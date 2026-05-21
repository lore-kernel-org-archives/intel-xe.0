Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB748CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 19:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6138710E55C;
	Thu, 21 May 2026 19:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lkOvdBwQ";
	dkim-atps=neutral
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A510E550
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 19:29:00 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-439c3768d56so2855699fac.3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 12:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779391740; cv=none;
 d=google.com; s=arc-20240605;
 b=FBwUlHzm5A8gCdtB+sgZWzcbaws3pRPqolndC0kKClMjqMV3zwWMN2O0sBv44/TjJL
 hbnEK//dAuMZ/GRiyLC3IfAgVn5fSrDSOue0dliEKlM2O0ZoIgIKwVSbrwR08PHQsOy+
 IQcuMrKUeZeCgozjcw36eQtpWPze2PzgKIYYKz3P93lXHI08KbjSfZhTmkfXedyzKrZy
 sm67oSgz46XHUYR8BJX+OvAR/3pLWyGeI9ND+rv5+ovUXp/OIJlWYcDOM/MkBUadmAhN
 dbhYAqGNzod3zjaWmk0+Dx6tHw+ufQCdEg93c1r13WSqnrdQ2R3ZZR6B3d77nSNauP1c
 fvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7ws4Wuj3CXZZNtq4EC+PMmQ3IvviWpx3ix3T35qEpAQ=;
 fh=DeHAsB9r1eK6OQG5iUh6UBJFYKA0BY5FaGq9xJMBLtg=;
 b=XHyE0QXzbgVEhi+VIEc3ZDcpRE8GwWNrqhWHphLeJn2QHW0i0OA+Db1lIYoTL4PYkV
 aDUjsWm2XuCDS02kyqQYIhm9JAHx4h3ZcJhKrbIKeCKQX7TMiAGCXawp4K8bzKLjn6tv
 hc7UEauCe1QQAv9RoFyy4GDNoff821JWgHnfsxk9pfmJWROHLFpkuHVXW+Xygs1IaJL6
 aRUYYJOrocIBEujsB4O+3y9cwaU0y7j/UOOSGHTIXSjn7G4YxewZ/iokcjdSY/J9QMHl
 XQUbfQ6uL8Jca5Fwu3a/mxp1nuXroXlJYWRb+490051GhbWNWBkYrlhxgPKGy1D2+ehB
 FI3g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779391740; x=1779996540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ws4Wuj3CXZZNtq4EC+PMmQ3IvviWpx3ix3T35qEpAQ=;
 b=lkOvdBwQZloOsTveTWFaja1Dieuhw7jgKYBJvxE1ELnb6wjCi2a0sUJA5e5UcE26yO
 h38yX6zkoPfMHQWY8uXJRqIBnMlqUNwOM19GZkwaAMSfSVInt2T+WVNydQi9OhEX7swB
 KRN2/0FT6Tl3tvi3h94FEDBU+inHJGn6VrlailO1K7tJZRAss1ieKBh/nZVwj8UsvTTL
 pfUx1mFl+QSKlLs8mgoq5eNauNCkTG7tTkDTg7XGRzgUd0VjJ091VlE/AjEcuNNIbnru
 J/unE1YjhT9rfgXiLroCzfMgt+IegqnERfv6sTZrHzJ6zVaRiBgIxV65gf7cRPEAdx1b
 PJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779391740; x=1779996540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ws4Wuj3CXZZNtq4EC+PMmQ3IvviWpx3ix3T35qEpAQ=;
 b=N6HKWQBXTNP2chCHB2HC5opeFVgfu787eE6sSqR5ckeo/IRSMsqSCy4VpI10p5sl/v
 aWA/WFqD4AsOg0D7z7/g/D3t7yEatT7Bf9uDIQAXG4ulWgRCyWHNqWgmOTzus9o1kfoa
 blI7ZhF01NzBK+qvY5ARn0D9aUUBfzuBvFqKJQxy5PoDbaxHSYIrIg7KtL0UA+DkOgwA
 xasGQBKObqnivXg5Cy/Eg5lva5AXnrR05oO79qMO0W2R8/LHumEsvpLzB8qyGI/Hgjhh
 Cp8kRgGnA5kRfTAbgFBvCnsiqnuSywSz+9m5dl2J6AVLHUnxNnfCyB5WlP3o3GFc/zC+
 NJYA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9N8qytrHa2B7I4YhJIHAf76V3rlmUQEhj71RzbgeHgg+U4R0KQCRQ/TTQ02B/s+xC+aS5PXUfgLg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCPjJaVipGaKVyA4gaocXOlvQnFaDu/U1K96BWuBgFIahWtq9a
 NlQMiVBkf79/wPmCN/XQ3BJXOSl06bT2ovwZ9KsJVkJdDj+OYfHf2srL4iTA+HNXPFwU2o5tcsj
 pTEoPs8VlfQeNi+fd3+9Z+x7W9EG1k8KC9Ce9O4zy
X-Gm-Gg: Acq92OHCmR4oZqpoEXpahL+KmQt9se/70b3MhLHbA+fIn/aYxG3PcwZmJ60gWkWahZ5
 E7YQa1Xdw6uPDyx6vbGp7HKJRVmJbaRQYHSNfUADeisG20YtpJ5YYACBpkDZmXlw6wgEBJF8P7n
 yZtRylCYrPOT9OPgb5HAhcm+33/bXTgY47z+Zkan7edJjaJIE4jKZs0pdhP3q8oL8lj3sVM3ysd
 u8rR3vQ8kSVLsoLFI/A1CW45AMlvgKrikqtffbvXMKSI5njtuXPxXwXCLzygLjhDeTA+Bq6hJyW
 GLAcw3IBDVuh80vRmc6t5LGTCjcwPuIYn6gAO5Z9f+b/PoBuvF5njIqmbzt17A06kCRYX5p6tht
 JZUpHecp9VFUqoFxDt7yKIi6/CBtPG7Y6yXTDqLzTEzmbx4DXbkSHtVRH1H/W
X-Received: by 2002:a05:6871:4390:b0:42c:5ce:3fbf with SMTP id
 586e51a60fabf-43b5aa61c4fmr270735fac.13.1779391739185; Thu, 21 May 2026
 12:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260521180143.2143262-1-sean@poorly.run>
 <6d8e36e2aea806f9973b3c501aad4523f7316d6a@intel.com>
In-Reply-To: <6d8e36e2aea806f9973b3c501aad4523f7316d6a@intel.com>
From: Sean Paul <seanpaul@google.com>
Date: Thu, 21 May 2026 15:28:21 -0400
X-Gm-Features: AVHnY4L2anUydq_L67QU46fv9RB9GULiXwcGBVPw2CKypMRulFNg7KoJtoZEDCs
Message-ID: <CAOw6vbL-+YZED15LFH0PRbxWbKhkOohNd+fnJMmVtdvF=A31RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/color: Fix plane color pipeline programming bugs
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, May 21, 2026 at 2:39=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 21 May 2026, Sean Paul <sean@poorly.run> wrote:
> > From: Sean Paul <seanpaul@google.com>
> >
> > Fix two bugs in the plane-level color pipeline programming:
> > 1. Fix a step discontinuity in the Post-CSC Gamma LUT when SDR dimming
> >    is active by clamping Segment 2 to the last user-provided LUT entry
> >    value instead of hardcoding it to 1.0 (1 << 24).
> > 2. Fix a typo in the loop condition in xelpd_program_plane_pre_csc_lut
> >    for Segment 2 degamma programming, changing 'while (i++ > 130)' to
> >    'while (i++ < 130)'. Also clamp Segment 2 to the last user-provided
> >    LUT entry value instead of hardcoding it to 1.0 (1 << 24) to fix
> >    a step discontinuity similar to the Post-CSC fix.
>
> One fix per patch, please.

Ack

>
> For #2 there's already [1].

This isn't in drm-tip or drm-intel afaict. I'll drop it out of my set,
but could you please apply it?

Sean

>
> BR,
> Jani.
>
> [1] https://lore.kernel.org/r/20260519075245.383864-1-pranay.samala@intel=
.com
>
> >
> > Signed-off-by: Sean Paul <seanpaul@google.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/d=
rm/i915/display/intel_color.c
> > index 2d318e922671..9b807b024ec3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -3953,6 +3953,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
> >       enum plane_id plane =3D to_intel_plane(state->plane)->id;
> >       const struct drm_color_lut32 *pre_csc_lut =3D plane_state->hw.deg=
amma_lut->data;
> >       u32 i, lut_size;
> > +     u32 lut_val =3D 1 << 24;
> >
> >       if (icl_is_hdr_plane(display, plane)) {
> >               lut_size =3D 128;
> > @@ -3963,7 +3964,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
> >
> >               if (pre_csc_lut) {
> >                       for (i =3D 0; i < lut_size; i++) {
> > -                             u32 lut_val =3D drm_color_lut32_extract(p=
re_csc_lut[i].green, 24);
> > +                             lut_val =3D drm_color_lut32_extract(pre_c=
sc_lut[i].green, 24);
> >
> >                               intel_de_write_dsb(display, dsb,
> >                                                  PLANE_PRE_CSC_GAMC_DAT=
A_ENH(pipe, plane, 0),
> > @@ -3975,8 +3976,8 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
> >                       do {
> >                               intel_de_write_dsb(display, dsb,
> >                                                  PLANE_PRE_CSC_GAMC_DAT=
A_ENH(pipe, plane, 0),
> > -                                                (1 << 24));
> > -                     } while (i++ > 130);
> > +                                                lut_val);
> > +                     } while (i++ < 130);
> >               } else {
> >                       for (i =3D 0; i < lut_size; i++) {
> >                               u32 v =3D (i * ((1 << 24) - 1)) / (lut_si=
ze - 1);
> > @@ -4023,11 +4024,11 @@ xelpd_program_plane_post_csc_lut(struct intel_d=
sb *dsb,
> >                                                  lut_val);
> >                       }
> >
> > -                     /* Segment 2 */
> > +                     /* Segment 2 - clamp to the last LUT value to pre=
vent step discontinuity */
> >                       do {
> >                               intel_de_write_dsb(display, dsb,
> >                                                  PLANE_POST_CSC_GAMC_DA=
TA_ENH(pipe, plane, 0),
> > -                                                (1 << 24));
> > +                                                lut_val);
> >                       } while (i++ < 34);
> >               } else {
> >                       /*TODO: Add for segment 0 */
>
> --
> Jani Nikula, Intel
