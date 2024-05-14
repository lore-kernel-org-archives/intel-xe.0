Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6626EC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 16:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8410E30F;
	Tue, 14 May 2024 16:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSGEI8LR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFD910E30F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715703319; x=1747239319;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mvrW5K2IcrMA74adjD3MwhwF4WO1m6vIANGe607MbfU=;
 b=fSGEI8LRVlNCfmkm43IZc7932p4mjzuvPaj64du++yXubopxVijvm8AT
 x5qNJDD7+z5yBzvI/3xDfbHLVCDjvaCBeTmDTIrqBz/soqlwjxrRYqCe/
 pkt43nExWh1GMUcvkxZlpvdWWtUJ+lnGHe4eS7me1Wlg99XsVT/9gD3zc
 RLY5h45XNBCOvgNoGpJx57czlwsOU1bupC4tc16GS6hy8oMObisfyvtvM
 lf98AZQ0Y6/4JU5sXmJY7dK+arIZI5hpwtvOhnUC3ys8c7F/Ioo+2cJe7
 iKUfCiGXsRt3jgwZlQGgKCqEi+fgkzM5B4aI/ibm1ZQBX/C0InTIlb3SP w==;
X-CSE-ConnectionGUID: 9qhxeS6NRKKhOlxkwvynLg==
X-CSE-MsgGUID: JUoQRWUnTr6f7kOrL1WZlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11865939"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11865939"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 09:15:19 -0700
X-CSE-ConnectionGUID: RBwp2Sh9TECFJSNb5FxFFA==
X-CSE-MsgGUID: 8wqp88DCRBef0BK6kzxrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30713355"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 14 May 2024 09:15:17 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 597E12878A;
 Tue, 14 May 2024 17:15:16 +0100 (IST)
Message-ID: <fe150758-d89b-4e57-a0ad-46fd89239a52@intel.com>
Date: Tue, 14 May 2024 18:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/xe/guc: Add support for threshold KLVs in
 to_string() helper
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-4-michal.wajdeczko@intel.com>
 <20240514082058.cigcuaiyqemm746t@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240514082058.cigcuaiyqemm746t@intel.com>
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



On 14.05.2024 10:20, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:09 +0200]:
>> Use MAKE_XE_GUC_KLV_THRESHOLDS_SET to generate missing conversion
>> of threshold KLV keys to string.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index ceca949932a0..cf7c5fed407d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -8,6 +8,7 @@
>>  
>>  #include "abi/guc_klvs_abi.h"
>>  #include "xe_guc_klv_helpers.h"
>> +#include "xe_guc_klv_thresholds_set.h"
>>  
>>  #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>>  
>> @@ -48,6 +49,14 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>  		return "begin_db_id";
>>  	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
>>  		return "begin_ctx_id";
>> +
>> +	/* VF CFG threshold keys */
>> +#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
>> +	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
>> +		return #NAME;
>> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_key_to_string_case)
>> +#undef define_threshold_key_to_string_case
> 
> In a review of an earlier patch, I already mentioned that placing the definition of this macro
> inside the switch worsens the readability of the code, but still:

will include empty lines for a better visibility

> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> +
>>  	default:
>>  		return "(unknown)";
>>  	}
>> -- 
>> 2.43.0
>>
> 
