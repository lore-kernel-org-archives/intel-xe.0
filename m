Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA53C46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B2710E1B4;
	Mon, 18 Dec 2023 18:38:52 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9838810E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:21:22 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1702802756; bh=NrLfuitbb91PdwgnaJhniEIDKkbxTM8nmyZv0rq51DY=;
 h=Date:From:Subject:To:Cc:From;
 b=u0vja4ieEsphmJaSYu90yQAqDfq/qVRwEMr3CIwAAnGBXnBSFkYPNtjJtfXS5eIxW
 kUafBt0jNJRG8phRARBrWb7bstnqMSmJuSD5WaiLMzEL7La0NCsvzIAsoEaBso7vkw
 MxcKl9BhIL9r+aegtK84ATpcJd1K7LaQOiaqg82HZSFFDBsr/+173lSx9lABfYGlcE
 4J1adKhWunYVy4pjwLvNyq2t3/knbXn5JUKZznRfO9cDIVw3pKZa4ullMJ+WrPAoD8
 moI6RfFPf9Yri1h5iRZOFGo0WaBPtRM9IMxzwL+tswPT0qeWj6Tn2SVKpxeQjTsNGg
 jxsh8OoT2B5wQ==
Received: from gzadicario-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by gzadicario-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 3BH8jq5w1524332
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 17 Dec 2023 10:45:52 +0200
Received: (from gzadicario@localhost)
 by gzadicario-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 3BH8jqwL1524331;
 Sun, 17 Dec 2023 10:45:52 +0200
Date: Sun, 17 Dec 2023 10:45:52 +0200
From: Guy Zadicario <gzadicario@habana.ai>
Message-Id: <202312170845.3BH8jqwL1524331@gzadicario-vm-u22.habana-labs.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [01/17] drm/xe/perf/uapi: "Perf" layer to support multiple perf
 counter stream types
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
X-Mailman-Approved-At: Mon, 18 Dec 2023 18:38:44 +0000
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
Cc: "intel-xe@lists.freedesktop.org; Tal Albo <talbo@habana.ai>;
 Guy Zadicario" <gzadicario@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

..

>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index eb03a49c17a13..3539e0781d700 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h

..

>+
>+/**
>+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
>+ */
>+enum drm_xe_perf_ioctls {
>+	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
>+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>+
>+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>+
>+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>+};
>+

Hi Ashutosh,
It apears that in the hwtrace PERF stream I need to pass some arguments in the ENABLE/DISABLE
ioctls. This is required since firmware will implement the enable/disable functionality.
I would suggest to use different enums for the stream ioctls, you can rename
drm_xe_perf_ioctls to drm_xe_oa_ioctls and I will define drm_xe_hwtrace_ioctls.

I'd also like to add another stream ioctl to retrieve the stream status and avaialable bytes.

Thanks,
Guy.
