Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D7C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 10:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553B310E0A8;
	Tue, 13 Jun 2023 10:14:04 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CADB10E0A8
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686651242; x=1718187242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Roaxor2F1xrSjK9iho15lWkJD/eoxaaUq/jkHtUq9pg=;
 b=AU38JX1IVfi/M+8xhL7juJSya1v699oOaK4npiVpFckyQCfg0N9TtTmj
 U3dSrFt/NVmxea3ahOWD4hDTZD8Vww7GIXgBC9P53N8gp7tKMAnbJbv6b
 IGOfOVxzxP2zN5rX0eXlSU5FIsh74pLE/uyTBIDUwqkT6sdCRFOdaRAwR
 yiq42ACDywmi7MDT5TbDZX2gX6LjxubcHzf32Z8nebR5Mj0BRYJhznCkq
 pTikhFAa5JWODyx0LOAYwSl1cwN5QvGGzoI+DnFxx/bzirU8RmUJyLhSY
 fu/nLMqLUCylBPFsvRSXFhnirX5h945D289nGLkQPE1Mr3iigaoszpLLS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358285858"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="358285858"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 03:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="741372761"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="741372761"
Received: from tomdoylx-mobl1.ger.corp.intel.com (HELO [10.252.5.196])
 ([10.252.5.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 03:13:59 -0700
Message-ID: <c67b6160-948c-5546-1d70-987a1414fe0e@intel.com>
Date: Tue, 13 Jun 2023 11:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.1
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-13-matthew.auld@intel.com>
 <4a279965b6b113b994e16ebd87894ec543e9badd.camel@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <4a279965b6b113b994e16ebd87894ec543e9badd.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v11 12/12] drm/xe: add lockdep annotation for
 xe_device_mem_access_get()
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 13/06/2023 10:42, Thomas Hellström wrote:
> On Mon, 2023-06-12 at 18:12 +0100, Matthew Auld wrote:
>> The atomics here might hide potential issues, so add a dummy lock
>> with
>> the idea that xe_pm_runtime_resume() is eventually going to be called
>> when we are holding it. This only need to happen once and then
>> lockdep
>> can validate all callers and their locks.
> 
> This looks pretty similar to the fs_reclaim_[acquire|release]
> functionality.
> 
> Instead of using a per-device mutex, could you use a static struct
> lockdep map, similar to how __fs_reclaim_map is defined in
> mm/page_alloc.c or dma_fence_lockdep_map?

Yes, that sounds cleaner. Will fix.

> 
> Otherwise LGTM.
> 
> /Thomas
> 
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 1dc552da434f..3011a72da42f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -225,6 +225,8 @@ struct xe_device *xe_device_create(struct pci_dev
>> *pdev,
>>          if (WARN_ON(err))
>>                  goto err_put;
>>   
>> +       drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
>> +
>>          return xe;
>>   
>>   err_put:
>> @@ -443,6 +445,22 @@ void xe_device_mem_access_get(struct xe_device
>> *xe)
>>          if (xe_pm_read_callback_task(xe) == current)
>>                  return;
>>   
>> +       /*
>> +        * Since the resume here is synchronous it can be quite easy
>> to deadlock
>> +        * if we are not careful. Also in practice it might be quite
>> timing
>> +        * sensitive to ever see the 0 -> 1 transition with the
>> callers locks
>> +        * held, so deadlocks might exist but are hard for lockdep to
>> ever see.
>> +        * With this in mind, help lockdep learn about the
>> potentially scary
>> +        * stuff that can happen inside the runtime_resume callback
>> by acquiring
>> +        * a dummy lock (it doesn't protect anything and gets
>> compiled out on
>> +        * non-debug builds).  Lockdep then only needs to see the
>> +        * mem_access.lock -> runtime_resume callback once, and then
>> can
>> +        * hopefully validate all the (callers_locks) ->
>> mem_access.lock. For
>> +        * example if the (callers_locks) are ever grabbed in the
>> runtime_resume
>> +        * callback, lockdep should give us a nice splat.
>> +        */
>> +       lock_map_acquire(&xe->mem_access.lock.dep_map);
>> +
>>          if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
>>                  bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
>>                  int ref;
>> @@ -455,6 +473,8 @@ void xe_device_mem_access_get(struct xe_device
>> *xe)
>>          } else {
>>                  XE_WARN_ON(atomic_read(&xe->mem_access.ref) ==
>> S32_MAX);
>>          }
>> +
>> +       lock_map_release(&xe->mem_access.lock.dep_map);
>>   }
>>   
>>   void xe_device_mem_access_put(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index a39f3d3f3bc7..82b80e3f2d44 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -323,6 +323,14 @@ struct xe_device {
>>           * triggering additional actions when they occur.
>>           */
>>          struct {
>> +               /**
>> +                * @lock: Dummy lock used as lockdep aid to hopefully
>> ensure
>> +                * that lockep can more easily see any potential
>> deadlocks when
>> +                * calling xe_device_mem_access_get().
>> +                *
>> +                * Doesn't protect anything.
>> +                */
>> +               struct mutex lock;
>>                  /** @ref: ref count of memory accesses */
>>                  atomic_t ref;
>>                  /** @hold_rpm: need to put rpm ref back at the end */
> 
