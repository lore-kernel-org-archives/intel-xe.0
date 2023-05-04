Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857D9C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 06:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FC710E391;
	Thu,  4 May 2023 06:12:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A7F10E38F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 06:12:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A3686164D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 06:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E64FC433EF
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683180761;
 bh=u6gzfF6zvZ+Rh2lg4/Rwr21CWC+TnUvzZUXZFgl/B8M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PyJbFZJ5xX9vGERXbko0jYrKF0ffgogXZD94UxFXaLAIG90dLhB5ZfPxowpJHWRYO
 bybLNVJxvCVwHXSVRUzlE4rBy/35kHLB7Tk9bIJQ3CGmEHuSU48eVf6KW0Z2a3Nrur
 BfPABllO0W6Y4+ujEcllTv7NNUhgtX30XcG4Gr8BxM8u2dhGXSiHBzTCt5+aVgRH8J
 cg4EXddkXIaV6otJ5PVfxwOs64W7GxUQn6FjRzzUpq/WVjFbVWgXJCxyg8cimljCN4
 UZwvyQpu/ZP8BDQKMp5AB/bzQNAP+nlZ46JJPmdivV+aEHMfkSin5CfuWe6dYnNF97
 QI19nzMu3jf+w==
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-b996127ec71so187710276.0
 for <intel-xe@lists.freedesktop.org>; Wed, 03 May 2023 23:12:41 -0700 (PDT)
X-Gm-Message-State: AC+VfDxDw/Ju9zsPzs/bct/s0WAu5oSxFxcc32RE9fOg6atxSAxlDD5u
 xoyCR7CJmObxNNRerbTN/gpVgPxrL1K1egnyQtU=
X-Google-Smtp-Source: ACHHUZ6c6YVE6iBdRMBwk3EIGyfCu1/dy0Qc8qDldAhe9+xQCHwnd4GSAVkIxW1+1bhLIzyW9tv17zKENy236hZcLcY=
X-Received: by 2002:a25:40d2:0:b0:b9e:7589:62fc with SMTP id
 n201-20020a2540d2000000b00b9e758962fcmr7516152yba.28.1683180760469; Wed, 03
 May 2023 23:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503131005.1602412-1-jani.nikula@intel.com>
 <20230503131005.1602412-12-jani.nikula@intel.com>
 <ZFJoyJwtpFak/adU@rdvivi-mobl4>
In-Reply-To: <ZFJoyJwtpFak/adU@rdvivi-mobl4>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 4 May 2023 09:12:13 +0300
X-Gmail-Original-Message-ID: <CAFCwf10UCjS9+GA3Xjm12UWA5Qd0Hn7FoKXv-u+pjB3XtBf0Sw@mail.gmail.com>
Message-ID: <CAFCwf10UCjS9+GA3Xjm12UWA5Qd0Hn7FoKXv-u+pjB3XtBf0Sw@mail.gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 11/18] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 3, 2023 at 4:59=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@kernel.or=
g> wrote:
>
> On Wed, May 03, 2023 at 04:09:58PM +0300, Jani Nikula wrote:
> > Add the read8 accessor to support intel_de_read8.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> I wonder if we should have this as a new separated patch instead of a fix=
up?
> Then when rebasing with autosquash we make sure to put this before the
> xe/display patches...
>
> Oded has already started to review the xe-rev1 branch and I'd like
> to avoid changes to the patches that are in that branch already.
>
> But this is really small, probably with his ack we can keep as this fixup=
!
I haven't managed to do a lot yet, so keeping this patch as fixup is fine.
Oded
>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.=
h
> > index 1a32e0f52261..b72a0a75259f 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -17,6 +17,14 @@ struct xe_device;
> >
> >  int xe_mmio_init(struct xe_device *xe);
> >
> > +static inline u8 xe_mmio_read8(struct xe_gt *gt, u32 reg)
> > +{
> > +     if (reg < gt->mmio.adj_limit)
> > +             reg +=3D gt->mmio.adj_offset;
> > +
> > +     return readb(gt->mmio.regs + reg);
> > +}
> > +
> >  static inline void xe_mmio_write32(struct xe_gt *gt,
> >                                  u32 reg, u32 val)
> >  {
> > --
> > 2.39.2
> >
