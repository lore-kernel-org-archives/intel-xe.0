Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E5C001DE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 09:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B7910E45E;
	Wed, 26 Jul 2023 09:03:44 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA4710E440
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690362223; x=1721898223;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cyv4djMHyRdPfGWzOr40QorQQhZ3z9TboJMmYMZAXgM=;
 b=DJdhj0xnt1fxUqmdvapV/lffrWozN5rxSyF8N2IfXc9JNS1uedZC/ake
 DCqBMuZBg+V6USM+byMWYiM/iOuIajLfHRN5X/MlN2btLZzFCcpPSMYqo
 rDYFWJ42xKVNJRtO6eSGMe3UbpILIjhZJN+eVkH787/cmCTuTEqlaEABI
 GbdVF6IunPXGf8POzBjZ9xqdnorshFjkAxaY61qeCOxVqbSt4t3ZAN0Qd
 UmVJx3dzcMnHCEz2WwiD2E7ZSvZ8vPCVSXYsfGy6Ivsd0n7FfxGc5IHFp
 A0ksu5f4VOIkMqgGJDUdG7fl8XEMTtygDFUMWBlMRVoGWRVmatLdniXCG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431762967"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="431762967"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 02:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="756143730"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="756143730"
Received: from cmchugh-mobl.ger.corp.intel.com (HELO [10.252.31.174])
 ([10.252.31.174])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 02:03:41 -0700
Message-ID: <6b6356d9-c096-94bf-4fb7-52d43ec9418a@intel.com>
Date: Wed, 26 Jul 2023 10:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230725110116.114688-2-matthew.auld@intel.com>
 <ZL/XBN7wCqeEKLn2@intel.com> <420d1aa9-c2e6-03e3-a6c0-c5cbbc067b6e@intel.com>
 <ZL/9pkLpBBRBTF8f@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZL/9pkLpBBRBTF8f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/engine: add missing rpm for bind
 engines
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 25/07/2023 17:51, Rodrigo Vivi wrote:
> On Tue, Jul 25, 2023 at 04:11:41PM +0100, Matthew Auld wrote:
>> On 25/07/2023 15:07, Rodrigo Vivi wrote:
>>> On Tue, Jul 25, 2023 at 12:01:17PM +0100, Matthew Auld wrote:
>>>> Bind engines need to use the migration vm, however we don't have any rpm
>>>> for such a vm, otherwise the kernel would prevent rpm suspend-resume.
>>>> There are two issues here, first is the actual engine create which needs
>>>> to touch the lrc, but since that is in VRAM we trigger loads of missing
>>>> mem_access asserts.
>>>
>>> with this in mind, should we really create the new ENGINE_FLAG_HOLD_RPM,
>>> or should we simply use the existent ENGINE_FLAG_VM?
>>
>> Sure, I can do that instead.
> 
> What I'm not so sure is about the extra case that that would bring:
> 
> at xe_vm_create()
> if (!(flags & XE_VM_FLAG_MIGRATION))

I think in that case the vm is holding the rpm, but looking at the 
destroy path the bind engines vs final vm destroy could happen in any 
order since it appears to be async. The engine destroy gets pushed 
through the scheduler or something which has its own kthread, and the vm 
destroy is pushed onto workqueue. So I think we do want an explicit rpm 
ref there also.

> 
>>
>>>
>>>> The second issue is when destroying the actual
>>>> engine, which requires GuC CT to deregister the context.
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
>>>
>>> I wonder if we should get the mem_acceess from inside the ct path
>>> to be sure?
>>
>> Do you mean calling xe_device_mem_access_get() in ct_send()? I think that
>> will give various locking issues since any locks the caller is holding you
>> then can't ever grab in the suspend/resume callbacks without deadlocking.
>> And the callers of ct_send() are all over the place, and some are quite deep
>> down. Also some callers expect some future CT response so holding in
>> ct_send() is only one side, and would need to be kept held over to the wait
>> side.
> 
> hmm indeed! And I think we had already discussed that in the past...
> sorry for the noise
> 
>>
>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_engine.c       | 20 ++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_engine_types.h |  1 +
>>>>    2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>>>> index 59e0a9e085ba..dba71f53e53e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_engine.c
>>>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>>>> @@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>>>>    	if (err)
>>>>    		goto err_lrc;
>>>> +	/*
>>>> +	 * Normally the user vm holds an rpm ref to keep the device awake, and
>>>> +	 * the context holds a ref for the vm, however for some engines we use
>>>> +	 * the kernels migrate vm underneath which offers no such rpm ref. Make
>>>> +	 * sure we keep a ref here, so we can perform GuC CT actions when
>>>> +	 * needed. Caller is expected to have already grabbed the rpm ref
>>>> +	 * outside any sensitive locks.
>>>> +	 */
>>>> +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
>>>> +		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
>>>> +
>>>>    	return e;
>>>>    err_lrc:
>>>> @@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
>>>>    		xe_lrc_finish(e->lrc + i);
>>>>    	if (e->vm)
>>>>    		xe_vm_put(e->vm);
>>>> +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
>>>> +		xe_device_mem_access_put(gt_to_xe(e->gt));
>>>>    	kfree(e);
>>>>    }
>>>> @@ -560,14 +573,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>>>>    			if (XE_IOCTL_DBG(xe, !hwe))
>>>>    				return -EINVAL;
>>>> +			/* The migration vm doesn't hold rpm ref */
>>>> +			xe_device_mem_access_get(xe);
>>>> +
>>>>    			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>>>>    			new = xe_engine_create(xe, migrate_vm, logical_mask,
>>>>    					       args->width, hwe,
>>>> +					       ENGINE_FLAG_HOLD_RPM |
>>>>    					       ENGINE_FLAG_PERSISTENT |
>>>>    					       ENGINE_FLAG_VM |
>>>>    					       (id ?
>>>>    					       ENGINE_FLAG_BIND_ENGINE_CHILD :
>>>>    					       0));
>>>> +
>>>> +			xe_device_mem_access_put(xe); /* now held by engine */
>>>> +
>>>>    			xe_vm_put(migrate_vm);
>>>>    			if (IS_ERR(new)) {
>>>>    				err = PTR_ERR(new);
>>>> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
>>>> index 36bfaeec23f4..a3867e4db0bb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_engine_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
>>>> @@ -59,6 +59,7 @@ struct xe_engine {
>>>>    #define ENGINE_FLAG_VM			BIT(4)
>>>>    #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>>>>    #define ENGINE_FLAG_WA			BIT(6)
>>>> +#define ENGINE_FLAG_HOLD_RPM		BIT(7)
>>>>    	/**
>>>>    	 * @flags: flags for this engine, should statically setup aside from ban
>>>> -- 
>>>> 2.41.0
>>>>
