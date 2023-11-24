Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6A2C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 07:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4B10E79E;
	Fri, 24 Nov 2023 07:51:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C147510E79D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700812303; x=1732348303;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UhS694Tku4034TgpQ+2JSpVRtT190nQjp3KzUIZR9W0=;
 b=ksUaKWvbCAtCqOvChLoCllR9kDRIH9x8IjMDE5MdUoOPPr9/PaLOig7e
 YUFOAecQD3VTOBpR6gcwf/Axoka5TQRHpx1MOGZPxepdLWgCY99QxCk7a
 WvioM3dItXncH308zKwbgq6paVyfLRIKLhDb3cEkDkfA7XSHzSufufz4V
 YHrfCnWMVp6YsjZdNi70cFBLzl1I95sXK5fFKjj+w6zAS+ZZK4hEpQ+9R
 Ijc1MYWemGLFXnRIuRB+8qG9IpQACpOlSexuqvzwvroq7YJz73ZB3EaC6
 95nQOdGJO6ZaMFfqOoYeVxPwCx0+CNr7Ik60untPsNXuZ8+OSO9zuUfq/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391258451"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="391258451"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 23:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1099017328"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="1099017328"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 23:51:28 -0800
Message-ID: <7ef9b013-e2cf-4396-9310-6b8c14e12b49@linux.intel.com>
Date: Fri, 24 Nov 2023 13:24:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
 <CY5PR11MB6211B51A140CC49ED286FE5795B8A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <CY5PR11MB6211B51A140CC49ED286FE5795B8A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] FW: [PATCH] drm/xe: Fix lockdep warning in
 xe_force_wake calls
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


On 11/24/23 12:39, Gupta, Anshuman wrote:
>
> -----Original Message-----
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com> 
> Sent: Friday, November 24, 2023 12:14 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
> Subject: [PATCH] drm/xe: Fix lockdep warning in xe_force_wake calls
>
> Introduce atomic version for xe_force_wake calls which uses spin_lock while the non atomic version uses spin_lock_irq
>
> Fix for below:
> [13994.811263] ========================================================
> [13994.811295] WARNING: possible irq lock inversion dependency detected
> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
> [13994.811358] --------------------------------------------------------
> [13994.811388] swapper/0/0 just changed the state of lock:
> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
> __perf_event_read+0xb7/0x3a0
> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
> past:
> [13994.811528]  (&fw->lock){+.+.}-{2:2}
> [13994.811544]
>
>                and interrupts could create inverse lock ordering between them.
>
> [13994.811606]
>                other info that might help us debug this:
> [13994.811636]  Possible interrupt unsafe locking scenario:
>
> [13994.811667]        CPU0                    CPU1
> [13994.811691]        ----                    ----
> [13994.811715]   lock(&fw->lock);
> [13994.811744]                                local_irq_disable();
> [13994.811773]                                lock(&cpuctx_lock);
> [13994.811810]                                lock(&fw->lock);
> [13994.811846]   <Interrupt>
> [13994.811865]     lock(&cpuctx_lock);
> [13994.811895]
>                 *** DEADLOCK ***
>
> v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic context (Matthew Brost)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 62 +++++++++++++++++++++++++++++-  drivers/gpu/drm/xe/xe_force_wake.h |  4 ++
>  drivers/gpu/drm/xe/xe_pmu.c        |  4 +-
>  3 files changed, 66 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 32d6c4dd2807..1693097f72d3 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -147,7 +147,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  	enum xe_force_wake_domains tmp, woken = 0;
>  	int ret, ret2 = 0;
>  
> -	spin_lock(&fw->lock);
> +	spin_lock_irq(&fw->lock);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!domain->ref++) {
>  			woken |= BIT(domain->id);
> @@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  				   domain->id, ret);
>  	}
>  	fw->awake_domains |= woken;
> -	spin_unlock(&fw->lock);
> +	spin_unlock_irq(&fw->lock);
>  
>  	return ret2;
>  }
> @@ -176,6 +176,64 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	enum xe_force_wake_domains tmp, sleep = 0;
>  	int ret, ret2 = 0;
>  
> +	spin_lock_irq(&fw->lock);
> +	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +		if (!--domain->ref) {
> +			sleep |= BIT(domain->id);
> +			domain_sleep(gt, domain);
> +		}
> +	}
> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> +		ret = domain_sleep_wait(gt, domain);
> +		ret2 |= ret;
> +		if (ret)
> +			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> +				   domain->id, ret);
> +	}
> +	fw->awake_domains &= ~sleep;
> +	spin_unlock_irq(&fw->lock);
> +
> +	return ret2;
> +}
> +
> +int xe_atomic_force_wake_get(struct xe_force_wake *fw,
> +			     enum xe_force_wake_domains domains) {
> Is it possible to re-use the code something like below, for both atomic and non-atomic versions?
> Any how we are using lock around whole function here.
>
> int xe_force_wake_get()
> {
> 	local_irq_disable();
> 	xe_atomic_force_wake_get();
> 	local_irq_disable();
> }
I feel it is better we use the respective spin lock helpers to do that rather than we doing it and hence
having it the way it is good. Little skeptical about the ordering of irq_disable/enable and preemption disable/enable used
in the spin lock helpers so do not want to change that.

Thanks,

Aravind.
> Thanks,
> Anshuman Gupta. 
> +	struct xe_device *xe = fw_to_xe(fw);
> +	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_force_wake_domain *domain;
> +	enum xe_force_wake_domains tmp, woken = 0;
> +	int ret, ret2 = 0;
> +
> +	spin_lock(&fw->lock);
> +	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +		if (!domain->ref++) {
> +			woken |= BIT(domain->id);
> +			domain_wake(gt, domain);
> +		}
> +	}
> +	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> +		ret = domain_wake_wait(gt, domain);
> +		ret2 |= ret;
> +		if (ret)
> +			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> +				   domain->id, ret);
> +	}
> +	fw->awake_domains |= woken;
> +	spin_unlock(&fw->lock);
> +
> +	return ret2;
> +}
> +
> +int xe_atomic_force_wake_put(struct xe_force_wake *fw,
> +			     enum xe_force_wake_domains domains) {
> +	struct xe_device *xe = fw_to_xe(fw);
> +	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_force_wake_domain *domain;
> +	enum xe_force_wake_domains tmp, sleep = 0;
> +	int ret, ret2 = 0;
> +
>  	spin_lock(&fw->lock);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!--domain->ref) {
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 83cb157da7cc..584bedcd72fe 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -19,6 +19,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains);  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains);
> +int xe_atomic_force_wake_get(struct xe_force_wake *fw,
> +			     enum xe_force_wake_domains domains); int 
> +xe_atomic_force_wake_put(struct xe_force_wake *fw,
> +			     enum xe_force_wake_domains domains);
>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw, diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c index 9d0b7887cfc4..4fb77c7693c2 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -71,9 +71,9 @@ static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>  
>  	device_awake = xe_device_mem_access_get_if_ongoing(xe);
>  	if (device_awake) {
> -		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		XE_WARN_ON(xe_atomic_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		val = __engine_group_busyness_read(gt, sample_type);
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +		XE_WARN_ON(xe_atomic_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  		xe_device_mem_access_put(xe);
>  	}
>  
> --
> 2.25.1
>
