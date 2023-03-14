Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378C8C6FD1C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 08:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279D10E737;
	Tue, 14 Mar 2023 08:27:13 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D8C10E737
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678782431; x=1710318431;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=izsShRBQBaWVz17FIN1AyZuJ8WYHkkJM2IbtVa/8ges=;
 b=k1J/kvkX2RoFcvDaDIFNSz+KqqWQikU62pgt2Igy/LjltFbQ9sBXyz50
 NQLMBHefB35YEOyGoYg1khAH/i5p5GpM9fnt7kn5Hs1xXIfvhGKj+kB6s
 FWQZnvyM5YczXM1lz0yADFxX0o/9KSrsGtnjXxfQ6pQ64IWn5IvCdAqp+
 Y3kvctCWNvyB8/8/XjiDedbtf/k0NWSPaeSYwKHTSQwoRHn2M7TY1utjF
 RMyRdrvPas/yn9kORqFfbO2bR33Tfg9K/JqXeSTqon6JaqWvTLVWyu5/a
 f0shZzR9QZMV7tUQHBZ8xRypay7IsTheVXXLMUcObkR+WZqdgbfLr3ttw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399952294"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="399952294"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681330925"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="681330925"
Received: from tlambe-mobl2.ger.corp.intel.com (HELO [10.252.14.230])
 ([10.252.14.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:27:08 -0700
Message-ID: <0c2ad013-0e14-97ad-0d79-7c0663b3afcb@intel.com>
Date: Tue, 14 Mar 2023 08:27:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20230309131856.1480173-1-riana.tauro@intel.com>
 <87edpxna0l.wl-ashutosh.dixit@intel.com>
 <5f56e536-191c-7076-9257-dcb366518dff@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <5f56e536-191c-7076-9257-dcb366518dff@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix overflow in vram manager
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 14/03/2023 04:48, Riana Tauro wrote:
> Cc:Matthew Auld <matthew.auld@intel.com>
> 
> On 3/9/2023 10:21 PM, Dixit, Ashutosh wrote:
>> On Thu, 09 Mar 2023 05:18:56 -0800, Riana Tauro wrote:
>>>
>>> The overflow caused xe_bo_restore_kernel to return an error
>>> Fix overflow in vram manager alloc function.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 643365b18bc7..159ca7105df1 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -118,7 +118,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>
>>>         cur_size = size;
>>>
>>> -        if (fpfn + size != place->lpfn << PAGE_SHIFT) {
>>> +        if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
>>
>> Looks ok but not sure if it should just be lpfn computed above? 

Yes, that looks correct. place->lpfn should for now only be set when we 
want to place something at a specific offset. AFAICT this is heavily 
used for pinned kernel objects (as well as setting ALLOC_CONTIG), and 
incorrectly applying the roundup_power_of_two() might break stuff when 
restoring those objects (the roundup might smash into other pinned 
kernel objects).

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

fwiw the plan is to replace all of this with the i915 version, which 
also fixes this:
https://patchwork.freedesktop.org/patch/525697/?series=114521&rev=3

>> Copying Matt.
>>
>>>             /*
>>>              * Except for actual range allocation, modify the size and
>>>              * min_block_size conforming to continuous flag enablement
>>> -- 
>>> 2.39.1
>>>
