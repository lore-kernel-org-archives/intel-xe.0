Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA687C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07410E080;
	Tue, 25 Jun 2024 19:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuZ+bqjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DEF10E080
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719343735; x=1750879735;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Scd4SoVlMjdvPjK2FCWS/T0XHBRphD0Txpp2OjfPmoQ=;
 b=MuZ+bqjyh5qiMy2gBNrkmESpalLLZhlvGJMswy0DD5JMkbQu/Q5tmx2g
 uP1oZkuvfcgm+f5zHRWHiTQX2V57hdBxGkORqZj5ACzKn+Ms4ES/X8Syx
 kAT82hWko7QZxsC9ykF1zjdr7LToi0Vi4pJrai56PfZgSD3cg+xKiOxjM
 diVzoS9qgMsg8KGPcShPWb8Fb5N7HEzwO36Gm4JXdOaFeoCsxbM6WaGkB
 Rdafkx7uARb2Z2nLwkeAV+5WjR6AL1gX7wwGIOsi1e/i90feG3rWQqh5v
 Y1+yzr/f1TPi5YZuPnqwcQWoY46xkqSfExgwGC7HzNMC2K2iPZOXx4+l4 A==;
X-CSE-ConnectionGUID: Tgoge6iCRtGKAQbyz5G89Q==
X-CSE-MsgGUID: SJhfDyzSRNC/x2yCAvKD8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20195725"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20195725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:28:55 -0700
X-CSE-ConnectionGUID: 6e5RClJdSj6wjlkHKJ7noA==
X-CSE-MsgGUID: I2kwdTKGShC1ftjaZ4ypGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="81285639"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 25 Jun 2024 12:28:53 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3745F28775;
 Tue, 25 Jun 2024 20:28:51 +0100 (IST)
Message-ID: <1de772ad-3c3d-45f3-99eb-36ca395769dd@intel.com>
Date: Tue, 25 Jun 2024 21:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/pf: Trigger explicit FLR while disabling VFs
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240624205737.1213-1-michal.wajdeczko@intel.com>
 <20240624205737.1213-2-michal.wajdeczko@intel.com>
 <20240625161908.tsen6yxwqd7ib252@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240625161908.tsen6yxwqd7ib252@intel.com>
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



On 25.06.2024 18:19, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-cze-24 22:57:36 +0200]:
>> We attempt to unprovision all VFs GuC when disabling them, but
>> GuC may reject such request if the target VF was previously active
>> but VF driver didn't unload with explicit VF reset H2G action or
>> the VMM has not started the VF FLR.
>>
>> To avoid mismatches between configs maintained the PF and GuC,
>> trigger an explicit FLR sequences just before releasing resources.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 21 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
>>  drivers/gpu/drm/xe/xe_pci_sriov.c           | 14 ++++++++++++++
>>  3 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> index 40b8f881fe04..ebf06e037750 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> @@ -129,6 +129,27 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>>  	return pf_send_vf_stop(gt, vfid);
>>  }
>>  
>> +/**
>> + * xe_gt_sriov_pf_control_trigger_flr - Start a VF FLR sequence.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + *
>> + * This function is for PF only.
> 
> NIT: If I haven't missed anything, it seems to me that we don't have any
> assert to check IS_SRIOV_PF, maybe it would be worth adding it here?

we will add one once we start using PF specific data stored somewhere
under gt->sriov.pf, in the meantime we don't enforce it, as any abuse
won't be catastrophic ;)

> 
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	int err;
>> +
>> +	/* XXX pf_send_vf_flr_start() expects ct->lock */
>> +	mutex_lock(&gt->uc.guc.ct.lock);
>> +	err = pf_send_vf_flr_start(gt, vfid);
>> +	mutex_unlock(&gt->uc.guc.ct.lock);
>> +
>> +	return err;
>> +}
>> +
>>  /**
>>   * DOC: The VF FLR Flow with GuC
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
>> index 850a3e37661f..405d1586f991 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
>> @@ -14,6 +14,7 @@ struct xe_gt;
>>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
>> +int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
>>  
>>  #ifdef CONFIG_PCI_IOV
>>  int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 06d0fceb5114..74c8fadc9365 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -6,6 +6,7 @@
>>  #include "xe_assert.h"
>>  #include "xe_device.h"
>>  #include "xe_gt_sriov_pf_config.h"
>> +#include "xe_gt_sriov_pf_control.h"
>>  #include "xe_pci_sriov.h"
>>  #include "xe_pm.h"
>>  #include "xe_sriov.h"
>> @@ -37,6 +38,17 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>>  			xe_gt_sriov_pf_config_release(gt, n, true);
>>  }
>>  
>> +static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	unsigned int n;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		for (n = 1; n <= num_vfs; n++)
>> +			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>> +}
>> +
>>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  {
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -94,6 +106,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>>  
>>  	pci_disable_sriov(pdev);
>>  
>> +	pf_reset_vfs(xe, num_vfs);
>> +
>>  	pf_unprovision_vfs(xe, num_vfs);
>>  
>>  	/* not needed anymore - see pf_enable_vfs() */
> 
> 
> One comment above, but the code seems fine:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks

>> -- 
>> 2.43.0
>>
> 
