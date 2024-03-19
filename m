Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219D0C54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99F910F1AC;
	Tue, 19 Mar 2024 17:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bqkp1/jH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E1B10FC0B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710867929; x=1742403929;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LnF5KAWTX6RRXAFMkNtfiZfnSbMV7AXJ9fs4drKSotk=;
 b=Bqkp1/jH/AxOUTLjz9ALot+XVu+Te94/GCz9Ndf/JlKeOfBItEhr8sDP
 aawEst7oJhCJ4UVMfrY4YMXRKOYzidPrWvr2xi3XcWZpqHBY6gESDPMuc
 JIlFEzj1vQsHwM5zcqlDreiHeFL/2SYrtX9asupgMYbZ7NIY85DePDeDz
 QpEF/tM8txez0GPEOg/Kp/3O5QO0i4v/wi3f45jii/PrrUBIg49QTBUUK
 IpqAE76sf7fQidvQQhniX12rYg1iGubh2djFC+Pb5xRl9xXocS2eUAWNt
 M20f8jO3hg/mVycTGNdwdXxd4qgmeFD77IQF7rDvfZ2xENBWmzBhIWQ7/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="28230833"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="28230833"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13962723"
Received: from unknown (HELO [10.245.245.25]) ([10.245.245.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:05:23 -0700
Message-ID: <a1273d6b-a594-4545-8315-bb9df7a41331@intel.com>
Date: Tue, 19 Mar 2024 17:05:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add dbg messages on the suspend resume
 functions.
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, francois.dugast@intel.com
References: <20240318180141.267458-1-rodrigo.vivi@intel.com>
 <20240318180141.267458-2-rodrigo.vivi@intel.com>
 <8f2a95fa-2acc-46ba-8618-c7e784f69d25@intel.com> <ZfiajmWtdxG0COvx@intel.com>
 <7716487d-be0b-4e65-b506-63ba17318955@intel.com> <Zfmf0itERZZWtznc@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zfmf0itERZZWtznc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 19/03/2024 14:23, Rodrigo Vivi wrote:
> On Tue, Mar 19, 2024 at 09:38:53AM +0000, Matthew Auld wrote:
>> On 18/03/2024 19:48, Rodrigo Vivi wrote:
>>> On Mon, Mar 18, 2024 at 06:12:44PM +0000, Matthew Auld wrote:
>>>> On 18/03/2024 18:01, Rodrigo Vivi wrote:
>>>>> In case of the suspend/resume flow getting locked up we
>>>>> can get reports with some useful hints on where it might
>>>>> get locked and if that has failed.
>>>>>
>>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>
>>>> Makes sense. What about maybe also adding that to the rpm versions? Those
>>>> can also be fun, and so would be useful to get hints when inside the
>>>> callbacks.
>>>
>>> I'm planning to get that on RPM next... just was trying to avoid
>>> conflicting with myself ;)
>>> The bug that I'm targeting with this right now is a suspend to memory.
>>
>> Ok, sounds good.
>>
>>>
>>> And I was afraid that someone might complain about verbosity in the rpm
>>> path on cases where gnome-shell keeps doing some ioctl and waking up
>>> the device.
>>
>> If that is a concern, I think for rpm we also trigger (per gt):
>>
>> xe_gt_dbg(gt, "suspending\n");
>> ....
>> xe_gt_dbg(gt, "suspended\n");
>>
>> Which would also be quite verbose?
> 
> yeap, let's see how it goes... at least it is a debug now and not a info
> 
>>
>>>
>>>>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_pm.c | 22 +++++++++++++++++-----
>>>>>     1 file changed, 17 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>>> index 9fbb6f6c598a..cc650a92c2fc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>>> @@ -80,13 +80,15 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>>     	u8 id;
>>>>>     	int err;
>>>>> +	drm_dbg(&xe->drm, "Suspending device\n");
>>
>> New line between declarations? Below also.
> 
> well, the line is there... not sure why it is not showing up
> here in your reply...
> 
> But after applying with b4 from this thread I see
> 
> 	int err;
> 
> 	drm_dbg(&xe->drm, "Suspending device\n");
> 
>          for_each_gt(gt, xe, id)
> 
> I don't believe we need any extra, nor less...
> 
> below also:
> 
> 	int err;
> 
>          drm_dbg(&xe->drm, "Resuming device\n");
> 
>          for_each_tile(tile, xe, id)

Ok, not sure what happened here. Sorry for the noise.

> 
>>
>> Otherwise,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>>>> +
>>>>>     	for_each_gt(gt, xe, id)
>>>>>     		xe_gt_suspend_prepare(gt);
>>>>>     	/* FIXME: Super racey... */
>>>>>     	err = xe_bo_evict_all(xe);
>>>>>     	if (err)
>>>>> -		return err;
>>>>> +		goto err;
>>>>>     	xe_display_pm_suspend(xe);
>>>>> @@ -94,7 +96,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>>     		err = xe_gt_suspend(gt);
>>>>>     		if (err) {
>>>>>     			xe_display_pm_resume(xe);
>>>>> -			return err;
>>>>> +			goto err;
>>>>>     		}
>>>>>     	}
>>>>> @@ -102,7 +104,11 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>>     	xe_display_pm_suspend_late(xe);
>>>>> +	drm_dbg(&xe->drm, "Device suspended\n");
>>>>>     	return 0;
>>>>> +err:
>>>>> +	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>>>>> +	return err;
>>>>>     }
>>>>>     /**
>>>>> @@ -118,13 +124,15 @@ int xe_pm_resume(struct xe_device *xe)
>>>>>     	u8 id;
>>>>>     	int err;
>>>>> +	drm_dbg(&xe->drm, "Resuming device\n");
>>>>> +
>>>>>     	for_each_tile(tile, xe, id)
>>>>>     		xe_wa_apply_tile_workarounds(tile);
>>>>>     	for_each_gt(gt, xe, id) {
>>>>>     		err = xe_pcode_init(gt);
>>>>>     		if (err)
>>>>> -			return err;
>>>>> +			goto err;
>>>>>     	}
>>>>>     	xe_display_pm_resume_early(xe);
>>>>> @@ -135,7 +143,7 @@ int xe_pm_resume(struct xe_device *xe)
>>>>>     	 */
>>>>>     	err = xe_bo_restore_kernel(xe);
>>>>>     	if (err)
>>>>> -		return err;
>>>>> +		goto err;
>>>>>     	xe_irq_resume(xe);
>>>>> @@ -146,9 +154,13 @@ int xe_pm_resume(struct xe_device *xe)
>>>>>     	err = xe_bo_restore_user(xe);
>>>>>     	if (err)
>>>>> -		return err;
>>>>> +		goto err;
>>>>> +	drm_dbg(&xe->drm, "Device resumed\n");
>>>>>     	return 0;
>>>>> +err:
>>>>> +	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
>>>>> +	return err;
>>>>>     }
>>>>>     static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
