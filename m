Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCAFC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 14:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BAA10E1D0;
	Mon, 20 Mar 2023 14:25:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBABB10E1D0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679322341; x=1710858341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lLiv3XA3t8+6HcY7f/sTW2+dZ8+B3YwLFScWJE20xN4=;
 b=DDGDXdpnlUUVMPeE87Gbtop8XecoG2J7XzWzqUz2FyDJbTZaCxSrBXi0
 O9CUqr5TMbHTsCDkArira4URtmQp5vtYSu/HM8K2dVY14IC0E1FIdOfZP
 8X5/l+oioCZfoWwafrPt5hKmmv15s7NYYa9iwpZ7rqlScdbbAwU+N8EWR
 Wh5tWqkArjZPN6sSE8vYBQv6IvqtrspdCamblvcGUkNfABAin5Hnqw75r
 MlUwwn9j6hSvl7hUpnNc7iXaGGxN52/aV+gVXgEV0TH0icFk89or8QZlW
 MKSEoDHNjgeqLX48QFHzJ2XfwRtqdnbE0xM8ZyzE99J0tG3VrEzG0wKtv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340219010"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="340219010"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824494146"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="824494146"
Received: from vmiceli-mobl.amr.corp.intel.com (HELO [10.252.26.135])
 ([10.252.26.135])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:25:40 -0700
Message-ID: <1dbc1cf7-7e14-a007-55d8-d74bc4ba76e9@intel.com>
Date: Mon, 20 Mar 2023 14:25:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-7-matthew.auld@intel.com>
 <0be67651-66f7-9e83-0c90-5c4e2a6bf363@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0be67651-66f7-9e83-0c90-5c4e2a6bf363@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe/buddy: add compatible and
 intersects hooks
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 20/03/2023 14:15, Gwan-gyeong Mun wrote:
> 
> 
> On 3/8/23 12:17 PM, Matthew Auld wrote:
>> Copy this from i915. We need .compatible for lmem -> lmem transfers, so
>> they don't just get nooped by ttm, if need to move something from
>> mappable to non-mappble or vice versa. The .intersects is needed for
>> eviction, to determine if a victim resource is worth eviction. e.g if we
>> need mappable space there is no point in evicting a resource that has
>> zero mappable pages.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 62 ++++++++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index f703e962f499..8dd33ac65499 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -230,9 +230,71 @@ static void xe_ttm_vram_mgr_debug(struct 
>> ttm_resource_manager *man,
>>       drm_printf(printer, "man size:%llu\n", man->size);
>>   }
>> +static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
>> +                       struct ttm_resource *res,
>> +                       const struct ttm_place *place,
>> +                       size_t size)
>> +{
>> +    struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>> +    struct xe_ttm_vram_mgr_resource *vres =
>> +        to_xe_ttm_vram_mgr_resource(res);
>> +    struct drm_buddy *mm = &mgr->mm;
>> +    struct drm_buddy_block *block;
>> +
>> +    if (!place->fpfn && !place->lpfn)
>> +        return true;
>> +Hi Matt,
> I understand that ttm_resource_intersects() returns true in the 
> following case,
> 
> if (!place || !man->func->intersects)
>          return true;
> 
> so this line can handle it like this, but in a real scenario, is it 
> possible to have a situation where place->fpfn==0 and place->lpfn==0?

Yeah, fpfn = 0 and lpfn = 0 is the common case, where the user doesn't 
care specifically where it is placed in VRAM. Therefore everything 
intersects (potentially valuable to evict), and is also always going to 
be compatible, so we just always return true.

> 
> Except for the routine that does the same check in 
> xe_ttm_vram_mgr_compatible(), the rest of it looks good.
> 
> br,
> G.G.
>> +    if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
>> +        return vres->used_visible_size > 0;
>> +
>> +    list_for_each_entry(block, &vres->blocks, link) {
>> +        unsigned long fpfn =
>> +            drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> +        unsigned long lpfn = fpfn +
>> +            (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
>> +
>> +        if (place->fpfn < lpfn && place->lpfn > fpfn)
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
>> +                       struct ttm_resource *res,
>> +                       const struct ttm_place *place,
>> +                       size_t size)
>> +{
>> +    struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>> +    struct xe_ttm_vram_mgr_resource *vres =
>> +        to_xe_ttm_vram_mgr_resource(res);
>> +    struct drm_buddy *mm = &mgr->mm;
>> +    struct drm_buddy_block *block;
>> +
>> +    if (!place->fpfn && !place->lpfn)
>> +        return true;
>> +
>> +    if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
>> +        return vres->used_visible_size == size;
>> +
>> +    list_for_each_entry(block, &vres->blocks, link) {
>> +        unsigned long fpfn =
>> +            drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> +        unsigned long lpfn = fpfn +
>> +            (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
>> +
>> +        if (fpfn < place->fpfn || lpfn > place->lpfn)
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>>       .alloc    = xe_ttm_vram_mgr_new,
>>       .free    = xe_ttm_vram_mgr_del,
>> +    .intersects = xe_ttm_vram_mgr_intersects,
>> +    .compatible = xe_ttm_vram_mgr_compatible,
>>       .debug    = xe_ttm_vram_mgr_debug
>>   };
