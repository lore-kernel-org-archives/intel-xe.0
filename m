Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DC6C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13710E725;
	Tue, 25 Jun 2024 19:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FreXp28y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A7310E725
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719345335; x=1750881335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d619Z1ZT4mQIY2+aT3MfTjmoISs3ifxJLCUnCjaHtcU=;
 b=FreXp28yile66CthpJB2pupsIz4gZpU74eNoY7tSlkRN+Jca+vludAP6
 XktV8/QHZrADp3O+6OBw1/0SRwkHZuMtfIS3pXO20B+Eh/47+Pr3z7A2t
 2d/zfl+HVF+Ydr2rtAE4OQ3qQj6OTs5WELq8wSDVtXczYfZj+pgeKeSna
 t/a/zX8gfO7XsGBesapeGybEKcD27w8BEN2fblKOfR/vTgvmcilG3LKZZ
 OmD2/MhDljrEzGE4mD8yXOqgTkfD4jl899RBbhJSrTYAizlO/h1tMEauG
 +27CmXpgv5eBSwhtTTAyvcLDbE66jbhM0xWVTnT5xrjChAme3GS5EY5wr A==;
X-CSE-ConnectionGUID: +qYV6/p3QXqb+F6Q7g9IFw==
X-CSE-MsgGUID: 1LF2IAVyTWSVjXTaHqwleg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41808781"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="41808781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:55:33 -0700
X-CSE-ConnectionGUID: hkCwidmGSFqCIhgsPZDDNQ==
X-CSE-MsgGUID: w3n/QRhISXCiwR0L2JUHjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43828258"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2024 12:55:28 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0E00828775;
 Tue, 25 Jun 2024 20:55:24 +0100 (IST)
Message-ID: <7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com>
Date: Tue, 25 Jun 2024 21:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240625084947.30869-1-nirmoy.das@intel.com>
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



On 25.06.2024 10:49, Nirmoy Das wrote:
> GuC TLB invalidation depends on GuC to process the request from the CT
> queue and then the real time to invalidate TLB. Add a function to return
> overestimated possible time a TLB inval H2G might take which can be used
> as timeout value for TLB invalidation wait time.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
> Cc: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e1f1ccb01143..fa61070d6201 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -17,7 +17,7 @@
>  #include "xe_trace.h"
>  #include "regs/xe_guc_regs.h"
>  
> -#define TLB_TIMEOUT	(HZ / 4)
> +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()

if this is no longer a macro then maybe better get rid of it and use
function call directly ?

>  
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b4137fe195a4..e30c0da86acc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
>  #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>  
> +/**
> + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
> + *
> + * This function computes the maximum time to process a tlb inval H2G commands
> + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,

these numbers looks like from experiment - what commands did you use?
do we have SLA from the GuC for max processing time of any command?

> + * so this time is set to 2 seconds to be safe.

nit: missing "Return:" tag

> + */
> +long xe_guc_tlb_timeout_jiffies(void)

this function doesn't fit into xe_guc_ct component at all

if you need to reflect CTB size in TLB timeout calculation then:

a) from xe_guc_ct export function that will tell you max number of
commands it can queue (or are already in the CTB queue)

b) in xe_guc_tlb import above function and apply additional timeout per
each H2G action in flight

> +{
> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
> +}
> +
>  static size_t guc_ct_size(void)
>  {
>  	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 105bb8e99a8d..a9755574d6c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>  }
>  
> +long xe_guc_tlb_timeout_jiffies(void);
> +
>  #endif
