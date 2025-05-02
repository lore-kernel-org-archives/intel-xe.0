Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0BC3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E848B10E8E2;
	Fri,  2 May 2025 09:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wnooVVF8";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DD610E8E2
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 09:24:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1809926f8f.2
 for <intel-xe@lists.freedesktop.org>; Fri, 02 May 2025 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1746177886; x=1746782686;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w/9NydMVPL5obI8U+2CN6g1J0L5hJ6HpoWggI4Qrjlo=;
 b=wnooVVF8qWldhggn/5iFgXgk39FcocHeXH/0gABX5JPVMY/MTRlEJEsuV/Us350U9Q
 6Yh67lz26fya8KLizimoV0Kp7xI4Zu7nEHvKHIW1XIlBzdjiMz5t3ilePHd5Z6H5QI14
 FPYY/S9Azs+RqrGYH2JBIA20BE8M0n7PoYGcT2q8YjN5sdxcGg30so2cpWJi8+cM09JW
 PeL/+vlWJ7c6Ct0VB8pug93K81P/IEiEApJ8Yz8ij5mcoWRa0M44qWGpn1KCiJpC3E+y
 cUouFyMJPKXoO6mSzV+o0ca3jaay143aP47Y3Ijd0oKPKS58d4ewXfp4zbIFPnMnnpx6
 d7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746177886; x=1746782686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w/9NydMVPL5obI8U+2CN6g1J0L5hJ6HpoWggI4Qrjlo=;
 b=bTauN2jAXpMTO3zHUKxrLJeR+IWwFIoDyh79xBbrz3cTpHmKmEjoVkEPKoYEevWOcT
 wNL4nYdS02Nm0uNiH8XzgBT5JG7BekazwxxMyJs0i1rcuaoPiTl/mTkcvSyzhPMSIHLQ
 b59nwhUNM3S8JDmPFbQr94OusgjLFEf9EFFlgG4h6S0AZpnbFL9+guv2bkzEUrSW6BKw
 HcgzfY4pUhyd7aO7PQDMSq319rhwW4EWO2Jp1R+TFQ5d4tTGvm4w69UDnznZe84ELEM/
 dfUgAyhBZJrvSqlNbueKMic1HQjOISE5iXNSONHOZREP5K0qr9BWePmmqUmiRY+aPdjg
 76hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJmIi333ug+e7dKqDKelJHsAUQqD3hna8Ritbm5yk8XBfoe3MdibkD+KCUSk3p0Kc0UQLNt2Ft2w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyULxWbebREgL4tUG8U8TVnjHABaMcph+FFIxt3xeuIahBkvhCz
 UT1EnbUJ0BDdQYTt+d/5iLFHszDkwa/1l79G32ys4TOZfP4oSgMsc6Tnc1I5n3RDLwtsuiDa98w
 p
X-Gm-Gg: ASbGnctDOE1MO3oWjVVIT8dv2IZIW6Nc8fRLRkGgRRXv0jcStUvPsCwnFEM9DUy4NXN
 yA87D/V1+Yf4S6EHXwCiluaFFPHNk0BMOYmS2wp3RcWJWzGoGdhtDEOjuZt02F8hYtddHNj2p3b
 FROZUQYReczjOtLlfPkpPW/1cBjdYrnTGnAuOq9mAMmMrX83odPrxklwHaqg8uh537skQuVuFkh
 OGWiM519rS3HgzvItyG+iCB11ZqqDFgtWpxVujpfZWh+U2xSQEYf25d8/cDGgUZOJjyOJyExz9L
 BsaEGEHjnY1NP6apF8pXQKdHW7wITBJYWogggTVvAfyDVxzHsVoWE0/nCaBoJUUSaw==
X-Google-Smtp-Source: AGHT+IHMqVW9tymHBRisxIe720x28lWrvlOreai7EE+EDDsKVl7vnxbBwnRwUrNUYLgt4A+ULM1AVA==
X-Received: by 2002:a05:6000:2410:b0:39e:e438:8e32 with SMTP id
 ffacd0b85a97d-3a099af1b9amr1557878f8f.55.1746177885748; 
 Fri, 02 May 2025 02:24:45 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0efbfsm1632103f8f.69.2025.05.02.02.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 02:24:45 -0700 (PDT)
Message-ID: <b66c8972-bd33-4e66-81a7-7e6b2d6e34ba@ursulin.net>
Date: Fri, 2 May 2025 10:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/backlight: drop dmesg suggestion to file bugs
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250429112534.2121656-1-jani.nikula@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250429112534.2121656-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 29/04/2025 12:25, Jani Nikula wrote:
> Drop the FDO_BUG_URL from the source, and stop suggesting to file bugs
> on DPCD backlight issues. We don't do this anywhere else in display,
> this isn't a special snowflake.
> 
> As a consequence, also drop the dependency on i915_utils.h from
> intel_dp_aux_backlight.c.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
>   drivers/gpu/drm/i915/i915_utils.h                     | 2 --
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 20ab90acb351..271b27c9de51 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -36,7 +36,6 @@
>   
>   #include <drm/drm_print.h>
>   
> -#include "i915_utils.h"
>   #include "intel_backlight.h"
>   #include "intel_display_core.h"
>   #include "intel_display_types.h"
> @@ -149,7 +148,7 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
>   	    !(connector->base.hdr_sink_metadata.hdmi_type1.metadata_type &
>   	      BIT(HDMI_STATIC_METADATA_TYPE1))) {
>   		drm_info(display->drm,
> -			 "[CONNECTOR:%d:%s] Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=%d. needs this, please file a _new_ bug report on drm/i915, see " FDO_BUG_URL " for details.\n",
> +			 "[CONNECTOR:%d:%s] Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=%d.\n",
>   			 connector->base.base.id, connector->base.name,
>   			 INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL);
>   		return false;
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 609214231ffc..f7fb40cfdb70 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -40,8 +40,6 @@
>   struct drm_i915_private;
>   struct timer_list;
>   
> -#define FDO_BUG_URL "https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html"
> -
>   #define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>   			     __stringify(x), (long)(x))
>   

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

