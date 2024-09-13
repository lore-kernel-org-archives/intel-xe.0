Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1771AFA3747
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 11:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5FB10ECF1;
	Fri, 13 Sep 2024 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXk2TvDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342E410EC88
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726226772; x=1757762772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=frckdRbr7MP8FaJIiqMK7TISqsRJJCWGQNi+nqu9vPw=;
 b=kXk2TvDJ6zsuqE9camCu+VdGENKshvWVUAffXY6YCvXEsSnH3J1VMnqx
 3snT2pAJzbdnbxqQ5rL6Y9ro45rRfZqCqVwKftWAUcEbjEVXoGLFvY8e1
 a/Uo8hwMwCae0z1lAJWdMfaTA45pG8kp790vmHbm70EkxzAXv1hzComdw
 DCR4XGw/w6I3Dv8gO3mej8sceYVXQet3lgkoEMghvI1suxwQDQpAKW2rs
 3xjpTNb26hf3sBkWNm4Cj+WBcXnYoYwhSA6vdXLlxGcH7YtokYqO/pchE
 ecowPlCnchmfjrUPIcgEjenK5PczIwVdUXTE+7ql+SEBry2PM0JrmyKig A==;
X-CSE-ConnectionGUID: AKzXMaJfTUKsAiyxD59zgQ==
X-CSE-MsgGUID: Dq24y9WXQS62q4YuJS48hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24611610"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="24611610"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:26:11 -0700
X-CSE-ConnectionGUID: 4FxTt0MJSXOTJaCR7aC7ZA==
X-CSE-MsgGUID: HUF/t9tJSNOq2vmk4YGtXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="98843375"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 04:26:08 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3C2522878B;
 Fri, 13 Sep 2024 12:26:07 +0100 (IST)
Message-ID: <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
Date: Fri, 13 Sep 2024 13:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
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



On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
> 
> 
> On 13-09-2024 03:01, Michal Wajdeczko wrote:
>>
>>
>> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>> increment the reference count for the domain. This ensures that
>>> subsequent _get calls do not incorrectly assume the domain is awake. The
>>> return value is a mask of domains whose reference counts were
>>> incremented, and these domains need to be released using
>>> xe_force_wake_put.
>>>
>>> The caller needs to compare the return value with the input domains to
>>> determine the success or failure of the operation and decide whether to
>>> continue or return accordingly.
>>>
>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_force_wake.c | 35 +++++++++++++++++++++++++-----
>>>   1 file changed, 29 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>> index a64c14757c84..fa42d652d23f 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>                        (ffs(tmp__) - 1))) && \
>>>                        domain__->reg_ctl.addr)
>>>   +/**
>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0
>>> initially, wake the domain
>>
>> while likely this is still recognized by the kernel-doc tool, this is
>> not correct notation for the function() documentation
> 
> 
> I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
> will fix it.
> 
> 
>>
>> [1]
>> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
>>
>>> + * @fw: struct xe_force_wake
>>> + * @domains: forcewake domains to get refcount on
>>> + *
>>> + * Increment refcount for the force-wake domain. If the domain is
>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>> + * timeout. If a timeout occurs, decrement the refcount.
>>
>> not sure if doc shall be 1:1 of low level implementation details
> 
> Does this sound okay ?
> This function takes references for the input @domains and wakes them if
> they are asleep.
> 
>>
>>> + * The caller should compare the return value with the @domains to
>>> + * determine the success or failure of the operation.
>>> + *
>>> + * Return: mask of refcount increased domains.
>>
>> if we return a 'mask' then maybe it should be of 'unsigned int' type?
> 
> Agreed. Will fix in next version.
> 
>>
>>> If the return value is
>>> + * equal to the input parameter @domains, the operation is considered
>>> + * successful. Otherwise, the operation is considered a failure, and
>>> + * the caller should handle the failure case, potentially returning
>>> + * -ETIMEDOUT.
>>
>> it looks that all problems with the nice API is due to the
>> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
>>
>> maybe there should be different pair of functions:
> 
> I am not convinced with different pair of functions:
> 
> In current implementation:
> 
> int mask = xe_force_wake_get(fw, domains)
> if (mask != domains) {
>     Non critical path continue with warning;
>      or
>     critical path:
>         xe_force_wake_put(fw, mask);
>         return -ETIMEDOUT;
> }
> 
> do_ops;
> xe_force_wake_put(fw, mask);
> return err;
> 
> Above flow remains intact irrespective of individual domains or
> FORCEWAKE_ALL.
> 
> In case of individual domains if (mask != domains) can be replaced with
> (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path
> since mask is 0;

so maybe we should have (by reinventing i915?):

// opaque, but zero means failure/no domains are awake
typedef unsigned long xe_wakeref_t;


// caller should test for ref != 0
// but shall call put if ref != 0
xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)

// safe to call with ref == 0
void xe_force_wake_put(fw, xe_wakeref_t ref)


// helpers for critical work that must be sure about domain

// compares opaque ref with explicit domain != ALL
// can be used by the code that obtained the ref
bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)

// compares fw with explicit domain != ALL
// can be used by the code that does not have direct access to the ref
bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)


// helpers for checking correctness
void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)


then usage would be:

xe_wakeref_t ref;

ref = xe_force_wake_get(fw, d);
if (ref) {
	// ...
	xe_force_wake_put(fw, ref);
}

or:

xe_wakeref_t ref;

ref = xe_force_wake_get(fw, ALL);
if (xe_wakeref_has_domain(ref, d1))
	// ... critical work1
if (xe_wakeref_has_domain(ref, d2))
	// ... critical work2
xe_force_wake_put(fw, ref);


so above will be very similar to what you have but by having explicit
types IMO it will help connect all functions into proper use-case flow

> 
> 
>>
>> // for single domain where ret=0 is success, ret<0 is error
> 
> This leads to caller only calling xe_force_wake_put incase of get
> success. so in case of caller continuing with failure, he will need to
> ensure the put is not called.
> 
> for example:
> int ret;
> 
> ret = xe_force_wake_get(fw, DOMAIN_GT);
> XE_WARN_ON(ret)
> if(!ret)
>     xe_force_wake_put(fw, DOMAIN_GT);
> 
>> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
>> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
>>
>> and
>>
>> // for all domain where ret=0 is success, ret<0 is error
>> int int xe_force_wake_get_all(fw);
>> void xe_force_wake_put_all(fw);
> 
> In case of xe_force_wake_get_all(fw) failure, how the caller will know
> which domains got awake and which failed ?
> 
> ret = xe_force_wake_get_all(fw);
> if(!ret)
>    No way to put awake domains to sleep

in case of failure, it would be the responsibility of the
xe_force_wake_get_all() to put all partial awakes immediately, since it
failed to awake all requested domains (same as in single domain case)

but let's drop this idea

> 
>>
>> and
>>
>> // input: mask of domains, return: mask of domain
>> unsigned int xe_force_wake_get_mask(fw, mask);
>> void xe_force_wake_put_mask(fw, mask);
>>
>> this last one can be just main implementation (static or public if we
>> really want to continue with random set of enabled domains)
>>
>>> + */
>>>   int xe_force_wake_get(struct xe_force_wake *fw,
>>>                 enum xe_force_wake_domains domains)
>>>   {
>>>       struct xe_gt *gt = fw->gt;
>>>       struct xe_force_wake_domain *domain;
>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>> +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>
>> it looks that you're abusing even more all enum variables by treating
>> them as plain integers
> 
> Miss at my end. Will address them in next version.
> 
>>
>>>       unsigned long flags;
>>> -    int ret = 0;
>>> +    int ret = domains;
>>>         spin_lock_irqsave(&fw->lock, flags);
>>>       for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>           if (!domain->ref++) {
>>> -            woken |= BIT(domain->id);
>>> +            awake_rqst |= BIT(domain->id);
>>>               domain_wake(gt, domain);
>>>           }
>>>       }
>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>> -        ret |= domain_wake_wait(gt, domain);
>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>> +            awake_ack |= BIT(domain->id);
>>> +        } else {
>>> +            ret &= ~BIT(domain->id);
>>> +            --domain->ref;
>>> +        }
>>>       }
>>> -    fw->awake_domains |= woken;
>>> +
>>> +    fw->awake_domains |= awake_ack;
>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>>         return ret;
