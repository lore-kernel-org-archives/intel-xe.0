Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33783CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 13:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C710EABC;
	Fri,  7 Nov 2025 13:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RzD98TXq";
	dkim-atps=neutral
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39A010EABC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 13:11:17 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-3d5bb03d5c2so460458fac.1
 for <intel-xe@lists.freedesktop.org>; Fri, 07 Nov 2025 05:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762521077; x=1763125877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erLg3m4TJ6yGmrQyLnrtIrndgOYSfFMt0gJtY5EHPxY=;
 b=RzD98TXq8E5l+vbTbVCsFRzyE3mFUfCaDfFZTG/NZAP8UV7vwkFTwQ4KTWYLWReNLD
 oOEGhBswSokRQNilhbiirf9U3/ZMU2TYrfEqzl7OeVI5zv615ppO2osbCTO4DYTtKOJ5
 gaw4Vi0K0bhjxjQjYKVLaARPXmOTBvA1WYD+jhGXlxVZ9FIzP1hyfNrTwR+0OF/WK2uB
 vg+A8rGdbh8I6ih+UmDMArJ8mC2GNrOKhE6k/uXF/c1dGGoWTxk/hetDFecQaEEEyKHW
 4s25SD7kMDIG1+QFfZb2oPSfuhFlsngFoeANrCvlZ6j4kgdR3PapcgP1szgO0abGo+Zp
 adig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762521077; x=1763125877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=erLg3m4TJ6yGmrQyLnrtIrndgOYSfFMt0gJtY5EHPxY=;
 b=IuyCvqjyJqg6HutaVv+z8ltWN+A+w54grXmJ4rnUsQfldM+UIFkfttNJaErgrgXvfD
 3I5qWhb2M6ar4HpVlVD/CukWwiOBAQWkUp+0jkEvTDH/oRjOIRpme2yB+zX+paHqYedq
 SeboP4hOa8ZHt6dkOuwXUECXHQhPRHIWJSbz9DLc4f/CZFKIRNikzoA3e0RNAU2wAkEY
 9T53Flor3/iafQbA84mMO4fptePWXPfCzyVJXUwk7ppwQbDli6eruARm6kMqI7BEgG6x
 E4r5nbkfyxn1UvAbIdttPcWkBOQkpLkfTzaf4HI1bl9eoYn/4347pVKeNAZ1HPKE578n
 wq0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVARrnwVfF/NznsXn4sZ9Iq1d0Y1mk9w7lKCZ22+sfRQVETxG4ZdqCE6V0wf+8lW35C9AHoPCl4pQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuFRY/cZoL5coWAqH5RcfOOKbZpkEIitzouZl5kmPRSGFAy+lJ
 4U5TkamcTtX+ir1VYsJvP91rXz7PNJOo//uUYDZJH9oKQYPHZ4gX1iK5t64jCiuTzr5v7i4r8FW
 FUA8QsQxLMrH8iTRjShipxnJaQW8XcrQ2TXlpXvU=
X-Gm-Gg: ASbGnctSWwW5OTaiNb2WjCDC6lOVQpI0RDoRmEfRM9aJLSQlwTdmLTwOq3IVcdkdy2k
 hdILwlddz9R71GfoPiXKOFdRvgIyAo82eOJucvEMFHtlTdVFDbMvpkz6lDZCaW8Gc0AeMQX5f6s
 uMPi4MGJg1ohHZdoWZpOQZVYvwVfnLXpkOWpgnP5vSPhSIMHzvPK9TOjeCTa5BhNYmhGpq/1C2h
 mnwf3KbTrqVfMCYDaWcVQxxZ9H0uYe2HOlZ63x38z28r/UCWusz850h953eqe+iz47l/aqeUFzV
 8rshOapjgbbHkVY0cnw=
X-Google-Smtp-Source: AGHT+IHJ+54t+KbHIG3vLs020w3Rpi6SgBSNEicNeRV3rRs9xmq1jALlFsRZy8y9w9CbwQYVn7LxiC+UceOgO3Ry5xs=
X-Received: by 2002:a05:6870:9726:b0:3d3:672f:85b with SMTP id
 586e51a60fabf-3e41e732809mr1915366fac.51.1762521076710; Fri, 07 Nov 2025
 05:11:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762513240.git.jani.nikula@intel.com>
 <27b2c6772c68120d0d5ec28477db0d993743e955.1762513240.git.jani.nikula@intel.com>
In-Reply-To: <27b2c6772c68120d0d5ec28477db0d993743e955.1762513240.git.jani.nikula@intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 7 Nov 2025 14:11:05 +0100
X-Gm-Features: AWmQ_bkTAcYXBk0oWRYjmKcn89-uw-eJB-NQedGAhRB1wosY9iw8rphJxjxqlNE
Message-ID: <CAMeQTsaU7nS9K=UkQW73L6TS6PBLw26s_-jiOchEyT7dcfz-7Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/gma500: use drm_crtc_vblank_crtc()
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
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

On Fri, Nov 7, 2025 at 12:05=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
> for a crtc. Use it instead of poking at dev->vblank[] directly.
>
> However, we also need to get the crtc to start with. We could use
> drm_crtc_from_index(), but refactor to use drm_for_each_crtc() instead.
>
> This is all a bit tedious, and perhaps the driver shouldn't be poking at
> vblank->enabled directly in the first place. But at least hide away the
> dev->vblank[] access in drm_vblank.c where it belongs.
>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Hi Jani,
The gma500 part looks good. Feel free to merge this yourself.

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/psb_irq.c | 36 ++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/ps=
b_irq.c
> index c224c7ff353c..3a946b472064 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -250,6 +250,7 @@ static irqreturn_t gma_irq_handler(int irq, void *arg=
)
>  void gma_irq_preinstall(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> +       struct drm_crtc *crtc;
>         unsigned long irqflags;
>
>         spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
> @@ -260,10 +261,15 @@ void gma_irq_preinstall(struct drm_device *dev)
>         PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
>         PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
>
> -       if (dev->vblank[0].enabled)
> -               dev_priv->vdc_irq_mask |=3D _PSB_VSYNC_PIPEA_FLAG;
> -       if (dev->vblank[1].enabled)
> -               dev_priv->vdc_irq_mask |=3D _PSB_VSYNC_PIPEB_FLAG;
> +       drm_for_each_crtc(crtc, dev) {
> +               struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(c=
rtc);
> +
> +               if (vblank->enabled) {
> +                       u32 mask =3D drm_crtc_index(crtc) ? _PSB_VSYNC_PI=
PEB_FLAG :
> +                               _PSB_VSYNC_PIPEA_FLAG;
> +                       dev_priv->vdc_irq_mask |=3D mask;
> +               }
> +       }
>
>         /* Revisit this area - want per device masks ? */
>         if (dev_priv->ops->hotplug)
> @@ -278,8 +284,8 @@ void gma_irq_preinstall(struct drm_device *dev)
>  void gma_irq_postinstall(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> +       struct drm_crtc *crtc;
>         unsigned long irqflags;
> -       unsigned int i;
>
>         spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
>
> @@ -292,11 +298,13 @@ void gma_irq_postinstall(struct drm_device *dev)
>         PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
>         PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>
> -       for (i =3D 0; i < dev->num_crtcs; ++i) {
> -               if (dev->vblank[i].enabled)
> -                       gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTE=
RRUPT_ENABLE);
> +       drm_for_each_crtc(crtc, dev) {
> +               struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(c=
rtc);
> +
> +               if (vblank->enabled)
> +                       gma_enable_pipestat(dev_priv, drm_crtc_index(crtc=
), PIPE_VBLANK_INTERRUPT_ENABLE);
>                 else
> -                       gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
> +                       gma_disable_pipestat(dev_priv, drm_crtc_index(crt=
c), PIPE_VBLANK_INTERRUPT_ENABLE);
>         }
>
>         if (dev_priv->ops->hotplug_enable)
> @@ -337,8 +345,8 @@ void gma_irq_uninstall(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
>         struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> +       struct drm_crtc *crtc;
>         unsigned long irqflags;
> -       unsigned int i;
>
>         if (!dev_priv->irq_enabled)
>                 return;
> @@ -350,9 +358,11 @@ void gma_irq_uninstall(struct drm_device *dev)
>
>         PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>
> -       for (i =3D 0; i < dev->num_crtcs; ++i) {
> -               if (dev->vblank[i].enabled)
> -                       gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INT=
ERRUPT_ENABLE);
> +       drm_for_each_crtc(crtc, dev) {
> +               struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(c=
rtc);
> +
> +               if (vblank->enabled)
> +                       gma_disable_pipestat(dev_priv, drm_crtc_index(crt=
c), PIPE_VBLANK_INTERRUPT_ENABLE);
>         }
>
>         dev_priv->vdc_irq_mask &=3D _PSB_IRQ_SGX_FLAG |
> --
> 2.47.3
>
