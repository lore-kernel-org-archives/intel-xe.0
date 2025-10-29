Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB909CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 11:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8562F10E79F;
	Wed, 29 Oct 2025 11:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zw0/w++g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D570210E79F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761735815; x=1793271815;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eTZeKD6zJuDscCCmHKDQFlaIkoeivQXFz3PIvZTkUdg=;
 b=Zw0/w++gfLNLd+eVF5ghnn5jyeT4SdTQV/R9wv3Far78QarcLz+Sr7it
 DrxN/liEeMJbvyIsgo4tvBlefRtKqGi7tD1jTdwwsFDlYVcWEQropczYE
 Au7qjnIOYasUrS7WkZLiijHiyJ9A8DIctGgYOclX2K68q3057ETqK6lA3
 T0/3mmXJn07YEDfWwbMpJVoo0rM/TvVVGnhRLozQ9kt9A2QmcFBLJ7yYq
 XJP8bTtWD7Bd4JJyqfHnNd7u5AHa3dU1RzdgewE8k0Crx60ksTjdaG3AY
 XOLqVhxcvCslFBS9YiuS2fm6FjYZV/UHfdAPklosfh2X9FHp/1qmm5JBi g==;
X-CSE-ConnectionGUID: QbgNvCiwS8+eV61ROS3Liw==
X-CSE-MsgGUID: xbhr5hVxQDGcgoV+Cev69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="62879873"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="62879873"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:03:35 -0700
X-CSE-ConnectionGUID: dfhaPpYFQQ+GjKPlHqUcIA==
X-CSE-MsgGUID: OmjNpIjyT+W7HzxJXsR6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="186082205"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:03:33 -0700
Message-ID: <2d802bd2-cbf3-48c1-acf1-b1705b61ec85@intel.com>
Date: Wed, 29 Oct 2025 12:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Allow to lock/unlock the PF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
References: <20251028200521.184592-1-michal.wajdeczko@intel.com>
 <aQFuXW5WUeUu1f6r@lstrano-desk.jf.intel.com>
 <cdae237e-a4d7-4053-8b37-2164a1b2ea31@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cdae237e-a4d7-4053-8b37-2164a1b2ea31@intel.com>
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

On 29.10.2025 09:14, Michal Wajdeczko wrote:
> 
> 
> On 10/29/2025 2:31 AM, Matthew Brost wrote:
>> On Tue, Oct 28, 2025 at 09:05:21PM +0100, Michal Wajdeczko wrote:
>>> Some driver functionalities, like eudebug or ccs-mode, can't
>>> be used when VFs are enabled.  Add functions to allow locking
>>> the PF functionality for exclusive usage (either for enabling
>>> VFs or to enable those other features, or simply for testing).
>>> Add also debugfs attributes to explicitly call those functions
>>> if needed.
>>>
>>
>> Hmm, I'm not sure about this. Why not just lock the SR-IOV master mutex
>> in pf_enable_vfs? If the reason is that lockdep blows up — for example,
>> if the master mutex is annotated with __reclaim and pf_enable_vfs
>> allocates memory — then you still have a potential deadlock; you've just
>> silenced lockdep. I'm not certain that's the case, just using it as an
>> example.
>>
>> Given that, I'd lean toward saying no — this really, really looks
>> unsafe. If you'd like, get a second opinion from a locking expert (e.g.,
>> Thomas), but I think this is a no from me.
> 
> looks that more background info is needed here
> 
> this "lock/unlock" is not to protect any PF structures/data, as for this
> we have master_mutex, but to allow other components, like mentioned
> above eudebug & ccs-mode, to block PF from enabling VFs while that other
> feature is running or making incompatible with VFs changes, see [1] [2]
> 
> in this patch, the PF is trying to "lock" itself when enabling VFs.
> if other component (or here debugfs) already locked the PF, then PF will
> not enable any VFs, thus will not break this any other feature.
> 
> it is expected that other components, will follow the same flow, so they
> will first start with pf_try_lock and then either abort it's enabling, as
> PF is already running, or call pf_unlock when they are done.
> 
> however there is one open that we might need to solve: what if there are
> more such non-PF compatible features that would like to run in parallel
> 
> with this trivial approach, only eudebug or ccs-mode will be able to run

Good point - eudebug and ccs mode shouldn't be exclusive. Regardless, I 
think that a mechanism which provides absolute exclusivity to the caller 
shouldn't be exposed by a individual feature like SR-IOV.

> 
> if that's not sufficient, then we can switch to use rw_semaphore, or
> maybe, if that would be cleaner/safer, use that from the beginning ?
> 
> then we will have:
> 
> components:
> 	xe_sriov_pf_try_lock		--> down_read_trylock
> 	xe_sriov_pf_unlock		--> up_read
> 
> PF internals:
> 	__xe_sriov_pf_try_lock(write)	--> down_write_trylock
> 	__xe_sriov_pf_unblock(write)	--> up_write

This looks nice as it only provides SR-IOV vs others exclusion and 
*won't* break when there are two or more of those other features 
(looking at [1] :$)

> 
> [1] https://patchwork.freedesktop.org/patch/667725/?series=152682&rev=1
> [2] https://patchwork.freedesktop.org/patch/681266/?series=154538&rev=6
> 
>>
>> Matt
>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>>> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
>>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pci_sriov.c        |  7 +++++
>>>   drivers/gpu/drm/xe/xe_sriov_pf.c         | 38 ++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +++
>>>   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 15 ++++++++++
>>>   drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  3 ++
>>>   5 files changed, 67 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> index 735f51effc7a..e1d34860b064 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> @@ -120,6 +120,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>>   	if (err)
>>>   		goto out;
>>>   
>>> +	err = xe_sriov_pf_try_lock(xe);
>>> +	if (err)
>>> +		goto out;
>>> +
>>>   	/*
>>>   	 * We must hold additional reference to the runtime PM to keep PF in D0
>>>   	 * during VFs lifetime, as our VFs do not implement the PM capability.
>>> @@ -157,6 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>>   failed:
>>>   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>>>   	xe_pm_runtime_put(xe);
>>> +	xe_sriov_pf_unlock(xe);
>>>   out:
>>>   	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>>>   			num_vfs, str_plural(num_vfs), ERR_PTR(err));
>>> @@ -186,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>>>   	/* not needed anymore - see pf_enable_vfs() */
>>>   	xe_pm_runtime_put(xe);
>>>   
>>> +	xe_sriov_pf_unlock(xe);
>>> +
>>>   	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>>>   	return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>>> index bc1ab9ee31d9..8cdd25db2cf9 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>>> @@ -157,6 +157,44 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
>>>   	return 0;
>>>   }
>>>   
>>> +/**
>>> + * xe_sriov_pf_try_lock() - Try to lock the PF.
>>> + * @xe: the PF &xe_device
>>> + *
>>> + * This function can only be called on PF.

Nit: this comment could be a little bit more descriptive. The name 
itself (try_lock) is reminiscent of a typical resource lock, which I 
would argue is more commonly associated with concurrency and data 
integrity rather than feature state management.

>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_sriov_pf_try_lock(struct xe_device *xe)
>>> +{
>>> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
>>> +
>>> +	if (xe->sriov.pf.owner) {
>>> +		xe_sriov_dbg(xe, "already locked by %ps\n", xe->sriov.pf.owner);
>>> +		return -EBUSY;
>>> +	}
>>> +
>>> +	xe->sriov.pf.owner = __builtin_return_address(0);
>>> +	xe_sriov_dbg_verbose(xe, "locked by %ps\n", xe->sriov.pf.owner);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_sriov_pf_unlock() - Unlock the PF.
>>> + * @xe: the PF &xe_device
>>> + *
>>> + * This function can only be called on PF.

Same as above.

Regards,
Christoph

>>> + */
>>> +void xe_sriov_pf_unlock(struct xe_device *xe)
>>> +{
>>> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
>>> +
>>> +	xe_assert(xe, xe->sriov.pf.owner);
>>> +	xe_sriov_dbg_verbose(xe, "unlocked by %ps\n", __builtin_return_address(0));
>>> +	xe->sriov.pf.owner = NULL;
>>> +}
>>> +
>>>   /**
>>>    * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>>>    * @xe: the &xe_device to print info from
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
>>> index cba3fde9581f..2261596bb4fe 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
>>> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>>>   int xe_sriov_pf_init_early(struct xe_device *xe);
>>>   int xe_sriov_pf_init_late(struct xe_device *xe);
>>>   int xe_sriov_pf_wait_ready(struct xe_device *xe);
>>> +int xe_sriov_pf_try_lock(struct xe_device *xe);
>>> +void xe_sriov_pf_unlock(struct xe_device *xe);
>>>   void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>>>   #else
>>>   static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>>>   static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>>>   static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
>>> +int xe_sriov_pf_try_lock(struct xe_device *xe) { return 0; }
>>> +void xe_sriov_pf_unlock(struct xe_device *xe) { }
>>>   #endif
>>>   
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>>> index a81aa05c5532..7c011462244d 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>>> @@ -96,12 +96,27 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
>>>   	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
>>>   }
>>>   
>>> +static inline int xe_sriov_pf_try_lock_pf(struct xe_device *xe)
>>> +{
>>> +	return xe_sriov_pf_try_lock(xe);
>>> +}
>>> +
>>> +static inline int xe_sriov_pf_force_unlock_pf(struct xe_device *xe)
>>> +{
>>> +	xe_sriov_pf_unlock(xe);
>>> +	return 0;
>>> +}
>>> +
>>>   DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
>>> +DEFINE_SRIOV_ATTRIBUTE(try_lock_pf);
>>> +DEFINE_SRIOV_ATTRIBUTE(force_unlock_pf);
>>>   
>>>   static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
>>>   {
>>>   	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
>>>   			    &restore_auto_provisioning_fops);
>>> +	debugfs_create_file("try_lock_pf", 0200, dent, xe, &try_lock_pf_fops);
>>> +	debugfs_create_file("force_unlock_pf", 0200, dent, xe, &force_unlock_pf_fops);
>>>   }
>>>   
>>>   static int simple_show(struct seq_file *m, void *data)
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
>>> index c753cd59aed2..91da3c979922 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
>>> @@ -36,6 +36,9 @@ struct xe_device_pf {
>>>   	/** @master_lock: protects all VFs configurations across GTs */
>>>   	struct mutex master_lock;
>>>   
>>> +	/** @owner: the RET_IP of the owner who locked the PF */
>>> +	void *owner;
>>> +
>>>   	/** @provision: device level provisioning data. */
>>>   	struct xe_sriov_pf_provision provision;
>>>   
>>> -- 
>>> 2.47.1
>>>
> 

