Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698CCC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F6E10F813;
	Fri,  3 Jul 2026 13:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZ2BQvgR";
	dkim-atps=neutral
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3CD10F813
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:51:00 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-381c51fde6bso200558a91.2
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Jul 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783086660; x=1783691460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cMeriD0NIXbW4IniYY0pIyyS2Z94DkPNWh72wtAj2zI=;
 b=UZ2BQvgRAblj/U3DYvKzk1CdayuZu7BUR24Mf1Ms9CyM9iJjXTR0dv6dDG3/iK9Rvo
 IPwmiW/qGNKmFQj62A0pwfiZ3BscMB4G0a8usKxJZkZGYmxOXY89W8kDbZqbcT70DBmH
 gHWY5c6Ka3SdorGh+Jp3JxVddp7LQX9s8B6Rlzvwo7r1d5mkWLZ7TM6I+HOa+OCoB4vE
 io/UJnqjARnySjXE522HLMygkS25JTMDOqrl7kw1KyesG2QgGUThaoUg2Q/2xk9veyTZ
 i1EFRz2DpKehvOwk1L99rtywjwL7X7zj1EEfSzhyr07KdiP1BCJnR0xQwdsZ0/RlA1ap
 r+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783086660; x=1783691460;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cMeriD0NIXbW4IniYY0pIyyS2Z94DkPNWh72wtAj2zI=;
 b=piIfrtzJnYbOllWW6EJ3gzcnqiLVtw1GM7iRa+CsOk/fdPnzbPsTeTfPO0kXcaplIV
 Zxn8pk746wwaUzv/bmNIuZePBAeRVyHM6gRl64cl1FYmxW71vsAkz2V6/LDDvyVB3Uq5
 NIB/hiMEIIYES/naL6ce3jqsRk+EfXNZLcvEN+f5tyXN7yC2mC9InCr0VZawivbVJsdw
 qryuQMAyu/egiGuJ+z+9J6zRtgc5xgXcPA8avSwhbsTEhKhMfTnVyR8nuWX2m/znmC78
 hPIV/bFYNdZbpT+sJ9hoZ6daI/970iESICGNEipuO9cNTimq8xUUZ7Z8jwXiL7XF5Dcj
 HPjQ==
X-Gm-Message-State: AOJu0YzGubGDvVt187F0Kl5lAIwSioHmU80t4CX5/ohuQy9aXM1ure93
 S3YVixO/pkQ/NjFYmBXF2mwTTZWKZYgV7T21mxsW6b0Liezs3at/euDW
X-Gm-Gg: AfdE7cnohILnxjeOGgu1yB1ZrGLEyH9zML+D9F2TLAiCvtAhsIeRlN3bc7Bp58roLpe
 Ic59M+1ncHhdFaS/mXEqPxnwXSvtilj/El8YOjdevmNyJ6DpZrG6hkyrpkqgD+8TtJnwzvFwmYx
 6skfyLe3Q+fCkrE+gJ5pvweOfu0ruxREVrlJ65U+L79RGNd/7aMEll/n3YXTa1yBa/4C7e0fK3h
 O/HZ4kS+wIMpPEQb40g224ShYFpQEQrXNGDcYU5Ost3JuDjavXoAo5WteAr0wQQnkZFJsoiJB7c
 s8uEsCKzUnjFdRIqVg2WNYdjgewy9y0COkfO/mmGkFnV2P59dq6qkFg8ZbVZXMiwk7B2UEZXogE
 j7YI/1NRieCOkoBF5AczKHwGOsid25oYSlzJ2UmDbw3XUzE90ZUrLHatZNG0jYp9gNsHcuHA7Jf
 WaWoJZSSM2cl0go9MBLI/k6PVIR58PaipL1akAGUFhgl8qPAKhiTSzCVs=
X-Received: by 2002:a17:90b:2f0b:b0:37d:7bbb:afab with SMTP id
 98e67ed59e1d1-380aa0bd384mr11654431a91.11.1783086660051; 
 Fri, 03 Jul 2026 06:51:00 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3812801eadasm1005452a91.10.2026.07.03.06.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 06:50:59 -0700 (PDT)
Message-ID: <26ed323d-c0f5-42d4-b736-de7efcf893d7@gmail.com>
Date: Fri, 3 Jul 2026 16:50:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC]: drm/i915/display: Fix NV12 ceiling division for
 bigjoiner case
To: Vidya Srinivas <vidya.srinivas@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20260618181837.687302-1-vidya.srinivas@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260618181837.687302-1-vidya.srinivas@intel.com>
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

Hi Vidya,

apologies for the delayed reply. I tried to do the math and seems I got 
correct numbers as expected what you say below. I can't test this 
anywhere but it seems correct on code and idea level.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 18/06/2026 21.18, Vidya Srinivas wrote:
> Commit 16df4cc63c58 ("drm/i915/display: Use ceiling division for NV12
> UV surface offset calculation") computes the UV (chroma) surface
> start/size as ceiling(half of Y plane start/size) directly from the
> U16.16 fixed-point source rectangle:
> 
>          x = fp_16_16_to_int_ceil(fp_16_16_div2(src.x1));
> 
> For a single pipe the source coordinates are integers, so this is
> correct.
> (UV start = ceiling(half of Y plane start)).
> 
> With bigjoiner + a plane scaler the picture changes. The pipe boundary
> is a fixed integer destination pixel, but the plane's position and the
> scaler ratio are arbitrary, so drm_rect_clip_scaled() maps the seam back
> to a *fractional* per-pipe source. For a 1280->2407 upscaled NV12 plane
> crossing the seam:
> 
>          master src: width = 1204 * 1280/2407 = 640.265899, x1 = 0
>          joiner src: width = 1203 * 1280/2407 = 639.734115, x1 = 640.265884
> 
> The luma path floors this to an integer (src.x1 >> 16 = 640), but the
> UV path takes ceiling(640.265884 / 2) = ceil(320.13) = 321. The Y plane
> then starts at column 640 while the UV plane starts at 321*2 = 642,
> pushing the chroma read one column past the 640-wide chroma surface on
> the joiner secondary:
> 
>          [CRTC:382:pipe C] PLANE ATS fault
>          [CRTC:382:pipe C][PLANE:267:plane 1C] fault (CTL=0x81009400, ...)
> 
> The spec "Y plane start" is the integer pixel the luma surface actually
> programs (640), not the pre-floor fixed-point value (640.27). Convert
> the Y plane start/size to integer first - matching skl_check_main_surface()
> - and then apply the ceiling. This is a no-op for the integer (non-joiner)
> case and yields the correct, in-bounds chroma offset for the fractional
> joiner seam:
> 
>                       before fix      after fix
>          master 1B:   x=0  w=321      x=0   w=320   -> [0, 320)
>          slave  1C:   x=321 w=320     x=320 w=320   -> [320, 640)
> 
> The two halves now tile the 640-wide chroma plane exactly and the ATS
> fault is gone.
> 
> Assisted-by: GitHub-Copilot:Claude-Opus-4.8
> Fixes: 16df4cc63c58 ("drm/i915/display: Use ceiling division for NV12 UV surface offset calculation")
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   .../drm/i915/display/skl_universal_plane.c    | 33 ++++++++-----------
>   1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index ad4bfff6903d..164b7d61c9a3 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2126,19 +2126,6 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
>   	return 0;
>   }
>   
> -
> -/* Divide a U16.16 fixed-point value by 2, staying in fixed-point domain */
> -static inline u32 fp_16_16_div2(u32 fp)
> -{
> -	return fp >> 1;
> -}
> -
> -/* Convert a U16.16 fixed-point value to integer, rounding up */
> -static inline int fp_16_16_to_int_ceil(u32 fp)
> -{
> -	return DIV_ROUND_UP(fp, 1 << 16);
> -}
> -
>   static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>   {
>   	struct intel_display *display = to_intel_display(plane_state);
> @@ -2154,14 +2141,20 @@ static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
>   	int max_height = intel_plane_max_height(plane, fb, uv_plane, rotation);
>   
>   	/*
> -	 * LNL+ UV surface start/size =
> -	 * ceiling(half of Y plane start/size). Use ceiling division
> -	 * unconditionally; it is a no-op for even values.
> +	 * UV (chroma) start/size = ceiling(half of the *integer* Y plane
> +	 * start/size), i.e. the value the luma surface programs (src >> 16),
> +	 * not the raw U16.16. A bigjoiner seam mapped through the scaler can
> +	 * give a fractional luma src; ceiling that directly would round the
> +	 * chroma one column too far and read past the chroma surface.
>   	 */
> -	int x = fp_16_16_to_int_ceil(fp_16_16_div2(plane_state->uapi.src.x1));
> -	int y = fp_16_16_to_int_ceil(fp_16_16_div2(plane_state->uapi.src.y1));
> -	int w = fp_16_16_to_int_ceil(fp_16_16_div2(drm_rect_width(&plane_state->uapi.src)));
> -	int h = fp_16_16_to_int_ceil(fp_16_16_div2(drm_rect_height(&plane_state->uapi.src)));
> +	int luma_x = plane_state->uapi.src.x1 >> 16;
> +	int luma_y = plane_state->uapi.src.y1 >> 16;
> +	int luma_w = drm_rect_width(&plane_state->uapi.src) >> 16;
> +	int luma_h = drm_rect_height(&plane_state->uapi.src) >> 16;
> +	int x = DIV_ROUND_UP(luma_x, 2);
> +	int y = DIV_ROUND_UP(luma_y, 2);
> +	int w = DIV_ROUND_UP(luma_x + luma_w, 2) - x;
> +	int h = DIV_ROUND_UP(luma_y + luma_h, 2) - y;
>   	u32 offset;
>   
>   	/* FIXME not quite sure how/if these apply to the chroma plane */

