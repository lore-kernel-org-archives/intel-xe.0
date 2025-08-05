Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C36CC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 16:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE0E10E6C4;
	Tue,  5 Aug 2025 16:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOSKvGIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA29110E6C4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754411268; x=1785947268;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tNm7VkeISTA5o9to4c/4NtV9PUET6+/ngTVQoDoNDro=;
 b=fOSKvGIScXo8iV0lUaL+StOjVfpIQZQ173dqW9IIQJfvl1xUAoy6OaeS
 da3e+xeSbmqkbhUy5WJN3JB5CAM5V1oN5PDLfnLchrng5BxAZWyZj1qG2
 oR+lJQIuCox4hnCdNT57gvZodBu0oIDtlBsx+g8bUmGjpAEM3go4KEAb0
 VAjdaim9Ln891hX6z97KlFB/rtl+sbpir46b9UGRaSUAgIyQx4ICFB4c+
 nS+Dc+ueiZoKJSOmxG/W6KUbiJ9jlpjrPNsu19RHnZIkNot8WivSLIYb6
 W9iKoKib/zFckHpsV8VicFRaGJSan9IDWfIMQek3Q0XpcY+OYSzq7KaM9 g==;
X-CSE-ConnectionGUID: m9zVWMIgQsiEveUozIgtHA==
X-CSE-MsgGUID: C/1vEgI2Qj+KXI4YMDXE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67417079"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67417079"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:27:47 -0700
X-CSE-ConnectionGUID: 2WJKy6mYTuK0N0Cm0zHjZg==
X-CSE-MsgGUID: Wh+U4HwZSRO6C/GfyTYclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="163782675"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.229])
 ([10.245.245.229])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:27:46 -0700
Message-ID: <3e90708318a368704a8aa7aa89682fb3743d7f3f.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Defer buffer object shrinker write-backs and
 GPU waits
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: melvyn <melvyn2@dnsense.pub>, Summers Stuart <stuart.summers@intel.com>
Date: Tue, 05 Aug 2025 18:27:43 +0200
In-Reply-To: <c4346dd6-ec12-46cc-93c2-7bc3aa16c6c4@intel.com>
References: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
 <c4346dd6-ec12-46cc-93c2-7bc3aa16c6c4@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2025-08-05 at 14:40 +0100, Matthew Auld wrote:
> On 05/08/2025 08:48, Thomas Hellstr=C3=B6m wrote:
> > When the xe buffer-object shrinker allows GPU waits and write-back,
> > (typically from kswapd), perform multiple passes, skipping
> > subsequent passes if the shrinker number of scanned objects target
> > is reached.
> >=20
> > 1) Without GPU waits and write-back
> > 2) Without write-back
> > 3) With both GPU-waits and write-back
> >=20
> > This is to avoid stalls and costly write- and readbacks unless they
> > are really necessary.
> >=20
> > v2:
> > - Don't test for scan completion twice. (Stuart Summers)
> > - Update tags.
> >=20
> > Reported-by: melvyn <melvyn2@dnsense.pub>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5557
> > Cc: Summers Stuart <stuart.summers@intel.com>
> > Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> > Cc: <stable@vger.kernel.org> # v6.15+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.c | 51
> > +++++++++++++++++++++++++++++---
> > =C2=A0 1 file changed, 47 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 1c3c04d52f55..90244fe59b59 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -54,10 +54,10 @@ xe_shrinker_mod_pages(struct xe_shrinker
> > *shrinker, long shrinkable, long purgea
> > =C2=A0=C2=A0	write_unlock(&shrinker->lock);
> > =C2=A0 }
> > =C2=A0=20
> > -static s64 xe_shrinker_walk(struct xe_device *xe,
> > -			=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> > -			=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags flags,
> > -			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> > *scanned)
> > +static s64 __xe_shrinker_walk(struct xe_device *xe,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags
> > flags,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> > *scanned)
> > =C2=A0 {
> > =C2=A0=C2=A0	unsigned int mem_type;
> > =C2=A0=C2=A0	s64 freed =3D 0, lret;
> > @@ -93,6 +93,48 @@ static s64 xe_shrinker_walk(struct xe_device
> > *xe,
> > =C2=A0=C2=A0	return freed;
> > =C2=A0 }
> > =C2=A0=20
> > +/*
> > + * Try shrinking idle objects without writeback first, then if not
> > sufficient,
> > + * try also non-idle objects and finally if that's not sufficient
> > either,
> > + * add writeback. This avoids stalls and explicit writebacks with
> > light or
> > + * moderate memory pressure.
>=20
> Just one question here, with writeback=3Dfalse it doesn't really
> influence=20
> which objects are chosen for shrinking, unlike with no_wait_gpu,
> right?=20
> Will having another pass just with writeback=3Dtrue yield anything=20
> different, assuming here that the previous two passes would have
> already=20
> hoovered ~everything up that was a possible candidate, so this pass=20
> won't really find anything in practice? If so, does that also mean we
> never really end up using the writeback=3Dtrue behaviour any more?

Good point.

The assumption is that if allocating shmem backing-store fails during
shrinking, we'd see an -ENOMEM and fail our target, and the next pass
with writeback would help avoiding that.

Ofc that requires that a shmem_read_folio() from within reclaim returns
an ERR_PTR(-ENOMEM) if the kernel reserves are depleted rather than to
invoke the OOM killer. I should perhaps test that.

Other options would ofc be to include the writeback in pass 2, which
would be similar to what the i915 shrinker does.

Thoughts?

Thanks,
Thomas



>=20
> > + */
> > +static s64 xe_shrinker_walk(struct xe_device *xe,
> > +			=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> > +			=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags flags,
> > +			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> > *scanned)
> > +{
> > +	bool no_wait_gpu =3D true;
> > +	struct xe_bo_shrink_flags save_flags =3D flags;
> > +	s64 lret, freed;
> > +
> > +	swap(no_wait_gpu, ctx->no_wait_gpu);
> > +	save_flags.writeback =3D false;
> > +	lret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan,
> > scanned);
> > +	swap(no_wait_gpu, ctx->no_wait_gpu);
> > +	if (lret < 0 || *scanned >=3D to_scan)
> > +		return lret;
> > +
> > +	freed =3D lret;
> > +	if (!ctx->no_wait_gpu) {
> > +		lret =3D __xe_shrinker_walk(xe, ctx, save_flags,
> > to_scan, scanned);
> > +		if (lret < 0)
> > +			return lret;
> > +		freed +=3D lret;
> > +		if (*scanned >=3D to_scan)
> > +			return freed;
> > +	}
> > +
> > +	if (flags.writeback) {
> > +		lret =3D __xe_shrinker_walk(xe, ctx, flags, to_scan,
> > scanned);
> > +		if (lret < 0)
> > +			return lret;
> > +		freed +=3D lret;
> > +	}
> > +
> > +	return freed;
> > +}
> > +
> > =C2=A0 static unsigned long
> > =C2=A0 xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> > *sc)
> > =C2=A0 {
> > @@ -199,6 +241,7 @@ static unsigned long xe_shrinker_scan(struct
> > shrinker *shrink, struct shrink_con
> > =C2=A0=C2=A0		runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker,
> > true, 0, can_backup);
> > =C2=A0=20
> > =C2=A0=C2=A0	shrink_flags.purge =3D false;
> > +
> > =C2=A0=C2=A0	lret =3D xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags=
,
> > =C2=A0=C2=A0				nr_to_scan, &nr_scanned);
> > =C2=A0=C2=A0	if (lret >=3D 0)
>=20

