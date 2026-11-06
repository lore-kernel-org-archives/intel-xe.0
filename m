Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C2606A33D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+YBeHic
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4399112CCF;
	Fri,  6 Nov 2026 11:02:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD98112CCF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793962969; x=1825498969;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TeQQ8d/cDmDS+NiVol3TlFKaVhLxp55hVQp4TgbNzAM=;
 b=B+YBeHicoAYYaB5eP5CMCxtWcomi8eiGtsW8RfnjbCSebmy+SRkWHYTk
 L/G7pSZsZcWP+NGeFPrVfiKcBdj17L39mMd4/mA28AGSRrdavXlCnYJtA
 YYARLEXhUONeqQH1YrWXSZE3U8BNsidnu/biDIcqTM4TyAJ7YR8V9Kvrb
 7dipOXTlaRbih/7RfKyOKvstVP3CFU7PdrNGe4PEKqa0erNHF5ZGSaknm
 4FIrMXU9vZb3jMMgy5uezzWNTmSMM8juPPGvy9uqM9PGqXNrgvwkDprdo
 1g6p+vyDcXbZjmQ9Es/PoGnV614c3e25vwpB7TbTS5+4N1w+3nHbrXXot w==;
X-CSE-ConnectionGUID: GR1oGgYmSPK4KiiLIfKmgw==
X-CSE-MsgGUID: dtQrTGwlSx2vNNpanYRzKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659000"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:02:48 -0800
X-CSE-ConnectionGUID: c+68/GceTTe/5bnGRFqU/Q==
X-CSE-MsgGUID: 7qZvZm+WSnibhf6hjFPHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7136714"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.124])
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:02:47 -0800
Message-ID: <3e14de74-7640-4927-b4d6-0dac91ffe627@intel.com>
Date: Fri, 6 Nov 2026 11:02:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pm: skip BO eviction on iGPU for
 non-hibernation sleep
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
 <20261106-s4-opti-v1-2-5edaea2c6d31@intel.com>
 <b34f93a9f8901f787b030f275d7708f4334b4360.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <b34f93a9f8901f787b030f275d7708f4334b4360.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,

On 06/11/2026 10:32, Thomas Hellström wrote:
> Hi, Matthew,
> 
> On Fri, 2026-11-06 at 10:16 +0000, Matthew Auld wrote:
>> On iGPU platforms, system RAM and graphics stolen memory remain
>> powered
>> during S2idle and S3 (< S4) suspend, so evicting user buffers or
>> preparing pinned BOs is unnecessary and needlessly purges DONTNEED
>> buffers in userspace caches.
>>
>> Distinguish S4 hibernation (.freeze and PM_HIBERNATION_PREPARE) from
>> < S4 suspend (.suspend and PM_SUSPEND_PREPARE), and skip BO eviction
>> on
>> iGPU when not creating a hibernation image.
> 
> Isn't there a risk that compression metadata is lost or cleared on S3
> resume if we don't back it up?

In theory it just lives in RAM which will self-refresh in s3 etc. In the 
xe2+ memory compression SAS, it explicitly says: "During S4, CCS pool 
will be lost", but for s3 etc it should "persist".

> 
> Thanks,
> Thomas
> 
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Carlos Santa <carlos.santa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pm.c  | 26 ++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_pm.h  |  2 +-
>>   3 files changed, 39 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> b/drivers/gpu/drm/xe/xe_pci.c
>> index ba23ec60477b..67be6e707361 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1335,7 +1335,7 @@ static void d3cold_toggle(struct pci_dev *pdev,
>> enum toggle_d3cold toggle)
>>   	}
>>   }
>>   
>> -static int xe_pci_suspend(struct device *dev)
>> +static int __xe_pci_suspend(struct device *dev, bool hibernate)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> @@ -1344,7 +1344,7 @@ static int xe_pci_suspend(struct device *dev)
>>   	if (xe_survivability_mode_is_boot_enabled(xe))
>>   		return -EBUSY;
>>   
>> -	err = xe_pm_suspend(xe);
>> +	err = xe_pm_suspend(xe, hibernate);
>>   	if (err)
>>   		return err;
>>   
>> @@ -1362,6 +1362,16 @@ static int xe_pci_suspend(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int xe_pci_suspend(struct device *dev)
>> +{
>> +	return __xe_pci_suspend(dev, false);
>> +}
>> +
>> +static int xe_pci_freeze(struct device *dev)
>> +{
>> +	return __xe_pci_suspend(dev, true);
>> +}
>> +
>>   static int xe_pci_resume(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>> @@ -1491,7 +1501,12 @@ static int xe_pci_runtime_idle(struct device
>> *dev)
>>   }
>>   
>>   static const struct dev_pm_ops xe_pm_ops = {
>> -	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
>> +	.suspend = pm_sleep_ptr(xe_pci_suspend),
>> +	.resume = pm_sleep_ptr(xe_pci_resume),
>> +	.freeze = pm_sleep_ptr(xe_pci_freeze),
>> +	.thaw = pm_sleep_ptr(xe_pci_resume),
>> +	.poweroff = pm_sleep_ptr(xe_pci_suspend),
>> +	.restore = pm_sleep_ptr(xe_pci_resume),
>>   	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend,
>> xe_pci_runtime_resume, xe_pci_runtime_idle)
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 61d68c09189f..e73192b03074 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -166,13 +166,19 @@ static void xe_rpm_lockmap_release(const struct
>> xe_device *xe)
>>   			 &xe_pm_runtime_d3cold_map);
>>   }
>>   
>> +static bool xe_pm_needs_bo_evict(struct xe_device *xe, bool
>> hibernate)
>> +{
>> +	return IS_DGFX(xe) || hibernate;
>> +}
>> +
>>   /**
>> - * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
>>> S2idle
>> + * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
>>> S2idle / S0->S4
>>    * @xe: xe device instance
>> + * @hibernate: true if preparing for S4 hibernation, false for < S4
>> suspend
>>    *
>>    * Return: 0 on success
>>    */
>> -int xe_pm_suspend(struct xe_device *xe)
>> +int xe_pm_suspend(struct xe_device *xe, bool hibernate)
>>   {
>>   	struct xe_gt *gt;
>>   	u8 id;
>> @@ -193,10 +199,12 @@ int xe_pm_suspend(struct xe_device *xe)
>>   
>>   	xe_display_pm_suspend(xe);
>>   
>> -	/* FIXME: Super racey... */
>> -	err = xe_bo_evict_all(xe);
>> -	if (err)
>> -		goto err_display;
>> +	if (xe_pm_needs_bo_evict(xe, hibernate)) {
>> +		/* FIXME: Super racey... */
>> +		err = xe_bo_evict_all(xe);
>> +		if (err)
>> +			goto err_display;
>> +	}
>>   
>>   	for_each_gt(gt, xe, id) {
>>   		err = xe_gt_suspend(gt);
>> @@ -461,6 +469,9 @@ static int xe_pm_notifier_callback(struct
>> notifier_block *nb,
>>   		struct xe_validation_ctx ctx;
>>   
>>   		reinit_completion(&xe->pm_block);
>> +		if (!xe_pm_needs_bo_evict(xe, action ==
>> PM_HIBERNATION_PREPARE))
>> +			break;
>> +
>>   		xe_pm_block_begin_signalling();
>>   		xe_pm_runtime_get(xe);
>>   		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
>> @@ -485,6 +496,9 @@ static int xe_pm_notifier_callback(struct
>> notifier_block *nb,
>>   	case PM_POST_SUSPEND:
>>   		complete_all(&xe->pm_block);
>>   		xe_pm_wake_rebind_workers(xe);
>> +		if (!xe_pm_needs_bo_evict(xe, action ==
>> PM_POST_HIBERNATION))
>> +			break;
>> +
>>   		xe_bo_notifier_unprepare_all_pinned(xe);
>>   		xe_pm_runtime_put(xe);
>>   		break;
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 16d4e6c629f1..af81f2a2975f 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -13,7 +13,7 @@
>>   
>>   struct xe_device;
>>   
>> -int xe_pm_suspend(struct xe_device *xe);
>> +int xe_pm_suspend(struct xe_device *xe, bool hibernate);
>>   int xe_pm_resume(struct xe_device *xe);
>>   
>>   int xe_pm_init_early(struct xe_device *xe);

