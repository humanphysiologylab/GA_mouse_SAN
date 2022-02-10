import numpy as np
from sklearn.metrics import mean_squared_error as MSE


def RMSE(x, y, *, sample_weight=None, multioutput="uniform_average"):
    return MSE(
        x, y, squared=False, sample_weight=sample_weight, multioutput=multioutput
    )

def RMSE_heavy_peaks(x, y, peak_level = 0.9, peak_weight = 4.0):
    #if not isinstance(x, np.ndarray):
    #    x = x.values
    level = x.min() + peak_level * x.ptp()
    above_level = x >= level
    below_level = x < level

    above_errors = np.multiply(((y - x)**2), above_level) * peak_weight
    below_errors = np.multiply(((y - x)**2), below_level)
    return np.sqrt(above_errors.mean() + below_errors.mean())['V']


def calculate_RMSE(x, y) -> float:
    assert len(x) == len(y)  # TODO
    return np.sqrt(np.mean(((x - y) ** 2)))


def calculate_RMSE_balanced(x, y) -> float:
    assert len(x) == len(y)  # TODO
    x = (x - y.min(axis=0)) / y.ptp(axis=0)
    y = (y - y.min(axis=0)) / y.ptp(axis=0)
    return np.sqrt(np.sum(((x - y) ** 2)) / len(x))


def calculate_RMSE_weightened(x, y, weights) -> float:
    return float(np.sum(MSE(x, y, squared=False, multioutput="raw_values") * weights))
