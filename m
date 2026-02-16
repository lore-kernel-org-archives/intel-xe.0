Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BEEE7BDA9
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 12:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C0010E329;
	Mon, 16 Feb 2026 12:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQ3tEc6E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC18610E303
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 12:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771243647; x=1802779647;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NDf8BngrHzSCMu8/f652cHDo+09u8fty+ibjY3td+/Y=;
 b=aQ3tEc6EjTarZzUFGAfVw7PcO9Vm7es3O8xTRFpU/d8s8Mx5o4Izg8gy
 qzlVjZ/vxKUV/umkc2CGTiuYnBrWMgyT03x07ET5d+eLyRM9dPYLobUVC
 ACTj4jE+NRZfu4HEnY/GsID8AS1/3azy2NtHO6aal7/amX9EOVClQQnq+
 gTDq8cs8V7VB94BTSf2YaaUJ9bhGBCyCpblKj9She8MghE3tRiW4o2etq
 jGiEJSkAx0TshRpILpNSuFT7pV3sLXLc+b2QfHBjdlxnOiHLKFdAA5082
 wOylaHE7SSc1YL/IL2GPYwXWZjZ50rIcmKeNdxgQrlyAtvxEWc7y+jzSz A==;
X-CSE-ConnectionGUID: 7/ZyhL8gQQ+BOyx39Gc6gw==
X-CSE-MsgGUID: mJe3ZAs3QGS+p5xX2/1yBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="75943469"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="75943469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:07:26 -0800
X-CSE-ConnectionGUID: +TlY5WTvQ2+BYH4vEJ56zQ==
X-CSE-MsgGUID: dgLoRtYnS9Ovi+M3sTebSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="236616989"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.231])
 ([10.245.244.231])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:07:24 -0800
Message-ID: <9ce0acf02e8ef63bf81cfbb9e1053bfa1437362f.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Mrozek, Michal"	
 <michal.mrozek@intel.com>, "intel-xe@lists.freedesktop.org"	
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
Date: Mon, 16 Feb 2026 13:07:22 +0100
In-Reply-To: <8ce35a23-b639-4c4f-acfd-993c4f9d5008@intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-6-tejas.upadhyay@intel.com>
 <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
 <aYvHCeTd5pOFo2p5@lstrano-desk.jf.intel.com>
 <SJ1PR11MB6204CD2B54AD51B175F96F298163A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20260211211125.GL4694@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB6204B6489254C702FB9A9D478161A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <f57d25f0131d124bdee35411d15513739c7d17c3.camel@intel.com>
 <20260213171638.GC52346@mdroper-desk1.amr.corp.intel.com>
 <a62d59e4-c77d-4e28-8227-be253733dd7b@intel.com>
 <75dcc80b39ed33a7abc620b2614b0e81586a6299.camel@linux.intel.com>
 <8ce35a23-b639-4c4f-acfd-993c4f9d5008@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Mon, 2026-02-16 at 10:58 +0000, Matthew Auld wrote:
> On 16/02/2026 10:23, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2026-02-13 at 17:31 +0000, Matthew Auld wrote:
> > > On 13/02/2026 17:16, Matt Roper wrote:
> > > > On Fri, Feb 13, 2026 at 04:48:39PM +0000, Souza, Jose wrote:
> > > > > On Fri, 2026-02-13 at 16:23 +0000, Upadhyay, Tejas wrote:
> > > > > >=20
> > > > > >=20
> > > > > > > -----Original Message-----
> > > > > > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > > > > Sent: 12 February 2026 02:41
> > > > > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > > > Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> > > > > > > xe@lists.freedesktop.org; Auld, Matthew
> > > > > > > <matthew.auld@intel.com>;
> > > > > > > thomas.hellstrom@linux.intel.com
> > > > > > > Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush
> > > > > > > userptr/shrinker bo
> > > > > > > cachelines manually
> > > > > > >=20
> > > > > > > On Wed, Feb 11, 2026 at 07:06:05PM +0000, Upadhyay, Tejas
> > > > > > > wrote:
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > > > > > Sent: 11 February 2026 05:32
> > > > > > > > > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > > > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> > > > > > > > > intel-
> > > > > > > > > xe@lists.freedesktop.org; Auld, Matthew
> > > > > > > > > <matthew.auld@intel.com>;
> > > > > > > > > thomas.hellstrom@linux.intel.com
> > > > > > > > > Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush
> > > > > > > > > userptr/shrinker bo
> > > > > > > > > cachelines manually
> > > > > > > > >=20
> > > > > > > > > On Tue, Feb 10, 2026 at 01:05:25PM -0800, Matt Roper
> > > > > > > > > wrote:
> > > > > > > > > > On Tue, Feb 10, 2026 at 06:21:22PM +0530, Tejas
> > > > > > > > > > Upadhyay
> > > > > > > > > > wrote:
> > > > > > > > > > > "eXtended Architecture" (XA) tagged memory=E2=80=94me=
mory
> > > > > > > > > > > shared
> > > > > > > between
> > > > > > > > > the
> > > > > > > > > > > CPU and GPU
> > > > > > > > > >=20
> > > > > > > > > > I'm pretty sure this expansion of "XA" is wrong;
> > > > > > > > > > where
> > > > > > > > > > are
> > > > > > > > > > you
> > > > > > > > > > seeing this definition?=C2=A0 Everything in the bspec
> > > > > > > > > > indicates
> > > > > > > > > > that XA
> > > > > > > > > > means "wb
> > > > > > > > > > - transient app" (similar to how "XD" is 'wb -
> > > > > > > > > > transient
> > > > > > > > > > display").
> > > > > > > > > > I'm not sure why exactly they picked "X" to refer
> > > > > > > > > > to
> > > > > > > > > > transient in
> > > > > > > > > > both of these cases, but I've never seen any
> > > > > > > > > > documentation
> > > > > > > > > > that
> > > > > > > > > > refers to it as "extended."
> > > > > > > > > >=20
> > > > > > > > > > > is treated differently from other GPU memory when
> > > > > > > > > > > the
> > > > > > > > > > > Media
> > > > > > > > > > > engine is
> > > > > > > > > power-gated.
> > > > > > > > > > >=20
> > > > > > > > > > > XA is *always* flushed, like at the end-of-
> > > > > > > > > > > submssion
> > > > > > > > > > > (and
> > > > > > > > > > > maybe
> > > > > > > > > > > other
> > > > > > > > > >=20
> > > > > > > > > > I assume you're referring to the fact that the
> > > > > > > > > > driver
> > > > > > > > > > performs
> > > > > > > > > > flushes at the end of submission (via PIPE_CONTROL
> > > > > > > > > > or
> > > > > > > > > > MI_FLUSH_DW), and that depending on other
> > > > > > > > > > state/optimizations
> > > > > > > > > > in
> > > > > > > > > > the system, those flushes may flush the entire
> > > > > > > > > > device
> > > > > > > > > > cache,
> > > > > > > > > > or
> > > > > > > > > > may only flush the subset of cache data that is not
> > > > > > > > > > marked as
> > > > > > > > > > transient.=C2=A0 The way you worded this was confusing
> > > > > > > > > > since
> > > > > > > > > > it
> > > > > > > > > > makes
> > > > > > > > > > it sound like cache flushes happen automatically
> > > > > > > > > > somewhere in
> > > > > > > hardware/firmware.
> > > > > > > > > >=20
> > > > > > > > > > > places), just that internally as an optimisation
> > > > > > > > > > > hw
> > > > > > > > > > > doesn't
> > > > > > > > > > > need
> > > > > > > > > > > to make that a full flush (which will also
> > > > > > > > > > > include
> > > > > > > > > > > XA) when
> > > > > > > > > > > Media is off/powergated, since it doesn't need to
> > > > > > > > > > > worry
> > > > > > > > > > > about GT
> > > > > > > > > > > caches vs Media coherency, and only CPU vs GPU
> > > > > > > > > > > coherency,
> > > > > > > > > > > so can
> > > > > > > > > > > make that flush a targeted XA flush, since stuff
> > > > > > > > > > > tagged
> > > > > > > > > > > with XA
> > > > > > > > > > > now means it's shared with the CPU. The main
> > > > > > > > > > > implication is
> > > > > > > > > > > that
> > > > > > > > > > > we now need to somehow flush non-XA before
> > > > > > > > > > > freeing
> > > > > > > > > > > system
> > > > > > > > > > > memory
> > > > > > > > > > > pages, otherwise dirty cachelines could be
> > > > > > > > > > > flushed
> > > > > > > > > > > after
> > > > > > > > > > > the
> > > > > > > > > > > free (like if Media suddenly turns on and does a
> > > > > > > > > > > full
> > > > > > > > > > > flush)
> > > > > > > > > >=20
> > > > > > > > > > This description seems really confusing.=C2=A0 My
> > > > > > > > > > understanding is
> > > > > > > > > > that
> > > > > > > > > > marking something as wb-transient-app indicates
> > > > > > > > > > that it
> > > > > > > > > > might
> > > > > > > > > > be
> > > > > > > > > > accessed by something other than our graphics/media
> > > > > > > > > > IP
> > > > > > > > > > (i.e.,
> > > > > > > > > > accessed from the CPU, exported to another device,
> > > > > > > > > > etc.), so
> > > > > > > > > > transient data truly does need to be flushed at the
> > > > > > > > > > points in
> > > > > > > > > > the
> > > > > > > > > > driver where a flush typically happens.
> > > > > > > > > >=20
> > > > > > > > > > However when something is _not_ transient, then
> > > > > > > > > > either:
> > > > > > > > > > =C2=A0=C2=A0=C2=A0- it's "private" to the GPU and only =
our
> > > > > > > > > > graphics/media IP
> > > > > > > > > > will be
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 accessing it
> > > > > > > > > > =C2=A0=C2=A0=C2=A0- it's bound with a coherent PAT inde=
x so that
> > > > > > > > > > outside
> > > > > > > > > > observers like
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 the CPU can snoop the device c=
ache, even when
> > > > > > > > > > the
> > > > > > > > > > cache
> > > > > > > > > > hasn't been
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 flushed
> > > > > > > > > >=20
> > > > > > > > > > If media is not active, then there's really no need
> > > > > > > > > > to
> > > > > > > > > > include
> > > > > > > > > > non-transient data when an device cache flush
> > > > > > > > > > happens
> > > > > > > > > > since
> > > > > > > > > > there's no real need for the data to get to RAM.=C2=A0
> > > > > > > > > > So
> > > > > > > > > > that
> > > > > > > > > > enables
> > > > > > > > > > an optimization (which comes in your next patch),
> > > > > > > > > > that
> > > > > > > > > > allows
> > > > > > > > > > flushes to only operate on the subset of the device
> > > > > > > > > > cache
> > > > > > > > > > tagged as
> > > > > > > "transient" if media is idle.
> > > > > > > >=20
> > > > > > > > But what If we have stale non-XA marked pages for
> > > > > > > > userptr,
> > > > > > > > and
> > > > > > > > that
> > > > > > > > object moves out and at the same time media comes back,
> > > > > > > > will end
> > > > > > > > up in
> > > > > > > > full flush and flush the stale entry to RAM.
> > > > > > >=20
> > > > > > > What makes userptr special here?=C2=A0 During general, active
> > > > > > > usage,
> > > > > > > userptr would
> > > > > > > be data that's accessible by the CPU, so it needs to
> > > > > > > either
> > > > > > > be
> > > > > > > transient (so CPU
> > > > > > > can see the data in RAM after explicit flushes) or it
> > > > > > > needs
> > > > > > > to be
> > > > > > > using a
> > > > > > > coherent PAT (so that the CPU can just snoop the GPU
> > > > > > > cache).
> > > > > > > If
> > > > > > > you marked
> > > > > > > userptr as both non-XA and non-coherent, then that sounds
> > > > > > > likely to
> > > > > > > be a
> > > > > > > userspace bug (and probably something we can catch and
> > > > > > > reject
> > > > > > > as an
> > > > > > > invalid
> > > > > > > case on any Xe3p or later platforms that support this)
> > > > > > > since
> > > > > > > the
> > > > > > > CPU wouldn't
> > > > > > > have any reliable way of seeing GPU updates.
> > > > > >=20
> > > > > > Right. FYI @Mrozek, Michal @Souza, Jose
> > > > > > For userptr, as explained above, it needs to be either
> > > > > > coherent
> > > > > > or XA
> > > > > > pat index, or else KMD will reject as invalid case.
> > > > > >=20
> > > > > >=20
> > > > > The coherency restriction is already in the uAPI:
> > > > >=20
> > > > > "Note: For userptr and externally imported dma-buf the kernel
> > > > > expects
> > > > > either 1WAY or 2WAY for the @pat_index."
> > > > >=20
> > > > > Using 1 way is enough as Xe KMD does a PIPE_CONTROL flushing
> > > > > GPU
> > > > > caches
> > > > > at the end of batch buffers.
> > > >=20
> > > > But isn't that what we're discussing here?=C2=A0 1-way *won't*
> > > > necessarily be
> > > > enough anymore because PIPE_CONTROL instructions don't flush
> > > > the
> > > > entire
> > > > cache anymore.=C2=A0 Whenever the GuC determines that media is
> > > > inactive
> > > > and
> > > > activates the optimization, PIPE_CONTROL, MI_FLUSH_DW, etc.
> > > > change
> > > > behavior to only flush out the subset of data that was marked
> > > > as
> > > > app-transient; anything not marked that way doesn't get flushed
> > > > now.=C2=A0 So
> > > > there's a new requirement here that you ensure you're using an
> > > > XA
> > > > PAT
> > > > index, or you switch to use 2-way coherency which will allow
> > > > the
> > > > CPU to
> > > > snoop the GPU's caches.
> > >=20
> > > That exactly matches my understanding also.
> >=20
> > This only ever affects IGFX, right? Since AFAIU we don't have 2-way
> > coherency with DGFX?
>=20
> Yeah, this should be igpu only. I seem to also recall that on dgpu,=20
> Media is coherent with l2/l3, but also I don't think system memory
> can=20
> be cached in l2/l3 (only VRAM), which I assume is why there is the=20
> special SMRO (system-memory-read-only) cache only on dgpu, which is=20
> flushed when the fence signals, unlike the l2/l3.

Yes that sounds reasonable.

>=20
> >=20
> > It sounds like the same PAT restriction is needed also for imported
> > dma-buf, right?
>=20
> Good point. Looks like we are missing that still. Otherwise we can
> run=20
> into the same issues with stale l2/l3/ppc.

So if this affects only system memory could we instead of relying on 2-
way coherency or XA, just flush at dma unmap time, because that's
typically just before releasing the pages.

The exception, though, is dma-buf where the exporter can actually
release memory before all importers have given up their dma-mappings.

/Thomas

>=20
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > If something happens that changes the GTT mapping of an
> > > > > > > object,
> > > > > > > then
> > > > > > > doesn't that already trigger a TLB invalidation when
> > > > > > > necessary in
> > > > > > > the driver
> > > > > > > today?=C2=A0 It was my understanding that "heavy" TLB
> > > > > > > invalidations wait
> > > > > > > for data
> > > > > > > values to be globally observable before starting, so I
> > > > > > > think
> > > > > > > that
> > > > > > > would ensure
> > > > > > > that any non-XA data makes it to RAM before any binding
> > > > > > > changes,
> > > > > > > object,
> > > > > > > destruction, etc.?=C2=A0 Is there something special about
> > > > > > > userptr
> > > > > > > that
> > > > > > > makes that
> > > > > > > case more of a problem?
> > > > > > >=20
> > > > > > > I just found bspec page 74635 which gives an overview of
> > > > > > > the
> > > > > > > various flush
> > > > > > > and invalidate cases, and I don't see anything there that
> > > > > > > makes it
> > > > > > > obvious to
> > > > > > > me that userptr would be special.
> > > > > > >=20
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > As you said, we eventually do want to force a flush
> > > > > > > > > > of
> > > > > > > > > > the
> > > > > > > > > > non-transient data as well once we're freeing the
> > > > > > > > > > underlying
> > > > > > > > > > pages.
> > > > > > > > > > So how do we do that?=C2=A0 It's not clear to me how th=
e
> > > > > > > > > > changes
> > > > > > > > > > below
> > > > > > > > > > are accomplishing that.=C2=A0 Is there a way to
> > > > > > > > > > explicitly
> > > > > > > > > > request
> > > > > > > > > > a
> > > > > > > > > > full device cache flush (ignoring the transient vs
> > > > > > > > > > non-
> > > > > > > > > > transient tagging)?
> > > > > > > > > > Since the GuC handles the optimization in the next
> > > > > > > > > > patch
> > > > > > > > > > (toggling
> > > > > > > > > > whether flushes are full flushes vs non-transient
> > > > > > > > > > flushes
> > > > > > > > > > depending on whether media is active), I thought
> > > > > > > > > > there
> > > > > > > > > > might
> > > > > > > > > > be
> > > > > > > > > > some kind of GuC interface to request "please do
> > > > > > > > > > one
> > > > > > > > > > full
> > > > > > > > > > flush now, even
> > > > > > > if media is idle."
> > > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > I=E2=80=99m not an expert here by any means, but everythi=
ng
> > > > > > > > > above
> > > > > > > > > from
> > > > > > > > > Matt
> > > > > > > > > seems like valid concerns. Thomas also raised some
> > > > > > > > > concerns in
> > > > > > > > > the
> > > > > > > > > two previous revisions; again I=E2=80=99m not an expert, =
but
> > > > > > > > > reading
> > > > > > > > > through
> > > > > > > > > those, it doesn=E2=80=99t really seem like he received pr=
oper
> > > > > > > > > answers
> > > > > > > > > to his
> > > > > > > questions.
> > > > > > > >=20
> > > > > > > > Its forcing flush via tlb invalidation PPC flag under
> > > > > > > > xe_invalidate_vma( ).
> > > > > > >=20
> > > > > > > By the way, what is "PPC?"=C2=A0 It seems like it's another
> > > > > > > new
> > > > > > > synonym
> > > > > > > for the
> > > > > > > device cache?=C2=A0 It's already really confusing that some o=
f
> > > > > > > our
> > > > > > > hardware docs use
> > > > > > > a mix of both "L2" and "L3" to refer to the same device
> > > > > > > cache
> > > > > > > for
> > > > > > > historical
> > > > > > > reasons...
> > > > > > >=20
> > > > > > >=20
> > > > > > > Matt
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > A couple of comments below.
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Matt
> > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > V2(MattA): Expand commit description
> > > > > > > > > > >=20
> > > > > > > > > > > Signed-off-by: Tejas Upadhyay
> > > > > > > > > > > <tejas.upadhyay@intel.com>
> > > > > > > > > > > ---
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/xe/xe_device.c=C2=
=A0 | 23
> > > > > > > > > > > +++++++++++++++++++++++
> > > > > > > > > > > drivers/gpu/drm/xe/xe_device.h=C2=A0 |=C2=A0 1 +
> > > > > > > > > > > drivers/gpu/drm/xe/xe_userptr.c |=C2=A0 3 ++-
> > > > > > > > > > > =C2=A0=C2=A0=C2=A04 files changed, 28 insertions(+), =
2
> > > > > > > > > > > deletions(-)
> > > > > > > > > > >=20
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_bo.c index
> > > > > > > > > > > e9180b01a4e4..4455886b211e
> > > > > > > > > > > 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > > > @@ -689,7 +689,8 @@ static int
> > > > > > > > > > > xe_bo_trigger_rebind(struct
> > > > > > > > > > > xe_device *xe, struct xe_bo *bo,
> > > > > > > > > > >=20
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0		if (!xe_vm_in_fault_mode(vm)) {
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0			drm_gpuvm_bo_evict(vm_bo
> > > > > > > > > > > ,
> > > > > > > > > > > true);
> > > > > > > > > > > -			continue;
> > > > > > > > > > > +			if
> > > > > > > > > > > (!xe_device_needs_cache_flush(xe))
> > > > > > > > > > > +				continue;
> > > > > >=20
> > > > > > Matt R,
> > > > > > This flush will be still needed as there can be non-xa
> > > > > > buffers
> > > > > > which
> > > > > > can be evicted while media was off and stale entries can be
> > > > > > flushed
> > > > > > when media comes back on. Which was not case earlier as
> > > > > > full
> > > > > > flush
> > > > > > was happening at regular sync points and that=E2=80=99s where t=
his
> > > > > > feature is
> > > > > > bringing optimization now.
> > > > > >=20
> > > > > > Tejas
> > > > > >=20
> > > > > > > > >=20
> > > > > > > > > This will trigger a TLB invalidation (and I assume a
> > > > > > > > > cache
> > > > > > > > > flush)
> > > > > > > > > every time we move or free memory in the 3D stack if
> > > > > > > > > it
> > > > > > > > > has a
> > > > > > > > > binding. It also performs a synchronous wait on the
> > > > > > > > > BO
> > > > > > > > > being
> > > > > > > > > idle.
> > > > > > > > > Both of these are very expensive operations. I can=E2=80=
=99t
> > > > > > > > > imagine
> > > > > > > > > the
> > > > > > > > > granularity we want here is to do this on every
> > > > > > > > > move/free
> > > > > > > > > with
> > > > > > > > > bindings.
> > > > > > > > >=20
> > > > > > > > > Also, for LR compute with preempt fences, we would
> > > > > > > > > trigger the
> > > > > > > > > preempt fences during the wait, so a TLB invalidation
> > > > > > > > > after
> > > > > > > > > this
> > > > > > > > > seems unnecessary, though perhaps the cache flush is
> > > > > > > > > still
> > > > > > > > > required?
> > > > > > > > >=20
> > > > > > > > > I think this needs a bit more explanation, because
> > > > > > > > > without
> > > > > > > > > knowing a
> > > > > > > > > lot about the exact requirements, the implementation
> > > > > > > > > does
> > > > > > > > > not
> > > > > > > > > look
> > > > > > > correct.
> > > > > > > >=20
> > > > > > > > The thing is that we are trying to solve problem with
> > > > > > > > userptr
> > > > > > > > with non-XA
> > > > > > > pat, consider if that BO got moved while media is not
> > > > > > > active.
> > > > > > > As
> > > > > > > soon as media
> > > > > > > will come back active, stale cached entries of that
> > > > > > > object
> > > > > > > will be
> > > > > > > flushed as part
> > > > > > > of full flush , which may corrupt things.
> > > > > > > > There was thinking that with this patch we would at
> > > > > > > > least
> > > > > > > > solve
> > > > > > > > the problem
> > > > > > > of corruption and later when page_reclamation feature
> > > > > > > comes
> > > > > > > in will
> > > > > > > help in
> > > > > > > performance as well. But now when page reclamation
> > > > > > > feature is
> > > > > > > merged earlier
> > > > > > > and it tightly coupled with bind/unbind some cases like
> > > > > > > discussed
> > > > > > > above
> > > > > > > (which are not doing unbind immediately on move/free) are
> > > > > > > missed in
> > > > > > > reclamation.
> > > > > > > >=20
> > > > > > > > So thought was to let this solution go in with little
> > > > > > > > perf
> > > > > > > > hit
> > > > > > > > and discuss with
> > > > > > > page reclamation owner to come with cleaner solution
> > > > > > > together.
> > > > > > > >=20
> > > > > > > > Tejas
> > > > > > > > >=20
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0		}
> > > > > > > > > > >=20
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0		if (!idle) {
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_device.c index
> > > > > > > > > > > 743c18e0c580..da2abed94bc0
> > > > > > > > > > > 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > > > > > > @@ -1097,6 +1097,29 @@ static void
> > > > > > > > > > > tdf_request_sync(struct
> > > > > > > > > > > xe_device
> > > > > > > > > *xe)
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0}
> > > > > > > > > > >=20
> > > > > > > > > > > +/**
> > > > > > > > > > > + * xe_device_needs_cache_flush - Whether the
> > > > > > > > > > > cache
> > > > > > > > > > > needs
> > > > > > > > > > > to be
> > > > > > > > > > > +flushed
> > > > > > > > > > > + * @xe: The device to check.
> > > > > > > > > > > + *
> > > > > > > > > > > + * Return: true if the device needs cache flush,
> > > > > > > > > > > false
> > > > > > > > > > > otherwise.
> > > > > > > > > > > + */
> > > > > > > > > > > +bool xe_device_needs_cache_flush(struct
> > > > > > > > > > > xe_device
> > > > > > > > > > > *xe) {
> > > > > > > > > > > +	/* XA is *always* flushed, like at the
> > > > > > > > > > > end-
> > > > > > > > > > > of-
> > > > > > > > > > > submssion (and
> > > > > > > > > > > +maybe
> > > > > > > > > other
> > > > > > > > > > > +	 * places), just that internally as an
> > > > > > > > > > > optimisation hw doesn't
> > > > > > > > > > > +need to
> > > > > > > > > make
> > > > > > > > > > > +	 * that a full flush (which will also
> > > > > > > > > > > include XA)
> > > > > > > > > > > when Media is
> > > > > > > > > > > +	 * off/powergated, since it doesn't need
> > > > > > > > > > > to
> > > > > > > > > > > worry
> > > > > > > > > > > about GT
> > > > > > > > > > > +caches vs
> > > > > > > > > Media
> > > > > > > > > > > +	 * coherency, and only CPU vs GPU
> > > > > > > > > > > coherency,
> > > > > > > > > > > so
> > > > > > > > > > > can make
> > > > > > > that
> > > > > > > > > > > +flush
> > > > > > > > > a
> > > > > > > > > > > +	 * targeted XA flush, since stuff tagged
> > > > > > > > > > > with XA
> > > > > > > > > > > now means
> > > > > > > > > > > +it's shared
> > > > > > > > > with
> > > > > > > > > > > +	 * the CPU. The main implication is that
> > > > > > > > > > > we
> > > > > > > > > > > now
> > > > > > > > > > > need to
> > > > > > > > > > > +somehow
> > > > > > > > > flush non-XA before
> > > > > > > > > > > +	 * freeing system memory pages,
> > > > > > > > > > > otherwise
> > > > > > > > > > > dirty
> > > > > > > > > > > cachelines
> > > > > > > > > > > +could be
> > > > > > > > > flushed after the free
> > > > > > > > > > > +	 * (like if Media suddenly turns on and
> > > > > > > > > > > does
> > > > > > > > > > > a
> > > > > > > > > > > full flush)
> > > > > > > > > > > +	 */
> > > > > > > > > > > +	if (GRAPHICS_VER(xe) >=3D 35 &&
> > > > > > > > > > > !IS_DGFX(xe))
> > > > > > > > > > > +		return true;
> > > > > > > > > > > +	return false;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0void xe_device_l2_flush(struct xe_d=
evice *xe)=C2=A0
> > > > > > > > > > > {
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0	struct xe_gt *gt;
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_device.h index
> > > > > > > > > > > 39464650533b..baf386e0e037
> > > > > > > > > > > 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > > > > > > > @@ -184,6 +184,7 @@ void
> > > > > > > > > > > xe_device_snapshot_print(struct
> > > > > > > > > > > xe_device *xe, struct drm_printer *p);
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0u64 xe_device_canonicalize_addr(str=
uct
> > > > > > > > > > > xe_device
> > > > > > > > > > > *xe, u64
> > > > > > > > > > > address);
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0u64 xe_device_uncanonicalize_addr(s=
truct
> > > > > > > > > > > xe_device
> > > > > > > > > > > *xe,
> > > > > > > > > > > u64
> > > > > > > > > > > address);
> > > > > > > > > > >=20
> > > > > > > > > > > +bool xe_device_needs_cache_flush(struct
> > > > > > > > > > > xe_device
> > > > > > > > > > > *xe);
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0void xe_device_td_flush(struct xe_d=
evice *xe);
> > > > > > > > > > > void
> > > > > > > > > > > xe_device_l2_flush(struct xe_device *xe);
> > > > > > > > > > >=20
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_userptr.c index
> > > > > > > > > > > e120323c43bc..b435ea7f9b66
> > > > > > > > > > > 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > > > > > > @@ -114,7 +114,8 @@ static void
> > > > > > > > > > > __vma_userptr_invalidate(struct
> > > > > > > > > > > xe_vm
> > > > > > > > > *vm, struct xe_userptr_vma *uv
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 false,
> > > > > > > > > > > MAX_SCHEDULE_TIMEOUT);
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0	XE_WARN_ON(err <=3D 0);
> > > > > > > > > > >=20
> > > > > > > > > > > -	if (xe_vm_in_fault_mode(vm) && userptr-
> > > > > > > > > > > > initial_bind) {
> > > > > > > > > > > +	if ((xe_vm_in_fault_mode(vm) ||
> > > > > > > > > > > +xe_device_needs_cache_flush(vm-
> > > > > > > > > > xe)) &&
> > > > > > > > > > > +	=C2=A0=C2=A0=C2=A0 userptr->initial_bind) {
> > > > > > > > >=20
> > > > > > > > > Same concern with the LR preempt fence as above =E2=80=94=
 the
> > > > > > > > > hardware
> > > > > > > > > will
> > > > > > > > > be interrupted via preempt fences, so it doesn=E2=80=99t =
seem
> > > > > > > > > necessary
> > > > > > > > > to
> > > > > > > > > invalidate the TLBs but perhaps we need a cflush and
> > > > > > > > > TLB
> > > > > > > > > invalidation is the mechanism for that too?
> > > > > > > > >=20
> > > > > > > > > Matt
> > > > > > > > >=20
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0		err =3D xe_vm_invalidate_vma(vma)=
;
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0		XE_WARN_ON(err);
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > > > > > > --
> > > > > > > > > > > 2.52.0
> > > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > --
> > > > > > > > > > Matt Roper
> > > > > > > > > > Graphics Software Engineer
> > > > > > > > > > Linux GPU Platform Enablement
> > > > > > > > > > Intel Corporation
> > > > > > >=20
> > > > > > > --
> > > > > > > Matt Roper
> > > > > > > Graphics Software Engineer
> > > > > > > Linux GPU Platform Enablement
> > > > > > > Intel Corporation
> > > >=20
