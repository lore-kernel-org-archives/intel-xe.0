Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF2C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9630D10E140;
	Tue, 25 Jul 2023 15:11:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762E610E140
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690297905; x=1721833905;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kvue03kioz7OBHb52SfeLWespQPALKJZDJV4vg706to=;
 b=UZV0kMvv4IoClHx7rGDWYGuN29M1cgCVF/JA48fQ7b50ZOT6+vEYdWvT
 ftJB/ZWfdRyIHHvmZlb+4Wkz4ZRb/YRfjq7UgvaPfaTUY0xB5WJ7K4Xru
 Cb3w0OLsc4EQe1sXrbuUoxiNOxn0jawGW35UP96WqTmzcWKfgt48Adc5M
 1HYw6IMZfCis16SSSRAbmJIM5H5mkRLn/thhmVBWw8ZeNTdM/8cFAcN4R
 2CP5ggbELAzqbIuq6p9VrBTgCvIpzL7Pa6hnA2vTJEObcS8yUHSwOkN/k
 QAk6Xn6ryDN3RY0odgnBeusGW9ptLuz2EMEQ3YrieZIiLUyfXFGMvkT8k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365218272"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="365218272"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="703317771"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="703317771"
Received: from kkbrenna-mobl1.ger.corp.intel.com (HELO [10.252.31.100])
 ([10.252.31.100])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:11:43 -0700
Message-ID: <420d1aa9-c2e6-03e3-a6c0-c5cbbc067b6e@intel.com>
Date: Tue, 25 Jul 2023 16:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230725110116.114688-2-matthew.auld@intel.com>
 <ZL/XBN7wCqeEKLn2@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZL/XBN7wCqeEKLn2@intel.com>
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

On 25/07/2023 15:07, Rodrigo Vivi wrote:
> On Tue, Jul 25, 2023 at 12:01:17PM +0100, Matthew Auld wrote:
>> Bind engines need to use the migration vm, however we don't have any rpm
>> for such a vm, otherwise the kernel would prevent rpm suspend-resume.
>> There are two issues here, first is the actual engine create which needs
>> to touch the lrc, but since that is in VRAM we trigger loads of missing
>> mem_access asserts.
> 
> with this in mind, should we really create the new ENGINE_FLAG_HOLD_RPM,
> or should we simply use the existent ENGINE_FLAG_VM?

Sure, I can do that instead.

> 
>> The second issue is when destroying the actual
>> engine, which requires GuC CT to deregister the context.
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
> 
> I wonder if we should get the mem_acceess from inside the ct path
> to be sure?

Do you mean calling xe_device_mem_access_get() in ct_send()? I think 
that will give various locking issues since any locks the caller is 
holding you then can't ever grab in the suspend/resume callbacks without 
deadlocking. And the callers of ct_send() are all over the place, and 
some are quite deep down. Also some callers expect some future CT 
response so holding in ct_send() is only one side, and would need to be 
kept held over to the wait side.

> 
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_engine.c       | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_engine_types.h |  1 +
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>> index 59e0a9e085ba..dba71f53e53e 100644
>> --- a/drivers/gpu/drm/xe/xe_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>> @@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>>   	if (err)
>>   		goto err_lrc;
>>   
>> +	/*
>> +	 * Normally the user vm holds an rpm ref to keep the device awake, and
>> +	 * the context holds a ref for the vm, however for some engines we use
>> +	 * the kernels migrate vm underneath which offers no such rpm ref. Make
>> +	 * sure we keep a ref here, so we can perform GuC CT actions when
>> +	 * needed. Caller is expected to have already grabbed the rpm ref
>> +	 * outside any sensitive locks.
>> +	 */
>> +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
>> +		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
>> +
>>   	return e;
>>   
>>   err_lrc:
>> @@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
>>   		xe_lrc_finish(e->lrc + i);
>>   	if (e->vm)
>>   		xe_vm_put(e->vm);
>> +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
>> +		xe_device_mem_access_put(gt_to_xe(e->gt));
>>   
>>   	kfree(e);
>>   }
>> @@ -560,14 +573,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>>   			if (XE_IOCTL_DBG(xe, !hwe))
>>   				return -EINVAL;
>>   
>> +			/* The migration vm doesn't hold rpm ref */
>> +			xe_device_mem_access_get(xe);
>> +
>>   			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>>   			new = xe_engine_create(xe, migrate_vm, logical_mask,
>>   					       args->width, hwe,
>> +					       ENGINE_FLAG_HOLD_RPM |
>>   					       ENGINE_FLAG_PERSISTENT |
>>   					       ENGINE_FLAG_VM |
>>   					       (id ?
>>   					       ENGINE_FLAG_BIND_ENGINE_CHILD :
>>   					       0));
>> +
>> +			xe_device_mem_access_put(xe); /* now held by engine */
>> +
>>   			xe_vm_put(migrate_vm);
>>   			if (IS_ERR(new)) {
>>   				err = PTR_ERR(new);
>> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
>> index 36bfaeec23f4..a3867e4db0bb 100644
>> --- a/drivers/gpu/drm/xe/xe_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
>> @@ -59,6 +59,7 @@ struct xe_engine {
>>   #define ENGINE_FLAG_VM			BIT(4)
>>   #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>>   #define ENGINE_FLAG_WA			BIT(6)
>> +#define ENGINE_FLAG_HOLD_RPM		BIT(7)
>>   
>>   	/**
>>   	 * @flags: flags for this engine, should statically setup aside from ban
>> -- 
>> 2.41.0
>>
