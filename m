Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B308FCD6E6B
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 11:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675C0113F5B;
	Thu,  4 Jun 2026 11:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frejZJRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C44F113F5A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 11:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780572755; x=1812108755;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KP5L3T5uPqbd53j7pFXmfAoo96kovomNPitjY4tgJqs=;
 b=frejZJRbQ5tB2V3qCYbTwUrawiDOs7fgowcY33SYXQJcL1GCXsjviD7y
 9MlOQ/KQ3oHJ/diCQId2BnW7+6HhkgTa3H3ZvamL/EL9KiScdR+/8D9XV
 h6nKb+7DoI3gKT3OM61+eDl9yLp/4Egq3eECl5IKXUQkkb1KrXvAQE/1S
 1ulEuu3ffnCMvBxK06Grdwc0i2wMqXne2cM5/eG2PdkTnuLN3LPnI28cr
 yfqLjbFc+W8sJARLxAelGmycaRH323HtZS7FphoFlygSUxCVI83Id6Esz
 u8mkOnCEsqTzWF4wEEh6h9Kn+T5sQ/fIXEBIJVuKiaJ4AeEWLLHIrc6WW Q==;
X-CSE-ConnectionGUID: CsjaiYaDSi2E29soGKUC8w==
X-CSE-MsgGUID: 9xxHbhqbTdWlrRi3odZK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85251669"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="85251669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 04:32:35 -0700
X-CSE-ConnectionGUID: ssF7PsHHRraadLi5uA3nbw==
X-CSE-MsgGUID: x3JlOGNzTr+0eHMMaAYK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="249440351"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.94])
 ([10.245.245.94])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 04:32:32 -0700
Message-ID: <7269ac80-1470-46d6-bf2d-75b5ab7acf91@intel.com>
Date: Thu, 4 Jun 2026 12:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix UAF in xe_gem_prime_import() on attach failure
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Gote, Nitin R" <nitin.r.gote@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20260601101536.1333480-2-nitin.r.gote@intel.com>
 <ff4a02f0-5a59-4bad-af76-3d71146f136e@intel.com>
 <5e3854dd-d6ad-4110-966e-9029ef7c2374@amd.com>
 <b9b9e20f-703d-4e43-bd1a-17d8bbcead70@intel.com>
 <157c5cfc-b0a5-4ee9-b91a-909e87df3080@amd.com>
 <SA3PR11MB8118477615C02DD99CA966F7D0152@SA3PR11MB8118.namprd11.prod.outlook.com>
 <SA3PR11MB8118C54C085BCAF117582849D0102@SA3PR11MB8118.namprd11.prod.outlook.com>
 <9d26ec14323cb5a54e2b6e58cb177a4a7eb3652a.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <9d26ec14323cb5a54e2b6e58cb177a4a7eb3652a.camel@linux.intel.com>
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

On 04/06/2026 12:14, Thomas Hellström wrote:
> Hi,
> 
> On Thu, 2026-06-04 at 04:54 +0000, Gote, Nitin R wrote:
>> Hi,
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
>>> Of Gote, Nitin
>>> R
>>> Sent: Monday, June 1, 2026 8:57 PM
>>> To: Christian König <christian.koenig@amd.com>; Auld, Matthew
>>> <matthew.auld@intel.com>; intel-xe@lists.freedesktop.org; Christian
>>> König
>>> <ckoenig.leichtzumerken@gmail.com>
>>> Cc: stable@vger.kernel.org; Thomas Hellstrom
>>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>>> <matthew.brost@intel.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
>>> Subject: RE: [PATCH] drm/xe: Fix UAF in xe_gem_prime_import() on
>>> attach failure
>>>
>>> Hi Christian,
>>>
>>>> -----Original Message-----
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: Monday, June 1, 2026 5:47 PM
>>>> To: Auld, Matthew <matthew.auld@intel.com>; Gote, Nitin R
>>>> <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.org;
>>>> Christian
>>>> König <ckoenig.leichtzumerken@gmail.com>
>>>> Cc: stable@vger.kernel.org; Thomas Hellstrom
>>>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>>>> <matthew.brost@intel.com>; Prosyak, Vitaly
>>>> <Vitaly.Prosyak@amd.com>
>>>> Subject: Re: [PATCH] drm/xe: Fix UAF in xe_gem_prime_import() on
>>>> attach failure
>>>>
>>>> On 6/1/26 14:01, Matthew Auld wrote:
>>>>> On 01/06/2026 12:39, Christian König wrote:
>>>>>>
>>>>>>
>>>>>> On 6/1/26 12:46, Matthew Auld wrote:
>>>>>>> On 01/06/2026 11:15, Nitin Gote wrote:
>>>>>>>> xe_dma_buf_create_obj() creates the importer BO with obj-
>>>>>>>>> resv
>>>>>>>> pointing at the exporter's dma_buf->resv. When
>>>>>>>> dma_buf_dynamic_attach() fails, no dma_buf reference is
>>>>>>>> held so
>>>>>>>> the exporter can be freed immediately. Since
>>>>>>>> ttm_bo_release() now
>>>>>>>> always defers cleanup for ttm_bo_type_sg BOs to the TTM
>>>>>>>> workqueue, the worker later calls
>>>>>>>> dma_resv_lock() on the already-freed exporter resv,
>>>>>>>> causing a UAF.
>>>>>>>>
>>>>>>>> Reset obj->resv to the BO's private _resv before calling
>>>>>>>> xe_bo_put() in the error path. The BO is not yet
>>>>>>>> published
>>>>>>>> (attach
>>>>>>>> failed) and carries no fences, so the switch is safe.
>>>>>>>>
>>>>>>>> Observed with igt@xe_live_ktest@xe_dma_buf_kunit on BMG
>>>>>>>> (QEMU):
>>>>>>>>
>>>>>>>>      Oops: general protection fault, probably for non-
>>>>>>>> canonical
>>>>>>>> address 0x6b6b6b6b6b6b6b9c
>>>>>>>>      Workqueue: ttm ttm_bo_delayed_delete [ttm]
>>>>>>>>      RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0
>>>>>>>>      Call Trace:
>>>>>>>>       <TASK>
>>>>>>>>       ? __ww_mutex_lock.constprop.0+0x2dd/0x18e0
>>>>>>>>       ? ttm_bo_delayed_delete+0x41/0xc0 [ttm]
>>>>>>>>       ww_mutex_lock+0x3c/0xb0
>>>>>>>>       ttm_bo_delayed_delete+0x41/0xc0 [ttm]
>>>>>>>>       process_one_work+0x239/0x740
>>>>>>>>       worker_thread+0x200/0x3f0
>>>>>>>>       kthread+0x10d/0x150
>>>>>>>>       ret_from_fork+0x3bd/0x470
>>>>>>>>       ret_from_fork_asm+0x1a/0x30
>>>>>>>>       </TASK>
>>>>>>>>
>>>>>>>> Closes:
>>>>>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
>>>>>>>> Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed
>>>>>>>> cleanup
>>>>>>>> path for imported bos")
>>>>>>>> Cc: stable@vger.kernel.org # v6.8+
>>>>>>>> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/xe/xe_dma_buf.c | 8 ++++++++
>>>>>>>>     1 file changed, 8 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_dma_buf.c index
>>>>>>>> 8a920e58245c..6d944bd4065c
>>>>>>>> 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>>>>>>>> @@ -384,6 +384,14 @@ struct drm_gem_object
>>>>>>>> *xe_gem_prime_import(struct drm_device *dev,
>>>>>>>>           attach = dma_buf_dynamic_attach(dma_buf, dev-
>>>>>>>>> dev,
>>>>>>>> attach_ops, obj);
>>>>>>>>         if (IS_ERR(attach)) {
>>>>>>>> +        /*
>>>>>>>> +         * The BO was created with resv = dma_buf->resv
>>>>>>>> +(exporter's
>>>>>>>> +         * resv). Since attach failed, no dma_buf
>>>>>>>> reference is
>>>>>>>> +held and
>>>>>>>> +         * the exporter may be freed before TTM's
>>>>>>>> delayed_delete
>>>>>>>> +worker
>>>>>>>> +         * runs. Switch to the BO's own resv to prevent
>>>>>>>> a UAF
>>>>>>>> +when
>>>>>>>> +         * ttm_bo_delayed_delete() tries to lock the
>>>>>>>> stale pointer.
>>>>>>>> +         */
>>>>>>>> +        obj->resv = &obj->_resv;
>>>>>>>
>>>>>>> +Christian, does amdgpu not have the type of same issue
>>>>>>> here? Also
>>>>>>> +any
>>>> thoughts here?
>>>>>>
>>>>>> Oh, good catch. Yeah I think we have the same problem on
>>>>>> amdgpu as well.
>>>>>
>>>>> Maybe dumb question, but why does the
>>>>> ttm_bo_individualize_resv()
>>>>> skip the
>>>> final switch of the resv for type_sg?
>>>>
>>>> Because we need the original resv object for cleaning up the
>>>> mapping
>>>> should the initial attach and then map have succeed.
>>>>
>>>>> It goes through the trouble of copying the fences across?
>>>>
>>>> Because we need to know when the import can be cleaned up.
>>>>
>>>> In other words TTM takes a copy of the current fences and only
>>>> unmap,
>>>> detach and then do the final cleanup after we are sure that the
>>>> set of
>>>> fences which was active on destruction is now signaled.
>>>>
>>>> If new fences are added to the resv object (maybe by the exporter
>>>> itself or other
>>>> importers) after our reference count got down to zero then we
>>>> don't
>>>> care about that.
>>>>> If we do need to handle this here, do we also need to grab the
>>>>> lru
>>>>> lock, like we
>>>> do in ttm_bo_individualize_resv() when doing the swap?
>>>>
>>>> Good question, of hand I would say yes but I clearly need to
>>>> check the
>>>> source code as well.
>>>>
>>>> Might be better to switch the type of the BO on error so that the
>>>> normal cleanup will just switch over to the local dma_resv
>>>> object.
>>>>
>>>
>>> -               obj->resv = &obj->_resv;
>>> +               gem_to_xe_bo(obj)->ttm.type = ttm_bo_type_kernel;
>>>
>>> Switching the type to ttm_bo_type_kernel lets
>>> ttm_bo_individualize_resv() swap
>>> resv to the BO's private _resv under lru_lock, which prevents UAF
>>> without
>>> needing any manual locking.
> 
> The lru lock is IIRC only needed and safe when the ttm refcount is zero
> (in the TTM destruction path) to protect against a racing LRU walk
> trylock succeeds against the incorrect resv.
> 
> I wonder whether this was actually why xe code initially took care not
> to publish the bo on the LRUs until the attachment succeeded.
> 
> A TTM LRU walker may pick up the exporting resv as soon as the resource
> is published on the LRU, and then try to lock it using
> ttm_lru_walk_ticketlock(). The lru lock doesn't protect against that.
>   
> So we have a sort of moment22, since with that approach move_notify()
> could be called without the bo being fully initialized.
> 
> One way to move forward would perhaps be to, for now, reinstate that
> and have move_notify check if the bo is a stub or fully initialized
> before doing anything.
> 
> Also perhaps we should in the future consider allowing dma-buf
> attachment removal under a separate lower-level lock than the resv.

Is it plausible to check for drm_gem_is_imported() in 
ttm_bo_individualize_resv()? If sg && !imported then it should be safe 
to swap out the resv?

> 
> Thanks,
> Thomas
> 
> 
>>
>> Checked all bo->type readers (xe_evict_flags(), xe_bo_move(),
>> xe_bo_can_migrate()) and found they can be called concurrently by the
>> shrinker or eviction paths without any synchronization, making the
>> bo->type change unsafe.
>>
>> Switching resv to &obj->_resv under lru_lock, mirroring
>> ttm_bo_individualize_resv(), is the more reasonable.
>> I'll send this as v2, along with a separate patch fixing the same
>> issue in amdgpu.
>>
>> - Nitin
>>
>>>> Since we don't need the original dma_resv for the cleanup that
>>>> should work
>>> fine.
>>>>
>>>>> Ideally xe and amdgpu can just have identical solutions here.
>>>>
>>>> Yeah completely agree.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> How the heck did you found that? Do we have a dummy driver
>>>>>> (VGEM?)
>>>>>> which
>>>> could be made to always fail attachment for a test case?
>>>
>>> The bug was found via the existing KUnit test (xe_dma_buf_kunit),
>>> which was
>>> failing on a BMG VM device. The test runs 20 parameter
>>> combinations.
>>> the failing ones use force_different_devices=true +
>>> mem_mask=XE_BO_FLAG_VRAM0 + nop2p_attach_ops, where
>>> dma_buf_dynamic_attach() returns -EOPNOTSUPP, hitting the error
>>> path.
>>>
>>> On bare metal BMG the race window is too narrow to hit the issue.
>>> To make it
>>> more deterministic, added a small msleep(100) in
>>> ttm_bo_delayed_delete() just
>>> before the dma_resv_lock() call, which widened the race window.
>>> With KASAN enabled, that gave a clear slab-use-after-free in
>>> __ww_mutex_lock
>>> — the 0x6b6b6b6b SLUB poison pattern in the faulting address
>>> confirmed the
>>> UAF.
>>>
>>> Thanks,
>>> Nitin
>>>
>>>>>>
>>>>>> @Vitaly can you take a look and try to come up with a test
>>>>>> case for that?
>>>> Thanks in advance.
>>>>>>
>>>>>> Thanks for the notice,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>>             xe_bo_put(gem_to_xe_bo(obj));
>>>>>>>>             return ERR_CAST(attach);
>>>>>>>>         }
>>>>>>>
>>>>>>
>>>>>

