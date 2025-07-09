Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5881C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 13:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641C610E214;
	Wed,  9 Jul 2025 13:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Pbu7Q/gS";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DD510E214
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 13:41:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so46762395e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Jul 2025 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752068485; x=1752673285; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vQHn4sdz3XKT71/qSKvQ9Li5S3ZZMrjY5ESUKG+hzCE=;
 b=Pbu7Q/gSiK4zTpwIY9NWg+JQ40ZKYPa5crS/Y3WVsmeqHyTxsRAu7bGvARf/sXuJbh
 xniyKaTPMIkcOu3AK4G1inTwnHvm7OmLmsLrbDvzT4XRHm/kntuSP02dJ6KkopCOYV1J
 UjuZzBg1p9ocHNVzZ8/yt+8Xl4E7xl4uhW/xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752068485; x=1752673285;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQHn4sdz3XKT71/qSKvQ9Li5S3ZZMrjY5ESUKG+hzCE=;
 b=cWsNUIVba1cECxTyjhZuCDJRPZ9SuJBdQy1Qs9w7ehjeVvRUv4KkvjlAXoKKU+sQFj
 OpLODnIPZnlbQPxtWSU3UsBLk58mPnP+MCJSxDkkKTLsNngzhhuKL8/3D8S5hcHNL/Uv
 SIhEmzCe167Z3tvXGCzt4so3lif5LkxLrsrSRXBojVoezhhVMP8k/RBQS4boGia+fqR5
 0zKmjmfSN3k3wSE8lWvWBLk77e29CWg4fDRnsFZCiDQvDKi2sowTBqvtZv9FQ3QD+dXc
 uFpjgx1WJkt3QTFCyJAN5Lqc/L/1UBmkLbhWNdokRejgkUM7a4CcDGQ6piVFBKy+forJ
 CH9A==
X-Gm-Message-State: AOJu0Yzef+43UgxT2zXgoOuCHJWmye3M3fzNfnCrWx14bkM8RJA1X6i3
 /6uCv3xjYxVDW9sWOLGixmJrrrZAqxa2WyUCBkuNA+bzWUQ/2xTalBLwZI4SNthaq2U=
X-Gm-Gg: ASbGnctjaAO8RBZp5yUQXn/nK8ObSRczqi77bARqdXRkveTXlcR5XUS7KcX0YXWPZ5R
 Mb/K7pSZqC3+VJg5BEoDa8H6CehG3AJvZjaD2qPKEzCyhEwtCPK+76Ff1ZwUHSIGWAAngwW2hUf
 fTnflMSW6DWohBYyCnUZ5SQzD5NYbwIWx+FJRdjsa4nPbn2vlxYG4F0vIJ4exURl4Bqq75WcuJ0
 3+LmlHKPP8gM1eu0bXAU79kTpiI7eYoghQJpKzO7Kp2qz5LRhzwYHQF1JNGkaIkE38ktPJyRGHP
 C/0kQg+5/geYOEYwHxBIDeDlABJTiiTrcHBsUiGMaOnSUotDFTd4PffYY9Q+absLO+3GSaY5UQ=
 =
X-Google-Smtp-Source: AGHT+IF8T4mOMaR38ySYzYFHFujouA9292TOGj+RJuHZlM19Ov0VPK7QVM3cspi+fvE/qt5d3tk8Tg==
X-Received: by 2002:a05:6000:250d:b0:3a5:2ec5:35b8 with SMTP id
 ffacd0b85a97d-3b5e45200b9mr2255942f8f.11.1752068485096; 
 Wed, 09 Jul 2025 06:41:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0a5csm15636861f8f.29.2025.07.09.06.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:41:24 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:41:22 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aG5xglf8BeGzleWM@phenom.ffwll.local>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709112024.1053710-2-riana.tauro@intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> Certain errors can cause the device to be wedged and may
> require a vendor specific recovery method to restore normal
> operation.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> must provide additional recovery documentation if this method
> is used.
> 
> v2: fix documentation (Raag)
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

I'm not really understanding what this is useful for, maybe concrete
example in the form of driver code that uses this, and some tool or
documentation steps that should be taken for recovery?

The issues I'm seeing here is that eventually we'll get different
vendor-specific recovery steps, and maybe even on the same device, and
that leads us to an enumeration issue. Since it's just a string and an
enum I think it'd be better to just allocate a new one every time there's
a new strange recovery method instead of this opaque approach.

Cheers, Sima

> ---
>  Documentation/gpu/drm-uapi.rst | 9 +++++----
>  drivers/gpu/drm/drm_drv.c      | 2 ++
>  include/drm/drm_device.h       | 4 ++++
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..c33070bdb347 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -421,10 +421,10 @@ Recovery
>  Current implementation defines three recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. If recovery method is specific to vendor
> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> +specific documentation for further recovery steps. If driver is unsure about
> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +435,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..08a087f149ff 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
