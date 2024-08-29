Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6CAC6FD35
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 08:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0114310E60F;
	Thu, 29 Aug 2024 08:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrMjj7ut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1610E60F
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724919002; x=1756455002;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=io8tizle4srgoLZg0eUitJ2nUu4R96Hmvs92mda5tro=;
 b=MrMjj7ut2jwWb/GGF9SVgHjHxtNZtCjz0LyhjPDIMHbmjKZEe05vStRn
 aX/hkT/ix/jst4is7a4ycVGzu46NWH5hd5NSxpvmkmQfyjDD6M4IjzlK1
 IJPHyQhnJG2hZimGeP9NAh1zOnj5/08r5wWh7Sn2GEcSqc2jcDI/q/Dtr
 b02O688XiftIQ3k7Sb7hSewMbYFU58C59nSa2Df5RYTqIo/kc2U1aunjv
 KW9/X54TP5rlNCzhaxGmeJfxTftbgciv20MEP+6MWhfA2QXsRGG5018Fx
 EGYB+O2icYSRc59JqubTlKlB3UiRIC6BZxki2vVG/qATkzLQqGuAr2LYl Q==;
X-CSE-ConnectionGUID: nuh7Iv9JR/qgbKIUd62VJw==
X-CSE-MsgGUID: f2T1vOk+SvicUdJ80XUDEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34106948"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34106948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 01:10:02 -0700
X-CSE-ConnectionGUID: djAMn4FPREyh63le+XxDRg==
X-CSE-MsgGUID: ZZDwcx9GTZu514VM7R4KtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="94301984"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.47])
 ([10.245.245.47])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 01:10:01 -0700
Message-ID: <7db3a5e4-e98e-4e19-9b31-b653c2bba2f6@intel.com>
Date: Thu, 29 Aug 2024 09:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
References: <20240828104341.180111-2-matthew.auld@intel.com>
 <Zs9rI2MIMezCDtA0@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zs9rI2MIMezCDtA0@intel.com>
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

Hi,

On 28/08/2024 19:23, Rodrigo Vivi wrote:
> On Wed, Aug 28, 2024 at 11:43:42AM +0100, Matthew Auld wrote:
>> The node ptr can point to an already freed ptr, if we hit the path with
>> an already allocated node. We later dereference that pointer with:
>>
>> 	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
>>
>> which is a potential UAF.
> 
> Not true because xe_ggtt_node_allocated is checking for that.

Here the memory that node was pointing to was already freed, but node is 
still pointing at that freed memory. The node is not NULL at this point 
and so looks like a valid pointer. The node_allocated() call will then 
dereference that pointer, which is a UAF, AFAICT.

> 
> But probably after this patch we could remove the check there?!

Yeah, I did consider just dropping it altogether, but ending up just 
keeping it. I can drop it you prefer?

> 
>> Fix this by not stashing the ptr for node.
>> Also since it is likely a bad idea to leave config->ggtt_region pointing
>> to a stale ptr, also set that to NULL by calling
>> pf_release_vf_config_ggtt() instead of pf_release_ggtt().
> 
> This is a very good idea.
> 
> I wonder if this should be a separate patch, or another commit message,
> but the end result is cleaner code, so no reason to block:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks.

> 
>>
>> Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 41ed07b153b5..be198a426cdc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -390,7 +390,7 @@ static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_confi
>>   static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>> -	struct xe_ggtt_node *node = config->ggtt_region;
>> +	struct xe_ggtt_node *node;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   	u64 alignment = pf_get_ggtt_alignment(gt);
>> @@ -402,14 +402,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>>   
>>   	size = round_up(size, alignment);
>>   
>> -	if (xe_ggtt_node_allocated(node)) {
>> +	if (xe_ggtt_node_allocated(config->ggtt_region)) {
>>   		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
>>   		if (unlikely(err))
>>   			return err;
>>   
>> -		pf_release_ggtt(tile, node);
>> +		pf_release_vf_config_ggtt(gt, config);
>>   	}
>> -	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
>> +	xe_gt_assert(gt, !xe_ggtt_node_allocated(config->ggtt_region));
>>   
>>   	if (!size)
>>   		return 0;
>> -- 
>> 2.46.0
>>
