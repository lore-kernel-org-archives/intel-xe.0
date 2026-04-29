Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F490FF8877
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 11:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF4210EF2E;
	Wed, 29 Apr 2026 11:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2isLlLi";
	dkim-atps=neutral
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030E410EF16
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 11:07:33 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2bdcf5970cdso706604eec.0
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777460853; x=1778065653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9A0jd8GBTQaVTR1Ped2F9WLbT+W3243fKksVMlAlYzI=;
 b=k2isLlLiiVeIxubRODcV0KyxodvoGuhg5Qro3iM+aMkOgDVzgVhUygsMJbYBEo7dAV
 hdX3+qsRZyLT5ZGwmAbuuzpBKv7KJeTK27vbFiHVRg6tAtMtRFxLb5DAN+wtF1RrJkEj
 lP824cjCdLkv4drNOCdVCJgDGAu+nqv7rjXFtCMdNrwXGfhSIDFBkvlW1DT/Qxmh9mFP
 3zXtgzV+iWSQ8Y+YGpU8dkDgotIT9aOMPZtiquQk/Y4RxgqeFXHRtypWYsbbUltUlipw
 7i3OCb+wi0GUY2XNXrfBybr5EQNoWFw+O3hJzPsSQ0gZTTi44iiuVE6jRdkqpTn9fl9J
 2PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777460853; x=1778065653;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9A0jd8GBTQaVTR1Ped2F9WLbT+W3243fKksVMlAlYzI=;
 b=HTZm31+rwXWrnT3r/3z1UXB6+Hw4Ulp3aIypim2+8Dy1uywFyF7z09v7bOVdJXdOvY
 A2H7sscUy1VPwZ+Zbmb3N5lFmZsnPuvX28OY3NaVsjeRrWE7F9kZB9lP73K+ND2Qs3jt
 ubPAbwDQgGdDzSYH65AC8MBoxBe9stlYCct4qvmC9ZZNBaAZdUzkoRW19TjnmUsqu3yr
 bmE0UYzOzg1TH3mQIVv13jD3WBbUFMChK6xQF/0bGhQro54vxYRuGxq7r1DM4K2kM/bI
 jydYHBHZf/ndh8WYZbfrbi9sHnQHNOo8Wb71I3SpqzfxKJaE78JC/EOdczw1mdnd2K0O
 ITrg==
X-Gm-Message-State: AOJu0Yxrtb5vYAXblljREMdnBGMHjjo74Ovx5ER+dz5C/klRvob8+RYE
 37RUVYle/5r2eF4mqDxVgmdl9kYRW7XcVA/TlOwTkVM/WYzn4g4o7uk4
X-Gm-Gg: AeBDiev7nYg4nOlOgeKPi6CzTM2Km0oJuX7ZDEe6Fag18PbeV+R/5/YwEhoFnUylcWH
 exQ2N7p4QiUkJ7nebVj7jAR3a11eQf2rnSNzohR4gKfumorNCHKxB+LIr/mjSZ9hUycuXhnZyiC
 J48bWN7DfLOs8u2VhZLDYF9h/JQ98sITZDEXgVjHrIUSqFqGG+zCK6xhijOdbqMvXEpmlNAomW9
 xhCLo3iZjq4yknfsyOKGK6gKaXxJ6A46L9t4Qrvt09wmWFB6XYVg8hiHC3Rj/6/6Ixd8iBIOaG5
 45pFfyGgyk2UFGR5EgWYtOjjHQrLG3pDlga/lbob5n0SYjYWDATYIGfh60+gfwm9m7GvI0R1Ep0
 dPAm2y7fzXHr/rxPN96uBRzH6w+dzZqF4qr0VvwnXUewSAAbZk1e4GRrOCFL5DtdMyqMQFgYSrC
 rbBoiL6KYHha+rPb/JxLo+HZngOgi0afFkBV2A2R5nptjFa9131NYMglsER5gBtoh9kA5xDTJR+
 wqaAQ==
X-Received: by 2002:a05:7300:dc98:b0:2d8:fce3:a073 with SMTP id
 5a478bee46e88-2ed1b3e9790mr1152773eec.8.1777460853109; 
 Wed, 29 Apr 2026 04:07:33 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ed1c0ce05bsm1557429eec.26.2026.04.29.04.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 04:07:32 -0700 (PDT)
Message-ID: <4fcaf7b2-05de-48e5-8d0f-10d6a4e8d4ee@gmail.com>
Date: Wed, 29 Apr 2026 14:07:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC v3]: drm/i915/display: Use ceiling division for NV12
 UV surface offset calculation
To: Vidya Srinivas <vidya.srinivas@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 jani.nikula@intel.com
References: <20260411171521.162189-1-vidya.srinivas@intel.com>
 <20260415165849.187693-1-vidya.srinivas@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260415165849.187693-1-vidya.srinivas@intel.com>
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

Look ok to me. I tested this make related failing test pass and I didn't 
spot planar formats or scaler related failures in results for this patch.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 15/04/2026 19.58, Vidya Srinivas wrote:
> For LNL+, odd source size and panning for YUV 422/420 surfaces is
> supported. However, it requires the UV (chroma) surface Start X/Y and
> width/height to be calculated as ceiling(half of Y plane value) rather
> than floor.
> 
> The current code uses (>> 17) which combines the U16.16 fixed-point to
> integer conversion (>> 16) with a divide-by-2 for chroma subsampling
> (>> 1) into a single floor division. For odd Y plane values this
> produces an off-by-one error in the UV plane offset.
> 
> On Android systems we see PLANE ATS fault when NV12 overlays are
> used with odd source dimensions:
> 
> [  126.854200] xe 0000:00:02.0: [drm:intel_atomic_setup_scaler [xe]] [CRTC:148:pipe A] attached scaler id 0.0 to PLANE:33
> [  126.854617] xe 0000:00:02.0: [drm:skl_update_scaler [xe]] [CRTC:148:pipe A] scaler_user index 0.0: staged scaling request for 1279x719->1340x753
> [  126.854837] xe 0000:00:02.0: [drm:intel_plane_atomic_check [xe]] UV plane [PLANE:33:plane 1A] using Y plane [PLANE:123:plane 4A]
> [  126.854926] xe 0000:00:02.0: [drm] *ERROR* [CRTC:148:pipe A] PLANE ATS fault
> 
> With Y plane width 1279:
>    floor(1279/2) = 639 (current)
>    ceil(1279/2)  = 640 (required)
> 
> Introduce fp_16_16_div2() and fp_16_16_to_int_ceil() helpers to cleanly
> separate the two operations: first halve the U16.16 fixed-point value
> for chroma subsampling (staying in fixed-point domain), then convert
> to integer with ceiling rounding.
> 
> v2: Use DIV_ROUND_UP(value, 1 << 17) to preserve sub-pixel precision
>      while making the ceiling division readable (Jani, Uma)
> 
> v3: Split into two helpers - fp_16_16_div2() for fixed-point division
>      by 2 and fp_16_16_to_int_ceil() for ceiling conversion to integer,
>      cleanly separating chroma subsampling from fixed-point to integer
>      conversion (Jani)
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   .../drm/i915/display/skl_universal_plane.c    | 27 ++++++++++++++++---
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 7a9d494334b5..e772b0d716c7 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2126,6 +2126,19 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
>   	return 0;
>   }
>   
> +
> +/* Divide a U16.16 fixed-point value by 2, staying in fixed-point domain */
> +static inline u32 fp_16_16_div2(u32 fp)
> +{
> +	return fp >> 1;
> +}
> +
> +/* Convert a U16.16 fixed-point value to integer, rounding up */
> +static inline int fp_16_16_to_int_ceil(u32 fp)
> +{
> +	return DIV_ROUND_UP(fp, 1 << 16);
> +}
> +
>   static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>   {
>   	struct intel_display *display = to_intel_display(plane_state);
> @@ -2139,10 +2152,16 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>   	int min_height = intel_plane_min_height(plane, fb, uv_plane, rotation);
>   	int max_width = intel_plane_max_width(plane, fb, uv_plane, rotation);
>   	int max_height = intel_plane_max_height(plane, fb, uv_plane, rotation);
> -	int x = plane_state->uapi.src.x1 >> 17;
> -	int y = plane_state->uapi.src.y1 >> 17;
> -	int w = drm_rect_width(&plane_state->uapi.src) >> 17;
> -	int h = drm_rect_height(&plane_state->uapi.src) >> 17;
> +
> +	/*
> +	 * LNL+ UV surface start/size =
> +	 * ceiling(half of Y plane start/size). Use ceiling division
> +	 * unconditionally; it is a no-op for even values.
> +	 */
> +	int x = fp_16_16_to_int_ceil(fp_16_16_div2(plane_state->uapi.src.x1));
> +	int y = fp_16_16_to_int_ceil(fp_16_16_div2(plane_state->uapi.src.y1));
> +	int w = fp_16_16_to_int_ceil(fp_16_16_div2(drm_rect_width(&plane_state->uapi.src)));
> +	int h = fp_16_16_to_int_ceil(fp_16_16_div2(drm_rect_height(&plane_state->uapi.src)));
>   	u32 offset;
>   
>   	/* FIXME not quite sure how/if these apply to the chroma plane */

