Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FBEC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 09:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FC010E6E0;
	Mon, 25 Mar 2024 09:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dC6SEQle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201E710E6E0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711360343; x=1742896343;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M8joVDrC5LObjlF6j3EG8jLv2p0EexW3u8snpTkJVYQ=;
 b=dC6SEQleDMvyhXfgES2heDK+nd69AhQNYCLS2Xb2P63m3Dx8DhUleexp
 K+MWdwJKWsnaQHXEpdc9ZZYUCS3FLKLIp4QMAvDvyE0QgmHJvmaqs2zfv
 lp197+Wh15ZwrRVTo4/8RS9SlLwvNlgv69zb8yX2HbQlMNb+db1GmNI6M
 VVeNUu27U99Cg5VEA41iTWTUPA0tO6aQd58g5gZkPFYJu7orprh88rjde
 m9B3wCsVZgCeDY3m+PuV0Z77wv4VnZrBHQjaf9FFZ109EKK8x/qYfEmeW
 WyDOOtQGbBC129ehCm9cHAl5HDOUlremLMBAhqrAlZfu/Lw3yYjNK0An7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6951056"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6951056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="20241837"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:52:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, Riana Tauro
 <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Fix static analysis tool reported issues
In-Reply-To: <3c1f75ed-5f28-4fd0-8625-5611c7f95df9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
 <20240321104624.2205317-3-karthik.poosa@intel.com>
 <874jczn3io.fsf@intel.com>
 <3c1f75ed-5f28-4fd0-8625-5611c7f95df9@intel.com>
Date: Mon, 25 Mar 2024 11:52:17 +0200
Message-ID: <87bk72k59q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 22 Mar 2024, "Poosa, Karthik" <karthik.poosa@intel.com> wrote:
> Please find replies inline.
>
> On 21-03-2024 18:30, Jani Nikula wrote:
>> On Thu, 21 Mar 2024, Karthik Poosa <karthik.poosa@intel.com> wrote:
>>> Update xe hwmon with fixes for issues reported by static analysis
>>> tool.
>>> Fix integer overflow with upcasting.
>>> Initialize uninitialized variables.
>>>
>>> Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 18 +++++++++---------
>>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index a256af8c2012..6ed9d5c4f6b1 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -153,7 +153,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>>>    */
>>>   static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>>>   {
>>> -	u64 reg_val, min, max;
>>> +	u64 reg_val = 0, min, max;
>> Nah. Just fix xe_hwmon_process_reg() to set *value = 0.
> I think the caller has to ensure value is set to 0, it is not needed in 
> xe_hwmon_process_reg.

If the caller has to set the value to 0, it's a poorly defined
interface. Since xe_hwmon_process_reg() doesn't return a value
indicating an error, it better set the value to 0.

>> Side note, xe_hwmon_get_reg() should return struct xe_reg instead of
>> u32, and xe_hwmon_process_reg() has no business looking into the guts of
>> struct xe_reg.
>>
>>
>> BR,
>> Jani.
>>
> That change is not related to this patch series. It will be a major 
> change which will be handled in another patch series.

Not related to this series, thus a "side note". But the change itself is
trivial.

BR,
Jani.



>
>>>   
>>>   	mutex_lock(&hwmon->hwmon_lock);
>>>   
>>> @@ -182,7 +182,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>>>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>>   {
>>>   	int ret = 0;
>>> -	u64 reg_val;
>>> +	u64 reg_val = 0;
>>>   
>>>   	mutex_lock(&hwmon->hwmon_lock);
>>>   
>>> @@ -212,7 +212,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>>   
>>>   static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>>>   {
>>> -	u64 reg_val;
>>> +	u64 reg_val = 0;
>>>   
>>>   	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0);
>>>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>> @@ -243,7 +243,7 @@ static void
>>>   xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>>>   {
>>>   	struct xe_hwmon_energy_info *ei = &hwmon->ei;
>>> -	u64 reg_val;
>>> +	u64 reg_val = 0;
>>>   
>>>   	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
>>>   			     &reg_val, 0, 0);
>>> @@ -264,8 +264,8 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>>>   				  char *buf)
>>>   {
>>>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>> -	u32 x, y, x_w = 2; /* 2 bits */
>>> -	u64 r, tau4, out;
>>> +	u32 x = 0, y = 0, x_w = 2; /* 2 bits */
>>> +	u64 r = 0, tau4, out;
>>>   
>>>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>>>   
>>> @@ -291,7 +291,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>>>   	 * As y can be < 2, we compute tau4 = (4 | x) << y
>>>   	 * and then add 2 when doing the final right shift to account for units
>>>   	 */
>>> -	tau4 = ((1 << x_w) | x) << y;
>>> +	tau4 = (u64)((1 << x_w) | x) << y;
>>>   
>>>   	/* val in hwmon interface units (millisec) */
>>>   	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>>> @@ -331,7 +331,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>>>   	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>>>   	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>>>   	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>>> -	tau4 = ((1 << x_w) | x) << y;
>>> +	tau4 = (u64)((1 << x_w) | x) << y;
>>>   	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>>>   
>>>   	if (val > max_win)
>>> @@ -466,7 +466,7 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u3
>>>   
>>>   static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>>>   {
>>> -	u64 reg_val;
>>> +	u64 reg_val = 0;
>>>   
>>>   	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
>>>   			     REG_READ32, &reg_val, 0, 0);

-- 
Jani Nikula, Intel
