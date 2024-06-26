Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A4C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A0510E79F;
	Wed, 26 Jun 2024 07:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6YyormP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1888410E79F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719387230; x=1750923230;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xhH+8d/isXXhBHV9iP0QJdaLxBQ2a6uyyCI+0TSzDLY=;
 b=I6YyormPGhGS/GMm/Oy1KR1dSwpRlAAJwnq5zBlfMu4/Y253w1cptDUS
 aPQOU22uAgOmK4twU9Elx2qLBc/d2BcdIlihoKIilrZcOkPoTihJuxFmq
 ooIHXcJ/payQt8L7+OuSKKTQv4FC8n4ZaLH5ltXdPP2tpIU+tDTwiWeJY
 QD/F/iMgCJeGXvISIUPlxQlOWZEc7KXyA0sOTyjwuapw0I5yTgYQnayp6
 9bG6Re5M5QpC4tE9olSUX/8Pf6iHUAb0Febhi/tA4B2JeedE25TOY40bH
 Dw4RAXXNo8+/M9wtMvv1xsS/226VsM75/7bEMfB+HuHSeybLRCAVnRDLS Q==;
X-CSE-ConnectionGUID: OVOQtESmRUCtxHMXbGVzxA==
X-CSE-MsgGUID: VKcq2vcoRwKocNunkWR3KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16570686"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16570686"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:33:50 -0700
X-CSE-ConnectionGUID: thhI2NFRQW6ERboX/5esBg==
X-CSE-MsgGUID: S0wCIZhJQ+a0tYFeiLaa+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48889135"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.229])
 ([10.246.48.229])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:33:49 -0700
Message-ID: <f9bec61b-dafe-4762-9f69-2a3d403fd825@linux.intel.com>
Date: Wed, 26 Jun 2024 09:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
 <ZntAuUNTiHbYENzS@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZntAuUNTiHbYENzS@DUT025-TGLU.fm.intel.com>
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

Hi Matt,

On 6/26/2024 12:12 AM, Matthew Brost wrote:
> On Tue, Jun 25, 2024 at 10:49:47AM +0200, Nirmoy Das wrote:
>> GuC TLB invalidation depends on GuC to process the request from the CT
>> queue and then the real time to invalidate TLB. Add a function to return
>> overestimated possible time a TLB inval H2G might take which can be used
>> as timeout value for TLB invalidation wait time.
>>
> Not reviewing this patch as some reviews seem to be inflight, just
> adding some thoughts. I will say that this patch looks correct as a
> short term fix.
>
> Longterm I think we need explore coalescing TLB invalidations targeting
> the same VM when pressure exists (VM bind case, [1] should help here
> a bit) or

I assume you mean to queue tlb requests in kernel for sometime and then 
coalesce before sending.


>   optimize out invalidations
What do you mean ? Queue ggtt invalidation and send only one ?
>   (GGTT case, at one point I had
> logic in for this but pulled it out as it was buggy).
>
> I say this because when debugging [2] I found that lots of TLB
> invalidations can overwhelm the GuC to the point where it can barely
> make forward progess on submissions.
This sounds very serious!
> The former is likely a fairly large refactor, while the latter shouldn't
> be too difficult.
>
> Something for us to keep in mind as a group.

Created https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 to 
track it.


Thanks,

Nirmoy

>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/133034/
> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>>   3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index e1f1ccb01143..fa61070d6201 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -17,7 +17,7 @@
>>   #include "xe_trace.h"
>>   #include "regs/xe_guc_regs.h"
>>   
>> -#define TLB_TIMEOUT	(HZ / 4)
>> +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
>>   
>>   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index b4137fe195a4..e30c0da86acc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
>>   #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>>   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>>   
>> +/**
>> + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
>> + *
>> + * This function computes the maximum time to process a tlb inval H2G commands
>> + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
>> + * so this time is set to 2 seconds to be safe.
>> + */
>> +long xe_guc_tlb_timeout_jiffies(void)
>> +{
>> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
>> +}
>> +
>>   static size_t guc_ct_size(void)
>>   {
>>   	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 105bb8e99a8d..a9755574d6c9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>   	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>>   }
>>   
>> +long xe_guc_tlb_timeout_jiffies(void);
>> +
>>   #endif
>> -- 
>> 2.42.0
>>
