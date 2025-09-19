Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6603CAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 07:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B5510E941;
	Fri, 19 Sep 2025 07:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCdRQwEe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC3510E93D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758265924; x=1789801924;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HJrblOd4xO7pglvrDKWb4Q8zrAQ1cs5oMoEIztnP34Y=;
 b=mCdRQwEeg+Ack/iDNnApPOhnulmYJz5PMTuPa12dqmrAtZwKiqDArLBt
 5WDS6WY4l6OHeTjPhWzbc4wLaXNiUo8d3Ai0h9rl5gw97lM/SxnfcQivI
 hZolh40FjQbNqgng6XqL7DUYTZgP2Z+hNcXHY8TPsHCUed08WHvSW+5i/
 JcOCXys2qGNgjTvR7LdZEHNwl7Nm+AfafOWKzZ1JcvdkzKAizxpVZm1bX
 uxaZ/1C/r66hMJz1XsqM0JLeJ5/WISuCYnNVZ6V4CbTbG8+AexT0ymUCg
 aAvYilnl48ou38zSXIyFUMyXxNGEwMNSsOoO47IslmChnONsbau57I18z Q==;
X-CSE-ConnectionGUID: toiGIrOrRI6tyPpU1D3A5w==
X-CSE-MsgGUID: cEU4a4/lTfi+KlFabnsGGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78213847"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="78213847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 00:12:03 -0700
X-CSE-ConnectionGUID: 7fUdeOvMQLyzuZrHK1agdA==
X-CSE-MsgGUID: KP0J2WcrQ+KF13F7o/+4bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="175679547"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.120])
 ([10.245.245.120])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 00:12:01 -0700
Message-ID: <f5f43f2c14d2cd92773c4f19452ac868dfe69b9f.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org, 
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen	 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri, 19 Sep 2025 09:11:59 +0200
In-Reply-To: <27729672-509e-4f95-8aef-4dbf86858715@intel.com>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
 <53d50dff-89eb-4de0-befc-4bb2552c5e21@intel.com>
 <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
 <aMmmMoPcdimBAXS7@lstrano-desk.jf.intel.com>
 <dafff5f2281d7d3479c043c1d3d9f5ad7645f7d6.camel@linux.intel.com>
 <27729672-509e-4f95-8aef-4dbf86858715@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Maarten.

On Wed, 2025-09-17 at 10:48 +0200, Maarten Lankhorst wrote:
> Hey,
>=20
> On 2025-09-16 20:54, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-09-16 at 11:02 -0700, Matthew Brost wrote:
> > > On Tue, Sep 16, 2025 at 03:06:48PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > On Tue, 2025-09-16 at 14:03 +0100, Matthew Auld wrote:
> > > > > On 16/09/2025 12:53, Thomas Hellstr=C3=B6m wrote:
> > > > > > RDMA NICs typically requires the VRAM dma-bufs to be pinned
> > > > > > in
> > > > > > VRAM for pcie-p2p communication, since they don't fully
> > > > > > support
> > > > > > the move_notify() scheme. We would like to support that.
> > > > > >=20
> > > > > > However allowing unaccounted pinning of VRAM creates a DOS
> > > > > > vector
> > > > > > so up until now we haven't allowed it.
> > > > > >=20
> > > > > > However with cgroups support in TTM, the amount of VRAM
> > > > > > allocated
> > > > > > to a cgroup can be limited, and since also the pinned
> > > > > > memory is
> > > > > > accounted as allocated VRAM we should be safe.
> > > > > >=20
> > > > > > An analogy with system memory can be made if we observe the
> > > > > > similarity with kernel system memory that is allocated as
> > > > > > the
> > > > > > result of user-space action and that is accounted using
> > > > > > __GFP_ACCOUNT.
> > > > > >=20
> > > > > > Ideally, to be more flexible, we would add a
> > > > > > "pinned_memory",
> > > > > > or possibly "kernel_memory" limit to the dmem cgroups
> > > > > > controller,
> > > > > > that would additionally limit the memory that is pinned in
> > > > > > this
> > > > > > way.
> > > > > > If we let that limit default to the dmem::max limit we can
> > > > > > introduce that without needing to care about regressions.
> > > > > >=20
> > > > > > Considering that we already pin VRAM in this way for at
> > > > > > least
> > > > > > page-table memory and LRC memory, and the above path to
> > > > > > greater
> > > > > > flexibility, allow this also for dma-bufs.
> > > > > >=20
> > > > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > ---
> > > > > > =C2=A0 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
> > > > > > =C2=A0 drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 41
> > > > > > +++++++++++++++++-
> > > > > > ----
> > > > > > -----
> > > > > > =C2=A0 2 files changed, 39 insertions(+), 15 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > > > b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > > > index a7e548a2bdfb..1f88ca71820c 100644
> > > > > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > > > @@ -31,6 +31,7 @@ static void check_residency(struct kunit
> > > > > > *test,
> > > > > > struct xe_bo *exported,
> > > > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 struct drm_exec *exec)
> > > > > > =C2=A0 {
> > > > > > =C2=A0=C2=A0	struct dma_buf_test_params *params =3D
> > > > > > to_dma_buf_test_params(test->priv);
> > > > > > +	struct dma_buf_attachment *attach;
> > > > > > =C2=A0=C2=A0	u32 mem_type;
> > > > > > =C2=A0=C2=A0	int ret;
> > > > > > =C2=A0=20
> > > > > > @@ -88,6 +89,18 @@ static void check_residency(struct kunit
> > > > > > *test,
> > > > > > struct xe_bo *exported,
> > > > > > =C2=A0=20
> > > > > > =C2=A0=C2=A0	KUNIT_EXPECT_TRUE(test,
> > > > > > xe_bo_is_mem_type(exported,
> > > > > > mem_type));
> > > > > > =C2=A0=20
> > > > > > +	/* Check that we can pin without migrating. */
> > > > > > +	attach =3D list_first_entry_or_null(&dmabuf-
> > > > > > > attachments,
> > > > > > typeof(*attach), node);
> > > > > > +	if (attach) {
> > > > > > +		int err =3D dma_buf_pin(attach);
> > > > > > +
> > > > > > +		if (!err) {
> > > > > > +			KUNIT_EXPECT_TRUE(test,
> > > > > > xe_bo_is_mem_type(exported, mem_type));
> > > > > > +			dma_buf_unpin(attach);
> > > > > > +		}
> > > > > > +		KUNIT_EXPECT_EQ(test, err, 0);
> > > > > > +	}
> > > > > > +
> > > > > > =C2=A0=C2=A0	if (params->force_different_devices)
> > > > > > =C2=A0=C2=A0		KUNIT_EXPECT_TRUE(test,
> > > > > > xe_bo_is_mem_type(imported, XE_PL_TT));
> > > > > > =C2=A0=C2=A0	else
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > index a7d67725c3ee..54e42960daad 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct
> > > > > > dma_buf
> > > > > > *dmabuf,
> > > > > > =C2=A0=20
> > > > > > =C2=A0 static int xe_dma_buf_pin(struct dma_buf_attachment
> > > > > > *attach)
> > > > > > =C2=A0 {
> > > > > > -	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> > > > > > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > > > > > +	struct drm_gem_object *obj =3D dmabuf->priv;
> > > > > > =C2=A0=C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > > > > > =C2=A0=C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > > > > > =C2=A0=C2=A0	struct drm_exec *exec =3D XE_VALIDATION_UNSUPPORTE=
D;
> > > > > > +	bool allow_vram =3D true;
> > > > > > =C2=A0=C2=A0	int ret;
> > > > > > =C2=A0=20
> > > > > > -	/*
> > > > > > -	 * For now only support pinning in TT memory, for
> > > > > > two
> > > > > > reasons:
> > > > > > -	 * 1) Avoid pinning in a placement not accessible
> > > > > > to
> > > > > > some
> > > > > > importers.
> > > > > > -	 * 2) Pinning in VRAM requires PIN accounting
> > > > > > which is
> > > > > > a
> > > > > > to-do.
> > > > > > -	 */
> > > > > > -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > > > > XE_PL_TT)) {
> > > > > > +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> > > > > > +		allow_vram =3D false;
> > > > > > +	} else {
> > > > > > +		list_for_each_entry(attach, &dmabuf-
> > > > > > > attachments,
> > > > > > node) {
> > > > > > +			if (!attach->peer2peer) {
> > > > > > +				allow_vram =3D false;
> > > > > > +				break;
> > > > > > +			}
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > > > > XE_PL_TT) &&
> > > > > > +	=C2=A0=C2=A0=C2=A0 !(xe_bo_is_vram(bo) && allow_vram)) {
> > > > > > =C2=A0=C2=A0		drm_dbg(&xe->drm, "Can't migrate pinned bo
> > > > > > for
> > > > > > dma-buf pin.\n");
> > > > > > =C2=A0=C2=A0		return -EINVAL;
> > > > > > =C2=A0=C2=A0	}
> > > > > > =C2=A0=20
> > > > > > -	ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > > > > -	if (ret) {
> > > > > > -		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> > > > > > -			drm_dbg(&xe->drm,
> > > > > > -				"Failed migrating dma-buf
> > > > > > to
> > > > > > TT
> > > > > > memory: %pe\n",
> > > > > > -				ERR_PTR(ret));
> > > > > > -		return ret;
> > > > > > +	if (!allow_vram) {
> > > > > > +		ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL,
> > > > > > exec);
> > > > > > +		if (ret) {
> > > > > > +			if (ret !=3D -EINTR && ret !=3D -
> > > > > > ERESTARTSYS)
> > > > > > +				drm_dbg(&xe->drm,
> > > > > > +					"Failed migrating
> > > > > > dma-
> > > > > > buf
> > > > > > to TT memory: %pe\n",
> > > > > > +					ERR_PTR(ret));
> > > > > > +			return ret;
> > > > > > +		}
> > > > > > =C2=A0=C2=A0	}
> > > > > > =C2=A0=20
> > > > > > -	ret =3D xe_bo_pin_external(bo, true, exec);
> > > > > > +	ret =3D xe_bo_pin_external(bo, !allow_vram, exec);
> > > > > Are we also missing save/restore support for such objects? Or
> > > > > at
> > > > > least I=20
> > > > > can't see where the save flow is happening for externally
> > > > > pinned
> > > > > VRAM?
> > > > Good point. I forgot about that. IIRC we once made a deliberate
> > > > decision to leave that out since we didn't support it.
> > > >=20
> > > > I'll have a look at that as well depending if we decide to go
> > > > ahead with this.
> > > >=20
> > > Don't we take a PM ref exporting device in xe_dma_buf_attach? So
> > > when
> > > memory attached to (or pinned in this case) we can't go through
> > > save
> > > /
> > > restore flows as the device should be awake?
> > Yes, rpm save/restore should not happen, however system suspend or
> > hibernate may.
>=20
> Just a quick review: A call to ttm_bo_validate() is missing to ensure
> we don't pin while in wrong placement or swapped out.

Thanks for having a look!

It's in the ttm_bo_pin_external() function. Although we skip it when we
migrate to TT.

>=20
> By default the dmem cgroup controller is not yet used by most
> distributions, so introducing and using separate max_pinned +
> actually pinned accounting would work. It would make sense to make it
> first come first serve, which makes accounting simple. This would
> make the semantics the same as the first time hitting 'max' limit,
> but without the possibility for eviction.
>=20
> This will likely work better than re-using the 'min' semantics, since
> they serve different purposes. One might want to allow pinning, but
> not want to pin memory by default unless needed.
>=20
> Kind regards,
> ~Maarten

Thanks,
Thomas

