Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD353C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A17810E164;
	Wed, 26 Jun 2024 07:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idOAYo5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C41810E164
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719388544; x=1750924544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WTkqr3oACH+Una4QZSDCMI0XAmZ/L6dDZuUaFtW+TAA=;
 b=idOAYo5V/Ded/dmZBVGbr/HpY73KWHOqPckCjJJui6eoijYhN3Ia/z3O
 ztxpYmDIpQ2QnGC5NdwluKjoUBYNTKbO/0bBMUzLrYkpEWoAvZxK1sqC6
 eovcDCX4rqBqxaSy32Qca50it3qPhBEqkwS90SKei8XBabHGMNJY6apIH
 PfvhMzWavJMQJw2Y55VD2KhjSFRo3rfp4oroWwqitDU3u2DjmWZT0OGNC
 aFu0J7kMgesZvcW+pqWQ4ryzJkZkOpvKZ6uiW1cWQF8NEC+O9hnzZz+Xa
 6wMWDwwNK21+nVOTKP2DUM6itWbpmz/Rl5jFwdZNVd/ivitckSgIlnomy A==;
X-CSE-ConnectionGUID: B04vlgMoRHKwRyHO65QDig==
X-CSE-MsgGUID: 9YtLZ814SlygTdD5E5Lsmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16125562"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16125562"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:55:43 -0700
X-CSE-ConnectionGUID: 60Tl8QECTxayE1Okp/FFig==
X-CSE-MsgGUID: z2ad1N+4SD6TfvAx0LTsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48512424"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2024 00:55:41 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 61602125B4;
 Wed, 26 Jun 2024 08:55:40 +0100 (IST)
Message-ID: <f8efa132-d3f1-4234-8169-94239294c54e@intel.com>
Date: Wed, 26 Jun 2024 09:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
To: Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com
References: <20240625153842.41070-1-umesh.nerlige.ramappa@intel.com>
 <20240625221354.GX2906448@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240625221354.GX2906448@mdroper-desk1.amr.corp.intel.com>
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



On 26.06.2024 00:13, Matt Roper wrote:
> On Tue, Jun 25, 2024 at 11:38:42PM +0800, Umesh Nerlige Ramappa wrote:
>> Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
>> the user. Current code uses XE_FW_GT to read this register on the first
>> available engine in a GT. When testing on DG2, it is observed that this value is
>> 0 when running test on some engines. To resolve that, get the hwe domain
>> specific FW for reading the engine timestamp.
>>
>> v2:
>> - update commit message
>> - use domain specific FW (Matt)
>>
>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
>>  drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
>>  drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
>>  3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 4a19b771e3a0..886965e81465 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -260,13 +260,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  
>>  	/* Get the total GPU cycles */
>>  	for_each_gt(gt, xe, gt_id) {
>> +		enum xe_force_wake_domains fw;
>> +
>>  		hwe = xe_gt_any_hw_engine(gt);
>>  		if (!hwe)
>>  			continue;
>>  
>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +		fw = xe_hw_engine_to_fw_domain(hwe);
>> +		xe_force_wake_get(gt_to_fw(gt), fw);
>>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +		xe_force_wake_put(gt_to_fw(gt), fw);
>>  		break;
>>  	}
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 78b50d3a6501..97f43ba3a00f 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>  {
>>  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>>  }
>> +
>> +enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>> +{
>> +	return hwe ? engine_infos[hwe->engine_id].domain : 0;
> 
> Not sure if we really need the ternary operator here since it wouldn't
> really make sense to call this function with a NULL hwe.  But it doesn't
> hurt anything either, so

except that now function returns value 0 which is not a valid enumerator
from enum xe_force_wake_domains, so I would suggest to assume that hwe
must be always != NULL and remove this trouble maker ternary operator

> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 7f2d27c0ba1a..900c8c991430 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -69,5 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>>  
>>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>> +enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>>  
>>  #endif
>> -- 
>> 2.34.1
>>
> 
