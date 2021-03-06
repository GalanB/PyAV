from libc.stdint cimport int64_t, uint64_t

cimport libav as lib

from av.audio.frame cimport AudioFrame


cdef class AudioFifo:

    cdef lib.AVAudioFifo *ptr

    cdef AudioFrame template

    cdef readonly uint64_t samples_written
    cdef readonly uint64_t samples_read
    cdef readonly double pts_per_sample
    cdef readonly uint64_t first_pts

    cpdef write(self, AudioFrame frame)
    cpdef read(self, unsigned int samples=*, bint partial=*)
    cpdef read_many(self, unsigned int samples, bint partial=*)
