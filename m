Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F9C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 16:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4384510E05B;
	Thu, 30 Jan 2025 16:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="N61kroRT";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544DE10E05B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 16:23:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so10383655e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 08:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738254212; x=1738859012;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gRL2ejq866foXhhMZ3F9U8sU8x4jqEc84k8XulzlnI=;
 b=N61kroRTPjq79rdbGUTzKXXqbqNLM9Iy45hMj9OyPC/bYlhS2XAOfojh4eBhqNfw5e
 XcTO33Usyhrwmy27A88zdXo4yaEQR1TdnLUT2Gu6l23B4N8PFVfQYW9YwfTWI0OfRTmi
 AYcsdN36nES74tiCqaNwGiVY0KYqaNwZFg+12id70BpsVXhaglBjpG6HJuVkp1VlYnsc
 HZeoIF2hL/0bEnxs6E/DRrtOXjdwsSq+sHdgb4L+0EF3JkPdmnYwTvc7jYKhs1yVzlaW
 put15g1Kzl7NpLUmABhhXfnoAkotobywiHcP+T0MUh3ZShGSAVB6GCFzfuKGYhdXOMIK
 nqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738254212; x=1738859012;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gRL2ejq866foXhhMZ3F9U8sU8x4jqEc84k8XulzlnI=;
 b=A7pWVzzEdgMNGLVmoF0jFkPoFSCTElWzYu4YzfdCSyQvv9TTkpkWCsfurpDcw1AKE1
 i5HtjM2XCAl16mFVi9ALPFGT/+KVOVyXgqLtkw3KfdK5XnaV1kqCc5jPpMhst0NY9FfZ
 Drxc28r34UvPdf6eYeh9ofqLSi3e0AEwZWGbr7U2NIJAOXGSIker23Yh7hff6LpOs4zo
 43Njnp9UMARHcTJRiTecI0SygK0DH7FfszYlfd65dv4Es6GErZTPvbSCqEt8gY0/6Gd6
 kD4HNF15sL4IoShKL0fi81T8SnknMKEs7rZW1mkwYrwdPNXRxENKF8aP1WzhjsIruZUW
 sjYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpRNmcp+KoZvSqrVU+sV49cHXp9WPgXCL1rMXNHtEo3P3F4xZeH48MAOdWmUSmJpt2t6Iazbr3xg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6IGYXSVJhAjwrfCOtm8GfCIq1SDDt7jaJC6zpYKRxZSYdruvq
 Ex5eO1FFDA8gChfqeJSj1L59yLr7ipTbVTaE3sgMjF7qE+Ix+qjMN9EkArpitzo=
X-Gm-Gg: ASbGncuC7LbfjUvKbsGOYsJzYfBf855W/UG7ShXg2rFLQ/OcdV3u5CvemeKoIKF38Q0
 SwgGOm1NnChU6cImt+nCcGI1qOR4pqk6+8lnp9oARuulCzkj3a1DOTvexTXVujBzK38qTEQ5V1y
 /tN/C87I+z6pZJgjO9mAviRaUXk80Ke6ONlHmA07LSFXAMuZVxKGqDzfburWL+XRbC3zUls3wNX
 IbrBX6s7BZgkbz/HWdkFznWs6ZbGht8c4G5Z6si/Q29TWZ4ktktesH2A2xs7ICYxq3PVmpsUGUQ
 zaQ8ZTgrDhr8Fa2d4oHizZIJeI+oUOw=
X-Google-Smtp-Source: AGHT+IGcIkcWpW9Y4J+75q7UE964RqM+mP6V9+1wIFKxtVczMAdYkuQka25VW4AeNTcjTYjqt6OYxQ==
X-Received: by 2002:a05:600c:5119:b0:438:a432:7c44 with SMTP id
 5b1f17b1804b1-438dc40b281mr61888325e9.21.1738254211659; 
 Thu, 30 Jan 2025 08:23:31 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f087sm27710275e9.29.2025.01.30.08.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 08:23:31 -0800 (PST)
Message-ID: <eb065591-0c0d-4e5d-8996-38f825556e38@ursulin.net>
Date: Thu, 30 Jan 2025 16:23:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workaround handling
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
 <20250130110337.11237-2-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250130110337.11237-2-tvrtko.ursulin@igalia.com>
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


On 30/01/2025 11:03, Tvrtko Ursulin wrote:
> Any rules using engine matching are currently broken due RTP processing
> happening in early init before the list of hardware engines has been
> initialised.
> 
> Fix it my moving the engine initialisation to earlier in the init process
> and process the workaround and tuning lists just before the GuC load will
> happen.
> 
> Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
> should be present while we see, before:
> 
> GT Workarounds
> 	14011059788
> 	14015795083
> 
> And after:
> 
> GT Workarounds
> 	14011060649
> 	14011059788
> 	14015795083
> 
> v2:
>   * Moved OOB back to early init.
>   * Moved engine init and WA processing to earlier phase.
>   * Improved commit message.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> Lets see if this explodes in CI...
> ---
>   drivers/gpu/drm/xe/xe_device.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.c     |  6 ------
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f3f754beb812..9d8dfee9dad2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -55,6 +55,7 @@
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_sys_mgr.h"
> +#include "xe_tuning.h"
>   #include "xe_vm.h"
>   #include "xe_vram.h"
>   #include "xe_vsec.h"
> @@ -793,6 +794,23 @@ int xe_device_probe(struct xe_device *xe)
>   	}
>   
>   	for_each_gt(gt, xe, id) {
> +		unsigned int fw_ref;
> +
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (!fw_ref)
> +			return -ETIMEDOUT;
> +
> +		err = xe_hw_engines_init_early(gt);

Nope, this is now too early according to the CI. Back to the drawing board.

Regards,

Tvrtko

> +		if (err) {
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +			return err;
> +		}
> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +		xe_wa_process_gt(gt);
> +		xe_tuning_process_gt(gt);
> +
>   		err = xe_gt_init_hwconfig(gt);
>   		if (err)
>   			return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 01a4a852b8f4..c3711987737e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -380,9 +380,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> -	xe_wa_process_gt(gt);
>   	xe_wa_process_oob(gt);
> -	xe_tuning_process_gt(gt);
>   
>   	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>   	spin_lock_init(&gt->global_invl_lock);
> @@ -430,10 +428,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	/* Rerun MCR init as we now have hw engine list */
>   	xe_gt_mcr_init(gt);
>   
> -	err = xe_hw_engines_init_early(gt);
> -	if (err)
> -		goto err_force_wake;
> -
>   	err = xe_hw_engine_class_sysfs_init(gt);
>   	if (err)
>   		goto err_force_wake;
