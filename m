Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721A4C369B5
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 12:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B51710E77D;
	Tue, 15 Apr 2025 12:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CnL1/O1W";
	dkim-atps=neutral
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775D10E77C;
 Tue, 15 Apr 2025 12:48:17 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ff799d99dcso5103964a91.1; 
 Tue, 15 Apr 2025 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744721297; x=1745326097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/50ZgMDNi0Julm+YQwFklu9hoBrhLVPwRA+raz1I+ds=;
 b=CnL1/O1WtNLwB94ENXCYKUk8Hbcif4eUWWPeI/Yzi/KBRh7co8uEMFbPeZzwi6Z0Xo
 k1gBFah2esDV1+yKaKFlykbHtJQX+OdP70uc71syXUi3z6A4YoNgU/hKJbSG4rcgZj3Y
 hh6VQdW/62M/VnNyCYBCb2G/jvWjhdSnyLcxjOnI/BGI0JygtcMcWRb5qOVGTFMxfwOZ
 vmG1LiB0BbwdT6B8G8rNE0XEKBK4n58zdswDSXMdMmMsnlQEJp6Vq/esawDUN59aklFT
 0TTEpqH3ZTkqONpvrVe0ed7yqzHLAPQtiBm+IFuuWwmSFzPPnNP8UKWxW2ZaUqIpd0Hy
 wQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744721297; x=1745326097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/50ZgMDNi0Julm+YQwFklu9hoBrhLVPwRA+raz1I+ds=;
 b=VtKPOFvWmKUTnnH7oDkrvyiKy5SvMWsbwO3JPJir8ByyiOZxa9DAH+N9fDYXaGBNYB
 8GF6F547Fjr7v16hn4vKtbRPwQo7274yPIaJbKIz73EiwfbFYjhS85Z4nZ4Hdd3feKC+
 UbVprkrlLmhR0drcS5ys/ffMDuZ/Vn+OZzZEPpbxbbsW6gqERIGZL7rxDgwcdFuHzrKK
 Bdnp/vJ594TlY1OOrV4IggCeehaTwXjHc6+7DxO8iS7sC34ZWL1ZAxUsyTpzlu24yWrL
 61n+AIep3ffEeSeWZn2TIwUUzwrgU3rPWwcWwxr/jEVFPQQgNBe5AelYHKCXP8whZ8UB
 N+RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOsNPya23cu0GRHFe1G9akb3GUxwxI1zkWGZQWFShg2nVmUYz24dOgX1ocX+nVcuCq5ntnL9Mlpw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdQ99RZfAugX4/R08F+dFAlEoBTI1CfknQOtpqybqGJU31j2UC
 oB74Ew8kQWn9DI/IDxn6Re6CtmlIEQziNgQzBgF+mgzOm79O5mXyOU0OxiMXzGznt8Wb9qBHRcb
 8Nwg3s7cm4Y6CV5eOj0IO7gq3GTY=
X-Gm-Gg: ASbGncvb8TjH3ifLaQyi8B3k+VnuxnGZK8B8gjEnwuzz+CmzlQpGvVQfPznyM0Nx/Gv
 hHsQcX7jnNxWjIcFayjSB4TPvthNqKR+RbzVaEML2QgkG1PBd/9WphLVCiF0QKq83sK5FZyJSSL
 ArJk2+wz6kcOWYAzjMpVywyPFk
X-Google-Smtp-Source: AGHT+IEEXWGQ2CWYBGH6Zvv/QQN5G7SPRvD5mzY8SMVDBnOR97o8dwdp5rRReK3Tj1qypC+wTNmYDaxPnNZUgjOprTA=
X-Received: by 2002:a17:90b:5246:b0:2ef:2f49:7d7f with SMTP id
 98e67ed59e1d1-3082364973fmr29719494a91.18.1744721297223; Tue, 15 Apr 2025
 05:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250330180554.729353-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250330180554.729353-1-vinod.govindapillai@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 15 Apr 2025 15:48:04 +0300
X-Gm-Features: ATxdqUG-dbyC2EDpKfHqjIKPZCasrPJXesbtCCDFlAve1aid4AGtw7DkDoSDno4
Message-ID: <CAJ=qYWSca4V2ezVp8X9gvLzpzYM3b6HAhzGBm8WxDoeLSVHpNA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/display: implement wa_14022269668
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 uma.shankar@intel.com, jani.saarinen@intel.com
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

look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Sun, Mar 30, 2025 at 9:06=E2=80=AFPM Vinod Govindapillai
<vinod.govindapillai@intel.com> wrote:
>
> Woraround recommend programming the fbc_stride for bmg always.
> Display driver handles the need to program the fbc stride using
> the override stride. So ensure that we always get the override
> stride in case of bmg
>
> Bspec: 74212
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index e89cee323d8b..970f8c96cc85 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -252,9 +252,12 @@ static u16 intel_fbc_override_cfb_stride(const struc=
t intel_plane_state *plane_s
>          * Gen9 hw miscalculates cfb stride for linear as
>          * PLANE_STRIDE*512 instead of PLANE_STRIDE*64, so
>          * we always need to use the override there.
> +        *
> +        * wa_14022269668 For bmg, always program the FBC_STRIDE before f=
bc enable
>          */
>         if (stride !=3D stride_aligned ||
> -           (DISPLAY_VER(display) =3D=3D 9 && fb->modifier =3D=3D DRM_FOR=
MAT_MOD_LINEAR))
> +           (DISPLAY_VER(display) =3D=3D 9 && fb->modifier =3D=3D DRM_FOR=
MAT_MOD_LINEAR) ||
> +           display->platform.battlemage)
>                 return stride_aligned * 4 / 64;
>
>         return 0;
> --
> 2.43.0
>
