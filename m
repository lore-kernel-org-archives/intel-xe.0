Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F537C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 18:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76610E117;
	Wed, 15 Nov 2023 18:00:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFC010E119
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700071252; x=1731607252;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ezGeNkoozaBVRu25fnW18u92pYOZ/8APEykajRvzXbw=;
 b=E7NoIpZ4E5zlVQ0gb2uzzcAybO1ozL2XMsVtTkgFWVVaSKTRASGTrm/k
 gpROBTNpLVt02tx8oK37GB24SB81jKz8avqQDwSGO2iv7Efe/g9RoAn0k
 mYhLRZhLgjo4rFSStC6eQezub9vxBsub2qHePtmzinjqWqk/OJe+rLdJT
 gKil8qzuG1IY9NIP1G+A3/WEQleXazBUQigBuG2ivwXAyG6u2lno0mrsh
 NeUpYz40vBXx2OjPxyiTZY9ReJWGUX68tST9Dm4+o0DLjoz883XlaQfwQ
 JgrxoD6cj278Mhg3qQ2o3T+oR4F/pc34yQfxBUvbY0GxuY2C7XRbWBE3K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12474162"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="12474162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 10:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835469957"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="835469957"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2023 10:00:47 -0800
Received: from [10.249.135.24] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.24])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DDD4F3682C;
 Wed, 15 Nov 2023 18:00:45 +0000 (GMT)
Message-ID: <7b24dc06-effc-4128-9e05-6f7bd33b7b55@intel.com>
Date: Wed, 15 Nov 2023 19:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
 <20231115113748.1949-3-michal.wajdeczko@intel.com>
 <ZVSgURHzVdwm1LIN@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZVSgURHzVdwm1LIN@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/guc: Fix handling of
 GUC_HXG_TYPE_NO_RESPONSE_BUSY
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



On 15.11.2023 11:41, Matthew Brost wrote:
> On Wed, Nov 15, 2023 at 12:37:47PM +0100, Michal Wajdeczko wrote:
>> If GuC responds with the NO_RESPONSE_BUSY message, we extend
>> our timeout while waiting for the actual response, but we wrongly
>> assumed that the next message will be RESPONSE_SUCCESS, missing
>> that we still can get RESPONSE_FAILURE.
>>
>> Change the condition for the expected message type, using only
>> common bits from RESPONSE_SUCCESS and RESPONSE_FAILURE (as they
>> differ, by ABI design, only by the last bit).
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index ddbe64eb0f3b..16c233f120c6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -671,9 +671,10 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>  	header = xe_mmio_read32(gt, reply_reg);
>>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>> +		u32 resp_bits = GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE;
> 
> I think this works but is kinda goofy. It only works because 0x7 & 0x6
> are values. If these are defined as 0x6 & 0x1 this doesn't work.

but values for SUCCESS/FAILURE (as said in the commit message) were
designed to work that way and the HXG spec is stable AFAIK

> 
>> +		u32 resp_mask = FIELD_PREP(GUC_HXG_MSG_0_TYPE, resp_bits);
>>  
>> -		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
>> -				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
>> +		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
>>  				     1000000, &header, false);
>>
> 
> Here now we'd need to check for a failure in the header field.

checks for FAILURE/SUCCESS are done in "normal" path below, no need for
extra checks here

> 
> With all of this, I believe it is better just to wait for
> GUC_HXG_TYPE_RESPONSE_SUCCESS and have xe_mmio_wait32 timeout on all
> other returns. Getting a failure case is rare and we can live a timeout.

but are writing production quality driver, no?

and even for the "rare" cases there could be a need for different
handling of timeout vs error response (as example take version handshake
between VF and GuC - timeout means game over, while error might indicate
to try with different ABI level)

> 
> Matt
> 
>>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>> -- 
>> 2.25.1
>>
