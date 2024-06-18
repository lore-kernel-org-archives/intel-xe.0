Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C913FC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 18:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DCF10E217;
	Tue, 18 Jun 2024 18:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id8lfHwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6610E22C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718734093; x=1750270093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=naauMmX5Zx4JhaqBamV5Wxif5sMIFv5ev2QcpiDoB1c=;
 b=id8lfHwO1K4U6Kgj0lfhmIalECphc6vQTmoMSgcheZMmfa564WW+S74d
 kql5zDi2zUypQVc+LjBdovnrgV6Yzp22wfS+XBPrWt/ugfcMmzFSWskHl
 6FyX29iu5GFzWd1TxQEV/5RGDYuSmzYqhTH0tLMTLmaASnQvDX12m+G3E
 mzD7I3soqmv2/ogqNLh1ocjw/0kilxsTEJ2Pn7ofTdUBobbYpoJftjKZG
 UgLX0duE/pMxJcJLV0goBa8no16JuJD/Z4kmGVaeOdxhda3ib3Vf94X18
 ZgU95HJmH/bZ1smVQA4eGZJ4BvcsDDm5hOi+77+JIqX/IkdFR7lf2ClsB Q==;
X-CSE-ConnectionGUID: Tu+ka7MJROC4MGihs3SYGw==
X-CSE-MsgGUID: FNlUFaYcQBuTOUtDwhs/ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15783921"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15783921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 11:08:12 -0700
X-CSE-ConnectionGUID: WWrSl5zHR/uzjUbgAAMEPg==
X-CSE-MsgGUID: ZDn+0ABpQnWIxJ+ps0A2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41495984"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 18 Jun 2024 11:08:09 -0700
Received: from [10.245.82.128] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.82.128])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DAF5334308;
 Tue, 18 Jun 2024 19:08:06 +0100 (IST)
Message-ID: <b002361e-5c40-4902-abe0-107608ab8a08@intel.com>
Date: Tue, 18 Jun 2024 20:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] FW guard class
To: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com> <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
 <ZnDgBvtYGtAJt9Xv@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZnDgBvtYGtAJt9Xv@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 18.06.2024 03:16, Matthew Brost wrote:
> On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
>> On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
>>> On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 17.06.2024 20:00, Rodrigo Vivi wrote:
>>>>> On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
>>>>>> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
>>>>>>> There is support for 'classes' with constructor and destructor
>>>>>>> semantics that can be used for any scope-based resource management,
>>>>>>> like device force-wake management.
>>>>>>>
>>>>>>> Add necessary definitions explicitly, since existing macros from
>>>>>>> linux/cleanup.h can't deal with our specific requirements yet.
>>>>>>>
>>>>>>> This should allow us to use:
>>>>>>>
>>>>>>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
>>>>>>> 		foo();
>>>>>>> or
>>>>>>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
>>>>>>>
>>>>>>> without any concern of leaking the force-wake references.
>>>>>>>
>>>>>>> Note: this is preliminary code as right now it's unclear how to
>>>>>>> correctly handle errors from the force-wake functions.
>>>>>>>
>>>>>>
>>>>>> I'm personally don't like this at all. IMO it obfuscate the code with
>>>>>> little real benefit. This is just an opinion though, others opinions may
>>>>>> differ from mine.
>>>>
>>>> except that is more robust than hand-crafted code that is error prone,
>>>> like this snippet from wedged_mode_set():
>>>>
>>>> 	xe_pm_runtime_get(xe);
>>>> 	for_each_gt(gt, xe, id) {
>>>> 		ret = xe_guc_ads(...);
>>>> 		if (ret) {
>>>> 			xe_gt_err(gt, "...");
>>>> 			return -EIO;
>>>> 		}
>>>> 	}
>>>> 	xe_pm_runtime_put(xe);
>>>>
>>>> and thanks to PM guard class we could avoid such mistakes for free:
>>>>
>>>> 	scoped_guard(xe_pm, xe) {
>>>> 		for_each_gt(gt, xe, id) {
>>>> 			ret = xe_guc_ads(...);
>>>> 			if (ret) {
>>>> 				xe_gt_err(gt, "...");
>>>> 				return -EIO;
>>>
>>> Just responding with a question here - haven't looked at the rest of the
>>> comments.
>>>
>>> How is this not still a bug? Looking at scoped_guard, it appears to be a
>>> magic macro for loop which acquires / releases a lock or in your
>>> purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
>>> step? I see coding patterns like above in the kernel [1] so I do assume
>>
>> with __attribute__((cleanup)), the compiler guarantees that
>> it's executed when the variable goes out of scope. What you are probably
>> missing is the use of CLASS() declaring a variable inside the for, which
>> uses attribute cleanup:
>>
>> 	for (CLASS(_name, scope)(args),
>> 	     ...
>>
>> GCC's doc:
>>
>> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
>>
>> 	The cleanup attribute runs a function when the variable goes out
>> 	of scope. This attribute can only be applied to auto function
>> 	scope variables; it may not be applied to parameters or
>> 	variables with static storage duration. The function must take
>> 	one parameter, a pointer to a type compatible with the variable.
>> 	The return value of the function (if any) is ignored.
>>
>> 	When multiple variables in the same scope have cleanup
>> 	attributes, at exit from the scope their associated cleanup
>> 	functions are run in reverse order of definition (last defined,
>> 	first cleanup).
>>
>> 	If -fexceptions is enabled, then cleanup_function is run during
>> 	the stack unwinding that happens during the processing of the
>> 	exception. Note that the cleanup attribute does not allow the
>> 	exception to be caught, only to perform an action. It is
>> 	undefined what happens if cleanup_function does not return
>> 	normally.
>>
>> This was only possible with the recent change in the kernel raising
>> the minimum C std to gnu11 (uapi is still c90 for compatibility):
>>
>> 	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
>> 	Author: Arnd Bergmann <arnd@arndb.de>
>> 	Date:   Tue Mar 8 22:56:14 2022 +0100
>>
>> 	    Kbuild: move to -std=gnu11
>>
>> 	    During a patch discussion, Linus brought up the option of changing
>> 	    the C standard version from gnu89 to gnu99, which allows using variable
>> 	    declaration inside of a for() loop. While the C99, C11 and later standards
>> 	    introduce many other features, most of these are already available in
>> 	    gnu89 as GNU extensions as well.
>>
> 
> Thanks for the reference, will checkout.
> 
>>> this works, just confused how it works.
>>>
>>> With that, any code which isn't easily understandable IMO is a negative
>>> ROI as it just creates confusion in the long / makes problems harder to
>>> understand. Again this is just my opinion.
>>
>> I think that is mainly about getting used to the pattern. I think we
> 
> Agree once pattern is understood, fairly easy change.
> 
>> just have to be careful not to overshoot on trying to use everywhere.
> 
> Agree about overshooting. I think we agree we want to use cleanup.h
> semantics in Xe we should start by converting kernel core components
> (spin locks, mutexes, rwsem, kfree, etc...) to use these semantics
> before adding our own ones. Also with this, I think if we use cleanup.h
> semantics, we use these semantics everywhere we can (e.g. directly
> grabbing a spin lock is akin to open coding and not allowed).
> 
> Once we convert Xe core componets to use these semantics then we start
> adding Xe specific ones.
> 
> Thoughts?

IMO if we decide to promote new cleanup mechanism for core primitives
like mutex/spinlocks then we should already have wrappers for Xe
specific stuff like PM and FW handy to avoid mixing patterns and allow
use them together if applicable/desired:

	scoped_guard(xe_pm, xe)
		scoped_guard(xe_fw, fw, XE_FW_GT)
			scoped_guard(spinlock, &lock)
				foo();

and even if we just allow, without immediate enforcing this new cleanup
mechanism, then it still could be beneficial to introduce PM/FW support
to start closing any gaps we may have in any of these areas and to do
that in small steps whenever we make changes around problematic code

> 
>> For example, I don't know why there's already a second use in a separate
>> thread when we are still discussing it on this one.
>>
>> A very positive thing is that this is not xe's own invention and comes
> 
> I agree, it is core fairly new core thing which seems to widely
> endorsed which is a positive.
> 
>> from core kernel, maybe from the hottest path that is the scheduling and
>> locking. So I very much disagree with arguments raised here about
>> a) this is an alien thing and b) performance will be severely impacted
>>
>> I've used __attribute__((cleanup)) in several userspace projects in the
>> past and it does help avoiding problems on the error path that is
>> usually not very well tested (and xe's track record on error path is not
> 
> For sure our error paths are not great but it isn't like this solves our
> of those problems magically.
> 
>> very good either: those were the main issues being submitted in drm-xe-fixes
>> for the last release). So if we have a way to improve (and that I've already seen
>> being used successfully), I prefer failing on trying than on repeating
>> the same mistakes.  In kmod my only regret is that I didn't start it
>> earlier, during the bootstrap of the project.
> 
> This merged a little over a year, so quite new. Xe is still fairly small
> and I don't think it would be to painful to switch over to these
> semantics. If we want do this, I'd say we do this asap. 

thanks for reconsidering your initial strong position

> 
> Matt
> 
>>
>>
>> Lucas De Marchi
>>
>>
>>>
>>> Matt
>>>
>>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
>>>
>>>> 			}
>>>> 		}
>>>> 	}
>>>>
>>>>>
>>>>> Well, on the positive side, it is not adding a driver only thing like
>>>>> i915's with_runtime_pm() macro.
>>>>>
>>>>> But I'm also not sure if I like the overall idea anyway:
>>>>>
>>>>> - I don't like adding C++isms in a pure C code. Specially something not
>>>>> so standard and common that will decrease the ramp-up time for newcomers.
>>>>
>>>> does it mean that the use of other guard patterns seen elsewhere in the
>>>> tree is now prohibited on the Xe driver ? like:
>>>>
>>>> 	scoped_guard(mutex, &lock)
>>>> 		foo();
>>>>
>>>> 	scoped_guard(spinlock, &lock)
>>>> 		foo();
>>>> 	...
>>>>
>>>>> - It looks like and extra overhead on the object creation destruction.
>>>>
>>>> from cleanup.h doc is sounds there is none:
>>>>
>>>>  "And through the magic of value-propagation and dead-code-elimination,
>>>> it eliminates the actual cleanup call and compiles into:"
>>>>
>>>>
>>>>> - It looks not flexible for handling different cases... like forcewake for
>>>>> instance where we might want to ignore the ack timeout in some cases.
>>>>
>>>> there is scoped_cond_guard() that likely will be able to deal with it,
>>>> but I guess we first need to cleanup existing force_wake api as expected
>>>> flow is not clear and there are different approaches in the driver how
>>>> to deal with errors
>>>>
>>>>>
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>
>>>>>>> Michal Wajdeczko (3):
>>>>>>>   drm/xe: Introduce force-wake guard class
>>>>>>>   drm/xe: Use new FW guard in xe_mocs.c
>>>>>>>   drm/xe: Use new FW guard in xe_pat.c
>>>>>>>
>>>>>>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
>>>>>>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
>>>>>>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
>>>>>>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
>>>>>>>  4 files changed, 82 insertions(+), 50 deletions(-)
>>>>>>>
>>>>>>> --
>>>>>>> 2.43.0
>>>>>>>
