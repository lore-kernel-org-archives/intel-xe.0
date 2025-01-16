Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC62C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 15:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC56910E5A0;
	Thu, 16 Jan 2025 15:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mAoaF3oI";
	dkim-atps=neutral
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F610E9B7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 15:34:53 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ef714374c0so1879783a91.0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737041633; x=1737646433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XnJ9vB3EOOAv6TFAZJ8PP0y3HvfjPhPycO5fAHOIqD0=;
 b=mAoaF3oIgdFxnziDmk7S+XjCe7hrmf+55J7xbxB6IwetGz7nyTpKkdZ5oltl7ege0k
 RLpI8cDiMJYyFVaw7jYv4TKRQFWQjxiL9kS06Dss+WMrPuCWUj/wsMZX1vBSD+sl9ddV
 her077diK+HwhZlIweHcaARVXdQypxOJxk59IVQAIZbVbvmMECj56IeTp2m4xK9aVKNS
 iw5LeAG9Wupv7wdrg7BnZqpnBT67nnTI5/sTyRALfTnCcqN8u9dnhaxkqD2JfUgB6ct7
 QKeO1dSnsa1yZlsyCInsJaPWybN54RCkrzQ4Bg3vDnhI8XSuWi79RaGm70+NyjnpfQ4P
 ekZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737041633; x=1737646433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XnJ9vB3EOOAv6TFAZJ8PP0y3HvfjPhPycO5fAHOIqD0=;
 b=TjwmxSoQC43Ai/198rlRsCtyx3xh1NV+9lnPhy/Z7f1V2CApPvU4tDUjCIWdlrAWF7
 xjf0/2qnr838iuN8NrZ3VRrMqF0PtpfW7Iqvx5HOpZ/XHZb2y5TGq0qSdI0PbAjrDb+5
 fIYhDKKm71kaYawpEz9q1D7KRJEIvUcEAByFz1atrqe5uMKg79A0W0U9mqN/z12fsor4
 DNGgObTfvfQrHlnYe4k76rhf+2EiPOqwbXJfZVM4gAB0LrDxB/U3GToZtb6PVZXAhJC9
 fWO/ROFK8AZ810LpeksSyTshBltwkZFiOpxgdYCnn5xQD9au5Gctjb/vaD6y/hg+JtgB
 t6hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZsHeK9vmizpJY74p63OW+MAIhq89PuI3jQdmHb5enXy2d8babU7CT2V8mO8FG4xAuTRAb28iOLA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEer2LtPpXpZryZk3gUd9waZT6SaBwdPOt0u+a39k9eLRdVct4
 UCXtUJlC11iiclBOjhSe36e/2lWng3G/fWf9Fcum4n1nfvATAPZHdISlRf0D0vsu904k1Xn2NCr
 5FmUYfaLiF4kZmov+T+iu+lqdQXc=
X-Gm-Gg: ASbGncuF+/9G0NKWr0WKbGwwSEa0f2ZZW+t48jaGdFjpUhbiSxnEg8GSOli3qQhWHoK
 g406WcINKtGkErZZpBIn3sS3QgGB8ID7vLoRZOB4g
X-Google-Smtp-Source: AGHT+IHqaJrVeWIOJ+fwyKBkzi4X5ZQV8UbE2QJfNmx6pJnEDfX/QP4GCGvZmKXJg7Ol73YdramC3drzeIt1AeP+URs=
X-Received: by 2002:a17:90b:4b44:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-2f728e687f4mr11644077a91.15.1737041633219; Thu, 16 Jan 2025
 07:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <CH0PR11MB5444F77CC2DE257A7BA51E1DE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4edb736f-907c-4506-ae77-739d3aa377aa@linux.intel.com>
 <CH0PR11MB54445024134CDCFC27E2662BE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
 <CH0PR11MB54445001BEB95D4DA288EB9AE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54445001BEB95D4DA288EB9AE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 16 Jan 2025 17:33:40 +0200
X-Gm-Features: AbW1kvbra9a3yFDJxLXYVICtYNBeTYtfwRQZrGn9JX-8ohsaR_zp6p0Ywjlu4vk
Message-ID: <CAJ=qYWRxEXdFh8b5T2xCv3-zKHmR0QsCu2Dk5UpyrYbUFB78FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
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

Thanks for the reviews,

On Wed, Jan 15, 2025 at 5:26=E2=80=AFPM Cavitt, Jonathan
<jonathan.cavitt@intel.com> wrote:
>
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Wednesday, January 15, 2025 7:10 AM
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Juha-Pekka Hei=
kkila <juhapekka.heikkila@gmail.com>; intel-xe@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
> >
> > -----Original Message-----
> > From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Sent: Wednesday, January 15, 2025 2:19 AM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Juha-Pekka Heikkila <=
juhapekka.heikkila@gmail.com>; intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
> > > Den 2025-01-14 kl. 20:22, skrev Cavitt, Jonathan:
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf O=
f Juha-Pekka Heikkila
> > > > Sent: Tuesday, January 14, 2025 10:04 AM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > Subject: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
> > > >>
> > > >> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helpe=
r.
> > > >> This also fixes bug where dpt could have been allocated from syste=
m
> > > >> memory when on dgfx.
> > > >>
> > > >> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > >> ---
> > > >>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---=
------
> > > >>   1 file changed, 43 insertions(+), 24 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/=
drm/xe/display/xe_fb_pin.c
> > > >> index 9fa51b84737c..c28885316986 100644
> > > >> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > >> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > >> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct ios=
ys_map *map, u32 *dpt_ofs,
> > > >>          *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> > > >>   }
> > > >>
> > > >> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
> > > >> +                                     struct xe_tile *tile0, u64 s=
ize,
> > > >> +                                     u64 physical_alignment)
> > > >> +{
> > > >> +        struct xe_bo *dpt;
> > > >> +
> > > >> +        /*
> > > >> +         * If DGFX: try VRAM0 only
> > > >> +         */
> > > >> +        if (IS_DGFX(xe)) {
> > > >> +                dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0=
, NULL,
> > > >> +                                                      size, ~0ull=
,
> > > >> +                                                      ttm_bo_type=
_kernel,
> > > >> +                                                      XE_BO_FLAG_=
VRAM0 |
> > > >> +                                                      XE_BO_FLAG_=
GGTT |
> > > >> +                                                      XE_BO_FLAG_=
PAGETABLE,
> > > >> +                                                      physical_al=
ignment);
> > > >> +        } else {
> > > >> +                /*
> > > >> +                 * For IGFX: first try STOLEN. on fail try SYSTEM=
.
> > > >> +                 */
> > > >> +                dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0=
, NULL,
> > > >> +                                                      size, ~0ull=
,
> > > >> +                                                      ttm_bo_type=
_kernel,
> > > >> +                                                      XE_BO_FLAG_=
STOLEN |
> > > >> +                                                      XE_BO_FLAG_=
GGTT |
> > > >> +                                                      XE_BO_FLAG_=
PAGETABLE,
> > > >> +                                                      physical_al=
ignment);
> > > >> +                if (IS_ERR(dpt)) {
> > > >> +                        dpt =3D xe_bo_create_pin_map_at_aligned(x=
e, tile0, NULL,
> > > >> +                                                              siz=
e, ~0ull,
> > > >> +                                                              ttm=
_bo_type_kernel,
> > > >> +                                                              XE_=
BO_FLAG_SYSTEM |
> > > >> +                                                              XE_=
BO_FLAG_GGTT |
> > > >> +                                                              XE_=
BO_FLAG_PAGETABLE,
> > > >> +                                                              phy=
sical_alignment);
> > > >> +                }
> > > >> +        }
> > > >> +        return dpt;
> > > >
> > > > We might be able to collapse some of this logic by storing the flag=
s separately:
> > > >
> > > > """
> > > > static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
> > > >                                struct xe_tile *tile0, u64 size,
> > > >                                u64 physical_alignment)
> > > > {
> > > >   struct xe_bo *dpt;
> > > >   u32 base_flags =3D XE_BO_FLAG_GGTT | XE_BO_FLAG_PAGETABLE;
> > > >   u32 flags =3D base_flags;
> > > >
> > > >   /*
> > > >    * If DGFX: try VRAM0.
> > > >    * If IGFX: try STOLEN.
> > > >    */
> > > >   flags |=3D IS_DGFX(xe) ? XE_BO_FLAG_VRAM0 : XE_BO_FLAG_STOLEN;
> > > >
> > > >   dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL, size,
> > > >                                         ~0ull, ttm_bo_type_kernel,
> > > >                                         flags, physical_alignment);
> > > >
> > > >   /*
> > > >    * For IGFX, we first try STOLEN, and on a failure we try SYSTEM.
> > > >    * DGFX should only attempt VRAM0
> > > >    */
> > > >   if (IS_DGFX(xe) && IS_ERR(dpt))
> > > >           dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> > > >                                                 size, ~0ull,
> > > >                                                 ttm_bo_type_kernel,
> > > >                                                 base_flags |
> > > >                                                 XE_BO_FLAG_SYSTEM,
> > > >                                                 physical_alignment)=
;
> > > >   return dpt;
> > > > }
> > > > """
> > > > This isn't a particularly necessary compression, but it might be wo=
rth considering.
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>Except that=
 fails on both integrated and discrete, due to IS_DGFX() used
> > > wrongly here. ;-)
> > >
> > > Every change, no matter how small, has the opportunity to break thing=
s.
> >
> > Interesting.  For future reference, may I ask how IS_DGFX is being used=
 incorrectly in the above example?
>
> Ah, wait.  Never mind, I see it.  I forgot to negate IS_DGFX in the error=
 case.  It should be:

I was initially thinking something similar but didn't come up with
anything that I did like hence I decided to stick with the looks of
original code. Your version look better than those I had, maybe first
put these patches in as is since it fixes a bug and later come back
for this.

/Juha-Pekka
