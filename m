Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C591CC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 10:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0310E0CE;
	Tue,  3 Jun 2025 10:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EodInH9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEF110E0CE
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748946503; x=1780482503;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MtfJiyd9ZpgNEb3sw4aLgR4cwKHRfp2IY0L9QBmHfIA=;
 b=EodInH9SnqYdTwyX+HUoBbDPk7KBokTgQR4Oole/XMt3Wbb5RqZBJWNf
 HvhVbnfxtpRZtrkv4vRC+Cy9wF73asDeCikYDof2WZlDmrTIQI+LRuO5h
 CXpelYgdzqx05stIkw22D8NHIXXCamvyXMqTXtunWuJALjptO7eBjSXHS
 WE/B8Gq31tnMVnSk5FaOqSNMTXTLanOu3RDBy/ttn2gQFkQnnDNAIQi8O
 l8X3AFb7qS2K+wvqUPHW53mclojqeDmRWNMj9+CkeXuQt7zjPefgTXyeb
 alyR8LW8LuTx54STiQDToUaUph1fLcEiA04ZsS8bMppJv6ulRxeXtAxDb Q==;
X-CSE-ConnectionGUID: AMReJCvcRJCqqIbppqOVDw==
X-CSE-MsgGUID: QN1XE3/qSXioGX3LNUG/CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76373403"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="76373403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 03:28:21 -0700
X-CSE-ConnectionGUID: S7CnDZQhRNuBgAK4G/vOgg==
X-CSE-MsgGUID: cCV8F7PyQp6RH8yQC0CbGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144791665"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 03 Jun 2025 03:28:19 -0700
Received: from [10.245.253.198] (unknown [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0C93533BDC;
 Tue,  3 Jun 2025 11:28:17 +0100 (IST)
Message-ID: <bf2aeade-2686-4f24-9fc8-e10d99ce1357@intel.com>
Date: Tue, 3 Jun 2025 12:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/vf: Introduce helpers to access GGTT
 configuration
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <20250602103325.549-2-michal.wajdeczko@intel.com>
 <c37bdcfa-f5a1-4493-8f83-037e7895bc1d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <c37bdcfa-f5a1-4493-8f83-037e7895bc1d@intel.com>
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



On 03.06.2025 01:32, Lis, Tomasz wrote:
> 
> On 02.06.2025 12:33, Michal Wajdeczko wrote:
>> In upcoming patch we want to separate tile-oriented VF functions
>> from GT-oriented functions and to allow the former access a GGTT
>> configuration stored at GT level we need to provide some helpers.
>>
>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Tomasz Lis<tomasz.lis@intel.com>
> 
> We're not changing `xe_gt_sriov_vf_balloon_ggtt_locked()` to use the new
> getters,
> 
> instead we're making the change when moving the function to
> `xe_tile_sriov_vf_balloon_ggtt_locked()`
> 
> in the next patch. No problem with that. So:

well, initially considered doing that, but since old function was still
gt-based, it was ok for it to access gt.sriov.vf.config data as other gt
functions do

> 
> Reviewed-by: Tomasz Lis<tomasz.lis@intel.com>

thanks!

> 
> -Tomasz
> 
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 34 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  5 ++++-
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/
>> xe_gt_sriov_vf.c
>> index 4ff7ae1a5f16..acfb3b1b0832 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -561,6 +561,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>       return gt->sriov.vf.self_config.lmem_size;
>>   }
>>   +/**
>> + * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: size of the GGTT assigned to VF.
>> + */
>> +u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>> +{
>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +    xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>> +
>> +    return gt->sriov.vf.self_config.ggtt_size;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: base offset of the GGTT assigned to VF.
>> + */
>> +u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>> +{
>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +    xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>> +
>> +    return gt->sriov.vf.self_config.ggtt_base;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF
>> migration
>>    * @gt: the &xe_gt struct instance
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/
>> xe_gt_sriov_vf.h
>> index 9db41afddd5a..2f96ac0c5dca 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -20,7 +20,6 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>> @@ -28,6 +27,10 @@ void xe_gt_sriov_vf_migrated_event_handler(struct
>> xe_gt *gt);
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>> +u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
>> +u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
>> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>> +
>>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32
>> val);
>>   

