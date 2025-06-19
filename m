Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71398C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 15:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3569E10EA7D;
	Thu, 19 Jun 2025 15:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddFOcDDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F010EA7D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750346296; x=1781882296;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yYCqBFABQLLvXM5xXQ3FmHZaso7M8fn+XL8MMGzewyo=;
 b=ddFOcDDNMXIWzO9UWGP28TRtwEL5QK2TQIPtB5usJlt3PIdnfRRuj2WA
 Php/awTgJaemWNxKZM8e/TOTLxfaMKTdQkZgaLt116H/S7rEaEpMdpx6A
 aCa/Wb38N7QL7dIjJolRrjWfsvK1dCT4H5lrnELjTSbRN5YETWfKrS7Xj
 JJx6pSZ0R0CByoGcYFw0Jtx3J7WOU0eh4rQmIKEIzm2XePdKAgiqMA517
 zyVliExEZ69xeG3LqvL3uNEKje1UGQyOo0DofhTz7r5TQFwW2q5mwA6c7
 0nQ3bocFkTgrtOVro3UL362hw5zi0QwcwrGXXYyMrz/CNVTXwe5FEIiY2 g==;
X-CSE-ConnectionGUID: GTyvuhzbQGav4Qrieu+kvQ==
X-CSE-MsgGUID: vxV8YkRFSzu334RvmNzYGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52302072"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52302072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 08:18:16 -0700
X-CSE-ConnectionGUID: MorIYFG+RfCoKAKD7EozBg==
X-CSE-MsgGUID: RbtG6MYPRGim2GrJso5ttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="155054203"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.196])
 ([10.245.244.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 08:18:14 -0700
Message-ID: <131a3a652e25e68a63145fc20f0c6e23625bdb84.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Make WA BB part of LRC BO
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com, 
 shuicheng.lin@intel.com
Date: Thu, 19 Jun 2025 17:18:12 +0200
In-Reply-To: <20250612031925.4009701-1-matthew.brost@intel.com>
References: <20250612031925.4009701-1-matthew.brost@intel.com>
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

Hi, Matt.

On Wed, 2025-06-11 at 20:19 -0700, Matthew Brost wrote:
> No idea why, but without this GuC context switches randomly fail when
> running IGTs in a loop. Need to follow up why this fixes the
> aforementioned issue but can live with a stable driver for now.
>=20
> Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context
> utilization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This patch has non-trivial conflicts on drm-xe-fixes. If we need to
have it backported please help resolve the conflicts by:

./dim update-branches
./dim checkout drm-xe-fixes
./dim cherry-pick 3a1edef8f4b5

Fix up conflicts and finalize by

git cherry-pick --continue

And please send the resulting patch to me (including any tags that dim
added).

Thanks,
Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3=
6 +++++++++++++++--------------
> --
> =C2=A0drivers/gpu/drm/xe/xe_lrc_types.h |=C2=A0 3 ---
> =C2=A02 files changed, 18 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> b/drivers/gpu/drm/xe/xe_lrc.c
> index 529c6a972a55..a875b93697a5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -40,6 +40,7 @@
> =C2=A0
> =C2=A0#define LRC_PPHWSP_SIZE				SZ_4K
> =C2=A0#define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> +#define LRC_WA_BB_SIZE				SZ_4K
> =C2=A0
> =C2=A0static struct xe_device *
> =C2=A0lrc_to_xe(struct xe_lrc *lrc)
> @@ -910,7 +911,6 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> =C2=A0{
> =C2=A0	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> =C2=A0	xe_bo_unpin_map_no_vm(lrc->bo);
> -	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -973,22 +973,27 @@ struct wa_bb_setup {
> =C2=A0			 u32 *batch, size_t max_size);
> =C2=A0};
> =C2=A0
> +static size_t wa_bb_offset(struct xe_lrc *lrc)
> +{
> +	return lrc->bo->size - LRC_WA_BB_SIZE;
> +}
> +
> =C2=A0static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe=
)
> =C2=A0{
> -	const size_t max_size =3D lrc->bb_per_ctx_bo->size;
> +	const size_t max_size =3D LRC_WA_BB_SIZE;
> =C2=A0	static const struct wa_bb_setup funcs[] =3D {
> =C2=A0		{ .setup =3D wa_bb_setup_utilization },
> =C2=A0	};
> =C2=A0	ssize_t remain;
> =C2=A0	u32 *cmd, *buf =3D NULL;
> =C2=A0
> -	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> +	if (lrc->bo->vmap.is_iomem) {
> =C2=A0		buf =3D kmalloc(max_size, GFP_KERNEL);
> =C2=A0		if (!buf)
> =C2=A0			return -ENOMEM;
> =C2=A0		cmd =3D buf;
> =C2=A0	} else {
> -		cmd =3D lrc->bb_per_ctx_bo->vmap.vaddr;
> +		cmd =3D lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
> =C2=A0	}
> =C2=A0
> =C2=A0	remain =3D max_size / sizeof(*cmd);
> @@ -1011,13 +1016,14 @@ static int setup_wa_bb(struct xe_lrc *lrc,
> struct xe_hw_engine *hwe)
> =C2=A0	*cmd++ =3D MI_BATCH_BUFFER_END;
> =C2=A0
> =C2=A0	if (buf) {
> -		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc-
> >bb_per_ctx_bo->vmap, 0,
> -				 buf, (cmd - buf) * sizeof(*cmd));
> +		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
> +				 wa_bb_offset(lrc), buf,
> +				 (cmd - buf) * sizeof(*cmd));
> =C2=A0		kfree(buf);
> =C2=A0	}
> =C2=A0
> -	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) |
> 1);
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> xe_bo_ggtt_addr(lrc->bo) +
> +			=C2=A0=C2=A0=C2=A0=C2=A0 wa_bb_offset(lrc) + 1);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> @@ -1059,20 +1065,13 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> struct xe_hw_engine *hwe,
> =C2=A0	 * FIXME: Perma-pinning LRC as we don't yet support moving
> GGTT address
> =C2=A0	 * via VM bind calls.
> =C2=A0	 */
> -	lrc->bo =3D xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
> +	lrc->bo =3D xe_bo_create_pin_map(xe, tile, NULL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lrc_size + LRC_WA_BB_SIZE,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo_flags);
> =C2=A0	if (IS_ERR(lrc->bo))
> =C2=A0		return PTR_ERR(lrc->bo);
> =C2=A0
> -	lrc->bb_per_ctx_bo =3D xe_bo_create_pin_map(xe, tile, NULL,
> SZ_4K,
> -						=C2=A0
> ttm_bo_type_kernel,
> -						=C2=A0 bo_flags);
> -	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> -		err =3D PTR_ERR(lrc->bb_per_ctx_bo);
> -		goto err_lrc_finish;
> -	}
> -
> =C2=A0	lrc->size =3D lrc_size;
> =C2=A0	lrc->ring.size =3D ring_size;
> =C2=A0	lrc->ring.tail =3D 0;
> @@ -1860,7 +1859,8 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> =C2=A0	snapshot->seqno =3D xe_lrc_seqno(lrc);
> =C2=A0	snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
> =C2=A0	snapshot->lrc_offset =3D xe_lrc_pphwsp_offset(lrc);
> -	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset;
> +	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset -
> +		LRC_WA_BB_SIZE;
> =C2=A0	snapshot->lrc_snapshot =3D NULL;
> =C2=A0	snapshot->ctx_timestamp =3D
> lower_32_bits(xe_lrc_ctx_timestamp(lrc));
> =C2=A0	snapshot->ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(lrc);
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> b/drivers/gpu/drm/xe/xe_lrc_types.h
> index ae24cf6f8dd9..883e550a9423 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -53,9 +53,6 @@ struct xe_lrc {
> =C2=A0
> =C2=A0	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last
> update */
> =C2=A0	u64 ctx_timestamp;
> -
> -	/** @bb_per_ctx_bo: buffer object for per context batch wa
> buffer */
> -	struct xe_bo *bb_per_ctx_bo;
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_lrc_snapshot;

