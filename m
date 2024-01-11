Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE4C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3A10E87A;
	Thu, 11 Jan 2024 09:37:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5F310E87A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704965862; x=1736501862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6l+gp86nhMZABRJs2kyQR3FJBgKdnPrBqKMfgVIrmv4=;
 b=lJums/hgTTId5DzE7pGKC9C+E3GXJ8pkEOH3JubTnYrG+hzbxrZRXLhU
 /+p7EGu9YvpUUHOl88HuJQ4lLO4iFEMDm59p2lc8qFlsSh1m7iyzo5pEe
 FzWLi3Go7/cFUbW2CmLdi9DKnkXI0IdJDpFHuuPiyS9mSMtptyZkZigDb
 BhyTf222RQJk9Y/iTHm99aUqqRr77hqpIYO4+G+2JGPh65opcKoARvRnK
 c7QMsLj02GKhF4WvpfONUpA3aeP5P408bJYHaR5fO8uT4IZeKdjR9GWUX
 I3Da1568ljkhjMZVWXGEGIWTOX8Rxw6NFZn/1ysSM685VlEnbXlou1Le9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="398487638"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="398487638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:37:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="24271457"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 11 Jan 2024 01:37:40 -0800
Received: from [10.249.150.229] (unknown [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 89E363D432;
 Thu, 11 Jan 2024 09:37:33 +0000 (GMT)
Message-ID: <b249c605-25f7-42d7-b5e4-ed2fc59a51f0@intel.com>
Date: Thu, 11 Jan 2024 10:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
 <20240110195951.453-2-michal.wajdeczko@intel.com>
 <ZZ8jSw7WdvokR5Rh@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZZ8jSw7WdvokR5Rh@DUT025-TGLU.fm.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11.01.2024 00:07, Matthew Brost wrote:
> On Wed, Jan 10, 2024 at 08:59:51PM +0100, Michal Wajdeczko wrote:
>> By default CT code was passing just payload of the G2H event
>> message, while Relay code expects full G2H message including
>> HXG header which contains DATA0 field. Fix that.
>>
>> Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> FWIW I do think the argument names in xe_guc_relay_process_* functions
> should be changed but not going to hold of this fix.

I can rename message argument in relay g2h handlers to "hxg", but what
about the other g2h handlers, which (IMO wrongly) take just payload, not
a message, while still use "msg" as an argument name:

int xe_guc_sched_done_handler(... u32 *msg, u32 len)
int xe_guc_deregister_done_handler(... u32 *msg, u32 len)
int xe_guc_exec_queue_reset_handler(... u32 *msg, u32 len)
int xe_guc_exec_queue_memory_cat_error_handler(... u32 *msg, u32 len)
int xe_guc_exec_queue_reset_failure_handler(... u32 *msg, u32 len)
int xe_guc_pagefault_handler(... u32 *msg, u32 len)
int xe_guc_tlb_invalidation_done_handler(... u32 *msg, u32 len)
int xe_guc_access_counter_notify_handler(... u32 *msg, u32 len)

> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index d6b7020a2d2f..4a0c9ce13bf8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -984,10 +984,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  							   adj_len);
>>  		break;
>>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>> -		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
>> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
>>  		break;
>>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
>> -		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
>> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, hxg_len);
>>  		break;
>>  	default:
>>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>> -- 
>> 2.25.1
>>
