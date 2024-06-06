Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6B0C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C356C10E166;
	Thu,  6 Jun 2024 13:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwawQSAs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244E110E166
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717680886; x=1749216886;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2UKSLZtJCXIFsHf4yVUHV++RoM2Anq8AextBBm92SEY=;
 b=LwawQSAsqXJtL5vS8TDO+2sRpuHO1/ozV147bhtk4BzXPPzsOR2BfS6k
 aKdZSy53i922g9MCRFRQlaWfuDjClMyLDrFSzZIG7R3QaZcLuF5I2NpRI
 xy0+TFGc4e7SF8MYMTEoO3F6rPtlA5Yo6L/4hc5lmN1cODzPlEOjJKwjO
 x1fALRToG547pkWgehZLNIh2epkioJEGkfK13170nPrveaYEzi5OBRQWV
 2DbOQIoRw6vM3v9FA6AIwG9jZsfwD4Y5Oa4/3sva9f1ZDLVg6p5rortUV
 NvSKfNXa2FV9YW/JbstSI9M+5w765YVKnwXm8WZA2jW5UEqK4vGWoQLHN g==;
X-CSE-ConnectionGUID: c1eiOoUlQ7ODdAmiitrNug==
X-CSE-MsgGUID: cg8CYV6CRZ2Nh+m+MaqMhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31891724"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="31891724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:34:45 -0700
X-CSE-ConnectionGUID: e6lPqnSJRDW+OlaDqdhlkA==
X-CSE-MsgGUID: P9YzMUzhTxeLqJJpup8dEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38417395"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 06:34:43 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 48C2333BED;
 Thu,  6 Jun 2024 14:34:42 +0100 (IST)
Message-ID: <2c84433e-4f83-4962-99bb-49fee729a8a0@intel.com>
Date: Thu, 6 Jun 2024 15:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/vf: Custom uC initialization
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
 <20240604212231.1416-3-michal.wajdeczko@intel.com>
 <20240606113723.veuy3a26aeg7an56@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240606113723.veuy3a26aeg7an56@intel.com>
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



On 06.06.2024 13:37, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-cze-04 23:22:29 +0200]:
>> VF drivers can't modify WOPCM registers nor upload firmwares to
>> GuC, HuC or GSC.  Modify xe_uc initialization functions to skip
>> those steps if running in the VF mode.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_uc.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 85808706d1c8..0f240534fb72 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -11,9 +11,11 @@
>>  #include "xe_gsc_proxy.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_printk.h"
>> +#include "xe_gt_sriov_vf.h"
>>  #include "xe_guc.h"
>>  #include "xe_guc_pc.h"
>>  #include "xe_huc.h"
>> +#include "xe_sriov.h"
>>  #include "xe_uc_fw.h"
>>  #include "xe_wopcm.h"
>>  
>> @@ -53,6 +55,9 @@ int xe_uc_init(struct xe_uc *uc)
>>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>  		return 0;
>>  
>> +	if (IS_SRIOV_VF(uc_to_xe(uc)))
>> +		return 0;
>> +
>>  	ret = xe_wopcm_init(&uc->wopcm);
>>  	if (ret)
>>  		goto err;
>> @@ -141,6 +146,31 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>>  	return 0;
>>  }
>>  
>> +static int vf_uc_init_hw(struct xe_uc *uc)
>> +{
>> +	int err;
>> +
>> +	err = xe_uc_sanitize_reset(uc);
>> +	if (err)
>> +		return err;
>> +
>> +	err = xe_guc_enable_communication(&uc->guc);
>> +	if (err)
>> +		return err;
>> +
>> +	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>> +	if (err)
>> +		return err;
>> +
>> +	uc->guc.submission_state.enabled = true;
>> +
>> +	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>>  /*
>>   * Should be called during driver load, after every GT reset, and after every
>>   * suspend to reload / auth the firmwares.
>> @@ -153,6 +183,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>  		return 0;
>>  
>> +	if (IS_SRIOV_VF(uc_to_xe(uc)))
>> +		return vf_uc_init_hw(uc);
>> +
>>  	ret = xe_huc_upload(&uc->huc);
>>  	if (ret)
>>  		return ret;
> 
> I would expand the commit description a bit, because you mention what we should
> not do on VF, but here we also add a new vf_uc_init_hw function.

will change commit message to:

"
VF drivers can't modify WOPCM registers nor upload firmwares to
GuC, HuC or GSC.  Modify xe_uc initialization functions to skip
those steps if running in the VF mode, or defer to new custom
helper function that would not include those steps.
"

> 
> If you expand the description then LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

> 
>> -- 
>> 2.43.0
>>
> 
