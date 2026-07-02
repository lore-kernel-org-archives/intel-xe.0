Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEEDC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 14:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7738210E17E;
	Thu,  2 Jul 2026 14:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmhHXUlF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A37C10E17E
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783001317; x=1814537317;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KGKYrEKHvAg3Vtw1imsI947pXp2NVHSgr3TwPABqJh0=;
 b=mmhHXUlFW7JK38z5x4OEbfzh+e5y/bpgBT/IIgn0C3TCBSsxhY4y+yhT
 DevY826efc1/pKy3PskxquC2q8MoHKGGmuqI+ZBqFi4GbbEs+YLCgnLqJ
 FNnv7sYgU8Y7npo4Su4x2wDOJ0oiARuGe6ID63tB72wPLG7Y8Siu4pm75
 8Z/5NXK64i/5AZmohwVJM35dirqTjPnJpQPFnw160Q/0NNPTh9h0ELV/G
 8hFq8IbulKjKl10S+dwxBV627yPUEsDDs/A+4IA1genGYko+gYf1O6Tk4
 FE5x3jPdZbU+WI3oA9D42Z2j7ak1hAozs5838HcTKe7FTER46ld5ZiKmv w==;
X-CSE-ConnectionGUID: tB9Lt7EVRGCBo6uYRjHj3A==
X-CSE-MsgGUID: 5e3Ca0rTSdiWMMEBL3rsAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94355862"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="94355862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 07:08:36 -0700
X-CSE-ConnectionGUID: XQrbXyXkRxGqZEgJp1Y61Q==
X-CSE-MsgGUID: JZwZx76VSJ6EZ56DqMVFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="257217570"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 07:08:35 -0700
Message-ID: <bd1aab65-fa42-4540-af71-16dea211523d@intel.com>
Date: Thu, 2 Jul 2026 15:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix PTE index in xe_vm_populate_pgtable() for
 chunked binds
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20260702012434.3861171-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260702012434.3861171-1-matthew.brost@intel.com>
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

On 02/07/2026 02:24, Matthew Brost wrote:
> xe_vm_populate_pgtable() indexed the source PTE array (update->pt_entries)
> by the per-call loop counter, assuming each call starts at the first entry
> of the update. That holds for the CPU bind path
> (xe_migrate_update_pgtables_cpu), which populates a whole update in a single
> call, but not for the GPU bind path: write_pgtable() splits an update into
> MAX_PTE_PER_SDI (510) sized MI_STORE_DATA_IMM chunks, invoking the populate
> callback once per chunk with an advancing qword_ofs but a fresh command-
> buffer destination pointer.
> 
> As a result, every chunk after the first re-read pt_entries from index 0
> instead of from its true offset, so PTEs beyond the first 510 entries of a
> single update were programmed with the wrong physical pages, shifting the
> mapping by exactly MAX_PTE_PER_SDI pages.
> 
> This stayed latent because a single update only exceeds 510 qwords when a
> large (e.g. 2M) region is bound as individual 4K PTEs rather than a single
> huge-page entry, which happens when the backing store is sufficiently
> fragmented. It was surfaced by the BO defrag path, which deliberately
> rebinds such fragmented ranges via the GPU bind path, producing
> deterministic data corruption offset by 510 pages.
> 
> Index pt_entries by the chunk's absolute offset relative to update->ofs so
> both the CPU and GPU paths pick the correct entries.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub_Copilot:claude-opus-4.8

Missing sob.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pt.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 00cef6ff17cc..7970b4ed95b5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1024,12 +1024,22 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
>   	u64 *ptr = data;
>   	u32 i;
>   
> +	/*
> +	 * @qword_ofs is the absolute entry offset within the page table, while
> +	 * @ptes is indexed relative to @update->ofs (its first entry). The GPU
> +	 * path (write_pgtable) splits a single update into MAX_PTE_PER_SDI-sized
> +	 * chunks, calling this with an advancing @qword_ofs but a fresh @data
> +	 * pointer per chunk, so translate back into a @ptes index rather than
> +	 * assuming the chunk starts at ptes[0].
> +	 */
>   	for (i = 0; i < num_qwords; i++) {
> +		u32 idx = qword_ofs - update->ofs + i;
> +
>   		if (map)
>   			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
> -				  sizeof(u64), u64, ptes[i].pte);
> +				  sizeof(u64), u64, ptes[idx].pte);
>   		else
> -			ptr[i] = ptes[i].pte;
> +			ptr[i] = ptes[idx].pte;
>   	}
>   }
>   

