Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76395CC6B33
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 09:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB0410F1C2;
	Thu,  2 Apr 2026 09:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8Sp0m1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8FC10F1C2
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 09:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775121167; x=1806657167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dw2BLD8vzCSsgQF5o5t3Rsb3gpujg60ePUkKKu0s6iU=;
 b=G8Sp0m1FmKvHpSzRz0HjF/wBCp2fVzXGTthbYp4WHo4sGs8IA+Ta+9LI
 7MiAKCu4hd48OF5y2W67QENcxJyAyRS+5opf9CtUQeCOor1eIRn/8lgHO
 xaWXmRb92FivFMzrAEfqKNR1NuxzLIVItVuitz/lXAn45VFm1Hllz9VEv
 6lv+URL8h5gGuhtmQwNln0rUU9rkrN8lVaQaTXODkbbs0ujbUPCW5CDaW
 LjtKZsqJUEdM/CHQppA3nt6bIirzRjMUd1+ODhGRMWFH3inNbZqzhnzzK
 7diP24Y0AvHtLOc7uskDMyDfGruUwFNAXRt99IwqP4AVSDn/ud41Huu0s w==;
X-CSE-ConnectionGUID: i+uYCo2gQCGlk2B15Lxidg==
X-CSE-MsgGUID: 1r1Wkp4zRo6kjfTqXG58mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80064388"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="80064388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:12:46 -0700
X-CSE-ConnectionGUID: 8kPiO5zCTgeH1in3qqACMg==
X-CSE-MsgGUID: me4csWsTTmySELwBp5kVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="227194830"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.52])
 ([10.245.245.52])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:12:46 -0700
Message-ID: <a432e0ba-0c14-4d04-9398-dd98a3aedd17@intel.com>
Date: Thu, 2 Apr 2026 10:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V6 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-11-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260327114829.2678240-11-tejas.upadhyay@intel.com>
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

On 27/03/2026 11:48, Tejas Upadhyay wrote:
> Add helper with primary purpose is to efficiently trace a specific
> physical memory address back to its corresponding TTM buffer object.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/buddy.c       | 56 +++++++++++++++++++++++++++++++++++++++
>   include/linux/gpu_buddy.h |  2 ++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> index 52686672e99f..2d26c2a0f971 100644
> --- a/drivers/gpu/buddy.c
> +++ b/drivers/gpu/buddy.c
> @@ -589,6 +589,62 @@ void gpu_buddy_free_block(struct gpu_buddy *mm,
>   }
>   EXPORT_SYMBOL(gpu_buddy_free_block);
>   
> +/**
> + * gpu_buddy_addr_to_block - given physical address find a block
> + *
> + * @mm: GPU buddy manager
> + * @addr: Physical address

Maybe mention that this is relative addr, and not necessarily the real 
physical address?

> + *
> + * Returns:
> + * gpu_buddy_block on success, NULL or error code on failure
> + */
> +struct gpu_buddy_block *gpu_buddy_addr_to_block(struct gpu_buddy *mm, u64 addr)
> +{
> +	struct gpu_buddy_block *block;
> +	LIST_HEAD(dfs);
> +	u64 end;
> +	int i;
> +
> +	end = addr + SZ_4K - 1;
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct gpu_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		block_start = gpu_buddy_block_offset(block);
> +		block_end = block_start + gpu_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(addr, end, block_start, block_end))
> +			continue;
> +
> +		if (contains(addr, end, block_start, block_end) &&
> +		    !gpu_buddy_block_is_split(block)) {
> +			if (gpu_buddy_block_is_free(block))
> +				return NULL;
> +			else if (gpu_buddy_block_is_allocated(block) && !mm->clear_avail)

I think we need to drop the clear_avail check here, or this won't work 
correctly with clear/dirty tracking (currently xe doesn't use it).

> +				return block;

Should the function doc be updated? This will only find allocated 
blocks, but the doc doesn't make that clear. Maybe also 
gpu_buddy_allocated_addr_to_block() to make this even clearer ? Or maybe 
gpu_buddy_allocated_addr_to_priv(), if we don't actually care about the 
block itself?

Other thing we need is a small testcase for this new interface in 
gpu_buddy selftest, but maybe it makes sense to hold off on that until 
we get input from Arun etc. in case they have feedback on the interface 
itself.

> +		}
> +
> +		if (gpu_buddy_block_is_split(block)) {
> +			list_add(&block->right->tmp_link, &dfs);
> +			list_add(&block->left->tmp_link, &dfs);
> +		}
> +	} while (1);
> +
> +	return ERR_PTR(-ENXIO);
> +}
> +EXPORT_SYMBOL(gpu_buddy_addr_to_block);
> +
>   static void __gpu_buddy_free_list(struct gpu_buddy *mm,
>   				  struct list_head *objects,
>   				  bool mark_clear,
> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> index 5fa917ba5450..957c69c560bc 100644
> --- a/include/linux/gpu_buddy.h
> +++ b/include/linux/gpu_buddy.h
> @@ -231,6 +231,8 @@ void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear);
>   
>   void gpu_buddy_free_block(struct gpu_buddy *mm, struct gpu_buddy_block *block);
>   
> +struct gpu_buddy_block *gpu_buddy_addr_to_block(struct gpu_buddy *mm, u64 addr);
> +
>   void gpu_buddy_free_list(struct gpu_buddy *mm,
>   			 struct list_head *objects,
>   			 unsigned int flags);

