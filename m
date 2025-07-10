Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE58C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 18:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484E810E238;
	Thu, 10 Jul 2025 18:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VwgyttzB";
	dkim-atps=neutral
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1A210E238
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 18:25:32 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so1755954b3a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752171931; x=1752776731;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fme3qidvzTY1mT8dF0PnlqJ0Nqz3hq5qKHlnrRYfVBg=;
 b=VwgyttzBDH8L6aSsfR4Qgr1BAC55b6YZ5eBkjh5sAR+ZX/xHApjRkSnE7JxArSd0aZ
 iWulQVd0xRvbuz4dJcOAMB+UW4M2Qa6aR4F3Am/L2iB6h/EGWxkbH4x7zTp0tMHPlmym
 DHnp4DnG2tztYEWHtqv2fF9DtYMjXmnRz6Bc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752171931; x=1752776731;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fme3qidvzTY1mT8dF0PnlqJ0Nqz3hq5qKHlnrRYfVBg=;
 b=ImHzw0vIevbx5ZqFsHiJXt2bXkej6J4MHerut86wL708hSoj/RxaGBHCgfVQj1skht
 64BORglBq8w1jys125CXuaJaYFJvVf95HUuEzvQ23OlXOJnMKceTgA5B20eslfe8p1kY
 S2AXbreDQev7yoIaSyMUxHsUYk9C6w6XJ6eYBm2AN76pLQ/BzLmcCRNcRSCmlIO4wl88
 OcDsas1SfaYHwd+8Teaocelj3hnAPnJJ1B7o7ezaPZZDZtAYxYTcOhpikX52+/GlLs5j
 1Q70GhQxmzurubzFAKEdbasG020XC2M1IkHRs9JMympm7NiU0l9GSUaLE2lX0cD9GzP/
 5GNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi13Jz8fiWWeoa39l9JICDlOKyJftd7wQIPcY/WFzf4GzXqMMXFckgCaSg5qGaJS7I6dFgpRdksw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2seSREsKCiL18BxCHsOkPGpypKhz3VChSXgTVEWY/9rsezgW2
 Cp7YTVF4w2lGhE38Je77gCN9LoW8mQYCFAPvCyd9alSx79Sm49AkUm6B1HAgnFvw2g==
X-Gm-Gg: ASbGncuVh8rx8vlSgdSPP6W/UwaROpHYiWzPFQ4x+UFP6ww2EQKAuJXmn0rv+w62OO+
 HEV5eJwQpn9YjmTbPrcXb0UxQikG+u49qkEuuNt4rd66/ATOXxlslyVR+Cj6Ek9hLCZpnuroqU+
 wVgXqEJSFVynZuWLXG3usepp4kudk/e/xybiHuG7StFaJES26ob0yzA9v5W1UIJiiKxB5MiLsGm
 gQAAJD+KHPg9JzmLbCDSegULK70TBjfFzw0EGTdHbHLU6k65uIKI2iDPIHViYTtudYbwhG6CZMY
 gg4y5MlVNiTZS+boxfeA1UcTFmjunG4yXyQQdouA/Nk1bRoFkF0NkBkumDgT4mMZOMsMfKsS2g/
 c6UWLVo9rbcDFg+Mkkv3QkO6qij4e/wf9hZ5SzVt3lxqtobSK
X-Google-Smtp-Source: AGHT+IF++ELGSNnoV+huyyaAykivAc6X08oSFr8WeXORsZBPbCJv7r2Rq+Lex7N8crit+ADb6iVelg==
X-Received: by 2002:a05:6a00:4b47:b0:74e:b9fd:4a33 with SMTP id
 d2e1a72fcca58-74ee30457f4mr57488b3a.22.1752171931504; 
 Thu, 10 Jul 2025 11:25:31 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f8cee7sm3045308b3a.158.2025.07.10.11.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 11:25:30 -0700 (PDT)
Message-ID: <6c957d612a484ce68b582e58bf98bc57395e07c0.camel@chromium.org>
Subject: Re: [CI] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Thu, 10 Jul 2025 11:25:30 -0700
In-Reply-To: <qam7njmuxr23wzswe2g3mumtd7usjiamovl7sisvqwt5wkgfef@j36kxiphdzy6>
References: <20250709192313.479336-2-lucas.demarchi@intel.com>
 <qam7njmuxr23wzswe2g3mumtd7usjiamovl7sisvqwt5wkgfef@j36kxiphdzy6>
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

On Thu, 2025-07-10 at 09:56 -0500, Lucas De Marchi wrote:
> On Wed, Jul 09, 2025 at 12:23:14PM -0700, Lucas De Marchi wrote:
> > From: Juston Li <justonli@chromium.org>
> >=20
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
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
> > drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++++++
> > 2 files changed, 25 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 7f8470b22dc99..4e0355d0f406b 100644
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
> > @@ -418,6 +420,19 @@ static void xe_ttm_tt_account_subtract(struct
> > xe_device *xe, struct ttm_tt *tt)
> > 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt-
> > >num_pages, 0);
> > }
> >=20
> > +static void update_global_total_pages(struct ttm_device *ttm_dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long num_pages)
> > +{
> > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
> > +	u64 global_total_pages =3D
> > +		atomic64_add_return(num_pages, &xe-
> > >global_total_pages);
> > +
> > +	trace_gpu_mem_total(xe->drm.primary->index, 0,
> > +			=C2=A0=C2=A0=C2=A0 global_total_pages << PAGE_SHIFT);
> > +#endif
> > +}
> > +
> > static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > *ttm_bo,
> > 				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 page_flags)
> > {
> > @@ -525,6 +540,7 @@ static int xe_ttm_tt_populate(struct ttm_device
> > *ttm_dev, struct ttm_tt *tt,
> >=20
> > 	xe_tt->purgeable =3D false;
> > 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
> > +	update_global_total_pages(ttm_dev, tt->num_pages);
> >=20
> > 	return 0;
> > }
> > @@ -541,6 +557,7 @@ static void xe_ttm_tt_unpopulate(struct
> > ttm_device *ttm_dev, struct ttm_tt *tt)
> >=20
> > 	ttm_pool_free(&ttm_dev->pool, tt);
> > 	xe_ttm_tt_account_subtract(xe, tt);
> > +	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
> > }
> >=20
> > static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct
> > ttm_tt *tt)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 78c4acafd268b..5b48b9604fc0d 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -632,6 +632,14 @@ struct xe_device {
> > 		unsigned int fsb_freq, mem_freq, is_ddr3;
> > 	};
> > #endif
> > +
> > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > +	/**
> > +	 * @global_total_pages: global GPU page usage tracked for
> > gpu_mem
> > +	 * tracepoints
> > +	 */
> > +	atomic64_t global_total_pages;
> > +#endif
>=20
> I also had to move this up, above /* private: */, otherwise kernel-
> doc
> shows a warning:
>=20
> 	Warning: drivers/gpu/drm/xe/xe_device_types.h:642 Excess
> struct member 'global_total_pages' description in 'xe_device'
>=20
> Applied to drm-xe-next, thanks.

Thanks for your feedback and guidance getting this landed!

Juston

> Lucas De Marchi
>=20
> > };
> >=20
> > /**
> > --=20
> > 2.49.0
> >=20
