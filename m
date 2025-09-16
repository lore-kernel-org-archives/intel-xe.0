Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB1CAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 20:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615A710E793;
	Tue, 16 Sep 2025 20:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnKygU+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBD810E793
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758054934; x=1789590934;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6raTF1zxj42AiUSP51OZAqzmp29CLGULg2XvBJDeUpk=;
 b=dnKygU+vf/PMEmx1ptA0PZ1h1oV1UjMTemPyHCP3kwIe4CBdCvyBC/fB
 NWrPqDAVdyn0uVVVIwaHrnmcn26F11u9iI3aklZAruSrgKLHaO16sH4kN
 KDoQa2SxZL53vv6cTpKSio1yErI53QcSrN60QmjTH5rd6C1O9bFXAwzaq
 CM1SrPNEqSy2OQPjXkKT7Zj12fCvH6cwBYUCVFedMXjULqdsrm21Fm8Pm
 SWR9HTlNSZdygQR6K4jdDr/hi8LoXXiM0Ub+gXd5ao6Gypj1kumEG8VcA
 ppaRgD79J6UDy+5pZ36m4T25zafanzxJmjsoT3dSG4COY0x1taazZ92zV w==;
X-CSE-ConnectionGUID: r8z0ltmJQRezmeSP+6OgJA==
X-CSE-MsgGUID: pNDGOxG8RvaKjZqrkQ99dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64168763"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="64168763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:35:34 -0700
X-CSE-ConnectionGUID: UiK3EdrZRYOPUGAlu+7ByA==
X-CSE-MsgGUID: Xzx+uOOsTDe4cT4kqrOovQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175827336"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.248])
 ([10.245.245.248])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:35:32 -0700
Message-ID: <f9fea1925b39e6cb195784497ff031ba5e4967d6.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org, 
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen	 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst	
 <maarten.lankhorst@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 16 Sep 2025 22:35:28 +0200
In-Reply-To: <aMnAIlKMXsmRuXCW@intel.com>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
 <53d50dff-89eb-4de0-befc-4bb2552c5e21@intel.com>
 <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
 <aMnAIlKMXsmRuXCW@intel.com>
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

On Tue, 2025-09-16 at 15:53 -0400, Rodrigo Vivi wrote:
> On Tue, Sep 16, 2025 at 03:06:48PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-09-16 at 14:03 +0100, Matthew Auld wrote:
> > > On 16/09/2025 12:53, Thomas Hellstr=C3=B6m wrote:
> > > > RDMA NICs typically requires the VRAM dma-bufs to be pinned in
> > > > VRAM for pcie-p2p communication, since they don't fully support
> > > > the move_notify() scheme. We would like to support that.
> > > >=20
> > > > However allowing unaccounted pinning of VRAM creates a DOS
> > > > vector
> > > > so up until now we haven't allowed it.
> > > >=20
> > > > However with cgroups support in TTM, the amount of VRAM
> > > > allocated
> > > > to a cgroup can be limited, and since also the pinned memory is
> > > > accounted as allocated VRAM we should be safe.
> > > >=20
> > > > An analogy with system memory can be made if we observe the
> > > > similarity with kernel system memory that is allocated as the
> > > > result of user-space action and that is accounted using
> > > > __GFP_ACCOUNT.
> > > >=20
> > > > Ideally, to be more flexible, we would add a "pinned_memory",
> > > > or possibly "kernel_memory" limit to the dmem cgroups
> > > > controller,
> > > > that would additionally limit the memory that is pinned in this
> > > > way.
> > > > If we let that limit default to the dmem::max limit we can
> > > > introduce that without needing to care about regressions.
> > > >=20
> > > > Considering that we already pin VRAM in this way for at least
> > > > page-table memory and LRC memory, and the above path to greater
> > > > flexibility, allow this also for dma-bufs.
> > > >=20
> > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
> > > > =C2=A0 drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 41 +++++++++++++++++-
> > > > ----
> > > > -----
> > > > =C2=A0 2 files changed, 39 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > index a7e548a2bdfb..1f88ca71820c 100644
> > > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > > @@ -31,6 +31,7 @@ static void check_residency(struct kunit
> > > > *test,
> > > > struct xe_bo *exported,
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 struct drm_exec *exec)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0	struct dma_buf_test_params *params =3D
> > > > to_dma_buf_test_params(test->priv);
> > > > +	struct dma_buf_attachment *attach;
> > > > =C2=A0=C2=A0	u32 mem_type;
> > > > =C2=A0=C2=A0	int ret;
> > > > =C2=A0=20
> > > > @@ -88,6 +89,18 @@ static void check_residency(struct kunit
> > > > *test,
> > > > struct xe_bo *exported,
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported,
> > > > mem_type));
> > > > =C2=A0=20
> > > > +	/* Check that we can pin without migrating. */
> > > > +	attach =3D list_first_entry_or_null(&dmabuf-
> > > > >attachments,
> > > > typeof(*attach), node);
> > > > +	if (attach) {
> > > > +		int err =3D dma_buf_pin(attach);
> > > > +
> > > > +		if (!err) {
> > > > +			KUNIT_EXPECT_TRUE(test,
> > > > xe_bo_is_mem_type(exported, mem_type));
> > > > +			dma_buf_unpin(attach);
> > > > +		}
> > > > +		KUNIT_EXPECT_EQ(test, err, 0);
> > > > +	}
> > > > +
> > > > =C2=A0=C2=A0	if (params->force_different_devices)
> > > > =C2=A0=C2=A0		KUNIT_EXPECT_TRUE(test,
> > > > xe_bo_is_mem_type(imported, XE_PL_TT));
> > > > =C2=A0=C2=A0	else
> > > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > index a7d67725c3ee..54e42960daad 100644
> > > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct
> > > > dma_buf
> > > > *dmabuf,
> > > > =C2=A0=20
> > > > =C2=A0 static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> > > > =C2=A0 {
> > > > -	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> > > > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > > > +	struct drm_gem_object *obj =3D dmabuf->priv;
> > > > =C2=A0=C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > > > =C2=A0=C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > > > =C2=A0=C2=A0	struct drm_exec *exec =3D XE_VALIDATION_UNSUPPORTED;
> > > > +	bool allow_vram =3D true;
> > > > =C2=A0=C2=A0	int ret;
> > > > =C2=A0=20
> > > > -	/*
> > > > -	 * For now only support pinning in TT memory, for two
> > > > reasons:
> > > > -	 * 1) Avoid pinning in a placement not accessible to
> > > > some
> > > > importers.
> > > > -	 * 2) Pinning in VRAM requires PIN accounting which is
> > > > a
> > > > to-do.
> > > > -	 */
> > > > -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > > XE_PL_TT)) {
> > > > +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>=20
> I don't believe this check is the right one here.
> Perhaps the config is enabled, but the driver importing
> this dma-buf doesn't support it.

So this was actually shamelessly stolen from amdgpu. I'll see if I can
sort out whether this works anyway even if the importer doesn't support
move_notify().

>=20
> perhaps we want a new config here? so when we transition to cgroups
> we "don't regress" ?!

We currently *do* use cgroups for VRAM. If enabled, all the cgroup's
VRAM allocations (including this pinned memory) don't exceed the
dmem:max limit.
The plan moving forward is to, if needed, try to introduce a
dmem:pinned_memory limit <=3D dmem:max and when we pin we account against
that as well. If dmem:pinned_memory is set to dmem:max by default, we
don't regress.

Thanks,
Thomas


>=20
> > > > +		allow_vram =3D false;
> > > > +	} else {
> > > > +		list_for_each_entry(attach, &dmabuf-
> > > > >attachments,
> > > > node) {
> > > > +			if (!attach->peer2peer) {
> > > > +				allow_vram =3D false;
> > > > +				break;
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > > XE_PL_TT) &&
> > > > +	=C2=A0=C2=A0=C2=A0 !(xe_bo_is_vram(bo) && allow_vram)) {
> > > > =C2=A0=C2=A0		drm_dbg(&xe->drm, "Can't migrate pinned bo for
> > > > dma-buf pin.\n");
> > > > =C2=A0=C2=A0		return -EINVAL;
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=20
> > > > -	ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > > -	if (ret) {
> > > > -		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> > > > -			drm_dbg(&xe->drm,
> > > > -				"Failed migrating dma-buf to
> > > > TT
> > > > memory: %pe\n",
> > > > -				ERR_PTR(ret));
> > > > -		return ret;
> > > > +	if (!allow_vram) {
> > > > +		ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > > +		if (ret) {
> > > > +			if (ret !=3D -EINTR && ret !=3D -
> > > > ERESTARTSYS)
> > > > +				drm_dbg(&xe->drm,
> > > > +					"Failed migrating dma-
> > > > buf
> > > > to TT memory: %pe\n",
> > > > +					ERR_PTR(ret));
> > > > +			return ret;
> > > > +		}
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=20
> > > > -	ret =3D xe_bo_pin_external(bo, true, exec);
> > > > +	ret =3D xe_bo_pin_external(bo, !allow_vram, exec);
> > >=20
> > > Are we also missing save/restore support for such objects? Or at
> > > least I=20
> > > can't see where the save flow is happening for externally pinned
> > > VRAM?
> >=20
> > Good point. I forgot about that. IIRC we once made a deliberate
> > decision to leave that out since we didn't support it.
> >=20
> > I'll have a look at that as well depending if we decide to go
> > ahead with this.
> >=20
> > /Thomas
> >=20
> > >=20
> > > > =C2=A0=C2=A0	xe_assert(xe, !ret);
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0	return 0;
> > >=20
> >=20

