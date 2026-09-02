Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B10C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E789110E49D;
	Wed,  2 Sep 2026 10:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdntOFFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D651910F120
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788346618; x=1819882618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yZfhVXO7hoGecA5+JlolbWRIrJDHn8yxChXKAoxhxzA=;
 b=EdntOFFEbrhiQa11YmECiZL+aTgx2OVprkZtuh1EwhYu+RxMCyU8aNVz
 A9hzTKD7jtQmtuW2YXsSaL6hRQ+DjJjEeZp7YG3R63m3t972f1IglmoO9
 eUImgKqNSCPSgmyF1JS8IlQjWpHZHLtBqfJ0LZhhmXJ40ors3Nq+HhE2T
 P+TvPiA4jsKHoetYcd6/tOL/dnlVAnA6CC2B8+7RO5hr6gFU8l8FXEyhu
 DkHlFv4QH3KdykC90k8LqKrTvLxYFWBphgDjIu6RdqHV4fLquB/LzYbOr
 XIjBBRXO+aSm0JJtOmWjDeF7SSqA2hz2nchjvfgxZOJQDBZm8Qg3j2nFR g==;
X-CSE-ConnectionGUID: 8vou1nxqSPCt3v5s3hzibA==
X-CSE-MsgGUID: V3aB2gE0QOuOyBLpJ65BRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="89008138"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="89008138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:56:58 -0700
X-CSE-ConnectionGUID: rlbgJe04Tpinpj2kAyILzg==
X-CSE-MsgGUID: XgWcqXg0Qg+v0p6gSCBY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="271341966"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.174])
 ([10.245.245.174])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:56:56 -0700
Message-ID: <74a63306-9fda-47fc-b5ea-779d6652fbcd@intel.com>
Date: Wed, 2 Sep 2026 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe/vram: revamp CPU VRAM mapping
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260902103931.826063-7-matthew.auld@intel.com>
 <20260902103931.826063-10-matthew.auld@intel.com>
 <20260902104936.63BA71F000E9@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260902104936.63BA71F000E9@smtp.kernel.org>
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

On 02/09/2026 11:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The commit intentionally leaves the global VRAM mapping (`xe->mem.vram->mapping`) uninitialized (NULL), but the display panic handler (`xe_panic_page_set_pixel()`) still attempts to use it. This will cause an invalid memory access during a kernel panic, resulting in a nested fault and preventing the panic screen from being drawn.
> --
> 
> commit c5769f31bf8cec4dae25246aba506ccb4445b29b
> Author: Matthew Auld <matthew.auld@intel.com>
> 
>      drm/xe/vram: revamp CPU VRAM mapping
>      
>      Previously, we called devm_ioremap_wc() for the entire PCI LMEM BAR (which
>      can be significantly larger than usable memory, e.g., mapping 16G for a
>      10G card), and then simply assigned subsets of this global mapping to each
>      tile. By moving the devm_ioremap_wc() call into vram_region_init() and
>      mapping on a per-tile basis, we restrict the virtual address space to exactly
>      the usable_size of each tile. As a consequence the global vram->mapping is
>      now NULL.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 56cff1e44530b..04d831b101bd1 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
> [ ... ]
>> @@ -257,8 +254,15 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>>   		return -ENODEV;
>>   	}
>>   
>> +	if (vram != xe->mem.vram) {
>> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +		vram->mapping = devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io_size);
>> +		if (!vram->mapping)
>> +			return -ENOMEM;
>> +	}
>> +
>>   	vram->dpa_base = lmem_bar->dpa_base + offset;
>> -	vram->mapping = lmem_bar->mapping + offset;
>>   	vram->usable_size = usable_size;
> 
> [Severity: High]
> Does this change break the drm_panic display handler by leaving the global
> xe->mem.vram->mapping as NULL?
> 
> Looking at drivers/gpu/drm/xe/display/xe_panic.c, xe_panic_page_set_pixel()
> appears to explicitly use the global vram->mapping to compute the IOMEM
> address for drawing pixels when the framebuffer is in VRAM:
> 
> 		if (xe_bo_is_vram(bo)) {
> 			/* Display is always mapped on root tile */
> 			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
> 
> 			if (panic->page < 0 || new_page < panic->page) {
> 				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
> 					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
> 			} else {
> 				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
> 			}
> 			iosys_map_set_vaddr_iomem(&panic->vmap,
> 						  vram->mapping + panic->res.start);
> 
> If vram->mapping is NULL, this could cause an invalid memory access when
> dereferenced by iosys_map_wr() during a kernel panic, resulting in a nested
> fault and preventing the panic screen from being displayed.

Indeed. I think we can just go via the root tile instead.

> 

