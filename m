Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F5C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 15:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30E210E5C0;
	Wed, 20 Dec 2023 15:08:32 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03510E30E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 06:19:46 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1703053177; bh=lag4Mx/3Je6cgheIBMFr3UIe+PzRgbuRy5sG+5gnd+Y=;
 h=Date:From:To:Cc:Subject:From;
 b=CRxjQPkDWGwe0/t9hDaBU7Sj/CZGLchw3ac1PCHRpA4cVC8LwHrCIKXYZwnZZIPUQ
 TbQgR1yAz2ZVV9H7uFQWn2JN9qJSlC6GxcSVKTbmGbfkrx9hUUsCYo7KHfFVNbG760
 zKT1v3GGfrmq2yY1SAdBDlbmNFQ6r9iY/RxWGnF+XuLR7Si3mKwOFf6QZXf2EW/Pb5
 mpBfE45kuXTpUMAXWBohCOtpkVUc//Ptqin/XbrzszlTYHkuJU6/refEqKTJDrLKFB
 /mCyUwoXfX4pz0AJj3gk37OqIjSZ2HYUxztMGfziS02+z6iILGV3H9bSnUp5bw3/jB
 jVw8BCDOw9Y5Q==
Received: from gzadicario-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by gzadicario-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 3BK6JViD1772659
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 08:19:31 +0200
Received: (from gzadicario@localhost)
 by gzadicario-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 3BK6JV7G1772658;
 Wed, 20 Dec 2023 08:19:31 +0200
Date: Wed, 20 Dec 2023 08:19:31 +0200
Message-Id: <202312200619.3BK6JV7G1772658@gzadicario-vm-u22.habana-labs.com>
From: Guy Zadicario <gzadicario@habana.ai>
To: Dixit@gzadicario-vm-u22.habana-labs.com,
 Ashutosh <ashutosh.dixit@intel.com>
Subject: Re: [01/17] drm/xe/perf/uapi: "Perf" layer to support multiple perf
 counter stream 
X-Mailman-Approved-At: Wed, 20 Dec 2023 15:08:30 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: , Nerlige.Ramappa@freedesktop.org,
	"Harish <harish.chegondi@intel.com>;  Guy Zadicario" <gzadicario@habana.ai>,
	talbo@habana.ai, Chegondi@freedesktop.org,
	intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

types

>On Sun, 17 Dec 2023 00:45:52 -0800, Guy Zadicario wrote:
>>
>> ..
>>
>> >diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> >index eb03a49c17a13..3539e0781d700 100644
>> >--- a/include/uapi/drm/xe_drm.h
>> >+++ b/include/uapi/drm/xe_drm.h
>>
>> ..
>>
>> >+
>> >+/**
>> >+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
>> >+ */
>> >+enum drm_xe_perf_ioctls {
>> >+	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
>> >+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>> >+
>> >+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>> >+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>> >+
>> >+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>> >+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>> >+};
>> >+
>>
>
>Hi Guy,
>
>Let's discuss this a bit and then decide what to do.
>
>> It apears that in the hwtrace PERF stream I need to pass some arguments
>> in the ENABLE/DISABLE ioctls. This is required since firmware will
>> implement the enable/disable functionality.  I would suggest to use
>> different enums for the stream ioctls, you can rename drm_xe_perf_ioctls
>> to drm_xe_oa_ioctls and I will define drm_xe_hwtrace_ioctls.
>
>I meant the above ioctls to be ioctl's which could be common between the
>different stream types. A couple of points:
>
>* The above ioctl's do not prevent you from passing in any data. E.g. with:
>
>  static long xe_hwtrace_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
>
>  If 'arg' is a pointer, any data you want can be passed into any of the
>  ioctls (enable/disable/config). So there are no restrictions. Each stream
>  type is free to do what it needs.
>

Right, I know that technically, it works if I pass arguments.
Just a matter of better documentation and make it clear.
We can work with any of the options below, however the 2nd option
really make it clear what argument needs to be passed.

DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0)
DRM_XE_HWTRACE_IOCTL_ENABLE = _IOW('i', 0x0, struct drm_xe_hwtrace_enable_disable)

>* Each stream type is free to add whatever ioctl's it needs, or ignore
>  these common ioctls. E.g. this is possible for HWTRACE:
>
>	#define DRM_XE_PERF_IOCTL_ENABLE   _IO('i', 0x0)
>	#define DRM_XE_PERF_IOCTL_DISABLE  _IO('i', 0x1)
>	#define DRM_XE_PERF_IOCTL_CONFIG   _IO('i', 0x2)
>	#define DRM_XE_HWTRACE_IOCTL_ABC   _IO('i', 0x3)
>	#define DRM_XE_HWTRACE_IOCTL_XYZ   _IO('j', 0x4)
>	#define DRM_XE_HWTRACE_IOCTL_XYZ1  _IO('q', 0x9)
>
>* Currently we expect to have 3 stream types: OA, EuStall and HwTrace. The
>  above ioctl's are used by both OA and Eustall (and also it appears
>  HwTrace). EuStall just uses enable/disable, it doesn't have 'config'.
>

We can do this, and I am OK with what will be decided ...
The question is what do we gain by sharing the same ioctls.

Another option is that OA and EuStall will share drm_xe_perf_ioctls and
hwtrace will define a different set: drm_xe_hwtrace_ioctls.

Thanks,
Guy.
