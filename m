Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27E7C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 16:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6085B10E0A7;
	Wed,  9 Jul 2025 16:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JeHFsHVs";
	dkim-atps=neutral
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BB410E2DE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 16:19:01 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3122a63201bso156831a91.0
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Jul 2025 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752077940; x=1752682740;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WB0cSlpgHObUJTPQDLX4QuR9PrmDikXz04vEGr/TQgo=;
 b=JeHFsHVs+jgcD4u5LKa99Y0MDHai+PShXXwMyLPx9iFtevBbPZ2Lf6B00c2eTCwTrX
 ols4i1/3PQlWzKfsVmdHuIf6u/daseBdV+h3dVVyjMbga0TyAdb8QIIhqPiP3eV/SqqH
 df+VXOzDxMpWFspUI5wlrzyrSAi/nRu6e1rrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752077940; x=1752682740;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WB0cSlpgHObUJTPQDLX4QuR9PrmDikXz04vEGr/TQgo=;
 b=GR7v7Kth5V8dqUH3qWW3b41NdRkQYuCeb7YPvHgnDuxKCStYpeTQ+8p5+JVGzh1T7A
 IebGac2z0YsS9Sr4qxHg9i0ser5QHv7R1CtOJOk0N1lxaeoum7gwwkpdu914cnjH5Qp5
 67DjEu1Evi3USen2cJjAiAdngyh+4muTJuE36UIZ6y0iSgAGnWjmLlcNK466790MIvM3
 OK9YcMibTLIogVPJLtwMC6mIZz1ZpbKp4WkmV55js2SOx1/K1rruyH3yHHRkDfjUt2Qv
 OdZzTun5KEIHLq7lqMVDKFHUWm9ZJDeB03dI/cyzzeHl73uHhXMnz8h8+QVFlTxjX7MZ
 LA9Q==
X-Gm-Message-State: AOJu0YyueT09P1RcNBlNZxlXxsJB+0Lk9rr15b0xxGMqD+a29txdaoAj
 ZokblrqB1luPgTW7uJ54diMH+8IDoZ4fVCB0YwNmAkrY+s9sy0fXCDnH2gd2fC0G9Q==
X-Gm-Gg: ASbGncs0MhqYiRYE17k2E2PWGV79LzY8a0j9KKeaY84MN0TseGRvV/fFKx+KMHCAgKC
 d0HpF1JbOAE5uqUgHqhYH993+TKsVriQRFyKr2bxg4fkmc7992X2/Hhz601/z1MtlNPPty2HfF/
 LV5WV1ZlBcCF9pxLxp9L2MFuAMME70rGIlMuYUPCRe51lpNdHjCrUm9i++uctZ4app/RuGKKCNk
 /h4flwZnAiTWXve7aaRfFyxZaBLX6pyONdb2jR2wDcp/YXpkrq3v4/E7aItx9l/MUScXJpGKcVn
 2TchrXcDT/WKWi7BowISzwuLgAlWAMmdj6M4NOoWsDtPWtqsnCqJ0VMbvxbwzeD0eM+Sr96/0kw
 wrI48xJo5/o88/vYAHRnkwY9tfML+EcZ4vPIXZ6FdA1tqJn+G
X-Google-Smtp-Source: AGHT+IFke1rWcERTnVfsNfizWhdI48Cb7B3RZHpWRa/Xxw+Wp8UABWvnwAmyc1QGgSwsUq1m6VPQow==
X-Received: by 2002:a17:90b:4d07:b0:313:1e9d:404b with SMTP id
 98e67ed59e1d1-31c2fd26befmr5297301a91.2.1752077940381; 
 Wed, 09 Jul 2025 09:19:00 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455babasm140538685ad.107.2025.07.09.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 09:18:59 -0700 (PDT)
Message-ID: <858a70c5779027572476e02fb7aa580cf7e829f9.camel@chromium.org>
Subject: Re: [PATCH v5 2/2] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang	 <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 09 Jul 2025 09:18:58 -0700
In-Reply-To: <dqatebbwn3ek7nfguu2l2b4awc7a4pqlizuh5cvaa5jfqmiakv@z3voepobjgul>
References: <20250707203849.545312-1-justonli@chromium.org>
 <20250707203849.545312-2-justonli@chromium.org>
 <dqatebbwn3ek7nfguu2l2b4awc7a4pqlizuh5cvaa5jfqmiakv@z3voepobjgul>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
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

On Tue, 2025-07-08 at 15:29 -0500, Lucas De Marchi wrote:
> On Mon, Jul 07, 2025 at 01:38:23PM -0700, Juston Li wrote:
> > Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.
> >=20
> > These are required by VSR on Android 12+ for reporting GPU driver
> > memory
> > allocations.
> >=20
> > v5:
> > - Drop process_mem tracking
> > - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
> > - Formatting cleanup under 80 columns
> >=20
> > v3:
> > - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
> > =C2=A0 per-driver Kconfig (Lucas)
> >=20
> > v2:
> > - Use u64 as preferred by checkpatch (Tvrtko)
> > - Fix errors in comments/Kconfig description (Tvrtko)
> > - drop redundant "CONFIG" in Kconfig
> >=20
> > Signed-off-by: Juston Li <justonli@chromium.org>
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > ---
> > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 22 ++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++++++
> > 2 files changed, 30 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021ab..950eef514c11c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -19,6 +19,8 @@
> >=20
> > #include <kunit/static_stub.h>
> >=20
> > +#include <trace/events/gpu_mem.h>
> > +
> > #include "xe_device.h"
> > #include "xe_dma_buf.h"
> > #include "xe_drm_client.h"
> > @@ -418,6 +420,24 @@ static void xe_ttm_tt_account_subtract(struct
> > xe_device *xe, struct ttm_tt *tt)
> > 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt-
> > >num_pages, 0);
> > }
> >=20
> > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > +static void update_global_total_pages(struct ttm_device *ttm_dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long num_pages)
> > +{
>=20
> wouldn't it be better to move the ifdef inside the function?
> Any compiler would remove the empty call regardless of the inline
> annotation, so I think this would make it less error prone if we
> change
> function signature.
>=20
> No need to send a new version, I can move that while applying
> if agreed.

SGTM, thanks!

Juston

> Lucas De Marchi
