Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D08CD3427
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 09:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7155910F045;
	Thu,  7 May 2026 09:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erjTrUsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E456410F002
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 09:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778144637; x=1809680637;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8KKCqCLdP7VcTPidivBPuZRSXLAgixp2kuM6JXfRflQ=;
 b=erjTrUsrbuJjmEAHhAAAka9gZx8rwbygp3aepPR5/I0uuAzxHYnPgZZH
 aXvJRxgwc8VASSbJn96qmzvqx+pMEz74P86kldDRUshZsfcOJaTHIvzcT
 8trmUROZ/84AmXLa96Bc5NP66oD8+Lkm7QuD7hPXTYLFYaCYxOAgBUtD5
 pCQWqzRSDVUWKxzFZQzhnJ8kzgDZYDkXQWCSwGb5Ni9NEIEF9iDPp7ZG2
 uqogicqZFdQnBmRENqjmDbuNSUEY+mFgOjlBUGxfD9bV/UCc1OV0Ww1gB
 WIPszdkOg4caj9gg3MTkQ0eU5kupGvoEnx5KVidPT/X971D09T/3TL/tz Q==;
X-CSE-ConnectionGUID: oyIEqI9iR32BN5RYhIMaFA==
X-CSE-MsgGUID: 1ZU3p+9nRAKOzXsrr7zr3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78940753"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="78940753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:03:57 -0700
X-CSE-ConnectionGUID: 4iO4Kb+2RTyWikIpTfbF8g==
X-CSE-MsgGUID: MlY12JthQASlk1ZUlFd1+w==
X-ExtLoop1: 1
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.139])
 ([10.245.245.139])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:03:55 -0700
Message-ID: <f4957d06-3c0b-4ffe-928c-e82bf7615d75@intel.com>
Date: Thu, 7 May 2026 10:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/dma-buf: handle empty bo and UAF races
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20260506184332.86743-2-matthew.auld@intel.com>
 <ac67eec8376792e795f37645b83c1f4c7fed8ba4.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ac67eec8376792e795f37645b83c1f4c7fed8ba4.camel@linux.intel.com>
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

On 06/05/2026 20:59, Thomas Hellström wrote:
> On Wed, 2026-05-06 at 19:43 +0100, Matthew Auld wrote:
>> There look to be some nasty races here when triggering the
>> invalidate_mappings hook:
>>
>> 1) We do xe_bo_alloc() followed by the attach, before the actual full
>> bo
>>     init step in xe_dma_buf_init_obj(). However the bo is visible on
>> the
>>     attachments list after the attach.  This is bad since exporter
>> driver,
>>     say amdgpu, can at any time call back into our invalidate_mappings
>> hook,
>>     with an empty/bogus bo, leading to potential bugs/crashes.
>>
>> 2) Similar to 1) but here we get a UAF, when the invalidate_mappings
>>     hook is triggered. For example, we get as far as
>> xe_bo_init_locked()
>>     but this fails in some way. But here the bo will be freed on
>> error, but
>>     we still have it attached from dma-buf pov, so if the
>>     invalidate_mappings is now triggered then the bo we access is gone
>> and
>>     we trigger UAF and more bugs/crashes.
>>
>> To fix this, move the attach step until after we actually have a
>> fully
>> set up buffer object. Note that the bo is not published to userspace
>> until later, so not sure what the comment "Don't publish the bo
>> until we have a valid attachment", is referring to.
>>
>> We have at least two different customers reporting hitting a NULL ptr
>> deref in evict_flags when importing something from amdgpu, followed
>> by
>> triggering the evict flow. Hit rate is also pretty low, which would
>> hint at some kind of race, so something like 1) or 2) might explain
>> this.
>>
>> Assisted-by: Gemini:gemini-3 #debug
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7903
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/4055
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
>> GPUs")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.8+
>> ---
>>   drivers/gpu/drm/xe/xe_dma_buf.c | 23 ++++++++---------------
>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
>> b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index b9828da15897..e6c2f7d30abb 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -357,11 +357,6 @@ struct drm_gem_object
>> *xe_gem_prime_import(struct drm_device *dev,
>>   		}
>>   	}
>>   
>> -	/*
>> -	 * Don't publish the bo until we have a valid attachment,
>> and a
>> -	 * valid attachment needs the bo address. So pre-create a bo
>> before
>> -	 * creating the attachment and publish.
>> -	 */
>>   	bo = xe_bo_alloc();
>>   	if (IS_ERR(bo))
>>   		return ERR_CAST(bo);
>> @@ -371,6 +366,13 @@ struct drm_gem_object
>> *xe_gem_prime_import(struct drm_device *dev,
>>   	if (test)
>>   		attach_ops = test->attach_ops;
>>   #endif
>> +	/*
>> +	 * xe_dma_buf_init_obj() takes ownership of bo on both
>> success
>> +	 * and failure, so we must not touch bo after this call.
>> +	 */
>> +	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
>> +	if (IS_ERR(obj))
>> +		return obj;
> 
> IIRC this publishes the bo on the LRUs, as per the removed comment.
> What happens if, for example, the shrinker kicks in and shrinks it? But
> similarly perhaps we should have obj->import_attach set already at
> publish time?

I don't think anything bad will happen? I would view it as an sg object 
without any real backing store or attachment. Trying to 
move/shrink/evict should be a noop, like moving from SYS -> SYS 
(starting placement for type_sg). But since this a type_sg bo, I think 
shrinker will already ignore it right?

 From user POV, the handle is only published until much later at the end 
of drm_gem_prime_fd_to_handle(), after our import callback here, AFAICT. 
So I don't think there is a risk of the user somehow using the imported 
bo in an ioctl, before we have done the attach etc.

One other data point is perhaps amdgpu, which does seem to do the create 
+ attach as normal steps.

> 
> If this is indeed the case we might have to revert to some trickery.
> Like invalidate_mappings() returning early if the init is not complete,
> and set obj->import_attach under the lock in xe_dma_buf_init_obj?
> 
> Also I think IIRC xe_bo_alloc() was created specifically for this
> situation, so unless there are more users of that, and the ordering in
> this patch is indeed correct, we might be able to get rid of the two-
> step bo creation here.
> 
> /Thomas
> 
> 
>>   
>>   	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
>> attach_ops, &bo->ttm.base);
>>   	if (IS_ERR(attach)) {
>> @@ -378,21 +380,12 @@ struct drm_gem_object
>> *xe_gem_prime_import(struct drm_device *dev,
>>   		goto out_err;
>>   	}
>>   
>> -	/*
>> -	 * xe_dma_buf_init_obj() takes ownership of bo on both
>> success
>> -	 * and failure, so we must not touch bo after this call.
>> -	 */
>> -	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
>> -	if (IS_ERR(obj)) {
>> -		dma_buf_detach(dma_buf, attach);
>> -		return obj;
>> -	}
>>   	get_dma_buf(dma_buf);
>>   	obj->import_attach = attach;
>>   	return obj;
>>   
>>   out_err:
>> -	xe_bo_free(bo);
>> +	xe_bo_put(bo);
>>   
>>   	return obj;
>>   }

