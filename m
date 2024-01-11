Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06031C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 17:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D6810E937;
	Thu, 11 Jan 2024 17:07:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B171110E937
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704992843; x=1736528843;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0lwoD0H08Xgne1Vi6lEuk4iwjP4LM2TLfxETAZBxZ1c=;
 b=iMM+sYeYglBAx3zIUWp+H31eQ2LbiLw4vLWW+WNQvFkAhnBMR3SlQWqM
 JigzHOY1lXqMSf0xNpmmH4o2t7QDcSEjJNvGLVyRBesami9SddVsWhAbt
 cr+0gp4zQO4sW/Y3MMp2x2EMlk5gTtMtLOdVgS0N8gq7U4xE3Eg51/uKD
 oacawV1nWzXQStck1RVxfI9+L/O7tvsw17CdgkclAE8fqvOiLJNGpdXHc
 ZSzfIrSHBGrGkSOuxnUIuR5VyRjBkkOC9NWFdoV0M9Eb47sCc2cdPRwM/
 JSTgswE0fTWi1kQ6yW+Q2Gt0CKMf3G4xDjEhUqpLqggumh6iTg0C1iwOQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12402378"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="12402378"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 09:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775695789"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="775695789"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 11 Jan 2024 09:07:14 -0800
Received: from [10.249.150.229] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 91E4240DFE;
 Thu, 11 Jan 2024 17:07:13 +0000 (GMT)
Message-ID: <cd126beb-db4e-4995-8518-f04658fd6820@intel.com>
Date: Thu, 11 Jan 2024 18:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Return CTB response length
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240111152724.497-1-michal.wajdeczko@intel.com>
 <ZaAaDeAOPqbS7Tg6@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZaAaDeAOPqbS7Tg6@DUT025-TGLU.fm.intel.com>
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



On 11.01.2024 17:40, Matthew Brost wrote:
> On Thu, Jan 11, 2024 at 04:27:24PM +0100, Michal Wajdeczko wrote:
>> Not all CTB responses from the GuC are fixed size and we need to
>> pass response length to the caller, if there was a response_buffer.
>> Easiest solution is to return it as positive value from all
>> xe_guc_ct_send_recv() functions.  The CTB response length is always
>> between 1 and 254 (ie. GUC_HXG_MSG_MIN_LEN and GUC_CTB_MAX_DWORDS
>> - GUC_HXG_MSG_MIN_LEN).
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> I has purposed a different usage of the return value [1].
> 
> Perhaps we just have response len as a pass by ref argument?

no need for additional argument, we can still return data0 if there was
no response_buffer provided, and I also have patch for this, but didn't
send right now as it conflicts with our already in-flight HXG changes.

Michal

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/541762/?series=119096&rev=1
> 
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c29f095aa1b9..d490a4d42c01 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -780,7 +780,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		ret = -EIO;
>>  	}
>>  
>> -	return ret > 0 ? 0 : ret;
>> +	return ret > 0 ? response_buffer ? g2h_fence.response_len : 0 : ret;
>>  }
>>  
>>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>
>> base-commit: 79184e72263e91528195db01783148435c7e4fad
>> -- 
>> 2.25.1
>>
