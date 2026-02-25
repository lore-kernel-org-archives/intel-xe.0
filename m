Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DECCF4BB9A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244610E010;
	Wed, 25 Feb 2026 10:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rt7dRJoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F83010E010
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772016934; x=1803552934;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dlxcnYLAImynFOmbnTZ34qQkm8HKUwQnIpJtRNMXMGY=;
 b=Rt7dRJoADloE4dW/cNHpn45PFJCkQ2sNC51gPTsaeokueVyrYwqDryTc
 mh1jMR/tnS2OyWv38yijP0XiOIEaB4hxFQ+9F70+c5+Vy58VLIXGNzKDS
 0EFx58YIa9I9AIqOtFS7lpf+a56O1oG3pl4QJ48g8qo8V9IzO4df/ycag
 Lw458Fv9bdpvVYRjOOJHtXKgQNFIqQBKHJWf5H0nbJ+s5dNMnLTprRl+f
 qeAavTbxcaTT16fUq6vODYlTOzgrad+T24C4uYkMw9vEOcSOWUc8Ic6bc
 0ZFBb/9/oej6+Z+CRY49iVaZfd1Hn3D96VwOBMXZKO7CpEf8HV+p6BDsj A==;
X-CSE-ConnectionGUID: 9PqaZPdJQBeLkuTvu9+bRQ==
X-CSE-MsgGUID: Wss1VhdBQ+egOnXN75ngeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76657066"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76657066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 02:55:33 -0800
X-CSE-ConnectionGUID: hnkx3yezQvGCuVnLWkK5hw==
X-CSE-MsgGUID: YUbYEZzESBS+zSPyMjnSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215307784"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.40])
 ([10.245.244.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 02:55:32 -0800
Message-ID: <b052bef6590a73a3ea726b81b1af55dea36db272.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Split H2G and G2H into separate buffer
 objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stuart.summers@intel.com, 
 francois.dugast@intel.com, daniele.ceraolospurio@intel.com, 
 michal.wajdeczko@intel.com
Date: Wed, 25 Feb 2026 11:55:28 +0100
In-Reply-To: <aZ3N+CwyKRARMW6m@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-2-matthew.brost@intel.com>
 <3033abb2dfe6755ff3559a480e0d21b5665436d5.camel@linux.intel.com>
 <aZ3N+CwyKRARMW6m@lstrano-desk.jf.intel.com>
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

On Tue, 2026-02-24 at 08:12 -0800, Matthew Brost wrote:
> On Tue, Feb 24, 2026 at 04:58:35PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > > H2G and G2H buffers have different access patterns (H2G is CPU-
> > > write,
> > > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these
> > > patterns
> > > benefit from different memory placements: H2G in VRAM and G2H in
> > > system
> > > memory. Split the CT buffer into two separate buffers=E2=80=94one for=
 H2G
> > > and
> > > one for G2H=E2=80=94and select the optimal placement for each.
> > >=20
> > > This provides a significant performance improvement on the G2H
> > > read
> > > path, reducing a single read from ~20 =C2=B5s to under 1 =C2=B5s on B=
MG.
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >=20
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > Perhaps one could experiment with reading the data from the g2h bo
> > using MOVNTDQA, like the write-combining memcopy. That would avoid
> > caching the data and the GuC having to invalidate the cache line
> > while
> > snooping on the next write.
>=20
> We can try that, but G2H messages are variable-sized, so I believe it
> will get a little tricky. Once these are system-memory reads, I
> recall
> G2H handling being something like 15 per =C2=B5s of page faults (maybe
> that
> isn=E2=80=99t correct =E2=80=94 I=E2=80=99ll double-check), and that incl=
uded my not-yet-
> posted
> caching implementation, which also takes a spinlock, examines the
> page-fault cache, and chains the fault onto a list. So I don=E2=80=99t th=
ink
> this will end up in the critical path.
>=20
> >=20
> > But that should probably have a less impact, but perhaps speeding
> > up
> > GuC writes.
>=20
> We can play around with this and bounce ideas around. On the H2G
> side,
> xe_device_wmb() before the tail update is actually fairly expensive,
> so
> if we can use some asm instructions to avoid that, it might be
> worthwhile.

That is probably the latency of flushing out buffered writes. I don't
think there is much to be done on improving that.

/Thomas

>=20
> Matt
>=20
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > ---
> > > v3:
> > > =C2=A0- Move BO to ctbs h2g or g2h structure (Michal)
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_ct.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 67 +++++++++++++++++++---
> > > ----
> > > --
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_ct_types.h |=C2=A0 4 +-
> > > =C2=A02 files changed, 47 insertions(+), 24 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 8a45573f8812..ea07a27757d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct
> > > g2h_fence *g2h_fence)
> > > =C2=A0
> > > =C2=A0#define CTB_DESC_SIZE		ALIGN(sizeof(struct
> > > guc_ct_buffer_desc), SZ_2K)
> > > =C2=A0#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > > +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > > =C2=A0#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > > =C2=A0#define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE /
> > > sizeof(u32))
> > > =C2=A0#define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> > > @@ -279,10 +280,14 @@ long
> > > xe_guc_ct_queue_proc_time_jiffies(struct
> > > xe_guc_ct *ct)
> > > =C2=A0	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
> > > =C2=A0}
> > > =C2=A0
> > > -static size_t guc_ct_size(void)
> > > +static size_t guc_h2g_size(void)
> > > =C2=A0{
> > > -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> > > -		CTB_G2H_BUFFER_SIZE;
> > > +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> > > +}
> > > +
> > > +static size_t guc_g2h_size(void)
> > > +{
> > > +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static void guc_ct_fini(struct drm_device *drm, void *arg)
> > > @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct
> > > *ct)
> > > =C2=A0	struct xe_gt *gt =3D ct_to_gt(ct);
> > > =C2=A0	int err;
> > > =C2=A0
> > > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > > +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> > > +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
> > > =C2=A0
> > > =C2=A0	err =3D drmm_mutex_init(&xe->drm, &ct->lock);
> > > =C2=A0	if (err)
> > > @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > > =C2=A0	struct xe_bo *bo;
> > > =C2=A0
> > > -	bo =3D xe_managed_bo_create_pin_map(xe, tile,
> > > guc_ct_size(),
> > > +	bo =3D xe_managed_bo_create_pin_map(xe, tile,
> > > guc_h2g_size(),
> > > +					=C2=A0 XE_BO_FLAG_SYSTEM |
> > > +					=C2=A0 XE_BO_FLAG_GGTT |
> > > +					=C2=A0
> > > XE_BO_FLAG_GGTT_INVALIDATE
> > > >=20
> > > +					=C2=A0
> > > XE_BO_FLAG_PINNED_NORESTORE);
> > > +	if (IS_ERR(bo))
> > > +		return PTR_ERR(bo);
> > > +
> > > +	ct->ctbs.h2g.bo =3D bo;
> > > +
> > > +	bo =3D xe_managed_bo_create_pin_map(xe, tile,
> > > guc_g2h_size(),
> > > =C2=A0					=C2=A0 XE_BO_FLAG_SYSTEM |
> > > =C2=A0					=C2=A0 XE_BO_FLAG_GGTT |
> > > =C2=A0					=C2=A0
> > > XE_BO_FLAG_GGTT_INVALIDATE
> > > >=20
> > > @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > =C2=A0	if (IS_ERR(bo))
> > > =C2=A0		return PTR_ERR(bo);
> > > =C2=A0
> > > -	ct->bo =3D bo;
> > > +	ct->ctbs.g2h.bo =3D bo;
> > > =C2=A0
> > > =C2=A0	return devm_add_action_or_reset(xe->drm.dev,
> > > guc_action_disable_ct, ct);
> > > =C2=A0}
> > > @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct
> > > xe_guc_ct
> > > *ct)
> > > =C2=A0	xe_assert(xe, !xe_guc_ct_enabled(ct));
> > > =C2=A0
> > > =C2=A0	if (IS_DGFX(xe)) {
> > > -		ret =3D xe_managed_bo_reinit_in_vram(xe, tile,
> > > &ct-
> > > > bo);
> > > +		ret =3D xe_managed_bo_reinit_in_vram(xe, tile,
> > > &ct-
> > > > ctbs.h2g.bo);
> > > =C2=A0		if (ret)
> > > =C2=A0			return ret;
> > > =C2=A0	}
> > > @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct
> > > xe_device
> > > *xe, struct guc_ctb *g2h,
> > > =C2=A0	g2h->desc =3D IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> > > =C2=A0	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct
> > > guc_ct_buffer_desc));
> > > =C2=A0
> > > -	g2h->cmds =3D IOSYS_MAP_INIT_OFFSET(map,
> > > CTB_H2G_BUFFER_OFFSET
> > > +
> > > -					=C2=A0=C2=A0=C2=A0
> > > CTB_H2G_BUFFER_SIZE);
> > > +	g2h->cmds =3D IOSYS_MAP_INIT_OFFSET(map,
> > > CTB_G2H_BUFFER_OFFSET);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > > @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct
> > > xe_guc_ct *ct)
> > > =C2=A0	u32 desc_addr, ctb_addr, size;
> > > =C2=A0	int err;
> > > =C2=A0
> > > -	desc_addr =3D xe_bo_ggtt_addr(ct->bo);
> > > -	ctb_addr =3D xe_bo_ggtt_addr(ct->bo) +
> > > CTB_H2G_BUFFER_OFFSET;
> > > +	desc_addr =3D xe_bo_ggtt_addr(ct->ctbs.h2g.bo);
> > > +	ctb_addr =3D xe_bo_ggtt_addr(ct->ctbs.h2g.bo) +
> > > CTB_H2G_BUFFER_OFFSET;
> > > =C2=A0	size =3D ct->ctbs.h2g.info.size * sizeof(u32);
> > > =C2=A0
> > > =C2=A0	err =3D xe_guc_self_cfg64(guc,
> > > @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct
> > > xe_guc_ct *ct)
> > > =C2=A0	u32 desc_addr, ctb_addr, size;
> > > =C2=A0	int err;
> > > =C2=A0
> > > -	desc_addr =3D xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > > -	ctb_addr =3D xe_bo_ggtt_addr(ct->bo) +
> > > CTB_H2G_BUFFER_OFFSET +
> > > -		CTB_H2G_BUFFER_SIZE;
> > > +	desc_addr =3D xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > > CTB_DESC_SIZE;
> > > +	ctb_addr =3D xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > > CTB_G2H_BUFFER_OFFSET;
> > > =C2=A0	size =3D ct->ctbs.g2h.info.size * sizeof(u32);
> > > =C2=A0
> > > =C2=A0	err =3D xe_guc_self_cfg64(guc,
> > > @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct
> > > xe_guc_ct
> > > *ct, bool needs_register)
> > > =C2=A0	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> > > =C2=A0
> > > =C2=A0	if (needs_register) {
> > > -		xe_map_memset(xe, &ct->bo->vmap, 0, 0,
> > > xe_bo_size(ct->bo));
> > > -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo-
> > > > vmap);
> > > -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo-
> > > > vmap);
> > > +		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap, 0, 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_size(ct->ctbs.h2g.bo));
> > > +		xe_map_memset(xe, &ct->ctbs.g2h.bo->vmap, 0, 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_size(ct->ctbs.g2h.bo));
> > > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct-
> > > > ctbs.h2g.bo->vmap);
> > > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct-
> > > > ctbs.g2h.bo->vmap);
> > > =C2=A0
> > > =C2=A0		err =3D guc_ct_ctb_h2g_register(ct);
> > > =C2=A0		if (err)
> > > @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct
> > > *ct, bool needs_register)
> > > =C2=A0		ct->ctbs.h2g.info.broken =3D false;
> > > =C2=A0		ct->ctbs.g2h.info.broken =3D false;
> > > =C2=A0		/* Skip everything in H2G buffer */
> > > -		xe_map_memset(xe, &ct->bo->vmap,
> > > CTB_H2G_BUFFER_OFFSET, 0,
> > > +		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap,
> > > CTB_H2G_BUFFER_OFFSET, 0,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CTB_H2G_BUFFER_SIZE);
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot
> > > *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
> > > =C2=A0	if (!snapshot)
> > > =C2=A0		return NULL;
> > > =C2=A0
> > > -	if (ct->bo && want_ctb) {
> > > -		snapshot->ctb_size =3D xe_bo_size(ct->bo);
> > > +	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && want_ctb) {
> > > +		snapshot->ctb_size =3D xe_bo_size(ct->ctbs.h2g.bo)
> > > +
> > > +			xe_bo_size(ct->ctbs.g2h.bo);
> > > =C2=A0		snapshot->ctb =3D kmalloc(snapshot->ctb_size,
> > > atomic ?
> > > GFP_ATOMIC : GFP_KERNEL);
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -2012,8 +2030,13 @@ static struct xe_guc_ct_snapshot
> > > *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > > =C2=A0		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> > > &snapshot->g2h);
> > > =C2=A0	}
> > > =C2=A0
> > > -	if (ct->bo && snapshot->ctb)
> > > -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo-
> > > >vmap,
> > > 0, snapshot->ctb_size);
> > > +	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && snapshot->ctb)
> > > {
> > > +		xe_map_memcpy_from(xe, snapshot->ctb, &ct-
> > > > ctbs.h2g.bo->vmap, 0,
> > > +				=C2=A0=C2=A0 xe_bo_size(ct->ctbs.h2g.bo));
> > > +		xe_map_memcpy_from(xe, snapshot->ctb +
> > > xe_bo_size(ct->ctbs.h2g.bo),
> > > +				=C2=A0=C2=A0 &ct->ctbs.g2h.bo->vmap, 0,
> > > +				=C2=A0=C2=A0 xe_bo_size(ct->ctbs.g2h.bo));
> > > +	}
> > > =C2=A0
> > > =C2=A0	return snapshot;
> > > =C2=A0}
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > index 09d7ff1ef42a..46ad1402347d 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > @@ -39,6 +39,8 @@ struct guc_ctb_info {
> > > =C2=A0 * struct guc_ctb - GuC command transport buffer (CTB)
> > > =C2=A0 */
> > > =C2=A0struct guc_ctb {
> > > +	/** @bo: Xe BO for CTB */
> > > +	struct xe_bo *bo;
> > > =C2=A0	/** @desc: dma buffer map for CTB descriptor */
> > > =C2=A0	struct iosys_map desc;
> > > =C2=A0	/** @cmds: dma buffer map for CTB commands */
> > > @@ -126,8 +128,6 @@ struct xe_fast_req_fence {
> > > =C2=A0 * for the H2G and G2H requests sent and received through the
> > > buffers.
> > > =C2=A0 */
> > > =C2=A0struct xe_guc_ct {
> > > -	/** @bo: Xe BO for CT */
> > > -	struct xe_bo *bo;
> > > =C2=A0	/** @lock: protects everything in CT layer */
> > > =C2=A0	struct mutex lock;
> > > =C2=A0	/** @fast_lock: protects G2H channel and credits */
