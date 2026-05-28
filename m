Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8AACD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 23:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3FD10F6F5;
	Thu, 28 May 2026 23:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UnjwOOlN";
	dkim-atps=neutral
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B82610F6F3
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 23:17:12 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7e61da76fd9so4283576a34.0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 16:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1780010231; x=1780615031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTeBdjW8HIH85jcvkS5iTaSEeXnu+jYoMCs0/egef4U=;
 b=UnjwOOlNEDlB4SEyy4mk4mZj3wqlwdN0g4TsWvJ74Aukzz+EXnrWKr3x1UmSueToXp
 D7++jTmY5a8pJE9vg0jqMVGlufyhLY/W0RBLdmspYoYEFp02YMtQFMfDJj/T/v8HPCAE
 5H6JOOp22VNPEb5BY4Gn5Gwjg14bw2di1M7PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780010231; x=1780615031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vTeBdjW8HIH85jcvkS5iTaSEeXnu+jYoMCs0/egef4U=;
 b=rO2xx0Ua6J1iAzFggJLlg+hsUxsfEQwc9wWt0b36AUkVBKHI6GFKv1T11OMmzI+Q5E
 3qWSpsbx5I4lzIHxiwSHPr2+Qh3H9HvR7tcV6k27iq1OpBlydkU4Hvt/MNJ299qM9ovF
 pFqJI09SdPd4Ws+VcILQfuNbhK1TqieApCvr6Da2oH8GGtyqPXhc6Tt0BtTNu+B7rxnI
 OCkIXOuvYtin+vq6e/OKcZC+13oJAzqfI3v6wsroa6yGcfQk/cO1QOznIVRot5mum62/
 T5VIyJwao+kc+8UY7qqI1y4gpefMQrniDUzMELJBfrl2apbVHUAHt2rWZ/4SHdNPIO0D
 Zw6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DGb6NuVkgYW0s0Y41ImAgfRoRJsQSC38AnPmxYjUEtN5oOIWtEzA/KKlVW+uyrg5CbxF0Q3BXaw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR/9uASq76njAseSvt8Mz/Yoyfe/ijB9b7br4fUZ0I0RG2Gosb
 hwiq5uOOH0yJR0n+Y8sXKAy5wwbryRro0g1M1nAcVAaJ4yT/Oxdv9mOyDEd34VklKtAdbNHcL8k
 wqWn+5bWd
X-Gm-Gg: Acq92OGcEKdlHgSYd4SoT1Bmf2Y+VBafevTB89HcmQXzJurIOMa0NzFWqfHVsqk8Iwi
 CY/EYZKyadAfXFA/maDsoTasWaQPfYGiTdxNkUqYha88rK0d8xp/37dkLlabmM3C+T+ZKjb9HXn
 Ptk8TWZXnuHNyFBKNkEU/TIGQZUygoea1Nd/ZrpHuI4ffbxqEjVATm8Q6JatG2HMeXwN3WI3dG6
 ZTsjkp/+092+pp1qgrPge7ryATYSGvBf4tQssQSkPJcWVmnzdP6QmPQT1FZgFc2b8Z1uLkwN6Bu
 aTF8QR2/tNm5ccTQGt8dQF709F4Yz6NvGpGCkqnsjwi578GWE5psW4MhgRCwvfGJikHRtj6RX7z
 eyIGfQduOmg1AptZXA1D3hsV9I67demhApE475pAkCfTYId8EIObmmf+jpaBnZf1m8sdt4umFGU
 CoEqs6Ip+Myw8Jax9x+YZ2fbY2fPGF7scy0M66ZiPRE4cj+iYoL1tKoENf1cPG63L2ETeSz0dMm
 I0e+zxGeus=
X-Received: by 2002:a05:6820:8382:b0:69d:82e6:69d8 with SMTP id
 006d021491bc7-69e0404502emr254212eaf.52.1780010231115; 
 Thu, 28 May 2026 16:17:11 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com.
 [209.85.160.44]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43c89613d02sm319593fac.11.2026.05.28.16.17.08
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 16:17:09 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-439acb393f7so14614055fac.1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 16:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9HRzEb8oHYVTn0miC1cGD1IpiOv9yl2ja9egkrItM98ghjE2ntiYMWtgWsfZEsc7Jz4k3PRK6Ozw==@lists.freedesktop.org
X-Received: by 2002:a05:6870:214b:b0:423:9219:4c6 with SMTP id
 586e51a60fabf-43c8c3ee10cmr157564fac.13.1780010227881; Thu, 28 May 2026
 16:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
 <20260511053213.3122314-5-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260511053213.3122314-5-chaitanya.kumar.borah@intel.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 28 May 2026 19:16:30 -0400
X-Gmail-Original-Message-ID: <CAOw6vb+Q=WzaFpHgbBYmxvQajL=dcEO9PAmfAP0mZ7DQT4Emew@mail.gmail.com>
X-Gm-Features: AVHnY4J662srQ9Hu_UDZ5nTbfLq_lZ8rwnh6EIbPFEATsb1wHNC_KLvW4cwrkhA
Message-ID: <CAOw6vb+Q=WzaFpHgbBYmxvQajL=dcEO9PAmfAP0mZ7DQT4Emew@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/i915: Fix color blob reference handling in
 intel_plane_state
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, uma.shankar@intel.com, pranay.samala@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 11, 2026 at 1:56=E2=80=AFAM Chaitanya Kumar Borah
<chaitanya.kumar.borah@intel.com> wrote:
>
> Take proper references for hw color blobs (degamma_lut, gamma_lut,
> ctm, lut_3d) in intel_plane_duplicate_state() and drop them in
> intel_plane_destroy_state().
>
> v2:
> - handle blobs in hw state clear
>
> Fixes: 3b7476e786c2 ("drm/i915/color: Add framework to program PRE/POST C=
SC LUT")
> Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
> Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")

These are in 6.19+, you probably want cc stable as well.

Sean

> Reviewed-by: Pranay Samala <pranay.samala@intel.com> #v1
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_plane.c | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm=
/i915/display/intel_plane.c
> index 559eef467dda..54b2c32473cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -145,6 +145,15 @@ intel_plane_duplicate_state(struct drm_plane *plane)
>         if (intel_state->hw.fb)
>                 drm_framebuffer_get(intel_state->hw.fb);
>
> +       if (intel_state->hw.degamma_lut)
> +               drm_property_blob_get(intel_state->hw.degamma_lut);
> +       if (intel_state->hw.gamma_lut)
> +               drm_property_blob_get(intel_state->hw.gamma_lut);
> +       if (intel_state->hw.ctm)
> +               drm_property_blob_get(intel_state->hw.ctm);
> +       if (intel_state->hw.lut_3d)
> +               drm_property_blob_get(intel_state->hw.lut_3d);
> +
>         return &intel_state->uapi;
>  }
>
> @@ -168,6 +177,16 @@ intel_plane_destroy_state(struct drm_plane *plane,
>         __drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
>         if (plane_state->hw.fb)
>                 drm_framebuffer_put(plane_state->hw.fb);
> +
> +       if (plane_state->hw.degamma_lut)
> +               drm_property_blob_put(plane_state->hw.degamma_lut);
> +       if (plane_state->hw.gamma_lut)
> +               drm_property_blob_put(plane_state->hw.gamma_lut);
> +       if (plane_state->hw.ctm)
> +               drm_property_blob_put(plane_state->hw.ctm);
> +       if (plane_state->hw.lut_3d)
> +               drm_property_blob_put(plane_state->hw.lut_3d);
> +
>         kfree(plane_state);
>  }
>
> @@ -340,6 +359,14 @@ static void intel_plane_clear_hw_state(struct intel_=
plane_state *plane_state)
>  {
>         if (plane_state->hw.fb)
>                 drm_framebuffer_put(plane_state->hw.fb);
> +       if (plane_state->hw.degamma_lut)
> +               drm_property_blob_put(plane_state->hw.degamma_lut);
> +       if (plane_state->hw.gamma_lut)
> +               drm_property_blob_put(plane_state->hw.gamma_lut);
> +       if (plane_state->hw.ctm)
> +               drm_property_blob_put(plane_state->hw.ctm);
> +       if (plane_state->hw.lut_3d)
> +               drm_property_blob_put(plane_state->hw.lut_3d);
>
>         memset(&plane_state->hw, 0, sizeof(plane_state->hw));
>  }
> --
> 2.25.1
>
