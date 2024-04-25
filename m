Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7530FC19F4E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 19:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02CA11A7EA;
	Thu, 25 Apr 2024 19:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JsJ7v68Y";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6514811A7EA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 19:17:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so1084665f8f.1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714072670; x=1714677470;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TORP8JmPLsgmNgoZFGOZHT7MTm2YWpfB21iCEYUVT4g=;
 b=JsJ7v68Y5c3XR7iGkCerY5igF38KUHUIZXvy1GX22Rn1aXlv+DUDgWdpRmIUrnUW7U
 mBJNljHEb3/1eWsOVo/MOKuobIwORdbVjYG7fTinU7TebcSbnO1NR+jOqV+hMyxzkIR4
 dMPwzOfqBfVdyij6sm0XHilHcCe8iMvSvnrb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714072670; x=1714677470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TORP8JmPLsgmNgoZFGOZHT7MTm2YWpfB21iCEYUVT4g=;
 b=sX57T3rEKc3qMjMYqHthTCxXeptlcdpg/g/zceLk/cZtqJvZ341PWwMHgrh0+A6XiB
 hLneByeTqpYC3EowOzp/0q+ouYbEE8uA+wtYsctwyfE+Rj0AXAFK6qCO51MGjMpFU4bL
 WiZTILJ+B3WDn2Dxs4PyZvac7+tluwSoJ8rn0kIW+7tmhU4V3NsrpybsSFWtQD4q7a6o
 +uaSxbUVe0ENBt5/c0awveVqSwlrKTgRKa02GgdAw+Vi7AqpGw7DW2/cr7pgGRO84RKE
 ffapozfv3E0jsit7mNJweJUXd0WoMksP1fdM7H4oKukOpTELJjbqPprwD+LvcB/z8vkw
 scsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn2Ruo81Pl2ixKT0Q8QXYKi2vdi8QN6HdvzONWD4jRqFG6H8rFS0fv5aG3uWEsYheFu6wL7rVBLz1PMLImpW6bbqhX6DWOPMcre4Dfnnw=
X-Gm-Message-State: AOJu0Yys3DTV6N8FHNx9J+v3vf3w6InhN4EAvI7RWXDgWCLDf2uhQHXf
 4yPjQad/MGV+g/w4eAp2bNfpy+FP+XAz3jfOrNJp1PV1omU7DrHIHSMtuHId75qzjOhXKvvfjOo
 0oLNNs27qppoaRkjD1hgJwFm2lz79IKkh8r2m
X-Google-Smtp-Source: AGHT+IG9K92yKqs8W2lMzB8dBG/qC9LIChhVCwedymWfAuz6JtrzHXcl/KngZ1SL5O3XeaVaoJnnaFweWnBNq4oSPXM=
X-Received: by 2002:a5d:54cd:0:b0:349:efb7:6532 with SMTP id
 x13-20020a5d54cd000000b00349efb76532mr249726wrv.28.1714072670453; Thu, 25 Apr
 2024 12:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
In-Reply-To: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
From: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Date: Thu, 25 Apr 2024 13:17:39 -0600
Message-ID: <CAJZwx_=5AB=EmG7ANcH4aw6GvCPtb0K2h_SEx4x8xpWA2F0HJA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/i915/intel_bios: Fix parsing backlight BDB data
To: LKML <linux-kernel@vger.kernel.org>
Cc: stable@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

A kind reminder to review this change.

On Wed, Feb 21, 2024 at 6:06=E2=80=AFPM Karthikeyan Ramasubramanian
<kramasub@chromium.org> wrote:
>
> Starting BDB version 239, hdr_dpcd_refresh_timeout is introduced to
> backlight BDB data. Commit 700034566d68 ("drm/i915/bios: Define more BDB
> contents") updated the backlight BDB data accordingly. This broke the
> parsing of backlight BDB data in VBT for versions 236 - 238 (both
> inclusive) and hence the backlight controls are not responding on units
> with the concerned BDB version.
>
> backlight_control information has been present in backlight BDB data
> from at least BDB version 191 onwards, if not before. Hence this patch
> extracts the backlight_control information for BDB version 191 or newer.
> Tested on Chromebooks using Jasperlake SoC (reports bdb->version =3D 236)=
.
> Tested on Chromebooks using Raptorlake SoC (reports bdb->version =3D 251)=
.
>
> Fixes: 700034566d68 ("drm/i915/bios: Define more BDB contents")
> Cc: stable@vger.kernel.org
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
> ---
>
> Changes in v2:
> - removed checking the block size of the backlight BDB data
>
>  drivers/gpu/drm/i915/display/intel_bios.c     | 19 ++++---------------
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  5 -----
>  2 files changed, 4 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index aa169b0055e97..8c1eb05fe77d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1042,22 +1042,11 @@ parse_lfp_backlight(struct drm_i915_private *i915=
,
>         panel->vbt.backlight.type =3D INTEL_BACKLIGHT_DISPLAY_DDI;
>         panel->vbt.backlight.controller =3D 0;
>         if (i915->display.vbt.version >=3D 191) {
> -               size_t exp_size;
> +               const struct lfp_backlight_control_method *method;
>
> -               if (i915->display.vbt.version >=3D 236)
> -                       exp_size =3D sizeof(struct bdb_lfp_backlight_data=
);
> -               else if (i915->display.vbt.version >=3D 234)
> -                       exp_size =3D EXP_BDB_LFP_BL_DATA_SIZE_REV_234;
> -               else
> -                       exp_size =3D EXP_BDB_LFP_BL_DATA_SIZE_REV_191;
> -
> -               if (get_blocksize(backlight_data) >=3D exp_size) {
> -                       const struct lfp_backlight_control_method *method=
;
> -
> -                       method =3D &backlight_data->backlight_control[pan=
el_type];
> -                       panel->vbt.backlight.type =3D method->type;
> -                       panel->vbt.backlight.controller =3D method->contr=
oller;
> -               }
> +               method =3D &backlight_data->backlight_control[panel_type]=
;
> +               panel->vbt.backlight.type =3D method->type;
> +               panel->vbt.backlight.controller =3D method->controller;
>         }
>
>         panel->vbt.backlight.pwm_freq_hz =3D entry->pwm_freq_hz;
> diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/=
drm/i915/display/intel_vbt_defs.h
> index a9f44abfc9fc2..b50cd0dcabda9 100644
> --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> @@ -897,11 +897,6 @@ struct lfp_brightness_level {
>         u16 reserved;
>  } __packed;
>
> -#define EXP_BDB_LFP_BL_DATA_SIZE_REV_191 \
> -       offsetof(struct bdb_lfp_backlight_data, brightness_level)
> -#define EXP_BDB_LFP_BL_DATA_SIZE_REV_234 \
> -       offsetof(struct bdb_lfp_backlight_data, brightness_precision_bits=
)
> -
>  struct bdb_lfp_backlight_data {
>         u8 entry_size;
>         struct lfp_backlight_data_entry data[16];
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
