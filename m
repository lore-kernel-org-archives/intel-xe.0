Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0ECCE7AE3
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 13:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4110EA5C;
	Fri,  6 Sep 2024 13:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjTGru4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F109410EA5C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725629851; x=1757165851;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w9Ck5g67QoaMKl/EdO9ApgpmtRphmYks4+oMYMPT1NU=;
 b=fjTGru4njwd9RazSklO9okLjNDhWSPCbDAyWaxec5XPt8CAPi9ZawALK
 221QoUrsbgQr0g5htJ6PRL3Y2Eo4DXHTUhb7Ftclrfk5lTVP0/dp8q+Gu
 wZbkvYZDQy0R7rIOeX3USl5vzVX3zG+uL0r/y2SAGWXJy7DDCjMypMAX4
 vw/6SMx7Pz59sM2hiCXod/nZgtV6pSDvJ/ff0yGrzIu895hRCZHB9eKbj
 8XLA8zoJ4g/Xwvle4OZhfM+rbaL9uYjiGbx0OMLchB65/m3FspgJ/ggYo
 w3GNoXc0APTzilrdbra1WdBHIom+4CmQNPFlCWbZsSUQKGqIiOsx6w+XM w==;
X-CSE-ConnectionGUID: ZoxQM2teQPCPUx6GvJS26g==
X-CSE-MsgGUID: Xvdm4Md0Q3WvZ/LMXohkKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23945434"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="23945434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:37:30 -0700
X-CSE-ConnectionGUID: Wfz5UGSPS3i4hflx4q/WGA==
X-CSE-MsgGUID: Yooavxj6RxiF/8/SUKjrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="103430663"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.194])
 ([10.245.244.194])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:37:29 -0700
Message-ID: <baf6e316-7d01-4503-91f1-07422adf583b@linux.intel.com>
Date: Fri, 6 Sep 2024 15:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Wire up device shutdown handler
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-4-maarten.lankhorst@linux.intel.com>
 <bqqgufbcacxf7ix5nsveuvb3lr3equnm7otlkr5opw73f3are3@hu3b7zr2dko2>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <bqqgufbcacxf7ix5nsveuvb3lr3equnm7otlkr5opw73f3are3@hu3b7zr2dko2>
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



Den 2024-09-05 kl. 18:52, skrev Lucas De Marchi:
> On Thu, Sep 05, 2024 at 05:00:51PM GMT, Maarten Lankhorst wrote:
>> The system is turning off, and we should probably put the device
>> in a safe power state. We don't need to evict VRAM or suspend running
>> jobs to a safe state, as the device is rebooted anyway.
>>
>> This does not imply the system is necessarily reset, as we can
>> kexec into a new kernel. Without shutting down, things like
>> USB Type-C may mysteriously start failing.
>>
>> References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3500
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>> drivers/gpu/drm/xe/display/xe_display.c | 43 +++++++++++++++++++++++++
>> drivers/gpu/drm/xe/display/xe_display.h |  4 +++
>> drivers/gpu/drm/xe/xe_device.c          | 40 +++++++++++++++++++----
>> drivers/gpu/drm/xe/xe_gt.c              |  7 ++++
>> drivers/gpu/drm/xe/xe_gt.h              |  1 +
>> 5 files changed, 89 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 33071ac3bc12d..0cb8eef1b095c 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -350,6 +350,36 @@ void xe_display_pm_suspend(struct xe_device *xe)
>>     __xe_display_pm_suspend(xe, false);
>> }
>>
>> +void xe_display_pm_shutdown(struct xe_device *xe)
>> +{
>> +    struct intel_display *display = &xe->display;
>> +
>> +    if (!xe->info.probe_display)
>> +        return;
>> +
>> +    intel_power_domains_disable(xe);
>> +    intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>> +    if (has_display(xe)) {
>> +        drm_kms_helper_poll_disable(&xe->drm);
>> +        intel_display_driver_disable_user_access(xe);
>> +        intel_display_driver_suspend(xe);
>> +    }
>> +
>> +    xe_display_flush_cleanup_work(xe);
>> +    intel_dp_mst_suspend(xe);
>> +    intel_hpd_cancel_work(xe);
>> +
>> +    if (has_display(xe))
>> +        intel_display_driver_suspend_access(xe);
>> +
>> +    intel_encoder_suspend_all(display);
>> +    intel_encoder_shutdown_all(display);
>> +
>> +    intel_opregion_suspend(display, PCI_D3cold);
>> +
>> +    intel_dmc_suspend(xe);
>> +}
>> +
>> void xe_display_pm_runtime_suspend(struct xe_device *xe)
>> {
>>     if (!xe->info.probe_display)
>> @@ -372,6 +402,19 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
>>     intel_display_power_suspend_late(xe);
>> }
>>
>> +void xe_display_pm_shutdown_late(struct xe_device *xe)
>> +{
>> +    if (!xe->info.probe_display)
>> +        return;
>> +
>> +    /*
>> +     * The only requirement is to reboot with display DC states disabled,
>> +     * for now leaving all display power wells in the INIT power domain
>> +     * enabled.
>> +     */
>> +    intel_power_domains_driver_remove(xe);
>> +}
>> +
>> void xe_display_pm_resume_early(struct xe_device *xe)
>> {
>>     if (!xe->info.probe_display)
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
>> index bed55fd26f304..17afa537aee50 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.h
>> +++ b/drivers/gpu/drm/xe/display/xe_display.h
>> @@ -35,7 +35,9 @@ void xe_display_irq_reset(struct xe_device *xe);
>> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>>
>> void xe_display_pm_suspend(struct xe_device *xe);
>> +void xe_display_pm_shutdown(struct xe_device *xe);
>> void xe_display_pm_suspend_late(struct xe_device *xe);
>> +void xe_display_pm_shutdown_late(struct xe_device *xe);
>> void xe_display_pm_resume_early(struct xe_device *xe);
>> void xe_display_pm_resume(struct xe_device *xe);
>> void xe_display_pm_runtime_suspend(struct xe_device *xe);
>> @@ -66,7 +68,9 @@ static inline void xe_display_irq_reset(struct xe_device *xe) {}
>> static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
>>
>> static inline void xe_display_pm_suspend(struct xe_device *xe) {}
>> +static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
>> static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
>> +static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
>> static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
>> static inline void xe_display_pm_resume(struct xe_device *xe) {}
>> static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 1a0d7fdd094b5..a2ce7454794f6 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -383,6 +383,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>     return ERR_PTR(err);
>> }
>>
>> +static bool xe_driver_flr_disabled(struct xe_device *xe)
>> +{
>> +    return xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
>> +}
>> +
>> /*
>>  * The driver-initiated FLR is the highest level of reset that we can trigger
>>  * from within the driver. It is different from the PCI FLR in that it doesn't
>> @@ -396,17 +401,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  * if/when a new instance of i915 is bound to the device it will do a full
>>  * re-init anyway.
>>  */
>> -static void xe_driver_flr(struct xe_device *xe)
>> +static void __xe_driver_flr(struct xe_device *xe)
>> {
>>     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
>>     struct xe_gt *gt = xe_root_mmio_gt(xe);
>>     int ret;
>>
>> -    if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>> -        drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>> -        return;
>> -    }
>> -
>>     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>
>>     /*
>> @@ -447,6 +447,16 @@ static void xe_driver_flr(struct xe_device *xe)
>>     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> }
>>
>> +static void xe_driver_flr(struct xe_device *xe)
>> +{
>> +    if (xe_driver_flr_disabled(xe)) {
>> +        drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>> +        return;
>> +    }
>> +
>> +    __xe_driver_flr(xe);
>> +}
>> +
>> static void xe_driver_flr_fini(void *arg)
>> {
>>     struct xe_device *xe = arg;
>> @@ -798,6 +808,24 @@ void xe_device_remove(struct xe_device *xe)
>>
>> void xe_device_shutdown(struct xe_device *xe)
>> {
>> +    struct xe_gt *gt;
>> +    u8 id;
>> +
>> +    drm_dbg(&xe->drm, "Shutting down device\n");
>> +
>> +    if (xe_driver_flr_disabled(xe)) {
>> +        xe_display_pm_shutdown(xe);
>> +
>> +        xe_irq_suspend(xe);
>> +
>> +        for_each_gt(gt, xe, id)
>> +            xe_gt_shutdown(gt);
>> +
>> +        xe_display_pm_shutdown_late(xe);
>> +    } else {
>> +        /* BOOM! */
>> +        __xe_driver_flr(xe);
> 
> is this just so we don't read the register twice? Not really necessary,
> is it? Otherwise let's please add an xe_assert() so we catch in CI cases
> that this is eventually called in other paths that shouldn't.

I'll just go back to xe_driver_flr here..

Cheers,
~Maarten

