Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A56BC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE5710E92C;
	Thu,  1 Aug 2024 20:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btj/Gvuq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3758E10E92C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722545712; x=1754081712;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K4EANNc1QU7j7oVkVNMnbNjBNLn4pns3MClxe8qJcYk=;
 b=btj/GvuqviR3UgL3hz+xoDTNoLIEoXo9b9ZUWzrutwyCCgCoQ7BAdC01
 fbLi3EZtzHDF1hoY3DTD/YC0U0d7rFhuJQeXqpGNAc+GXsYVgXzl5G9FP
 ZluWat+wxhvgKL1wUwCV9Wcvp0l7x0SE554ro8vUURksZDdALCSPDvqFL
 56klO4eYYPeb0RZqeUr4mxjyBJzD2X3rVJeHd/u3SKuZ+ZxKRgoSbuJ4/
 o1Y0VL+ghPiGTtnNDbEYLBeb0pP+L0aUI/5rg3ARv4SliTqATQxM0F7QE
 rLtfjICB++CW0U3OzprlYoG4xkKSfnhRY5G0TdAnWHrHowGESsOvuoBR3 w==;
X-CSE-ConnectionGUID: btITCVLKS+W3X8yQSMjIpw==
X-CSE-MsgGUID: 7QbxH11EQ9akvXGufrngMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23452284"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="23452284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:55:11 -0700
X-CSE-ConnectionGUID: wp1nvVipRMqMvLb4Rmk7ng==
X-CSE-MsgGUID: KhCBAlIoTx6UFMuvBzR5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60200830"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 13:55:09 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 10D9E312D5;
 Thu,  1 Aug 2024 21:55:07 +0100 (IST)
Message-ID: <3659cc23-7860-42d0-9c63-5a86edc6da25@intel.com>
Date: Thu, 1 Aug 2024 22:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe: remove GuC reload in D3Hot path
To: Matthew Brost <matthew.brost@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 karthik.poosa@intel.com
References: <20240801055941.1187878-1-riana.tauro@intel.com>
 <20240801055941.1187878-3-riana.tauro@intel.com>
 <ZqvzU2rYPy4Citg+@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZqvzU2rYPy4Citg+@DUT025-TGLU.fm.intel.com>
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



On 01.08.2024 22:42, Matthew Brost wrote:
> On Thu, Aug 01, 2024 at 11:29:41AM +0530, Riana Tauro wrote:
>> Currently GuC is reloaded for both runtime resume and system resume.
>> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
>> is not necessary.
>>
>> Remove GuC reload from D3Hot path and only enable/disable CTB
>> communication.
>>
>> v2: rebase
>>
>> v3: fix commit message
>>     add kernel-doc for gt suspend and resume methods
>>     fix comment
>>     do not split register and enable calls of CT (Michal)
>>
>> v4: fix commit message
>>     fix comment (Karthik)
>>     split patches
>>     correct kernel-doc (Rodrigo)
>>
>> v5: do not expose internal function of CT layer (Michal)
>>     remove wait for outstanding g2h as it will be always zero,
>>     use assert instead (Matthew Brost)
>>     use runtime suspend and runtime resume pair for CT layer
>>     (Michal / Matthew Brost)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++++----
>>  drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
>>  drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 31 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
>>  drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
>>  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>>  9 files changed, 131 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 58895ed22f6e..e0b13dc7663b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>  }
>>  
>> -int xe_gt_suspend(struct xe_gt *gt)
>> +/**
>> + * xe_gt_suspend - GT suspend helper
>> + * @gt: GT object
>> + * @runtime: true if this is from runtime suspend
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>>  {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>  	int err;
>>  
>>  	xe_gt_dbg(gt, "suspending\n");
>> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_msg;
>>  
>> -	err = xe_uc_suspend(&gt->uc);
>> +	if (runtime && !xe->d3cold.allowed)
>> +		err = xe_uc_runtime_suspend(&gt->uc);
>> +	else
>> +		err = xe_uc_suspend(&gt->uc);
>> +
>>  	if (err)
>>  		goto err_force_wake;
>>  
>> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>  	return ret;
>>  }
>>  
>> -int xe_gt_resume(struct xe_gt *gt)
>> +/**
>> + * xe_gt_resume - GT resume helper
>> + * @gt: GT object
>> + * @runtime: true if called on runtime resume
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>>  {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>  	int err;
>>  
>>  	xe_gt_dbg(gt, "resuming\n");
>> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_msg;
>>  
>> -	err = do_gt_restart(gt);
>> +	/* GuC is still alive at D3hot, no need to reload it */
>> +	if (runtime && !xe->d3cold.allowed)
>> +		xe_uc_runtime_resume(&gt->uc);
>> +	else
>> +		err = do_gt_restart(gt);
>> +
>>  	if (err)
>>  		goto err_force_wake;
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 8b1a5027dcf2..21f27ca23b67 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>  void xe_gt_record_user_engines(struct xe_gt *gt);
>>  
>>  void xe_gt_suspend_prepare(struct xe_gt *gt);
>> -int xe_gt_suspend(struct xe_gt *gt);
>> -int xe_gt_resume(struct xe_gt *gt);
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>  void xe_gt_reset_async(struct xe_gt *gt);
>>  void xe_gt_sanitize(struct xe_gt *gt);
>>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1ff49318f001..e1923a00a9f6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -881,6 +881,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>>  
>>  	if (register_ctb)
>>  		err = xe_guc_ct_enable(&guc->ct);
>> +	else
>> +		xe_guc_ct_runtime_resume(&guc->ct);
>>  
>>  	if (err)
>>  		return err;
>> @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>  	guc->submission_state.enabled = false;
>>  }
>>  
>> +/**
>> + * xe_guc_runtime_suspend - GuC runtime suspend
>> + * @guc: GuC object
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>> +{
>> +	return xe_guc_ct_runtime_suspend(&guc->ct);
>> +}
>> +
>> +/**
>> + * xe_guc_runtime_resume - GuC runtime resume
>> + * @guc: GuC object
>> + *
>> + * This function enables GuC CTB communication
>> + */
>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>> +{
>> +	/*
>> +	 * Power is not lost when in D3Hot state,
>> +	 * hence it is not necessary to reload GuC
>> +	 * everytime. Only enable interrupts and
>> +	 * CTB communication during resume
>> +	 */
>> +	xe_guc_enable_communication(guc, false);
>> +}
>> +
>>  int xe_guc_reset_prepare(struct xe_guc *guc)
>>  {
>>  	return xe_guc_submit_reset_prepare(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 13e75573f7d0..ddc87798e176 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>  int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>>  int xe_guc_suspend(struct xe_guc *guc);
>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>  void xe_guc_notify(struct xe_guc *guc);
>>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index beeeb120d1fc..9e42c5d29971 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -419,6 +419,37 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>  	return err;
>>  }
>>  
>> +/**
>> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
>> + * @ct: the &xe_guc_ct
>> + *
>> + * Mark GuC CT as enabled on runtime resume
>> + */
>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>> +{
> 
> I'd assert here g2h head and tail are equal in memory to ensure we know
> we are doing with the PM as we shouldn't have any g2h on runtime resume
> if we have the PM correct. If they are unequal, this isn't fatal just
> kick the g2h handler.
> 
>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>> +}
>> +
>> +/**
>> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
>> + * @ct: the &xe_guc_ct
>> + *
>> + * Mark GuC CT as disabled on runtime suspend
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>> +{
> 
> Nit, I'd write it like this:
> 
> xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
> if (ct->g2h_outstanding)
> 	return -EBUSY;

IMO neither option is good as xe_assert() is not to be used where you
plan to use fallback path [1] you may want to use xe_gt_WARN_ON instead

Michal

[1] https://docs.kernel.org/gpu/xe/xe_debugging.html

> 
> Matt
> 
>> +	if (ct->g2h_outstanding) {
>> +		xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
>> +		return -EBUSY;
>> +	}
>> +
>> +	xe_guc_ct_disable(ct);
>> +
>> +	return 0;
>> +}
>> +
>>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>>  {
>>  	cancel_work_sync(&ct->g2h_worker);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 190202fce2d0..0cf9d77feb35 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>  
>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>> +
>>  struct xe_guc_ct_snapshot *
>>  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9f3c14fd9f33..c73a728a7450 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>  	xe_display_pm_suspend(xe, false);
>>  
>>  	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, false);
>>  		if (err) {
>>  			xe_display_pm_resume(xe, false);
>>  			goto err;
>> @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
>>  	xe_display_pm_resume(xe, false);
>>  
>>  	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, false);
>>  
>>  	err = xe_bo_restore_user(xe);
>>  	if (err)
>> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>  	}
>>  
>>  	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, true);
>>  		if (err)
>>  			goto out;
>>  	}
>> @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>  	xe_irq_resume(xe);
>>  
>>  	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, true);
>>  
>>  	if (xe->d3cold.allowed) {
>>  		xe_display_pm_resume(xe, true);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index fa98e9f22631..8e535153cc62 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>  	return xe_guc_suspend(&uc->guc);
>>  }
>>  
>> +/**
>> + * xe_uc_runtime_suspend - uC runtime suspend
>> + * @uc: uC object
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>> +{
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	return xe_guc_runtime_suspend(&uc->guc);
>> +}
>> +
>> +/**
>> + * xe_uc_runtime_resume - uC runtime resume
>> + * @uc: uC object
>> + *
>> + * Called while resuming from D3Hot
>> + */
>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>> +{
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return;
>> +
>> +	xe_guc_runtime_resume(&uc->guc);
>> +}
>> +
>>  /**
>>   * xe_uc_remove() - Clean up the UC structures before driver removal
>>   * @uc: the UC object
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 506517c11333..1e223d67086a 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>  int xe_uc_fini_hw(struct xe_uc *uc);
>>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>>  int xe_uc_reset_prepare(struct xe_uc *uc);
>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>  void xe_uc_stop_prepare(struct xe_uc *uc);
>>  void xe_uc_stop(struct xe_uc *uc);
>>  int xe_uc_start(struct xe_uc *uc);
>> -- 
>> 2.40.0
>>
