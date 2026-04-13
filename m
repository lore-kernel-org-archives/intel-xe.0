Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812CAF34C49
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4154C10E445;
	Mon, 13 Apr 2026 13:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ8Xb2WE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0E310E445
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086938; x=1807622938;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YhL13Wf8ESbY6MKPSa3thFKXTCIe9rN0AzgohLpAp4U=;
 b=AJ8Xb2WEj3O49AAv3puLtYrf+NoS+xivgeyiv7lyvyrX4+VCSGlsUx/M
 yd0HRunLsmfQRKe0p7njzIYudaMi7V9DO80PZqTioLnNHI+PM8Bwj4JQg
 m4wah1gZ4CIPs+BJq+OqXBOaT3CJ0QBqkgqoAzAYZRuFBCoKKOa1EVyNQ
 gjs60KKMvO6Xp+GtC0wMb2bCd61YEqFT5k19mz+mwbjFh9DCDNGuHVvVi
 rr4C8iF6yV2kV9nL5uM91zLcdO+0g91JUp6LW6U9gFdXyOuKQxRGENH2V
 bHOnOZNQ4/rYuy7kUIoCbL0L84LY2HrMluuXzfmdpVH8jnErkDd+JVNsB g==;
X-CSE-ConnectionGUID: Ax5mZ0bdTL+kXl9vL2e9Eg==
X-CSE-MsgGUID: t5EnPNjiSVi1ubWNV18Tzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80902573"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80902573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:28:57 -0700
X-CSE-ConnectionGUID: Mna6yldQR6ypf49s7wX7Ig==
X-CSE-MsgGUID: MLH0MKXlTaOGkaBtMrF+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="223298971"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.62])
 ([10.245.245.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:28:56 -0700
Message-ID: <2d928829-8627-4535-9a68-f0fd6882e64b@intel.com>
Date: Mon, 13 Apr 2026 14:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V7 2/9] drm/gpu: Add gpu_buddy_addr_to_block helper
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
 <20260413131623.2891528-13-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260413131623.2891528-13-tejas.upadhyay@intel.com>
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

On 13/04/2026 14:16, Tejas Upadhyay wrote:
> Add helper with primary purpose is to efficiently trace a specific
> physical memory address back to its corresponding TTM buffer object.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

I think you missed the feedback from the prev revision?

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
> +				return block;
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

