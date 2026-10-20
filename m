Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B54606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e2onBKUk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EB610E08A;
	Tue, 20 Oct 2026 20:57:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1D10E08A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 20:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792529824; x=1824065824;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VQBjBTsQYcUxgttVUo95U/jDAxvmLCC6ldDEVKX2I1E=;
 b=e2onBKUkQQm40qM42HlUMHhuZVFVGHXPr4W1xJZCnHhIZ4ehCU05yj78
 5gKbYREDZHjRc5a46AeVMc6tkzonPH7K/ew2zM+mX4EWMahf88Vsr5PLo
 F0lM08k83lsOJfOojM6ZM9mUmhZ8H2wzM9J1ZX13VJ4x4AC2BUAanqaeg
 P9ugXoiq+/nnQDkMErLxwTC9HOlxKKdGSlDe5jzs+7OSWX8AtvPIfRBdw
 JFKvn5Cw+QP0bwhjtCkVjzb6mV8idT05+WUs8ejbMRrBk3h8ZE4VZmKXm
 31xzBnj1wprzmipgzthpS68xaX2K2kHeZ9i07ZDGg+qrqKCbuuAL2UuFn g==;
X-CSE-ConnectionGUID: XS3HnVNNQbmIrMx0DnnPxg==
X-CSE-MsgGUID: yjKuSmviQUunjeKSVKyRtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1258333"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1258333"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 13:57:03 -0700
X-CSE-ConnectionGUID: /OWNdaJPQdSPMU4vgWDXKA==
X-CSE-MsgGUID: nvguhyh7QyeWgHWSztf3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3016724"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.117])
 ([10.245.244.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 13:57:02 -0700
Message-ID: <4687ab193a1a1c83f653463e680d21ab15936974.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED
 madvise state
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 22:57:00 +0200
In-Reply-To: <ate9TVShDPYAF2L/@gsse-cloud1.jf.intel.com>
References: <20261020165137.765886-1-matthew.brost@intel.com>
 <bd07d276ef1a575fc8bdcd37e1dd80552fb52a69.camel@linux.intel.com>
 <ate9TVShDPYAF2L/@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-10-20 at 12:13 -0700, Matthew Brost wrote:
> On Tue, Oct 20, 2026 at 09:00:09PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2026-10-20 at 09:51 -0700, Matthew Brost wrote:
> > > The DRM_XE_MADVISE ioctl lets userspace mark a VMA's BO as
> > > DONTNEED,
> > > signalling that its contents are not needed right now and may be
> > > discarded under memory pressure (see madvise_purgeable() in
> > > xe_vm_madvise.c), or restore it back to WILLNEED. This is a
> > > stronger,
> > > explicit signal than a plain unbind: userspace has told us the BO
> > > is
> > > not
> > > just unused for now, but that it is actively fine to lose the
> > > data.
> > > There is no reason to keep such a BO competing for LRU space with
> > > actively used buffers, and conversely, once userspace marks it
> > > WILLNEED
> > > again it is back in active use and should be reprioritized
> > > accordingly.
> > >=20
> > > Give xe two TTM LRU priority bands and tie them to that state:
> > > XE_BO_PRIORITY_LOW for DONTNEED BOs and XE_BO_PRIORITY_NORMAL for
> > > everything else. Since the TTM LRU is walked in ascending
> > > priority
> > > order, DONTNEED BOs become the first candidates for eviction and
> > > shrinking. The transition is driven from
> > > xe_bo_set_purgeable_state(),
> > > the single point through which a BO's aggregate purgeable state
> > > actually
> > > moves between WILLNEED and DONTNEED (PURGED is terminal and left
> > > at
> > > XE_BO_PRIORITY_LOW).
> > >=20
> > > Changing bo->ttm.priority cannot be done by a plain store:
> > > private,
> > > user
> > > BOs have bo->ttm.bulk_move set to their VM's LRU bulk-move range,
> > > which
> > > tracks a contiguous [first, last] run of resources per (mem_type,
> > > priority) bucket. Writing the priority while the BO is still
> > > attached
> > > would leave the resource linked in the old priority's bucket
> > > while
> > > the
> > > bulk-move code looks it up under the new one, corrupting both.
> > > Add
> > > xe_bo_update_ttm_priority(), which temporarily detaches the BO
> > > from
> > > its
> > > bulk-move range, updates the priority with a plain non-bulk LRU
> > > update,
> > > and reattaches it into the new priority's bucket.
> > > xe_bo_set_purgeable_state() is always called with the BO's dma-
> > > resv
> > > held, so this is safe.
> > >=20
> > > With DONTNEED BOs now clustered at XE_BO_PRIORITY_LOW, the
> > > shrinker's
> > > purge pass no longer needs to walk each memory type's whole LRU:
> > > nothing
> > > beyond XE_BO_PRIORITY_LOW can possibly be purgeable, so
> > > continuing
> > > past
> > > it just wastes time trylocking BOs that can never be purged in
> > > this
> > > pass. Break out of the per-mem_type LRU walk in
> > > __xe_shrinker_walk()
> > > once a BO's priority rises above XE_BO_PRIORITY_LOW during the
> > > purge
> > > pass. Behavior of the non-purge (regular shrink) pass is
> > > unchanged.
> > >=20
> > > Assisted-by: LLM
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 46
> > > ++++++++++++++++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_bo_types.h |=C2=A0 8 +++++-
> > > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c |=C2=A0 3 +++
> > > =C2=A03 files changed, 56 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 6d2ac986e98a..b723addf071d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1086,6 +1086,38 @@ static void
> > > xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> > > =C2=A0	}
> > > =C2=A0}
> > > =C2=A0
> > > +/*
> > > + * Change @bo's TTM LRU priority to @priority. @bo's dma-resv
> > > must
> > > be held.
> > > + *
> > > + * Private, user BOs of non-fault-mode VMs have bo-
> > > >ttm.bulk_move
> > > set to their
> > > + * VM's LRU bulk-move range (see xe_bo_create_user()), which
> > > tracks
> > > a
> > > + * contiguous [first, last] run of resources per (mem_type,
> > > priority) bucket.
> > > + * Writing bo->ttm.priority while the BO is still attached to
> > > that
> > > range would
> > > + * leave the resource linked in the old priority's bucket while
> > > the
> > > bulk-move
> > > + * code looks it up under the new one, corrupting both buckets.
> > > Temporarily
> > > + * detaching the BO from its bulk-move range moves it with a
> > > plain,
> > > non-bulk
> > > + * LRU update instead, and reattaching afterwards re-inserts it
> > > into
> > > the new
> > > + * priority's bucket.
> > > + */
> > > +static void xe_bo_update_ttm_priority(struct xe_bo *bo, int
> > > priority)
> > > +{
> > > +	struct ttm_lru_bulk_move *bulk =3D bo->ttm.bulk_move;
> > > +
> > > +	xe_bo_assert_held(bo);
> > > +
> > > +	if (bo->ttm.priority =3D=3D priority)
> > > +		return;
> >=20
> > Hm, what about (pseudo code)
> >=20
> > spin_lock(lru_lock);
> > bo->ttm.priority =3D priority;
> > ttm_bo_move_to_lru_tail(&bo->ttm);
> > spin_unlock(lru_lock);
> >=20
> > If that works, we could also shorten the comment a bit.
> >=20
>=20
> This doesn't work. IIRC this explodes in TTM, hence the way this
> coded.

Ugh, you're right. Should probably resurrect the conversion of bulk
moves to sublists....

https://patchwork.freedesktop.org/patch/746362/?series=3D170311&rev=3D3

/Thomas

>=20
> > > +
> > > +	if (bulk)
> > > +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > +
> > > +	bo->ttm.priority =3D priority;
> > > +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > +
> > > +	if (bulk)
> > > +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * xe_bo_set_purgeable_state() - Set BO purgeable state with
> > > validation
> > > =C2=A0 * @bo: Buffer object
> > > @@ -1095,6 +1127,13 @@ static void
> > > xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> > > =C2=A0 * transitions. Once a BO is PURGED, it cannot transition to an=
y
> > > other state.
> > > =C2=A0 * Invalid transitions are caught with xe_assert(). Shrinker
> > > page
> > > accounting
> > > =C2=A0 * is updated automatically.
> > > + *
> > > + * A WILLNEED -> DONTNEED transition also lowers the BO's TTM
> > > LRU
> > > priority to
> > > + * XE_BO_PRIORITY_LOW: userspace has signaled it does not need
> > > these
> > > contents
> > > + * again soon, so make it one of the first buffers considered
> > > for
> > > + * eviction/shrinking. The shrinker's purge pass relies on this
> > > clustering to
> > > + * bound its LRU walk. Conversely, a DONTNEED -> WILLNEED
> > > transition
> > > restores
> > > + * XE_BO_PRIORITY_NORMAL, since the BO is back in active use.
> >=20
> > Is it possible to make this comment less verbose and focus on what
> > the
> > function is doing. Perhaps we could put the LRU priorities and what
> > the
> > shrinker relies on in a separate DOC section?
> >=20
>=20
> Ok, let me adjust this.
>=20
> Matt
> =C2=A0
> >=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> >=20
> > > =C2=A0 */
> > > =C2=A0void xe_bo_set_purgeable_state(struct xe_bo *bo,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xe_madv_purgeable_=
state
> > > new_state)
> > > @@ -1112,6 +1151,13 @@ void xe_bo_set_purgeable_state(struct
> > > xe_bo
> > > *bo,
> > > =C2=A0	xe_assert(xe, !(bo->purgeable.state =3D=3D
> > > XE_MADV_PURGEABLE_PURGED &&
> > > =C2=A0			new_state !=3D XE_MADV_PURGEABLE_PURGED));
> > > =C2=A0
> > > +	if (new_state =3D=3D XE_MADV_PURGEABLE_DONTNEED &&
> > > +	=C2=A0=C2=A0=C2=A0 bo->purgeable.state =3D=3D XE_MADV_PURGEABLE_WIL=
LNEED)
> > > +		xe_bo_update_ttm_priority(bo,
> > > XE_BO_PRIORITY_LOW);
> > > +	else if (new_state =3D=3D XE_MADV_PURGEABLE_WILLNEED &&
> > > +		 bo->purgeable.state =3D=3D
> > > XE_MADV_PURGEABLE_DONTNEED)
> > > +		xe_bo_update_ttm_priority(bo,
> > > XE_BO_PRIORITY_NORMAL);
> > > +
> > > =C2=A0	bo->purgeable.state =3D new_state;
> > > =C2=A0	xe_bo_set_purgeable_shrinker(bo, new_state);
> > > =C2=A0}
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index 8ec4a01a0092..0265fb314c77 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -24,7 +24,13 @@ struct xe_exec_queue;
> > > =C2=A0
> > > =C2=A0#define XE_BO_MAX_PLACEMENTS	3
> > > =C2=A0
> > > -/* TODO: To be selected with VM_MADVISE */
> > > +/*
> > > + * TTM LRU priority bands. The LRU is walked in ascending
> > > priority
> > > order, so
> > > + * XE_BO_PRIORITY_LOW objects are the first candidates for
> > > eviction
> > > and
> > > + * shrinking. BOs advised DONTNEED through DRM_XE_MADVISE live
> > > at
> > > + * XE_BO_PRIORITY_LOW, everything else at XE_BO_PRIORITY_NORMAL.
> > > + */
> > > +#define	XE_BO_PRIORITY_LOW	0
> > > =C2=A0#define	XE_BO_PRIORITY_NORMAL	1
> > > =C2=A0
> > > =C2=A0/**
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > index 772dab9b3ed7..c86455ea08d1 100644
> > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > @@ -133,6 +133,9 @@ static int __xe_shrinker_walk(struct
> > > xe_shrinker
> > > *shrinker,
> > > =C2=A0		}
> > > =C2=A0
> > > =C2=A0		ttm_bo_lru_for_each_reserved_guarded(&curs, man,
> > > &arg, ttm_bo) {
> > > +			if (flags.purge && ttm_bo->priority >
> > > XE_BO_PRIORITY_LOW)
> > > +				break;
> > > +
> > > =C2=A0			if (!ttm_bo_shrink_suitable(ttm_bo,
> > > ctx))
> > > =C2=A0				continue;
> > > =C2=A0
