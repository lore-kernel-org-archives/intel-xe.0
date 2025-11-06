Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3F3CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 12:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4454510E161;
	Thu,  6 Nov 2025 12:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgWnV907";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E0F10E161
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762432971; x=1793968971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jt8PQEmBC7LtEbiAfq541vIsq781PzSSsEwmfigabhg=;
 b=UgWnV907vJkG4p2B2QnyN86Ff9RaK/shJ2juDFWw7ODrzrhjd1bp2ybk
 jf3BdbC6bCV/D8s23Wv9HCHcbi0NaoK2i6YhwWxtfPh2pNNRiRoRWWuEp
 FjWCV3JxXvkwj/wPopraGqwwmtLV+uU6/x5gKB3rREhXJz7MKwalXHidG
 kyysmlnc2xc7USDFkLNZURGmsx3y0lsOJelCy00JShqBNQvtEYH7Hp9+k
 ZKetZqkzz1hJP0GmXibe92O/PIQ0ra6PrAQVaM6TIQ0yQOSdq4qkjFozN
 e3XBx+KJkn2ZoGY46LkpTYk2g/NVLQ/q6aaDTuZ/3po2rqXinGdfol2Sq Q==;
X-CSE-ConnectionGUID: OdptDDuwTcO/JAknsxBAog==
X-CSE-MsgGUID: Xn6mk2UmTCyV1G+8Gwsgcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74856930"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="74856930"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:42:50 -0800
X-CSE-ConnectionGUID: otn0iJoMQ5SKbLyCxg+QMQ==
X-CSE-MsgGUID: PxqWTVU4SFOuLJYzqIF/hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218410867"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.197])
 ([172.28.180.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:42:49 -0800
Message-ID: <f3b92826-c5c0-45bb-a4bd-8c2b12ac04dd@intel.com>
Date: Thu, 6 Nov 2025 13:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pf: Allow to lockdown the PF using custom guard
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
References: <20251105130105.582-1-michal.wajdeczko@intel.com>
 <2233ef9b-3979-4009-a45a-0af0de2b6812@intel.com>
 <76ae6ad0-b508-48ff-8f21-ba9afa17f399@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <76ae6ad0-b508-48ff-8f21-ba9afa17f399@intel.com>
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



On 6.11.2025 11:45, Michal Wajdeczko wrote:
> 
> 
> On 11/6/2025 11:30 AM, Manszewski, Christoph wrote:
>> Hi Michal,
>>
>> On 5.11.2025 14:00, Michal Wajdeczko wrote:
>>> Some driver components, like eudebug or ccs-mode, can't be used
>>> when VFs are enabled.  Add functions to allow those components
>>> to block the PF from enabling VFs for the requested duration.
>>>
>>> Introduce trivial counter to allow lockdown or exclusive access
>>> that can be used in the scenarios where we can't follow the strict
>>> owner semantics as required by the rw_semaphore implementation.
>>>
>>> Before enabling VFs, the PF will try to arm the "vfs_enabling"
>>> guard for the exclusive access.  This will fail if there are
>>> some lockdown requests already initiated by the other components.
>>>
>>> For testing purposes, add debugfs file which will call these new
>>> functions from the file's open/close hooks.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
>>> ---
>>> v1: https://patchwork.freedesktop.org/series/156687/#rev1
>>> v2: https://patchwork.freedesktop.org/series/156795/#rev1
>>>       use less confusing names (Matthew/Christoph)
>>>       allow many components to lockdown the PF (Christoph)
>>> v3: no atomic_t, just use spinlock (Matthew)
>>> v4: add missing local change (Michal)
>>> ---
>>> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guard.h            | 119 +++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_pci_sriov.c        |  21 ++++
>>>    drivers/gpu/drm/xe/xe_sriov_pf.c         |  98 +++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_sriov_pf.h         |   4 +
>>>    drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c |  30 ++++++
>>>    drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |   5 +
>>>    drivers/gpu/drm/xe/xe_sriov_pf_types.h   |   4 +
>>>    7 files changed, 281 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_guard.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guard.h b/drivers/gpu/drm/xe/xe_guard.h
>>> new file mode 100644
>>> index 000000000000..333f8e13b5a1
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_guard.h
>>> @@ -0,0 +1,119 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GUARD_H_
>>> +#define _XE_GUARD_H_
>>> +
>>> +#include <linux/spinlock.h>
>>> +
>>> +/**
>>> + * struct xe_guard - Simple logic to protect a feature.
>>> + *
>>> + * Implements simple semaphore-like logic that can be used to lockdown the
>>> + * feature unless it is already in use.  Allows enabling of the otherwise
>>
>> Nit: double space before 'Allows'
> 
> it was on purpose, like usually done (in many places that use plain text) to emphasize start of the new sentence

Ok


> (but I don't care)
> 
>>
>>
>>> + * incompatible features, where we can't follow the strict owner semantics
>>> + * required by the &rw_semaphore.
>>> + *
>>> + * NOTE! It shouldn't be used to protect a data, use &rw_semaphore instead.
>>> + */
>>> +struct xe_guard {
>>> +    /**
>>> +     * @counter: implements simple exclusive/lockdown logic:
>>> +     *           if == 0 then guard/feature is idle/not in use,
>>> +     *           if < 0 then feature is active and can't be locked-down,
>>> +     *           if > 0 then feature is lockded-down and can't be activated.
>>> +     */
>>> +    int counter;
>>> +
>>> +    /** @name: the name of the guard (useful for debug) */
>>> +    const char *name;
>>> +
>>> +    /** @owner: the info about the last owner of the guard (for debug) */
>>> +    void *owner;
>>> +
>>> +    /** @lock: protects guard's data */
>>> +    spinlock_t lock;
>>> +};
>>> +
>>> +/**
>>> + * xe_guard_init() - Initialize the guard.
>>> + * @guard: the &xe_guard to init
>>> + * @name: name of the guard
>>> + */
>>> +static inline void xe_guard_init(struct xe_guard *guard, const char *name)
>>> +{
>>> +    spin_lock_init(&guard->lock);
>>> +    guard->counter = 0;
>>> +    guard->name = name;
>>> +}
>>> +
>>> +/**
>>> + * xe_guard_arm() - Arm the guard for the exclusive/lockdown mode.
>>> + * @guard: the &xe_guard to arm
>>> + * @lockdown: arm for lockdown(true) or exclusive(false) mode
>>> + * @who: optional owner info (for debug only)
>>> + *
>>> + * Multiple lockdown requests are allowed.
>>> + * Only single exclusive access can be granted.
>>> + * Will fail if the guard is already in exclusive mode.
>>> + * On success, must call the xe_guard_disarm() to release.
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>
>> I am not sold on the arm/disarm and exclusive/lockdown naming. Something like 'get/put' and 'exclusive/shared' sounds more familiar, but that's just a personal opinion.
> 
> actually I was considering "lockdown_get|put" and "exclusive_get|put" but still was afraid of being accused of using misleading tags used elsewhere

The initial confusion was with regard to locks, get|put is usually used 
for ref counting and to me this is some form of it.


> 
> also note that "shared" is actually a bad term here, as in our case we are not going to "share" the feature with anyone, there just might be collective requests to "block" the feature

It's called 'xe_guard' so it made sense to me that a 'guard' can be 
shared. But again, that's just a personal opinion on naming, feel free 
to ignore.

Regards,
Christoph

> 
> and this is how I ended with the "lockdown" naming
> 
>>
>> None the less the solution looks clean and does what it should so:
>>
>> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> thanks, but you have to wait for another rev anyway (see below)
> 
>>
>> Regards,
>> Christoph
>>
> 
> ...
> 
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
>>> index cba3fde9581f..b5bee3a549c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
>>> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>>>    int xe_sriov_pf_init_early(struct xe_device *xe);
>>>    int xe_sriov_pf_init_late(struct xe_device *xe);
>>>    int xe_sriov_pf_wait_ready(struct xe_device *xe);
>>> +int xe_sriov_pf_lockdown(struct xe_device *xe);
>>> +void xe_sriov_pf_end_lockdown(struct xe_device *xe);
>>>    void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>>>    #else
>>>    static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>>>    static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>>>    static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
>>> +int xe_sriov_pf_lockdown(struct xe_device *xe) { return 0; }
>>> +void xe_sriov_pf_end_lockdown(struct xe_device *xe) { }
> 
> those stubs shall be "static inline"

