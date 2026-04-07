Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAD5EDB7E0
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 09:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1E110E3A4;
	Tue,  7 Apr 2026 09:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwzUDr7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C26710E3A8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555314; x=1807091314;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2xkhBI2sq+hLWXSICTh9LZKToxTNxDiWSRDWfL6SrBg=;
 b=YwzUDr7KC7UqCnkvAs2BC42nS9ieyM8KLWc31DylG8r5NDIlgb14dytU
 fdFIaP0rxNjU7Gs+lAVZfF1N90gHcKmlHcwaM4YdbZg6nW1YxfNpyDg6g
 re+CWINhyUe7U3krOxc+BsqlJRL8LEYglZYyi/UdVgPepCjBAo5aNC8ut
 +499kZ9/vjmkAkvEnNqCgLre+urvB6KB7/DlMpceoBQJS2ekTzLo88Ltj
 /rOJo7DQGvFgfJ/sFKH5wTB7fUMq6NzSi7XR5kWMT2LKpYRzo+dHmJwbX
 bReKkXN220m3/CIitfDcnhi8B93Ka+Mz8HXcF8IGlWFCNjAh9/4hPKhvD A==;
X-CSE-ConnectionGUID: P1TFANNhSkWMjeygWiLSHA==
X-CSE-MsgGUID: eL/MqGG2QYa6FO5fvwDxMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87901032"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87901032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:48:34 -0700
X-CSE-ConnectionGUID: EbdxAsM7RwmTxnTp/SJoaA==
X-CSE-MsgGUID: NdjJYq0TRBiSGWAcrYj4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233095672"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:48:33 -0700
Message-ID: <d6c549b1-c20c-49ec-9629-11243b27966b@intel.com>
Date: Tue, 7 Apr 2026 10:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to
 invalid and assert on use
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20260406182546.569131-1-x.wang@intel.com>
 <20260406182546.569131-3-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260406182546.569131-3-x.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06/04/2026 19:25, Xin Wang wrote:
> Initialize XE_CACHE_NONE_COMPRESSION PAT index to XE_PAT_INVALID_IDX by
> default, and add xe_assert() checks at the sites that use it for PTE
> encoding. This ensures platforms that don't support this cache mode fail
> loudly rather than silently encoding an invalid index into PTEs.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
>   drivers/gpu/drm/xe/xe_pat.c     | 1 +
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index fc918b4fba54..cad47866435d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -30,6 +30,7 @@
>   #include "xe_lrc.h"
>   #include "xe_map.h"
>   #include "xe_mocs.h"
> +#include "xe_pat.h"
>   #include "xe_printk.h"
>   #include "xe_pt.h"
>   #include "xe_res_cursor.h"
> @@ -341,6 +342,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
>   			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
>   
> +			xe_assert(xe, comp_pat_index != XE_PAT_INVALID_IDX);
>   			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
>   							  IDENTITY_OFFSET / 2) * SZ_1G);
>   			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
> @@ -635,11 +637,14 @@ static void emit_pte(struct xe_migrate *m,
>   	u64 cur_ofs;
>   
>   	/* Indirect access needs compression enabled uncached PAT index */
> -	if (GRAPHICS_VERx100(xe) >= 2000)
> +	if (GRAPHICS_VERx100(xe) >= 2000) {
>   		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
>   					  xe->pat.idx[XE_CACHE_WB];
> -	else
> +		if (is_comp_pte)
> +			xe_assert(xe, pat_index != XE_PAT_INVALID_IDX);
> +	} else {
>   		pat_index = xe->pat.idx[XE_CACHE_WB];
> +	}

To simplify the flow, maybe we just unconditionally stick the assert here?

But would it make sense to take this a step further and wrap all 
pat.idx[] accesses with a simple helper (like xe_cache_pat_idx()), and 
add the assert there? There are a fair few places directly accessing 
pat.idx, outside of xe_pat.

>   
>   	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 75aaae7b003d..fad5b5a5ed4a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -559,6 +559,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>   void xe_pat_init_early(struct xe_device *xe)
>   {
>   	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
> +	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
>   	if (GRAPHICS_VERx100(xe) == 3511) {
>   		xe->pat.ops = &xe3p_xpc_pat_ops;
>   		xe->pat.table = xe3p_xpc_pat_table;

