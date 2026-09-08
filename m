Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF79C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320110E0DF;
	Tue,  8 Sep 2026 10:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SC/3YA5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6410E0DF
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862990; x=1820398990;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vc/J6A5IQsFpN0vxJQvqrdqovd04bT3lHpWA6Fd2HgE=;
 b=SC/3YA5OrqDkN9mFGqGHe6I2TfGkJpNTRTc0jaMwixm9M5Hg/TLCpk7K
 fAm28KuVVAVHZShwRIh0WRpOAQtFtO34Cz0yS0zAJL0DxRtzqzzCMbJD0
 qLw+EJzmesZXM2eJBK8FM7XrFv6UbGNwfW2IkF2339pk0rrDdDXQhDtU4
 stWO0EUK2Hk0t4WU0PdRp7nPEzIvmTNPMs2MMqIA5tNfuktZ5+/CuRLXX
 z9+8BYUch9It3HQA3JoRGp3NYg+CLT2yFRrfEnBnmoMY2/R4cAAnrdaNw
 vOFkNLjpXr5hrRm759gDjX0/z2eorJc0BSn8YXNgdxcS8cNycMNXE4a2Z A==;
X-CSE-ConnectionGUID: smeDwZPSSTOZLwl9jx+2uA==
X-CSE-MsgGUID: +mNnYNKsSgK5s6VTLHjnqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278588"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:23:09 -0700
X-CSE-ConnectionGUID: sxrkxbC4SQ2BvVXsU4Sccw==
X-CSE-MsgGUID: i1pM6c8aTM6YZMTUhVaf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628855"
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:23:09 -0700
Message-ID: <d60b8a9c-8a1a-4d4a-867b-ec85ca1efcfa@Intel.com>
Date: Tue, 8 Sep 2026 15:53:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/xe/hwmon: Report errors using structured xe_log
 API
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com>
 <e5a77bae-9e0f-4603-816b-35529d6c58bd@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <e5a77bae-9e0f-4603-816b-35529d6c58bd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 26-Aug-26 3:20 PM, Mallesh, Koujalagi wrote:
> 
> On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
>> Replace drm_err() calls with xe_log_err() using the HWMON component
>> tag to enable structured error reporting with SIGID for hardware
>> monitor failures:
> nit: '.' rigtht?
>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5284cab6703d..9ff351e87e5a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -15,6 +15,7 @@
>>   #include "regs/xe_pcode_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_hwmon.h"
>> +#include "xe_log.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> @@ -563,9 +564,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>>   		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
>>   		if (ret) {
>> -			drm_err(&hwmon->xe->drm,
>> -				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
>> -				channel, power_attr, reg_val, ret);
>> +			xe_log_err(hwmon->xe, HWMON, -EIO,
> Use ret as errno.
>> +				   "power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
>> +				   channel, power_attr, reg_val, ret);
> Once you pass ret as errno, no need to log it.
>>   			reg_val = 0;
>>   		}
>>   	} else {
>> @@ -1599,7 +1600,8 @@ int xe_hwmon_register(struct xe_device *xe)
>>   								&hwmon_chip_info,
>>   								hwmon_groups);
>>   	if (IS_ERR(hwmon->hwmon_dev)) {
>> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>> +		xe_log_err(xe, HWMON, -EIO,
> hmm, is -EIO correct one?  we can use PTR_ERR(hwmon->hwmon_dev) right?
>> +			   "Failed to register xe hwmon (%pe)", hwmon->hwmon_dev);
> 
> nit: Once we pass correct errno, no need to log so remove hwmon->hwmon_dev.
> 
> nit: add '\n' end of message
> 
> 
Thank you Mallesh, This is handled the in rev 2.

> Thanks,
> 
> -/Mallesh
> 
>>   		xe->hwmon = NULL;
>>   		return PTR_ERR(hwmon->hwmon_dev);
>>   	}

