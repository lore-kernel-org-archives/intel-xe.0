Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1563CD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 12:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D9010E7A3;
	Mon,  1 Jun 2026 12:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldjG/I2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705FE10E7A3
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780315309; x=1811851309;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6xEhnlKK7ZlkDqcUSGtO041ICWC0sPmKbWyTpW9cEvs=;
 b=ldjG/I2PbYVW0sllWZUKpLHtRAGy6gH/++/yQ6Emp+KVBekNIALD7p4S
 /F9yHeVs7IBkCnzmQjZ9fPeXozGHH7KR/zhKr2ZLmkVHNUjC9xynse7XI
 bKZv3jAAiucAaViAsyBv0PRvHiQRL7C+5O1pG4uSVv5Iq6YoG0bMQL+MG
 cwsLOCBVQvv2k1ewfxE4Z0gyNB+cpKXzZAZf2wt6hKax9MRIMmK47cq2t
 a0cZGnP68wZRpGSmMWNEXghM1ITdNJfyko7e2wiOH+oTHvHDi7ZY8+t7j
 E729ozhKszXkGLAdjoH0oqMkrbQAeIxjzHOmNuWrhN6wsSP+2+T1GcIo1 g==;
X-CSE-ConnectionGUID: c32UgjtHR+GJaoyh/nkF4w==
X-CSE-MsgGUID: Lpk5ftuxTgKuMh2yUAi8Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92452247"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92452247"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:01:49 -0700
X-CSE-ConnectionGUID: TtFYD29wQlCMTTH2+NgJ4w==
X-CSE-MsgGUID: IBi+Mt/pTU6tTgPzh4/oaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242743594"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.132])
 ([10.245.245.132])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:01:47 -0700
Message-ID: <b9b9e20f-703d-4e43-bd1a-17d8bbcead70@intel.com>
Date: Mon, 1 Jun 2026 13:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix UAF in xe_gem_prime_import() on attach failure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: stable@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20260601101536.1333480-2-nitin.r.gote@intel.com>
 <ff4a02f0-5a59-4bad-af76-3d71146f136e@intel.com>
 <5e3854dd-d6ad-4110-966e-9029ef7c2374@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <5e3854dd-d6ad-4110-966e-9029ef7c2374@amd.com>
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

On 01/06/2026 12:39, Christian König wrote:
> 
> 
> On 6/1/26 12:46, Matthew Auld wrote:
>> On 01/06/2026 11:15, Nitin Gote wrote:
>>> xe_dma_buf_create_obj() creates the importer BO with obj->resv
>>> pointing at the exporter's dma_buf->resv. When dma_buf_dynamic_attach()
>>> fails, no dma_buf reference is held so the exporter can be freed
>>> immediately. Since ttm_bo_release() now always defers cleanup for
>>> ttm_bo_type_sg BOs to the TTM workqueue, the worker later calls
>>> dma_resv_lock() on the already-freed exporter resv, causing a UAF.
>>>
>>> Reset obj->resv to the BO's private _resv before calling xe_bo_put()
>>> in the error path. The BO is not yet published (attach failed) and
>>> carries no fences, so the switch is safe.
>>>
>>> Observed with igt@xe_live_ktest@xe_dma_buf_kunit on BMG (QEMU):
>>>
>>>     Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b9c
>>>     Workqueue: ttm ttm_bo_delayed_delete [ttm]
>>>     RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0
>>>     Call Trace:
>>>      <TASK>
>>>      ? __ww_mutex_lock.constprop.0+0x2dd/0x18e0
>>>      ? ttm_bo_delayed_delete+0x41/0xc0 [ttm]
>>>      ww_mutex_lock+0x3c/0xb0
>>>      ttm_bo_delayed_delete+0x41/0xc0 [ttm]
>>>      process_one_work+0x239/0x740
>>>      worker_thread+0x200/0x3f0
>>>      kthread+0x10d/0x150
>>>      ret_from_fork+0x3bd/0x470
>>>      ret_from_fork_asm+0x1a/0x30
>>>      </TASK>
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
>>> Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed cleanup path for imported bos")
>>> Cc: stable@vger.kernel.org # v6.8+
>>> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_dma_buf.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>>> index 8a920e58245c..6d944bd4065c 100644
>>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>>> @@ -384,6 +384,14 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>>>          attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, obj);
>>>        if (IS_ERR(attach)) {
>>> +        /*
>>> +         * The BO was created with resv = dma_buf->resv (exporter's
>>> +         * resv). Since attach failed, no dma_buf reference is held and
>>> +         * the exporter may be freed before TTM's delayed_delete worker
>>> +         * runs. Switch to the BO's own resv to prevent a UAF when
>>> +         * ttm_bo_delayed_delete() tries to lock the stale pointer.
>>> +         */
>>> +        obj->resv = &obj->_resv;
>>
>> +Christian, does amdgpu not have the type of same issue here? Also any thoughts here?
> 
> Oh, good catch. Yeah I think we have the same problem on amdgpu as well.

Maybe dumb question, but why does the ttm_bo_individualize_resv() skip 
the final switch of the resv for type_sg? It goes through the trouble of 
copying the fences across?

If we do need to handle this here, do we also need to grab the lru lock, 
like we do in ttm_bo_individualize_resv() when doing the swap?

Ideally xe and amdgpu can just have identical solutions here.

> 
> How the heck did you found that? Do we have a dummy driver (VGEM?) which could be made to always fail attachment for a test case?
> 
> @Vitaly can you take a look and try to come up with a test case for that? Thanks in advance.
> 
> Thanks for the notice,
> Christian.
> 
>>
>>>            xe_bo_put(gem_to_xe_bo(obj));
>>>            return ERR_CAST(attach);
>>>        }
>>
> 

