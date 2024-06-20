Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B082C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D234B10E2D1;
	Thu, 20 Jun 2024 10:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRcPW1wI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470910E2D1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718877935; x=1750413935;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+W9N9HpC0ksuVUX5xJUOlUn/1OImxt2EaDdLr9dw7MQ=;
 b=eRcPW1wIsh8za7MoKqIAVcwOtR61VjXWYlrtDRZ/oVEtBjq5F2Ob694W
 lKJRyq2jqiyJe7CKnxq5O3sC5tw5WjUF8qsxGfxbuZ+JUBGBx+ayDY6Mg
 SIEIjJwydujk0Y/SduPPAWaYRY+HNKD6YhfxCYe14Ll064gtktrAuR+4R
 XQUni3q2OGre0/g+1iSrU9itSZvO/ZLcI5JVQt3EBUZvfYbvtkB0fcC0q
 lZLISnrD4t9+E4srkqMNzRmyppBGm/pChdIjqT2jma5xITUoSvjeG4vyM
 /O+Aw0Vdrz+PdMxkeGdrTfvLkPoslUFlaTPeDnz5mdpj+Lnyp9EleoGQK w==;
X-CSE-ConnectionGUID: wLHh9GivRpmR61n5h195yA==
X-CSE-MsgGUID: I7XtIiCQSTC5yUTXi51d9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15964096"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15964096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:05:34 -0700
X-CSE-ConnectionGUID: fr6cMyJmStaPsRxl91x2lg==
X-CSE-MsgGUID: HfCZdwcNT1Sl5YHueGXxdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="47102013"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 20 Jun 2024 03:05:33 -0700
Received: from [10.246.49.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.49.231])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4520B312C4;
 Thu, 20 Jun 2024 11:05:30 +0100 (IST)
Message-ID: <55585266-4b61-48c0-a5e3-25f12822ec17@intel.com>
Date: Thu, 20 Jun 2024 12:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/xe/vf: Disable features that do not apply to VFs
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-2-michal.wajdeczko@intel.com>
 <20240620091741.gbbfelgvbeoabjbd@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240620091741.gbbfelgvbeoabjbd@intel.com>
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



On 20.06.2024 11:17, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:49 +0200]:
>> We already maintain several flags that control the availability
>> of features on a given device. Disable features, like PCODE or
>> GuC PC or GSC, that do not apply to a VF device.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 75d4c8ae9234..603e85da5748 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -486,6 +486,16 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>>  	return 0;
>>  }
>>  
>> +static void update_device_info(struct xe_device *xe)
>> +{
>> +	/* disable features that are not available/applicable to VFs */
>> +	if (IS_SRIOV_VF(xe)) {
>> +		xe->info.has_heci_gscfi = 0;
>> +		xe->info.skip_guc_pc = 1;
>> +		xe->info.skip_pcode = 1;
>> +	}
> I have no objection to the current modifications of device_info on VF,
> but it seems to me that the setting of has_diplay to false is missing here,
> as VF does not support it.

thanks for catching this, as I missed due to my CONFIG_DRM_XE_DISPLAY=n

> 
> Thanks,
> Piotr
> 
>> +}
>> +
>>  /**
>>   * xe_device_probe_early: Device early probe
>>   * @xe: xe device instance
>> @@ -506,6 +516,8 @@ int xe_device_probe_early(struct xe_device *xe)
>>  
>>  	xe_sriov_probe_early(xe);
>>  
>> +	update_device_info(xe);
>> +
>>  	err = xe_pcode_probe_early(xe);
>>  	if (err)
>>  		return err;
> 
>> -- 
>> 2.43.0
>>
> 
