Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C189EC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7178A10E00E;
	Wed,  2 Sep 2026 14:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7cJDA4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEDF10E00E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788359808; x=1819895808;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tzSkLlseCDwogDPQUmH8XLhXlBQfkVYvp/zSZw1UfD4=;
 b=h7cJDA4Eki4c0r6DwpEYWOhaJzVk+xCD3Z2B6q32B90ckcCis5DlkXVx
 hH06L9GJEhGP4d50VtdjdIL06wkzUb3ySknnge0i8HR1/2ZqRBcpMrj2E
 6041FuRHR1yyb0HuMc0n+hT51HrjUFzYVLt+ZMd0dXzvSXDIuVNuEy1sF
 IIuxjttPpHO6cOEngxWby0JFMJZ7+iBhp71ozooKgSnjfzRtGYurnExGU
 dW85YWkqKNn52WRetgDmj6HqJAsjiEPYkQODJEo2KtWOzf5jC+fGcqWDY
 T+dPY5+GpKLgY9NDTfWmS8XJH2V1qm/1FinFqa1W8XO9ZvwYdugPpfljj g==;
X-CSE-ConnectionGUID: DZA1haGBQq+F8A+6a7Y47g==
X-CSE-MsgGUID: W9d18sXmRqOclTq3MA2kLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88945066"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88945066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:36:48 -0700
X-CSE-ConnectionGUID: rs35QUJlQd6KbgL2iaoLmw==
X-CSE-MsgGUID: gs0hHtCKReqFEKgFbkMLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="274699551"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.174])
 ([10.245.245.174])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:36:47 -0700
Message-ID: <ec26b63e-9201-42dd-a5b1-129664e4cb0e@intel.com>
Date: Wed, 2 Sep 2026 15:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/vram: revamp CPU VRAM mapping
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260902124117.918018-7-matthew.auld@intel.com>
 <20260902124117.918018-10-matthew.auld@intel.com>
 <20260902131208.497C81F000E9@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260902131208.497C81F000E9@smtp.kernel.org>
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

On 02/09/2026 14:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The panic handler incorrectly computes the virtual address for stolen memory framebuffers, silently corrupting normal VRAM instead of drawing the panic screen.
> --
> 
> commit 122b98d2306bc2a11fb8cd83e0ebcab780bfb24e
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe/vram: revamp CPU VRAM mapping
> 
> This commit moves the devm_ioremap_wc() call to vram_region_init(), mapping
> VRAM on a per-tile basis restricted to usable_size. It helps catch
> out-of-bounds CPU writes by placing a guard page at the end of each per-tile
> mapping.
> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
>> index 12c6fb99015dd..1a6cee25e9d76 100644
>> --- a/drivers/gpu/drm/xe/display/xe_panic.c
>> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
>> @@ -52,7 +52,8 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>>   	if (new_page != panic->page) {
>>   		if (xe_bo_is_vram(bo)) {
>>   			/* Display is always mapped on root tile */
>> -			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
>> +			struct xe_vram_region *vram =
>> +				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
>>   
>>   			if (panic->page < 0 || new_page < panic->page) {
>>   				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the panic handler
> incorrectly compute the virtual address for stolen memory framebuffers?
> 
> When a kernel panic occurs while the active framebuffer is in stolen memory
> (XE_PL_STOLEN), xe_bo_is_vram() returns true. The code in
> xe_panic_page_set_pixel() then adds panic->res.start (which is an offset
> starting at 0 within the stolen region) to vram->mapping (which maps normal
> VRAM) slightly below this hunk:
> 
>      iosys_map_set_vaddr_iomem(&panic->vmap,
>                                vram->mapping + panic->res.start);
> 
> This could silently corrupt normal VRAM instead of drawing the panic screen.
> 
> While this is a pre-existing issue, restricting vram->mapping to
> usable_size in this patch makes it structurally impossible to fix by merely
> correcting the offset, as the stolen memory region is explicitly excluded
> from the mapping.
> 
> Should the panic handler be updated to use xe->mem.stolen_mgr->mapping for
> XE_PL_STOLEN buffers?

xe_bo_is_vram() will only return true for dgfx + stolen or normal VRAM, 
but we would never want to put frame buffers in the stolen part of VRAM, 
and there is no path that would lead to such a thing. The stolen part of 
VRAM is quite small and is a precious resource for stuff like FBC.

It might be worth checking for this in xe_panic_setup() to make it 
bulletproof though.

> 
> [ ... ]
> 

