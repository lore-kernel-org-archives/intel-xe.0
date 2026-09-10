Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00727C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 15:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A121B10E088;
	Thu, 10 Sep 2026 15:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7jsEfXc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1610E088
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789055459; x=1820591459;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DAChlWhEoabI/TQ6v+JdAx+Mo376pmeNmiS+qeCsxN8=;
 b=Q7jsEfXc/GM2f34RA8kE0nOHT4OgL04fRKp7qoUlg71GmEyC4JnaEa2+
 ftkugIkiVowsMwtq/JZDoVycr2/CX/ZnZ1sMxSNTi53jH3+1yKv60cp5V
 cMzPpyftinXH0cU9G7utvO6p8NYmrgNHJEqqlqiiSKFAwnh114Lo1jhYD
 06gPq0kaBo4pFzEhY3E5nd+04vJkgToMjut0wmHhlPwBblgb8pAuhKRFI
 FAFoLUt05fENpsH8/uocg6OlNe5j5rFV+lLGSzAXBcKg3VLfx1NRmv57X
 EFdgm77lrC72GC9FqTetG2KeW7lUyrizpIdJehfMbaoAyppCcB0Vxs1Ox A==;
X-CSE-ConnectionGUID: DxMySDL8RCGcgzcldXIRQQ==
X-CSE-MsgGUID: F4bHQeqTQ2yywJm17Zfj8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77068144"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77068144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 08:50:58 -0700
X-CSE-ConnectionGUID: YVpgPoOMS72k2/Edvfq53w==
X-CSE-MsgGUID: 6dcAfZs8TiuOey+0ZNBqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268384846"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.193])
 ([10.245.245.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 08:50:57 -0700
Message-ID: <1ae2d69aa2a04b922c2fbc177a3d92733673ef18.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on
 average BO size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 10 Sep 2026 17:50:54 +0200
In-Reply-To: <9e00ce576d2801e8f7a514c76c3a333c73832383.camel@linux.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
 <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
 <723431d70f8cdc1534a040416fe93b4f9bdab529.camel@linux.intel.com>
 <aoTPVO57T1xKhOub@gsse-cloud1.jf.intel.com>
 <9e00ce576d2801e8f7a514c76c3a333c73832383.camel@linux.intel.com>
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

On Thu, 2026-09-10 at 12:54 +0200, Thomas Hellstr=C3=B6m wrote:
> On Tue, 2026-08-18 at 14:32 -0700, Matthew Brost wrote:
> > On Tue, Aug 18, 2026 at 02:10:35PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > On Fri, 2026-08-14 at 16:24 -0700, Matthew Brost wrote:
> > > > On Fri, Aug 14, 2026 at 04:37:37PM +0200, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > > > Update our preferred vmscan batch size on each count pass to
> > > > > avoid
> > > > > invoking scan_objects for requests too small to free even a
> > > > > single
> > > > > average-sized GEM object. Our rough estimate for an effective
> > > > > batch
> > > > > is twice the average number of pages per populated ttm_tt
> > > > > across
> > > > > all
> > > > > shrinkable and purgeable objects. The factor of two provides
> > > > > headroom
> > > > > so that most scan invocations can free at least one GEM
> > > > > object
> > > > > despite
> > > > > variability in object sizes.
> > > > >=20
> > > > > The batch value is updated as an exponential moving average,
> > > > > (old_batch + avg) / 2, to smooth out sudden changes in the
> > > > > object population. It is floored at 128 pages, the kernel
> > > > > default
> > > > > SHRINK_BATCH, to ensure the shrinker remains responsive when
> > > > > there
> > > > > are very few objects.
> > > > >=20
> > > > > The populated_tts counter introduced in the previous commit
> > > > > provides
> > > > > the object count needed for the average. We inherit the same
> > > > > justification as the analogous mechanism in i915: shrinking a
> > > > > GEM
> > > > > object has non-trivial locking overhead, so firing the
> > > > > shrinker
> > > > > for
> > > > > requests smaller than a single object is wasteful.
> > > > >=20
> > > > > v2:
> > > > > - Fix the average object size estimate to account for the
> > > > > full
> > > > > =C2=A0 shrinkable and purgeable population.
> > > > >=20
> > > > > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > > > > Assisted-by: GitHub_Copilot:claude-sonnet-5
> > > >=20
> > > > This is probably the right direction given what we currently
> > > > have
> > > > in
> > > > terms of shrinker control, but the core heuristic is still a
> > > > pretty
> > > > poor
> > > > one. My understanding is that it combines batch and seek values
> > > > using
> > > > some odd math to determine whether a scan is worthwhile at a
> > > > given
> > > > priority level. We probably want to avoid shrinking at the
> > > > initial
> > > > scan
> > > > priorities, and I believe this change accomplishes that.
> > >=20
> > > Yes, but I think that's a side-effect not to be fully relied
> > > upon.
> > >=20
> > > The meaning of this value IMO is to tell the core how many
> > > objects
> > > to
> > > expect for a scan request, so that the core can hold off
> > > shrinking
> > > until that many objects is actually this shrinker's fair share of
> > > its
> > > available objects. So the side effect would be that this
> > > shrinker's
> > > fair share of shrinking may not trigger a scan request if
> > > shrinking
> > > is
> > > triggered by compacting?
> > >=20
> >=20
> > I think you mean higher order allocations, not compaction. Reclaim
> > is
> > the input to compaction - see compaction_ready, compact_gap usage
> > in
> > vmscan.c
>=20
> Yes, I meant shrinking triggered by higher order allocations, but
> used
> compaction as a term for shrinking any order page in order to be able
> to coalesce memory into higher order. That might not be the correct
> terminology, though.
>=20
> >=20
> > So I think a side affect could be higher order allocation never
> > enter
> > our shrinker if compaction_ready flips to true before our batch
> > size
> > /
> > seek values are asked for (total_scan math in do_shrink_slab).
>=20
> Yes, that's a possible side-effect.
>=20
> >=20
> > > >=20
> > > > That said, I think we really want two shrinkers instead: one
> > > > with
> > > > the
> > > > default settings (or perhaps even a reduced seek value) for
> > > > purgeable
> > > > BOs, and another for BOs that we legitimately need to back up.
> > > > The
> > > > purgeable one should be favored to run eariler, likewise the
> > > > TTM
> > > > pool
> > > > shrinker should be favored run before our shrinker too.
> > >=20
> > > I don't think we can or should use the batch size to decide which
> > > shrinker should be prioritized. IIRC one of the comments to
> > > previous
> >=20
> > It probably isn't the right approach, but my concern is that our
> > shrinker
> > won't run at higher orders when there are cheap reclaimable pages
> > (i.e.,
> > we have purged BOs that can immediately make higher-order pages
> > available
> > or allow compaction to do its job of forming higher-order pages). I
> > have
> > already seen shrinker backoff being too aggressive when
> > compaction_ready()
> > returns true, resulting in virtually zero THP availability because
> > shrinkers hold onto enough non-movable pages scattered throughout
> > memory
> > to prevent successful compaction (I have a local core MM patch that
> > fixes
> > this issue).
> >=20
> > Purgable and non-purgable pages have fundamentally different
> > shrinking
> > costs, and that distinction needs to be expressed somehow. The
> > opportunistic compaction (wrongly named) shrinker series attempts
> > to
> > capture this.
>=20
> But since the core attempts to be fair poking shrinkers, and that's
> not
> really what we want (we want it to shrink purgeable stuff first, and
> avoid shrinking non-purgeable stuff).=C2=A0

Actually with separate shrinkers we can modify the count to handle
this. I'll take a look at that.

/Thomas

