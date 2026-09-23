Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954FEC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BC610E8C8;
	Wed, 23 Sep 2026 12:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2nPO4rY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596F10E8C8;
 Wed, 23 Sep 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790168035; x=1821704035;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/jE7BUfpMBQttipzqBDLcpmemFm4Qibh8pmc+cjyIoI=;
 b=h2nPO4rYeWZRfOq+1J8Q2oF4DpcueeAVme5DgS6pxQo+9EeCzGgjCObM
 YE2TxSWwiFb6N30/LwT50pYEKAzrbcfh7e81/7ny/7pXRlkbzh5M7Cf/i
 6iEluvzsuVIgQVPtY0FUDKt9LKAdsH+EoFI65SXlRTxA5SuIH3W9Zrz9r
 CF2T10AGDXu06tH9s+MOF00YDZvpBcDllETou1AnuCbVnPhjf8JmukgCp
 x+/5+DtAyuubVeyWCzDFAIg7fGYwAfrb8jmFjGXVyFaZJ/LI6oNcgg5gb
 oBPwx6FcZYlQh3xZjLBNqIQdjAgJmfjMyIIulvrYa9Hx3k6lO8GPWkEz7 Q==;
X-CSE-ConnectionGUID: uf92w7F/TvCeT9UJihCy6A==
X-CSE-MsgGUID: PHgqBuI3Rd++IVEoYIusZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1375812"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1375812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:53:55 -0700
X-CSE-ConnectionGUID: DJXdHyqrQRWyJLP1/vdMwg==
X-CSE-MsgGUID: 14cE6eQqRROfhtsnXiX5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="270112980"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:53:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/4] drm/{i915,xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
In-Reply-To: <arO17C67JhscLp1j@ideak-desk.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1790089118.git.jani.nikula@intel.com>
 <050b935fa3fd85101ea0241b60a2e7893d3ad546.1790089118.git.jani.nikula@intel.com>
 <arO17C67JhscLp1j@ideak-desk.lan>
Date: Wed, 23 Sep 2026 15:53:50 +0300
Message-ID: <1906729d97e71a4604ffe765ad9db0e4bba4930b@intel.com>
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

On Wed, 23 Sep 2026, Imre Deak <imre.deak@intel.com> wrote:
> On Tue, Sep 22, 2026 at 06:00:50PM +0300, Jani Nikula wrote:
>> Try to unify the suspend paths and behaviour by moving the
>> intel_opregion_suspend() calls to
>> intel_display_driver_pm_suspend_late().
>> 
>> This is a change in the suspend sequences. The idea behind adding this
>> to intel_display_driver_pm_suspend_late() is primarily based on not
>> having to pass the s2idle parameter to more functions than that.
>
> Imo the main reason is that it should be called with interrupts
> disabled. At least not sure how cancel_work_sync(asle_work) could work
> otherwise.
>
>> This also changes behaviour for i915 hibernation, going for PCI_D3cold
>> instead of PCI_D1 on hibernate. It's probably the correct thing to do
>> anyway, I don't think it should matter all that much, but fingers
>> crossed.
>
> I think it is PCI_D3cold for i915 already before this patch, since
> acpi_target_system_state() is ACPI_STATE_S4 in that case. If so, the
> hibernation param from i915_drm_suspend_late() could be also removed.
> But need to check this more to be sure.

I think Ville mentioned something similar in the past, but when I tried
to track this in the source I just couldn't be certain at all. :/

>
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
>>  drivers/gpu/drm/xe/display/xe_display.c             | 3 ---
>>  3 files changed, 2 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> index 77009dca7d0d..abab457bce3a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> @@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2
>>  	if (!HAS_DISPLAY(display))
>>  		return;
>>  
>> +	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>
> This leaves intel_opregion_resume() called from
> intel_display_driver_pm_resume() in an assymetric way, but I suppose
> that could be addressed later:
>
> Reviewed-by: Imre Deak <imre.deak@intel.com>
>
>> +
>>  	intel_display_power_suspend_late(display, s2idle);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 9e047c27a153..293099fe6639 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -1075,7 +1075,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>>  {
>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>>  	struct intel_display *display = dev_priv->display;
>> -	pci_power_t opregion_target_state;
>>  
>>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>  
>> @@ -1089,9 +1088,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>>  
>>  	i9xx_display_sr_save(display);
>>  
>> -	opregion_target_state = suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3cold;
>> -	intel_opregion_suspend(display, opregion_target_state);
>> -
>>  	dev_priv->suspend_count++;
>>  
>>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 184a5a237880..b013ec00b75d 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -246,14 +246,11 @@ static bool suspend_to_idle(void)
>>  void xe_display_pm_suspend(struct xe_device *xe)
>>  {
>>  	struct intel_display *display = xe->display;
>> -	bool s2idle = suspend_to_idle();
>>  
>>  	if (!xe->info.probe_display)
>>  		return;
>>  
>>  	intel_display_driver_pm_suspend(display);
>> -
>> -	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>>  }
>>  
>>  void xe_display_pm_suspend_late(struct xe_device *xe)
>> -- 
>> 2.47.3
>> 

-- 
Jani Nikula, Intel
