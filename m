Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB6C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 07:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B45210E483;
	Tue, 10 Jun 2025 07:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isRXAu5T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76A510E483
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749540023; x=1781076023;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cTVy9UN/8ncOyCevPSkeWQ/U4ypfpNOwHw2/rK02rDw=;
 b=isRXAu5TYCtr1l3o82zwEr69N95+QkSladjCZ8jeGt9/MdmjGMu5UyC5
 lENbrzuieCIsEAtgs+eO5Q0NgPsKn0hi+ojbFBkSkItWUo77j3Wo7p1qR
 7dOnHnFiV1T+mYwrdflF+0bZUaip/gnOrshahRjnFlmgUXSdubwxh5q8W
 AK6K7mtIN/bqQucXA1C1U7wiLkeW7U8QhlkSbgVCYp85LlYVj+FsNLUre
 QjuN8hOd/ROPUtBqXZZeBqf6iAbkhcGz3EMVLZf0mSyvRYj8pKP6dkhny
 LLlQNozCrEKiXBLf1MhP0GPTsGcVk3RUtM9CWcqcKKiy5ndfkgCubIORz A==;
X-CSE-ConnectionGUID: C3O+wbpFSxODe1L4c25tDw==
X-CSE-MsgGUID: KknHmhmbQgSJQbjKVUiAYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69198694"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="69198694"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:20:22 -0700
X-CSE-ConnectionGUID: CbPx7nhzS0K/3ePXOTX0dA==
X-CSE-MsgGUID: e/SgXxDATiyiX1nC7IpvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="177667287"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.227])
 ([10.245.244.227])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:20:22 -0700
Message-ID: <4ac8fa8a01f22c34f5094b6f47c416423af9ff3a.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Enable ATS if enabled on the PCI side
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 09:20:19 +0200
In-Reply-To: <aEeAVQLCj21e600V@lstrano-desk.jf.intel.com>
References: <20250609135408.102001-1-thomas.hellstrom@linux.intel.com>
 <aEeAVQLCj21e600V@lstrano-desk.jf.intel.com>
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

On Mon, 2025-06-09 at 17:46 -0700, Matthew Brost wrote:
> On Mon, Jun 09, 2025 at 03:54:08PM +0200, Thomas Hellstr=C3=B6m wrote:
> > If IOMMU and device supports ATS, enable it in an effort to offload
> > IOMMU TLB.
> >=20
>=20
> Can you explain what exactly you mean by offload 'IOMMU TLB'.
>=20
> Does that mean physical addresses are cached on the device rather
> than
> dma-addresses for system memory?

Yes, that's as I understand it, one (the main) purpose of ATS. Instead
of sending untranslated addresses for the IOMMU to translate on each
access, the device sends physical addresses stored in its translation
cache, thereby reducing the translation burden on the IOMMU.

Thanks,
Thomas

>=20
> Matt=20
>=20
> > v2:
> > - Set the FORCE_FAULT PTE flag when clearing a PTE for faulting VM.
> > (CI)
> > v3:
> > - More instances of FORCE_FAULT flag. (CI)
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/regs/xe_gtt_defs.h |=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 +++++++++++++++--------
> > ----
> > =C2=A03 files changed, 26 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > index 4389e5a76f89..c6b32516b008 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > @@ -33,5 +33,6 @@
> > =C2=A0
> > =C2=A0#define XE_PAGE_PRESENT			BIT_ULL(0)
> > =C2=A0#define XE_PAGE_RW			BIT_ULL(1)
> > +#define XE_PAGE_FORCE_FAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(2)
> > =C2=A0
> > =C2=A0#endif
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > b/drivers/gpu/drm/xe/xe_lrc.c
> > index 61a2e87990a9..085f7e0568e9 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -976,6 +976,7 @@ static void xe_lrc_setup_utilization(struct
> > xe_lrc *lrc)
> > =C2=A0
> > =C2=A0#define PVC_CTX_ASID		(0x2e + 1)
> > =C2=A0#define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> > +#define XE_CTX_PASID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (0x2c + 1)
> > =C2=A0
> > =C2=A0static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine
> > *hwe,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm, u32 ring=
_size, u16
> > msix_vec,
> > @@ -1104,6 +1105,10 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe,
> > =C2=A0	if (xe->info.has_asid && vm)
> > =C2=A0		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm-
> > >usm.asid);
> > =C2=A0
> > +	/* If possible, enable ATS to offload the IOMMU TLB */
> > +	if (to_pci_dev(xe->drm.dev)->ats_enabled)
> > +		xe_lrc_write_ctx_reg(lrc, XE_CTX_PASID, (1 <<
> > 31));
> > +
> > =C2=A0	lrc->desc =3D LRC_VALID;
> > =C2=A0	lrc->desc |=3D FIELD_PREP(LRC_ADDRESSING_MODE,
> > LRC_LEGACY_64B_CONTEXT);
> > =C2=A0	/* TODO: Priority */
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index c9c41fbe125c..6227ea238b1b 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -65,7 +65,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile
> > *tile, struct xe_vm *vm,
> > =C2=A0	u8 id =3D tile->id;
> > =C2=A0
> > =C2=A0	if (!xe_vm_has_scratch(vm))
> > -		return 0;
> > +		return XE_PAGE_FORCE_FAULT;
> > =C2=A0
> > =C2=A0	if (level > MAX_HUGEPTE_LEVEL)
> > =C2=A0		return vm->pt_ops->pde_encode_bo(vm-
> > >scratch_pt[id][level - 1]->bo,
> > @@ -163,17 +163,9 @@ void xe_pt_populate_empty(struct xe_tile
> > *tile, struct xe_vm *vm,
> > =C2=A0	u64 empty;
> > =C2=A0	int i;
> > =C2=A0
> > -	if (!xe_vm_has_scratch(vm)) {
> > -		/*
> > -		 * FIXME: Some memory is allocated already
> > allocated to zero?
> > -		 * Find out which memory that is and avoid this
> > memset...
> > -		 */
> > -		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
> > -	} else {
> > -		empty =3D __xe_pt_empty_pte(tile, vm, pt->level);
> > -		for (i =3D 0; i < XE_PDES; i++)
> > -			xe_pt_write(vm->xe, map, i, empty);
> > -	}
> > +	empty =3D __xe_pt_empty_pte(tile, vm, pt->level);
> > +	for (i =3D 0; i < XE_PDES; i++)
> > +		xe_pt_write(vm->xe, map, i, empty);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -535,7 +527,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> > =C2=A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> > =C2=A0
> > =C2=A0		if (xe_walk->clear_pt) {
> > -			pte =3D 0;
> > +			pte =3D XE_PAGE_FORCE_FAULT;
> > =C2=A0		} else {
> > =C2=A0			pte =3D vm->pt_ops->pte_encode_vma(is_null ?
> > 0 :
> > =C2=A0						=09
> > xe_res_dma(curs) +
> > @@ -865,9 +857,21 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > =C2=A0	 */
> > =C2=A0	if (xe_pt_nonshared_offsets(addr, next, --level, walk,
> > action, &offset,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 &end_offset)) {
> > -		xe_map_memset(tile_to_xe(xe_walk->tile),
> > &xe_child->bo->vmap,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset * sizeof(u64), 0,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (end_offset - offset) *
> > sizeof(u64));
> > +		struct iosys_map *map =3D &xe_child->bo->vmap;
> > +		struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> > +
> > +		/*
> > +		 * Write only the low dword in 32-bit case to
> > avoid potential
> > +		 * issues with the high dword being non-atomically
> > written first
> > +		 * resulting in an out-of-bounds address with the
> > present
> > +		 * bit set.
> > +		 */
> > +		for (; offset < end_offset; offset++) {
> > +			if (IS_ENABLED(CONFIG_64BIT))
> > +				xe_map_wr(xe, map, offset *
> > sizeof(u64), u64, XE_PAGE_FORCE_FAULT);
> > +			else
> > +				xe_map_wr(xe, map, offset *
> > sizeof(u64), u32, XE_PAGE_FORCE_FAULT);
> > +		}
> > =C2=A0		xe_walk->needs_invalidate =3D true;
> > =C2=A0	}
> > =C2=A0
> > --=20
> > 2.49.0
> >=20

