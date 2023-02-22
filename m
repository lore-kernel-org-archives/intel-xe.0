Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CB7C6379F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 12:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0B310E02F;
	Wed, 22 Feb 2023 12:02:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CFB10E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677067357; x=1708603357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qEnS1Lr7rfUPuQ0tJydNwPoGLzUwcJOgmXPhLMWwE8I=;
 b=bNk6us77tDeIK3P/vjpiitTDq+tburGI1zOF4yEPiblzxFPguQLiy+3q
 ucTBWDsiK2iugfOQh/JgWldha+UdVQ3JRdyBfLt8Vb7J3i3LMRxTEasiQ
 n3dncvZhH7t+hRAnAsVWdcCVNug+Gv52H4cPmZujOpgWx+3RtKIjWgUQk
 HU6n0pj4oUbBhg7GqH0T+EMukHAe07Ejag/vxZdG/YzjgPh6su/okwG0S
 H8E4ZlwBPl+QMOy+CinemGQcLuYSGYkxLk5nrBIRMTXRH8a2vJyaIVBjA
 7g5N2hBc3D0izLcXUtylXv1NzOUPGEMYL5pqWK9O2L3W3GD1GLPEGHIvD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="331574820"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="331574820"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 04:02:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702377339"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="702377339"
Received: from sineadmc-mobl2.ger.corp.intel.com (HELO [10.252.9.91])
 ([10.252.9.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 04:02:00 -0800
Message-ID: <6982ab79-6fb5-c2c1-7235-af6fe125d4e8@intel.com>
Date: Wed, 22 Feb 2023 12:01:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230221145221.105361-1-matthew.auld@intel.com>
 <20230221211649.novuq4b7ur2qlrs3@ldmartin-desk2.jf.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230221211649.novuq4b7ur2qlrs3@ldmartin-desk2.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: give the core kernel its rpm ref
 back
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 21/02/2023 21:16, Lucas De Marchi wrote:
> On Tue, Feb 21, 2023 at 02:52:21PM +0000, Matthew Auld wrote:
>> In local_pci_probe() the core kernel increments the rpm for the device,
>> just before calling into the probe hook. If the driver/device supports
>> runtime pm it is then meant to drop this ref during probe (like we do in
> 
> s/drop/put/ to be consistent with the terminology?
> 
>> xe_pm_runtime_init()). However when removing the device we then also need
>> to give the reference back, otherwise the ref that is dropped in
> 
> give? we are calling pm_runtime_get_sync(), which  would be "take".
> 
>> pci_device_remove() will be unbalanced when for example unloading the
>> driver, leading to warnings like:
>>
>>    [ 3808.596345] xe 0000:03:00.0: Runtime PM usage count underflow!
>>
>> Fix this by incrementing the rpm ref when removing the device.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/193
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pci.c | 1 +
>> drivers/gpu/drm/xe/xe_pm.c  | 7 +++++++
>> drivers/gpu/drm/xe/xe_pm.h  | 1 +
>> 3 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 25598de3a1fc..85d337cd8fbe 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -441,6 +441,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>         return;
>>
>>     xe_device_remove(xe);
>> +    xe_pm_runtime_fini(xe);
> 
> after xe_device_remove()? Wouldn't that end up calling the last
> drm_dev_put() and thus triggering all the drmm_* releases?

In __device_release_driver() it will call device_remove() first, which 
eventually calls our xe_pci_remove() hook. A little further down it then 
calls device_unbind_cleanup(), which in turn calls devres_release_all(), 
which eventually calls into drm_managed_release() and handles all the 
drmm_* stuff, AFAICT.

> 
> Lucas De Marchi
> 
>>     pci_set_drvdata(pdev, NULL);
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 44c38e670587..73d81621d960 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -128,6 +128,13 @@ void xe_pm_runtime_init(struct xe_device *xe)
>>     pm_runtime_put_autosuspend(dev);
>> }
>>
>> +void xe_pm_runtime_fini(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +
>> +    pm_runtime_get_sync(dev);
>> +}
>> +
>> int xe_pm_runtime_suspend(struct xe_device *xe)
>> {
>>     struct xe_gt *gt;
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index b8c5f9558e26..6a885585f653 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
>> int xe_pm_resume(struct xe_device *xe);
>>
>> void xe_pm_runtime_init(struct xe_device *xe);
>> +void xe_pm_runtime_fini(struct xe_device *xe);
>> int xe_pm_runtime_suspend(struct xe_device *xe);
>> int xe_pm_runtime_resume(struct xe_device *xe);
>> int xe_pm_runtime_get(struct xe_device *xe);
>> -- 
>> 2.39.1
>>
