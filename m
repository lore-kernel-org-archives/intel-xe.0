Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E5DC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C28210E143;
	Thu,  3 Sep 2026 17:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A74St18L";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9783E10E143
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 17:23:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8075160120;
 Thu,  3 Sep 2026 17:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F7B1F000E9;
 Thu,  3 Sep 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788456237;
 bh=fspfo0S0nHqepNaY1TzaM/feFf/MsP0CwFsSy80YZFw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=A74St18LtX4mtlm82C/dx196+sZr+U1Zr3ueVs6+VC/LQRUGB5a5pSuX9hCgwpoQL
 MSftEKCSUO0zJjQ+zFiHcu6PJ3rD8Q7NgjrWdt3u6WC/GXM/n4IKone2pozCa2b+IZ
 bkrowQJ0i/asfOuaWp2jyJm+ZRC9akZ74N8Iy3Zb28sAwp5wBw20j5SkVLbPWyAmZa
 y1gKZdovUn5bqvyTuNfcIq6Pax475HGDTIY/xrdXzmrMrNT8JqWhUpM/VGMIfYhRrG
 rfvsZJafy0nZ89Th4806No9QZXN9TsG59vI6Q574lOHlxIVFnzzsKaX/F4/0kZx1N9
 NsWqDmOzcYXvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V21 09/15] drm/xe/vram: Add VRAM page offline fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903161553.528932-26-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
 <20260903161553.528932-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 17:23:56 +0000
Message-Id: <20260903172357.15F7B1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Time-of-check to time-of-use (TOCTOU) race and unconditional force=
ful unpinning of BO corrupts pin accounting and leads to panic.
--

commit c3198ab922e6897a8d11667a30d137d679162800
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: Add VRAM page offline fault handler

Add the core VRAM page offlining logic to handle HW-reported faulty
physical addresses.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index d97739a84a2d1..aea4cb0b66fd0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c

[ ... ]

> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	struct ttm_operation_ctx ctx =3D {};

[ ... ]

> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> +	if (xe_bo_is_pinned(bo))
> +		xe_bo_unpin(bo);

[Severity: High]
Does this code forcefully unpin the BO without owning the pin reference?

When xe_ttm_vram_purge_page() gets called, it unconditionally drops the
pin count if the BO is pinned. Since the pin is owned by an external subsys=
tem
(like display or dma-buf), this steals their reference.=20

When the legitimate owner later calls xe_bo_unpin_external(), the pin count
will underflow or fail an assertion (xe_assert(xe, xe_bo_is_pinned(bo))),
leading to a kernel panic because xe_bo_unpin_external() lacks the
xe_bo_is_purged() short-circuit found in xe_bo_unpin().

Is there a way to handle this without corrupting the pin accounting?

> +	ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
> +	xe_bo_unlock(bo);
> +
> +out:
> +	if (q_to_put) {
> +		xe_exec_queue_kill(q_to_put);
> +		xe_exec_queue_put(q_to_put);
> +	}
> +
> +	return ret;
> +}

[ ... ]

> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 ad=
dr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{

[ ... ]

> +		if (block) {
> +			pbo =3D xe_ttm_vram_block_owner_get(xe, block);
> +
> +			/*
> +			 * Critical kernel BO? Best-effort check without resv lock;
> +			 * worst case a concurrent pin causes reset path unnecessarily.
> +			 */
> +			if (pbo && ((pbo->ttm.type =3D=3D ttm_bo_type_kernel &&
> +				     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> +				    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo)))) {

[Severity: High]
Can a concurrent pin on a user BO bypass this check?

This check in xe_ttm_vram_reserve_page_at_addr() reads xe_bo_is_pinned(pbo)
without holding the BO's dma_resv lock. If a user BO is concurrently pinned=
 via
dma-buf or display immediately after this check, it will fall through to
xe_ttm_vram_purge_page().=20

Because xe_ttm_vram_purge_page() acquires the lock and calls xe_bo_unpin()
unconditionally on pinned BOs, the newly pinned BO will have its pin refere=
nce
stolen, eventually causing a panic when the true owner tries to unpin it.=20

Furthermore, kernel BOs with XE_BO_FLAG_PINNED_LATE_RESTORE intentionally
bypass this check and are also forcefully unpinned. If the subsequent
xe_ttm_bo_purge() fails, the BO isn't marked as purged, and a later legitim=
ate
unpin will hit the same assertion panic.

Could this race be resolved by checking the pin status after acquiring the
dma_resv lock?

> +				kfree(nentry);
> +				pbo_to_put =3D pbo;
> +				drm_err(&xe->drm,
> +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> +					__func__, addr);
> +				break;
> +			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903161553.5289=
32-17-tejas.upadhyay@intel.com?part=3D9
