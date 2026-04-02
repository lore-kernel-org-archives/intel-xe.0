Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52BECC6B32
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 08:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6647110F1B2;
	Thu,  2 Apr 2026 08:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThzIsfrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A9310F19E
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775118554; x=1806654554;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Z+1mIcrkHBoJuo7BtBv1EHYqtUU9aHTTlNkhyzoT2wc=;
 b=ThzIsfrhcwVI0VyQhnvjbloJFhaWd/+2KmymdlRlDZh/Re1IiWT1aIWx
 zehz1ul/ItO7p+NWt7WvyBkggLxuPuBBr3NVgOJZBYDUTLQhWNmevDvua
 DyBJg6tZqeVbIkbTcRCzDoRCmVhQgPvduSbmW/NmjsHN7ysAHIeHhpatc
 RBaj3f1FTVuFjXD7UAFpfBY6W+Zspdl9e192vS8rCwA/yneklTWMIg1ep
 ysywudxlkkw7cAK0LSoRgREdTVUgzEsMR8/a/9ZSnlGcVIKpTzoOgKxrJ
 0kNkrkrRLO0RumHqOk8jVu5zth/kQjjzd16tji1UTm/nZ76R/Au9sAb8t g==;
X-CSE-ConnectionGUID: BTTaOJnaRgmpKDbF7X43Qw==
X-CSE-MsgGUID: MVy4JhM3QjmCEwsTaPQLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75210955"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="75210955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:29:14 -0700
X-CSE-ConnectionGUID: UQCsw0OPRiC1QD7c1uNHDg==
X-CSE-MsgGUID: VzekgNaIRlilErrJ4Ov5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226080853"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.32])
 ([10.245.245.32])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:29:13 -0700
Message-ID: <57caefccdc0a17a73e58ccde61ea4098af9c1038.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Date: Thu, 02 Apr 2026 10:29:08 +0200
In-Reply-To: <20260401161528.1990499-4-satyanarayana.k.v.p@intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-4-satyanarayana.k.v.p@intel.com>
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

On Wed, 2026-04-01 at 16:15 +0000, Satyanarayana K V P wrote:
> The suballocator algorithm tracks a hole cursor at the last
> allocation
> and tries to allocate after it. This is optimized for fence-ordered
> progress, where older allocations are expected to become reusable
> first.
>=20
> In fence-enabled mode, that ordering assumption holds. In fence-
> disabled
> mode, allocations may be freed in arbitrary order, so limiting
> allocation
> to the current hole window can miss valid free space and fail
> allocations
> despite sufficient total space.
>=20
> Use DRM memory manager instead of sub-allocator to get rid of this
> issue
> as CCS read/write operations do not use fences.
>=20
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands
> with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>=20
> ---
> V2 -> V3:
> - Used xe_mem_pool_init() and xe_mem_pool_shadow_init() to allocate
> BB
> pools.
>=20
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)

Claude's kreview:

commit 937a5e27ca20b0216530e9df59e85acfe2e3c1fb
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/vf: Use drm mm instead of drm sa for CCS read/write

The suballocator used for CCS batch buffer pools tracks a hole cursor
optimized for fence-ordered frees; in fence-disabled mode, out-of-order
frees can leave valid free space unreachable, causing allocation
failures
despite sufficient total space.  This patch replaces the suballocator
with drm_mm, which does not have that ordering constraint.

> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..97d8f9107434 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_ggtt_types.h"
>
>  struct xe_device;
> +struct xe_mm_sa_bb;
>  struct xe_vm;

This isn't a bug, but the forward declaration names a type xe_mm_sa_bb
that does not appear to be defined anywhere in the driver.  The field
added below uses struct xe_mem_pool_bb, not struct xe_mm_sa_bb.

Should this be:

    struct xe_mem_pool_bb;

or removed entirely?

> [...]
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index db023fb66a27..3a0abe519536 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -141,43 +141,39 @@ static u64 get_ccs_bb_pool_size(struct
xe_device *xe)
>
>  static int alloc_bb_pool(struct xe_tile *tile, struct
xe_sriov_vf_ccs_ctx *ctx)
>  {
> [ ... ]
> +	pool_manager =3D xe_mem_pool_init(tile, bb_pool_size, flags);
> +	if (IS_ERR(pool_manager)) {
> +		xe_sriov_err(xe, "xe_mem_pool_init init failed with
error: %pe\n",
> +			     pool_manager);

The error string "xe_mem_pool_init init" has the word "init" twice.
Was this meant to be "xe_mem_pool_init failed" or "pool init failed"?

Additionally, this patch fixes a bug introduced by:

    Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy
                           commands with BO")

That commit carries a lore.kernel.org link and a maintainer Signed-off-
by,
suggesting it has landed in a released kernel.  Should this patch carry
a
Cc: stable@vger.kernel.org tag?

Thomas's comment:
Please use "dim fixes <SHA1>" do craft Fixes: tags.

Thanks,
Thomas



