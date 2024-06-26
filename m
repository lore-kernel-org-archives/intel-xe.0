Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECCAC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 14:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAFD10E8D4;
	Wed, 26 Jun 2024 14:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3Ea56uE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8817310E8D5
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719411434; x=1750947434;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VCOyZqZWo57sxGo4Mhow4mT4ncjMFRxo4NU063IKgSk=;
 b=h3Ea56uEjRq59MZlCghu/+jfSEWyKtkrGkEOFHay3Q/4p4Suwc371Ks2
 5nZckn1CtxQoPhrKWXCVos91omJ+aVbueyET7z/9IwoE4HJnvpCfI3p+Q
 QuRla3HZpBjzmXiVaeOVwARU7HH4XsuecC81fIF88rbAVU4ZNN6pk9V0A
 ZOWl2iDkz0M0LdX/vT7EsqAsQlrGK5/njEBGEmV+V3JYxSMIay6Vp3CjO
 qVUYwst9TLxRrlvsgTtN4si4vIwWRg4ADG7a1ynFfJ6gUia3Lv58oLR5w
 i55zJ1blRx1aJZteutv9/kepRGKNlF1Az3zI8By5D1wDnKcbD4TqIGPdr w==;
X-CSE-ConnectionGUID: LppSvx8bTjCdrsF0aoa1ng==
X-CSE-MsgGUID: t/0/QJOTQxO6nQhz8yJe3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19373687"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="19373687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:17:13 -0700
X-CSE-ConnectionGUID: LUgRcGqmT2ObyO0GU3YdSQ==
X-CSE-MsgGUID: scFNING3RDmWx+fVeErsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48990129"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 26 Jun 2024 07:17:11 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 84F3828779;
 Wed, 26 Jun 2024 15:17:03 +0100 (IST)
Message-ID: <f16c1102-08a4-4f95-bd6a-6a5b05204038@intel.com>
Date: Wed, 26 Jun 2024 16:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Configure TLB timeout based on CT buffer
 size
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240626134239.5190-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240626134239.5190-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 26.06.2024 15:42, Nirmoy Das wrote:
> GuC TLB invalidation depends on GuC to process the request from the CT
> queue and then the real time to invalidate TLB. Add a function to return
> overestimated possible time a TLB inval H2G might take which can be used
> as timeout value for TLB invalidation wait time.
> 
> v2: Address reviews from Michal.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e1f1ccb01143..6fc85f711074 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -17,7 +17,12 @@
>  #include "xe_trace.h"
>  #include "regs/xe_guc_regs.h"
>  
> -#define TLB_TIMEOUT	(HZ / 4)
> +/**
> + * TLB inval depends on pending commands in the CT queue and then the real
> + * invalidation time. Double up the time to process full CT queue
> + * just to be on the safe side.
> + */
> +#define TLB_TIMEOUT	(xe_ct_full_queue_proc_time_jiffies() * 2)

I'm still not sold on keeping this as a macro, even at the one time cost
of slightly bigger diff.

static long tlb_timeout_jiffies(struct xe_gt *gt)
{
	/* this reflects what HW/GuC needs to process TLB inv request */
	const long HW_TLB_TIMEOUT = HZ / 4;

	/* this estimates actual delay caused by the CTB transport */
	long delay = xe_guc_ct_queue_proc_time_jiffies(ct);

	return HW_TLB_TIMEOUT + 2 * delay;
}

>  
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 873d1bcbedd7..0cdf0d4d20e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -112,6 +112,19 @@ ct_to_xe(struct xe_guc_ct *ct)
>  #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>  
> +/**
> + * xe_ct_full_queue_proc_time_jiffies - Return maximum time to process a full CT command queue
> + *
> + * Observation is that A 4KB buffer full of commands takes a little over a second to process.

s/A 4KB/a 4 KiB

> + * Use that to calculate maximum time to process a full CT command queue.
> + *
> + * Return: Maximum time to process the full CT queue in jiffies.
> + */

while code can be long as 100, we usually wrap comments at 80 column

> +long xe_ct_full_queue_proc_time_jiffies(void)

this should have xe_guc_ct_ prefix to match component

and likely take a ct pointer as then we could return better estimate of
the delay in CTB transport based on actual number of requests in flight,
or to provide any tweaks based on platform and/or SR-IOV mode (as
requests from the VFs might be processed at lower rate that your initial
observations, and in PF mode some operations could be quite heavy)

> +{
> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_4K;
> +}
> +
>  static size_t guc_ct_size(void)
>  {
>  	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 105bb8e99a8d..57280f82dc35 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>  }
>  
> +long xe_ct_full_queue_proc_time_jiffies(void);
> +
>  #endif
