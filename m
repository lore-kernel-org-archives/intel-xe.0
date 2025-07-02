Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18FC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 09:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C6C10E671;
	Wed,  2 Jul 2025 09:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LL2bzplb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3106B10E671
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751449032; x=1782985032;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c099d5QnimLdI7/HfFgJaCtxkdWn8OVeXzcIPaw6FiI=;
 b=LL2bzplbf4js8keo6W4EbFBSX61LNGJAj+RVYsVSvY+JS8f3B0lj4RAq
 vnxqs2ee/cUcjrA5LrcU60Yi+62+Pgj/SDP1j6hUPk1Qron923AJ5GK1G
 Kh5KJMq5myCgwDMvZPYK2VIQDgEZQYqofHImuzv7oRFFZ8vDVradnGtzq
 hDE7jL111jSRYZrnnReW7qOytEO9xUvmBX1LSST3l4N3cEAQDdl4YCBzV
 CNugdcinlZe4I8WNg7uIWCHTN3nezFDTq/07iFwNoIR890rxxPzV62G4g
 up8+chvrasQjSDdNf1aVjXJ67dVUBGmML7cd3jsWa2LVZho73rP2hNx/u Q==;
X-CSE-ConnectionGUID: i5aIvA2lSfKdfwRjPYiJmw==
X-CSE-MsgGUID: SzC3ZWBcRweY1WKIckbmwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53877917"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53877917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:37:12 -0700
X-CSE-ConnectionGUID: s9EncJPKT3WEwWfQWgLMBA==
X-CSE-MsgGUID: HZH9R6O8Rt+Hu9p086aDDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159541199"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:37:10 -0700
Received: from [10.245.112.168] (unknown [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1C007278DA;
 Wed,  2 Jul 2025 10:37:09 +0100 (IST)
Message-ID: <11cc0374-959c-4bee-848a-815fe33de4a0@intel.com>
Date: Wed, 2 Jul 2025 11:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Clear all LMTT pages on alloc
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250701220052.1612-1-michal.wajdeczko@intel.com>
 <20250702080231.givgpmcdn7qxjlrp@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250702080231.givgpmcdn7qxjlrp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 02.07.2025 10:02, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-02 00:00:52 +0200]:
>> Our LMEM buffer objects are not cleared by default on alloc
>> and during VF provisioning we only setup LMTT PTEs for the
>> actually provisioned LMEM range. But beyond that valid range
>> we might leave some stale data that could either point to some
>> other VFs allocations or even to the PF pages.
>>
>> Explicitly clear all new LMTT page to avoid the risk that a
>> malicious VF would try to exploit that gap.
>>
>> While around add asserts to catch any undesired PTE overwrites
>> and low-level debug traces to track LMTT PT life-cycle.
>>
>> Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>> index b56437a816e4..381f576036d0 100644
>> --- a/drivers/gpu/drm/xe/xe_lmtt.c
>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
>> @@ -78,6 +78,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>>  	}
>>  
>>  	lmtt_assert(lmtt, xe_bo_is_vram(bo));
>> +	lmtt_debug(lmtt, "level=%u addr=%#llx\n", level, (u64)xe_bo_main_addr(bo, XE_PAGE_SIZE));
>> +
>> +	xe_map_memset(lmtt_to_xe(lmtt), &bo->vmap, 0, 0, xe_bo_size(bo));
> 
> We have a dedicated macro LMTT_PTE_INVALID
> Maybe it's worth using it here.

this would require to introduce  {xe,iosys}_map_memset64() helpers

but at this point we only care about BO being zeroed, not filled with
any specific value (like LMTT_PTE_INVALID which accidentally is also 0)

> 
> I wonder why we care about cleaning LMTT only during allocation and
> not in lmtt_drop_pages and lmtt_destroy_pt.

because at lmtt_drop_pages() we explicitly remove all references to
existing PTs by resetting root entry at the PD level, so HW can't walk
those pages anymore

> To be precise, in lmtt_drop_pages we do lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid),
> but from what I understand, this is missing at the lmtt_destroy_pt level.

the designed flow is:
 - call xe_lmtt_prepare_pages() to build PT tree with clear leaf PTs
 - call xe_lmtt_populate_pages() to populate leaf PT with PTEs
 - call xe_lmtt_populate_pages() to populate leaf PT with PTEs
 - ...
 - call xe_lmtt_drop_pages() to remove whole PT tree

since currently there is no way to selectively unmap any address range
or change the back-end BOs, thus there is no point in doing selective
clear of any PTE, except at the top level PD, which we do

> 
> Thanks,
> Piotr
>>  
>>  	pt->level = level;
>>  	pt->bo = bo;
>> @@ -91,6 +94,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>>  
>>  static void lmtt_pt_free(struct xe_lmtt_pt *pt)
>>  {
>> +	lmtt_debug(&pt->bo->tile->sriov.pf.lmtt, "level=%u addr=%llx\n",
>> +		   pt->level, (u64)xe_bo_main_addr(pt->bo, XE_PAGE_SIZE));
>> +
>>  	xe_bo_unpin_map_no_vm(pt->bo);
>>  	kfree(pt);
>>  }
>> @@ -226,9 +232,14 @@ static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
>>  
>>  	switch (lmtt->ops->lmtt_pte_size(level)) {
>>  	case sizeof(u32):
>> +		lmtt_assert(lmtt, !overflows_type(pte, u32));
>> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u32), u32));
>> +
>>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u32), u32, pte);
>>  		break;
>>  	case sizeof(u64):
>> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u64), u64));
>> +
>>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u64), u64, pte);
>>  		break;
>>  	default:
>> -- 
>> 2.47.1
>>
> 

