Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D552C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C716010E18F;
	Tue, 27 May 2025 16:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UPW2Dz4l";
	dkim-atps=neutral
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0F110E165
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:53:40 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-47692b9d059so46018201cf.3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748364819; x=1748969619;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIF16cjUFV3ZsiCDhB3+Sm+ikqlHDW6+DhFShdpult8=;
 b=UPW2Dz4lRppGxMzeTJ0hl1BSdBflGZiC3tx3xhqU+fWdbMPAriWeYZMZHD0DhO8sgs
 k61NlQ637Q586/bh9+XpHUNeAjO47Zb6G5lAVwR6SWwEIRs507bivH9GDDEJVnjEtXSh
 hJNdxuctexqVyEV3TztGyGMGOcmKJea8mHyIyaRu8rUAY405dpyoJfHx5fFXHU783i0m
 GzIfMJeK/cjNqP/M5Fr4lacH79rvMkB3ski3HHtL/9yUaQF8SOvFxOGlMfYWcRLDW/mm
 U6HfUVUh+ntoeztMFDV6g4aFmriI66VrD0C7rjp7I7tau4qzCk0au3HDid0zoIl82EP1
 WUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748364819; x=1748969619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIF16cjUFV3ZsiCDhB3+Sm+ikqlHDW6+DhFShdpult8=;
 b=iRtwwt2x6pbaaY+PKcQrd7GKxbjSTZfn4Gb+wPfWdV70Ky3wlqhiriEc1IdrsXH4xK
 6zDUbVxjZOlOHgJLgRdc88ZIulCgHPBwrPS2nnpgPSUszRrot8tvv/X/Yfvcn8HkgNqe
 8UopiepF5JJhtwI/dsoOn0NrIKS/shwwLn9a9jiL6KR5nRD0bJe0VbpZzGtn2T7N3shv
 QnfANsSguoMaz7dpx/6xhyGA0PyZqOocDSptjqjTvX+wlMPd+eRB6maEvRMk/gyEQyG7
 39K3kQC9irvivtSWLkKy5YP61LNoH3OVMnwdBCyftvGX6hDcU4C6j1jXylUCelDRm6BA
 me1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmI9Ee3pWyg96L7GN8mUawaHNjkRACXAmXwoYihhqIWMR1zcVX/WEqEdeac66p0IUxSnGK18F0wQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaeHz3G2H2xbJh69eS+3GytT9DVnlnTVnsPXtMMiYuammjqZR7
 R7W4rvYCao3/96r9ceLTVOCSqJQyw1eu+t9/J31fR26IKEwg2Lu+d5ywXav+PfLWiNZDGZ+Ho8v
 NrRKIvJ55QbiMtY/yW2gu3aZ6Xe9Y8Wz40i3GfwWi
X-Gm-Gg: ASbGncvlxAkwJNBLSErPz9vPS2wOHI0mhiy96Ci/ZTECeNfb1pcm9pThFKuuOtIA84R
 GDDy0Np5WLvBrIAMZeBDpYhirh3A6s1pj1oillzGLeHI7PpN4eYTfCouOmH5azBk2aXgY+DqOKh
 zxtLNCLytVGCtXiClWWS1wjsWiy3vfev3pt3eogRb4DLXH
X-Google-Smtp-Source: AGHT+IGOVup33wYIMODjDjhZVEP6vy2HF6m2q4apgA6nEaPhlb8nmtWkfGEB1yr2n8kL+JhC8OndZwIrygPLx6jGAsA=
X-Received: by 2002:a05:622a:4c17:b0:47b:4d3:5d12 with SMTP id
 d75a77b69052e-49f47de69a1mr234209671cf.49.1748364819234; Tue, 27 May 2025
 09:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
 <87a5bsh27o.fsf@intel.com>
 <CAMCVhVOagmBOj5UOr_HdohPApSAuprsObBm107X0q_1UfvSU_w@mail.gmail.com>
In-Reply-To: <CAMCVhVOagmBOj5UOr_HdohPApSAuprsObBm107X0q_1UfvSU_w@mail.gmail.com>
From: Jonathan Denose <jdenose@google.com>
Date: Tue, 27 May 2025 11:53:28 -0500
X-Gm-Features: AX0GCFscBYeJUL9UQGWT4MYv3EMeVnwe6ivZFeKx6NRoEUN4Z0ec3DV-VJ7qOWc
Message-ID: <CAMCVhVNH0KMEFDX85Sp0zFxgccKvVigsHebXAnvpNi4W6jK3fA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/display: Add skip link check quirk
To: Jani Nikula <jani.nikula@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, imre.deak@intel.com
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

On Wed, Jan 15, 2025 at 9:47=E2=80=AFAM Jonathan Denose <jdenose@google.com=
> wrote:
>
> On Wed, Jan 15, 2025 at 3:10=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Tue, 14 Jan 2025, Jonathan Denose <jdenose@google.com> wrote:
> > > The display on the Advantech UTC124G3PWWW0E-ES worked fine until comm=
it
> > > "drm/i915/dp: Recheck link state after modeset" was introduced. After
> > > this commit the display flickers intermittently as the driver code
> > > initiates the delayed link recheck in an infinite loop.
> > >
> > > To resolve this issue for the Advantech device, add a quirk to skip o=
ver
> > > the delayed link recheck.
> >
> > It would be better to try to get at the root cause first, instead of
> > blindly skipping required parts. The code's complicated enough without
> > quirks, and removing them afterwards is very difficult.
> >
> > Please file a bug according to [1], and attach full dmesg with debugs
> > enabled.
>
> I filed a bug with the full dmesg a few weeks ago:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13344
>
> > Cc: Imre
> >
> > BR,
> > Jani.
> >
> >
> >
> > [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.=
html
> >
> >
> >
> > >
> > > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > > ---
> > >
> > >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 +++-
> > >  drivers/gpu/drm/i915/display/intel_quirks.c           | 8 ++++++++
> > >  drivers/gpu/drm/i915/display/intel_quirks.h           | 1 +
> > >  3 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/=
drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > index 397cc4ebae526..7804ad38b00cd 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > @@ -32,6 +32,7 @@
> > >  #include "intel_encoder.h"
> > >  #include "intel_hotplug.h"
> > >  #include "intel_panel.h"
> > > +#include "intel_quirks.h"
> > >
> > >  #define LT_MSG_PREFIX                        "[CONNECTOR:%d:%s][ENCO=
DER:%d:%s][%s] "
> > >  #define LT_MSG_ARGS(_intel_dp, _dp_phy)      (_intel_dp)->attached_c=
onnector->base.base.id, \
> > > @@ -1622,7 +1623,8 @@ void intel_dp_start_link_train(struct intel_ato=
mic_state *state,
> > >               lt_dbg(intel_dp, DP_PHY_DPRX, "Forcing link training fa=
ilure\n");
> > >       } else if (passed) {
> > >               intel_dp->link.seq_train_failures =3D 0;
> > > -             intel_encoder_link_check_queue_work(encoder, 2000);
> > > +             if (!intel_has_quirk(display, QUIRK_SKIP_LINK_CHECK))
> > > +                     intel_encoder_link_check_queue_work(encoder, 20=
00);
> > >               return;
> > >       }
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gp=
u/drm/i915/display/intel_quirks.c
> > > index 28f497ae785bb..d472a5f21f8b9 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> > > @@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *int=
el_dp)
> > >       drm_info(display->drm, "Applying Fast Wake sync pulse count qui=
rk\n");
> > >  }
> > >
> > > +static void quirk_skip_link_check(struct intel_display *display)
> > > +{
> > > +     intel_set_quirk(display, QUIRK_SKIP_LINK_CHECK);
> > > +     drm_info(display->drm, "Applying skip link check quirk\n");
> > > +}
> > > +
> > >  struct intel_quirk {
> > >       int device;
> > >       int subsystem_vendor;
> > > @@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] =3D {
> > >       { 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
> > >       /* HP Notebook - 14-r206nv */
> > >       { 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
> > > +     /* Advantech UTC124G3PWWW0E-ES */
> > > +     {0x5a85, 0x8086, 0x2212, quirk_skip_link_check},
> > >  };
> > >
> > >  static const struct intel_dpcd_quirk intel_dpcd_quirks[] =3D {
> > > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gp=
u/drm/i915/display/intel_quirks.h
> > > index cafdebda75354..9e8f2816a4fba 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> > > @@ -20,6 +20,7 @@ enum intel_quirk_id {
> > >       QUIRK_LVDS_SSC_DISABLE,
> > >       QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
> > >       QUIRK_FW_SYNC_LEN,
> > > +     QUIRK_SKIP_LINK_CHECK,
> > >  };
> > >
> > >  void intel_init_quirks(struct intel_display *display);
> >
> > --
> > Jani Nikula, Intel
> --
> Jonathan

Hello,

After discussing on the mailing list, Imre found that it was a link
status reporting issue and followed up with some patches at [1]. Are
these patches closer to what you'd be looking for since they more
directly address the root cause?

[1]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13344#note_277=
3364

--=20
Jonathan
