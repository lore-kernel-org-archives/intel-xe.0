Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1857C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 20:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16210E9FC;
	Fri,  9 Aug 2024 20:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqXpps+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0FE10E9FB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723234073; x=1754770073;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ho8Eb9FZ6K6+NU3ft7CPk0l0mZks0fbmtIZjWELWDV8=;
 b=gqXpps+fAdgyppxtNfNiukiPi8c6qzIA+5zjndN4BNWax0xJG2CcCdRF
 8jMezwTwwa1TrFFR2UE7Wi14DlFNz/V44//M5eGKrFuYK5i6axEuW4whp
 URDx3iMuxeVWo/jEgVlsTFI1AU9Ak2l0sZ3OXjNID42hB9PWZsJfGrMYT
 tpoQfPUO57R/dHKTb9S2q0xJj8NYhk0ONhA19HcWQDR4v5mJowGf+iJcN
 STOacTPTK6jFMkQP8f08Thc4XgQMCQF9J/W3H9rpNyuZF1IQdrsydFdFo
 o+4ZOovbuHZRb2XyBoa2wC2OrHhvZHwbpP3aC8kzJPD0lQ5w8Nrf4Yn51 w==;
X-CSE-ConnectionGUID: EpnGMBZ6TAiukYaqnVKbkg==
X-CSE-MsgGUID: 4jaqplsfToe3jDuTX5RR3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32833286"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32833286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 13:07:52 -0700
X-CSE-ConnectionGUID: odVsDA2VSk+NSlZwsaDIAQ==
X-CSE-MsgGUID: aAgZ1kj0QGCog3NFfCbCHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57616825"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2024 13:07:50 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8646D312D7;
 Fri,  9 Aug 2024 21:07:48 +0100 (IST)
Message-ID: <cc512814-3b91-4164-8165-531be48fd2e4@intel.com>
Date: Fri, 9 Aug 2024 22:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: remove GuC reload in D3Hot path
To: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 matthew.brost@intel.com, karthik.poosa@intel.com
References: <20240807134050.2048114-1-riana.tauro@intel.com>
 <20240807134050.2048114-3-riana.tauro@intel.com>
 <c4hemi6eshos64d6qxfux6wosyktw76thvzbwgvi26rbhbvvgr@3jkem2ozvclg>
 <ZrO0C82SU8r0tT7F@intel.com> <3d093184-f53a-44a5-926f-0a552ec154b3@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3d093184-f53a-44a5-926f-0a552ec154b3@intel.com>
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



On 08.08.2024 07:34, Riana Tauro wrote:
> 
> 
> On 8/7/2024 11:21 PM, Rodrigo Vivi wrote:
>> On Wed, Aug 07, 2024 at 09:59:27AM -0500, Lucas De Marchi wrote:
>>> On Wed, Aug 07, 2024 at 07:10:50PM GMT, Riana Tauro wrote:
>>>> Currently GuC is reloaded for both runtime resume and system resume.
>>>> For D3hot <-> D0 transitions no power is lost during suspend so GuC
>>>> reload
>>>> is not necessary.
>>>>
>>>> Remove GuC reload from D3Hot path and only enable/disable CTB
>>>> communication.
>>>>
>>>> v2: rebase
>>>>
>>>> v3: fix commit message
>>>>     add kernel-doc for gt suspend and resume methods
>>>>     fix comment
>>>>     do not split register and enable calls of CT (Michal)
>>>>
>>>> v4: fix commit message
>>>>     fix comment (Karthik)
>>>>     split patches
>>>>     correct kernel-doc (Rodrigo)
>>>>
>>>> v5: do not expose internal function of CT layer (Michal)
>>>>     remove wait for outstanding g2h as it will be always zero,
>>>>     use assert instead (Matthew Brost)
>>>>     use runtime suspend and runtime resume pair for CT layer
>>>>     (Michal / Matthew Brost)
>>>>
>>>> v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
>>>>     assert and queue handler if g2h head and tail are
>>>>     not equal (Matthew Brost)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++----
>>>> drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
>>>> drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>>>> drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
>>>> drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
>>>> drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>>>> 9 files changed, 136 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 58895ed22f6e..e0b13dc7663b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>>>     XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>> }
>>>>
>>>> -int xe_gt_suspend(struct xe_gt *gt)
>>>> +/**
>>>> + * xe_gt_suspend - GT suspend helper
>>>> + * @gt: GT object
>>>> + * @runtime: true if this is from runtime suspend
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>>>> {
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>>     int err;
>>>>
>>>>     xe_gt_dbg(gt, "suspending\n");
>>>> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>     if (err)
>>>>         goto err_msg;
>>>>
>>>> -    err = xe_uc_suspend(&gt->uc);
>>>> +    if (runtime && !xe->d3cold.allowed)
>>>> +        err = xe_uc_runtime_suspend(&gt->uc);
>>>> +    else
>>>> +        err = xe_uc_suspend(&gt->uc);
>>>> +
>>>>     if (err)
>>>>         goto err_force_wake;
>>>>
>>>> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>>>     return ret;
>>>> }
>>>>
>>>> -int xe_gt_resume(struct xe_gt *gt)
>>>> +/**
>>>> + * xe_gt_resume - GT resume helper
>>>> + * @gt: GT object
>>>> + * @runtime: true if called on runtime resume
>>>
>>> ugh... I find these boolean args way to ugly and error prone. Why can't
>>> the path we are on simply call the 2 functions and we use a composing
>>> style rather than "do this", "and that", "and that other thing", "and
>>> that other too"?
>>
>> My bad on that. I'm sorry Riana.
>>
>>> This only leads to dead code in the long run as we
>>> later realize "oh, nobody call this function with false as argument
>>> anymore".  And to hard to use APIs as now the caller ends up with
>>
>> indeed
>>
>>>
>>> xe_gt_do_foo(gt, true, false, true, true) without any indication of what
>>> those things are for the caller.
>>
>> yeap!
>>
>>> A less ugly alternative (but IMO still not ideal) is to use the
>>> "flags approach", since then at least the caller is passing something
>>> understandable rather than true/false.  But I think we should usually
>>> use 2 separate functions and call them where appropriate.
>>
>> I totally agree!
>>
> This series uses booleans in two places
> 
>     int xe_gt_suspend/resume(struct xe_gt *gt, bool runtime)
>     int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
> 
> During the earlier versions, there were review comments to avoid code
> duplication since all the code remains same except for one function. So
> wanted to get consensus
> 
> If functions are split, there will be code duplication. Even after  the
> split, we still need to call xe_uc_suspend if d3cold is allowed.
> @Rodrigo @Lucas is this okay?
> 
> System suspend (Resume also will follow similar pattern)
> 
> /xe_pm_suspend
> | xe_gt_suspend
> | |
> | | xe_uc_suspend
> | | xe_gt_idle_disable_pg
> | | ...
> | |
> 
> Runtime suspend : D3Hot/D3cold
> 
> /xe_pm_runtime_suspend
> | xe_gt_runtime_suspend
> | |
> | | if (d3cold_allowed)
> | | |    xe_uc_suspend
> | | |else
> | | |
> | | |   xe_uc_runtime_suspend
> | | xe_gt_idle_disable_pg
> | | ...
> | |
> 
> 
> 
> @Michal for the CTB registering, you suggested to reduce duplication of
> code. With Lucas comments to avoid boolean variables, there will be
> duplication of the irq code.
> Is that fine or should i use flag instead of boolean?
> 
> For registering/ resuming CT
> 
> xe_guc_enable_communication
> | guc_enable_irq
> | xe_guc_ct_enable
> | guc_handle_mmio_msg
> 
> xe_uc_runtime_resume
> | xe_guc_runtime_resume
> | | guc_enable_irq
> | | xe_guc_ct_runtime_resume
> 

hmm, but in [1] my suggestion was to have pairs of suspend/resume
functions across all layers, so no extra flag should be needed, as there
should be:
	
	xe_gc_runtime_suspend()
	  xe_guc_runtime_suspend()
	    xe_guc_ct_runtime_suspend()
and
	xe_uc_runtime_resume()
	  xe_guc_runtime_resume()
	    xe_guc_ct_runtime_resume()

maybe just xe_guc_enable_communication() as-is in the middle does not
fit any more into this flow and should part of guc level functions?

and IMO calling helper function from two places is not a 'code
duplication' so maybe what's needed is proper split of the unique code
into helpers

Michal

[1]
https://lore.kernel.org/intel-xe/f26ad960-4a13-49b3-b523-caa5715e40fd@intel.com/

> 
> Thanks,
> Riana
>>>
>>> Lucas De Marchi
>>>
>>>
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>>>> {
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>>     int err;
>>>>
>>>>     xe_gt_dbg(gt, "resuming\n");
>>>> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>     if (err)
>>>>         goto err_msg;
>>>>
>>>> -    err = do_gt_restart(gt);
>>>> +    /* GuC is still alive at D3hot, no need to reload it */
>>>> +    if (runtime && !xe->d3cold.allowed)
>>>> +        xe_uc_runtime_resume(&gt->uc);
>>>> +    else
>>>> +        err = do_gt_restart(gt);
>>>> +
>>>>     if (err)
>>>>         goto err_force_wake;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>> index 8b1a5027dcf2..21f27ca23b67 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>> @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>>> void xe_gt_record_user_engines(struct xe_gt *gt);
>>>>
>>>> void xe_gt_suspend_prepare(struct xe_gt *gt);
>>>> -int xe_gt_suspend(struct xe_gt *gt);
>>>> -int xe_gt_resume(struct xe_gt *gt);
>>>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>>>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>>> void xe_gt_reset_async(struct xe_gt *gt);
>>>> void xe_gt_sanitize(struct xe_gt *gt);
>>>> int xe_gt_sanitize_freq(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 85b88532e23f..6758b02dad58 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -883,6 +883,8 @@ int xe_guc_enable_communication(struct xe_guc
>>>> *guc, bool register_ctb)
>>>>         err = xe_guc_ct_enable(&guc->ct);
>>>>         if (err)
>>>>             return err;
>>>> +    } else {
>>>> +        xe_guc_ct_runtime_resume(&guc->ct);
>>>>     }
>>>>
>>>>     guc_handle_mmio_msg(guc);
>>>> @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>>>     guc->submission_state.enabled = false;
>>>> }
>>>>
>>>> +/**
>>>> + * xe_guc_runtime_suspend - GuC runtime suspend
>>>> + * @guc: GuC object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>>>> +{
>>>> +    return xe_guc_ct_runtime_suspend(&guc->ct);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_runtime_resume - GuC runtime resume
>>>> + * @guc: GuC object
>>>> + *
>>>> + * This function enables GuC CTB communication
>>>> + */
>>>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>>>> +{
>>>> +    /*
>>>> +     * Power is not lost when in D3Hot state,
>>>> +     * hence it is not necessary to reload GuC
>>>> +     * everytime. Only enable interrupts and
>>>> +     * CTB communication during resume
>>>> +     */
>>>> +    xe_guc_enable_communication(guc, false);
>>>> +}
>>>> +
>>>> int xe_guc_reset_prepare(struct xe_guc *guc)
>>>> {
>>>>     return xe_guc_submit_reset_prepare(guc);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>>> index 5fcf6f6ef964..56359047d185 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>>> @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>>> int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>> int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>>>> int xe_guc_suspend(struct xe_guc *guc);
>>>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>>>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>>> void xe_guc_notify(struct xe_guc *guc);
>>>> int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>>> int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index beeeb120d1fc..41bdb9437634 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>     return err;
>>>> }
>>>>
>>>> +/**
>>>> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
>>>> + * @ct: the &xe_guc_ct
>>>> + *
>>>> + * Mark GuC CT as enabled on runtime resume
>>>> + */
>>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>>>> +{
>>>> +    struct guc_ctb *g2h = &ct->ctbs.g2h;
>>>> +
>>>> +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>> +
>>>> +    /* Assert if g2h head and tail are unequal and queue g2h
>>>> handler */
>>>> +    if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h,
>>>> tail) != g2h->info.head))
>>>> +        queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
>>>> + * @ct: the &xe_guc_ct
>>>> + *
>>>> + * Mark GuC CT as disabled on runtime suspend
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>>>> +{
>>>> +    /* Assert if there are any outstanding g2h and abort suspend */
>>>> +    if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
>>>> +        return -EBUSY;
>>>> +
>>>> +    xe_guc_ct_disable(ct);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> static void stop_g2h_handler(struct xe_guc_ct *ct)
>>>> {
>>>>     cancel_work_sync(&ct->g2h_worker);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> index 190202fce2d0..0cf9d77feb35 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>>> void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>>> void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>>
>>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>>>> +
>>>> struct xe_guc_ct_snapshot *
>>>> xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>>>> void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index 9f3c14fd9f33..c73a728a7450 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>     xe_display_pm_suspend(xe, false);
>>>>
>>>>     for_each_gt(gt, xe, id) {
>>>> -        err = xe_gt_suspend(gt);
>>>> +        err = xe_gt_suspend(gt, false);
>>>>         if (err) {
>>>>             xe_display_pm_resume(xe, false);
>>>>             goto err;
>>>> @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
>>>>     xe_display_pm_resume(xe, false);
>>>>
>>>>     for_each_gt(gt, xe, id)
>>>> -        xe_gt_resume(gt);
>>>> +        xe_gt_resume(gt, false);
>>>>
>>>>     err = xe_bo_restore_user(xe);
>>>>     if (err)
>>>> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>     }
>>>>
>>>>     for_each_gt(gt, xe, id) {
>>>> -        err = xe_gt_suspend(gt);
>>>> +        err = xe_gt_suspend(gt, true);
>>>>         if (err)
>>>>             goto out;
>>>>     }
>>>> @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>     xe_irq_resume(xe);
>>>>
>>>>     for_each_gt(gt, xe, id)
>>>> -        xe_gt_resume(gt);
>>>> +        xe_gt_resume(gt, true);
>>>>
>>>>     if (xe->d3cold.allowed) {
>>>>         xe_display_pm_resume(xe, true);
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index fa98e9f22631..8e535153cc62 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>>>     return xe_guc_suspend(&uc->guc);
>>>> }
>>>>
>>>> +/**
>>>> + * xe_uc_runtime_suspend - uC runtime suspend
>>>> + * @uc: uC object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>>>> +{
>>>> +    if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>> +        return 0;
>>>> +
>>>> +    return xe_guc_runtime_suspend(&uc->guc);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_uc_runtime_resume - uC runtime resume
>>>> + * @uc: uC object
>>>> + *
>>>> + * Called while resuming from D3Hot
>>>> + */
>>>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>>>> +{
>>>> +    if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>> +        return;
>>>> +
>>>> +    xe_guc_runtime_resume(&uc->guc);
>>>> +}
>>>> +
>>>> /**
>>>>   * xe_uc_remove() - Clean up the UC structures before driver removal
>>>>   * @uc: the UC object
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>>> index 506517c11333..1e223d67086a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>>> int xe_uc_fini_hw(struct xe_uc *uc);
>>>> void xe_uc_gucrc_disable(struct xe_uc *uc);
>>>> int xe_uc_reset_prepare(struct xe_uc *uc);
>>>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>>>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>>> void xe_uc_stop_prepare(struct xe_uc *uc);
>>>> void xe_uc_stop(struct xe_uc *uc);
>>>> int xe_uc_start(struct xe_uc *uc);
>>>> -- 
>>>> 2.40.0
>>>>
