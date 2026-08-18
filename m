Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B334BC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 12:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C8710E02E;
	Tue, 18 Aug 2026 12:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpNoFA7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98A210E02E
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 12:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787055040; x=1818591040;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6UQSf51y4MrSMDM0ZgSjRgVC5OQpxJ5eewEyzpthDHw=;
 b=YpNoFA7MUBK7mlcJO36ICzIw0LSZ9zwYFQo7baOhOOI8/3R2YphH8Z0a
 PwA8ueXJF9tQ6f9wM3UazbiCELJ/JOQfpV1IJyI/8VPwzGa/mEZvNdi7q
 ppXK5J+Q8RBQFhs6zgeSR8KDVC8E9YrtDeLP49iXdDQ617Kr1d2V65Asj
 xkzYL1aI8dgY2DcXlCODlYmxlQDm51TxqJBuP4cViG9/VSjw+m/rnsK1T
 USoQPFliFaLk3M+v9s2uRyaftXGkz2v+a/0O11mUZVbln/IFQRIFqZF/T
 oVvDD1K/LgpNXGEJuQ7eogW4cjB6fBPEDGbvfEpAYMdCL6LvFKVUlvVLC w==;
X-CSE-ConnectionGUID: zPJcB8RnSwWJONKdw5tfHA==
X-CSE-MsgGUID: 72URf69vSnGjrgrjddmB2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="97882260"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="97882260"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:10:39 -0700
X-CSE-ConnectionGUID: 5rTRN8OwTzGqMougYBO5iw==
X-CSE-MsgGUID: WWF8p4lxQx6KIdNHnCR4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="290019699"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.14])
 ([10.245.244.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:10:37 -0700
Message-ID: <723431d70f8cdc1534a040416fe93b4f9bdab529.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on
 average BO size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 18 Aug 2026 14:10:35 +0200
In-Reply-To: <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
 <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-08-14 at 16:24 -0700, Matthew Brost wrote:
> On Fri, Aug 14, 2026 at 04:37:37PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Update our preferred vmscan batch size on each count pass to avoid
> > invoking scan_objects for requests too small to free even a single
> > average-sized GEM object. Our rough estimate for an effective batch
> > is twice the average number of pages per populated ttm_tt across
> > all
> > shrinkable and purgeable objects. The factor of two provides
> > headroom
> > so that most scan invocations can free at least one GEM object
> > despite
> > variability in object sizes.
> >=20
> > The batch value is updated as an exponential moving average,
> > (old_batch + avg) / 2, to smooth out sudden changes in the
> > object population. It is floored at 128 pages, the kernel default
> > SHRINK_BATCH, to ensure the shrinker remains responsive when there
> > are very few objects.
> >=20
> > The populated_tts counter introduced in the previous commit
> > provides
> > the object count needed for the average. We inherit the same
> > justification as the analogous mechanism in i915: shrinking a GEM
> > object has non-trivial locking overhead, so firing the shrinker for
> > requests smaller than a single object is wasteful.
> >=20
> > v2:
> > - Fix the average object size estimate to account for the full
> > =C2=A0 shrinkable and purgeable population.
> >=20
> > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > Assisted-by: GitHub_Copilot:claude-sonnet-5
>=20
> This is probably the right direction given what we currently have in
> terms of shrinker control, but the core heuristic is still a pretty
> poor
> one. My understanding is that it combines batch and seek values using
> some odd math to determine whether a scan is worthwhile at a given
> priority level. We probably want to avoid shrinking at the initial
> scan
> priorities, and I believe this change accomplishes that.

Yes, but I think that's a side-effect not to be fully relied upon.

The meaning of this value IMO is to tell the core how many objects to
expect for a scan request, so that the core can hold off shrinking
until that many objects is actually this shrinker's fair share of its
available objects. So the side effect would be that this shrinker's
fair share of shrinking may not trigger a scan request if shrinking is
triggered by compacting?

>=20
> That said, I think we really want two shrinkers instead: one with the
> default settings (or perhaps even a reduced seek value) for purgeable
> BOs, and another for BOs that we legitimately need to back up. The
> purgeable one should be favored to run eariler, likewise the TTM pool
> shrinker should be favored run before our shrinker too.

I don't think we can or should use the batch size to decide which
shrinker should be prioritized. IIRC one of the comments to previous
series what that shrinkers should appear similar to the core, unless
some form of differentiation is implemented in the core. If we were to
add two shrinkers it would mean that purgeable objects would get its
fair share of shrinking and so would also active / live objects. With
the current design we prioritize internally to make sure we target
purgeable objects first.

>=20
> Also we really should look at getting priority based shrinking in
> too, I
> have follow up there too which disconnects purgable / not in working
> set
> from shared VM dma-resv also, further prioritizing though shrinks.
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 26 ++++++++++++++++++++++++++
> > =C2=A01 file changed, 26 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index cded230f5459..284fce207705 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -146,6 +146,8 @@ xe_shrinker_count(struct shrinker *shrink,
> > struct shrink_control *sc)
> > =C2=A0{
> > =C2=A0	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > =C2=A0	unsigned long num_pages;
> > +	unsigned long total_pages;
> > +	unsigned long populated_tts;
> > =C2=A0	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> > =C2=A0
> > =C2=A0	num_pages =3D ttm_backup_bytes_avail() >> PAGE_SHIFT;
> > @@ -157,8 +159,32 @@ xe_shrinker_count(struct shrinker *shrink,
> > struct shrink_control *sc)
> > =C2=A0		num_pages =3D 0;
> > =C2=A0
> > =C2=A0	num_pages +=3D shrinker->purgeable_pages;
> > +	total_pages =3D shrinker->shrinkable_pages + shrinker-
> > >purgeable_pages;
> > +	populated_tts =3D shrinker->populated_tts;
> > =C2=A0	read_unlock(&shrinker->lock);
> > =C2=A0
> > +	/*
> > +	 * Update our preferred vmscan batch size for the next
> > pass.
> > +	 * Our rough guess for an effective batch size is twice
> > the average
> > +	 * number of pages per GEM object. That is, we don't want
> > the
> > +	 * shrinker to fire until the request is large enough to
> > justify
> > +	 * the overhead of freeing at least one GEM object.
> > +	 *
> > +	 * Base the average on the full shrinkable + purgeable
> > population
> > +	 * (total_pages), not on num_pages, which is reduced to
> > just the
> > +	 * purgeable pages whenever the gfp mask disallows backup
> > (can_backup
> > +	 * false). Otherwise the estimate would systematically
> > undershoot in
> > +	 * exactly the GFP_NOFS / GFP_NOIO reclaim paths where
> > avoiding
> > +	 * excessive scan_objects() calls matters most.
> > +	 */
> > +	if (populated_tts) {
> > +		unsigned long avg =3D 2 * total_pages /
> > populated_tts;
> > +
> > +		shrinker->shrink->batch =3D
> > +			max((shrinker->shrink->batch + avg) >> 1,
> > +			=C2=A0=C2=A0=C2=A0 128UL /* default SHRINK_BATCH */);
>=20
> I think 128UL should be at least whatever TTM pool batch is?

Again, we should not use this to attempt to prioritize between
shrinkers. Just to ensure that we give a fair estimate of the actual
batch size.

Thanks,
Thomas


>=20
> Matt
>=20
> > +	}
> > +
> > =C2=A0	return num_pages ? num_pages : SHRINK_EMPTY;
> > =C2=A0}
> > =C2=A0
> > --=20
> > 2.55.0
> >=20
