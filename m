Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C7C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 16:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7297110E4EE;
	Mon, 24 Jun 2024 16:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOtw27oA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F9110E0D4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719246757; x=1750782757;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to;
 bh=ZdDwWAPm5FVL/OxDO9PCGYp2/viv3wbH6R9Vzk08dCU=;
 b=HOtw27oAsnHaSGBu4BnvXnThnk94Sen9K4m7ax8UQLIlgLxWXqHmrT5g
 SGNvTZkx1m7KMlzvwbklKCEV58MTTSN8WK6wJuDe0dfgFAlQwPyrjBzQ9
 iLTIB6RfylZGwODXvRVlQy5CBeyxSOUukerXaGs8dS56esIahCJVYjpYj
 huhp9QT15UXBCdobhpQUy3QGlK7eFnwv5hRerNb151M7VbloHc40xmHvw
 Lw1XxL4txIxjE8y3OKNS3v0ywRj5xCyClRSuPNwtRnuy3JW9Zgbp96kbx
 ltfcHMJKbYKAb9u/MzuZ5PFH7wASZABoDRphuuMdIiisHuxsBt8rvYWx6 w==;
X-CSE-ConnectionGUID: Lh6L2OQsQy+Lnz2qCc1XCw==
X-CSE-MsgGUID: kEhGRnhwSTuqpjmB0rPhxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16052940"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208,217";a="16052940"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 09:32:36 -0700
X-CSE-ConnectionGUID: IaNb1WA/Q2ivLyjJjvxztg==
X-CSE-MsgGUID: o0A28pMnRlK9+f9wiLjWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208,217";a="43229022"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.115])
 ([10.246.50.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 09:32:34 -0700
Content-Type: multipart/alternative;
 boundary="------------G8GXZMJ2RjA7E7oZkKAkEtMt"
Message-ID: <a35afeae-4753-4795-94db-52e9ebe0bb7c@linux.intel.com>
Date: Mon, 24 Jun 2024 18:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: Re: [RFC 0/3] FW guard class
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com> <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
 <ZnHtdMLEHFAHMqRr@intel.com>
Content-Language: en-US
In-Reply-To: <ZnHtdMLEHFAHMqRr@intel.com>
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

This is a multi-part message in MIME format.
--------------G8GXZMJ2RjA7E7oZkKAkEtMt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/2024 10:26 PM, Rodrigo Vivi wrote:
> On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
>> On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
>>> On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
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
>>>>>> I'm personally don't like this at all. IMO it obfuscate the code with
>>>>>> little real benefit. This is just an opinion though, others opinions may
>>>>>> differ from mine.
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
>>> Just responding with a question here - haven't looked at the rest of the
>>> comments.
>>>
>>> How is this not still a bug? Looking at scoped_guard, it appears to be a
>>> magic macro for loop which acquires / releases a lock or in your
>>> purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
>>> step? I see coding patterns like above in the kernel [1] so I do assume
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
>> 	Author: Arnd Bergmann<arnd@arndb.de>
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
>>> this works, just confused how it works.
>>>
>>> With that, any code which isn't easily understandable IMO is a negative
>>> ROI as it just creates confusion in the long / makes problems harder to
>>> understand. Again this is just my opinion.
>> I think that is mainly about getting used to the pattern. I think we
>> just have to be careful not to overshoot on trying to use everywhere.
>> For example, I don't know why there's already a second use in a separate
>> thread when we are still discussing it on this one.
>>
>> A very positive thing is that this is not xe's own invention and comes
>> from core kernel, maybe from the hottest path that is the scheduling and
>> locking. So I very much disagree with arguments raised here about
>> a) this is an alien thing and b) performance will be severely impacted
> just for the record:
> a) the alien thing is i915's with_runtime_pm... this is part of core kernel, so
> it is not an alien thing. I still don't like C++isms, but that is just a preference
> not a blocker.
>
> b) it is an overhead, but I really doubt that this would impact performance.
> Only data would show.
>
>> I've used __attribute__((cleanup)) in several userspace projects in the
>> past and it does help avoiding problems on the error path that is
>> usually not very well tested (and xe's track record on error path is not
>> very good either: those were the main issues being submitted in drm-xe-fixes
>> for the last release). So if we have a way to improve (and that I've already seen
>> being used successfully), I prefer failing on trying than on repeating
>> the same mistakes.
> Pretty much agreeing here! Specially because this is a Linux core kernel
> infra available. Let's try.
>
> Cc Nirmoy Das<nirmoy.das@intel.com>
>
> who is looking at the forcewake stuff and to solve the flow.
> Specially to get his eyes here and see if this would cover all the needed
> cases for the forcewake.
Sorry for late reply. This looks fine for me. We are still missing a 
corner case where if

xe_force_wake_get() fails this is not be calling xe_force_wake_put().
xe_force_wake_get() should revert the counter on failure.

Regards, Nirmoy

> If this series were suggesting another with_runtime_pm macro, then I would
> push back hard.
>
>>   In kmod my only regret is that I didn't start it
>> earlier, during the bootstrap of the project.
>>
>>
>> Lucas De Marchi
>>
>>
>>> Matt
>>>
>>> [1]https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
>>>
>>>> 			}
>>>> 		}
>>>> 	}
>>>>
>>>>> Well, on the positive side, it is not adding a driver only thing like
>>>>> i915's with_runtime_pm() macro.
>>>>>
>>>>> But I'm also not sure if I like the overall idea anyway:
>>>>>
>>>>> - I don't like adding C++isms in a pure C code. Specially something not
>>>>> so standard and common that will decrease the ramp-up time for newcomers.
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
>>>> from cleanup.h doc is sounds there is none:
>>>>
>>>>   "And through the magic of value-propagation and dead-code-elimination,
>>>> it eliminates the actual cleanup call and compiles into:"
>>>>
>>>>
>>>>> - It looks not flexible for handling different cases... like forcewake for
>>>>> instance where we might want to ignore the ack timeout in some cases.
>>>> there is scoped_cond_guard() that likely will be able to deal with it,
>>>> but I guess we first need to cleanup existing force_wake api as expected
>>>> flow is not clear and there are different approaches in the driver how
>>>> to deal with errors
>>>>
>>>>>> Matt
>>>>>>
>>>>>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>>>>>> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>>>>>>>
>>>>>>> Michal Wajdeczko (3):
>>>>>>>    drm/xe: Introduce force-wake guard class
>>>>>>>    drm/xe: Use new FW guard in xe_mocs.c
>>>>>>>    drm/xe: Use new FW guard in xe_pat.c
>>>>>>>
>>>>>>>   drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
>>>>>>>   drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
>>>>>>>   drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
>>>>>>>   drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
>>>>>>>   4 files changed, 82 insertions(+), 50 deletions(-)
>>>>>>>
>>>>>>> --
>>>>>>> 2.43.0
>>>>>>>
--------------G8GXZMJ2RjA7E7oZkKAkEtMt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/2024 10:26 PM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZnHtdMLEHFAHMqRr@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 17.06.2024 20:00, Rodrigo Vivi wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">There is support for 'classes' with constructor and destructor
semantics that can be used for any scope-based resource management,
like device force-wake management.

Add necessary definitions explicitly, since existing macros from
linux/cleanup.h can't deal with our specific requirements yet.

This should allow us to use:

	scoped_guard(xe_fw, fw, XE_FW_GT)
		foo();
or
	CLASS(xe_fw, var)(fw, XE_FW_GT);

without any concern of leaking the force-wake references.

Note: this is preliminary code as right now it's unclear how to
correctly handle errors from the force-wake functions.

</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I'm personally don't like this at all. IMO it obfuscate the code with
little real benefit. This is just an opinion though, others opinions may
differ from mine.
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">except that is more robust than hand-crafted code that is error prone,
like this snippet from wedged_mode_set():

	xe_pm_runtime_get(xe);
	for_each_gt(gt, xe, id) {
		ret = xe_guc_ads(...);
		if (ret) {
			xe_gt_err(gt, "...");
			return -EIO;
		}
	}
	xe_pm_runtime_put(xe);

and thanks to PM guard class we could avoid such mistakes for free:

	scoped_guard(xe_pm, xe) {
		for_each_gt(gt, xe, id) {
			ret = xe_guc_ads(...);
			if (ret) {
				xe_gt_err(gt, "...");
				return -EIO;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Just responding with a question here - haven't looked at the rest of the
comments.

How is this not still a bug? Looking at scoped_guard, it appears to be a
magic macro for loop which acquires / releases a lock or in your
purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
step? I see coding patterns like above in the kernel [1] so I do assume
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">with __attribute__((cleanup)), the compiler guarantees that
it's executed when the variable goes out of scope. What you are probably
missing is the use of CLASS() declaring a variable inside the for, which
uses attribute cleanup:

	for (CLASS(_name, scope)(args),
	     ...

GCC's doc:

<a class="moz-txt-link-freetext"
href="https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html">https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html</a>

	The cleanup attribute runs a function when the variable goes out
	of scope. This attribute can only be applied to auto function
	scope variables; it may not be applied to parameters or
	variables with static storage duration. The function must take
	one parameter, a pointer to a type compatible with the variable.
	The return value of the function (if any) is ignored.

	When multiple variables in the same scope have cleanup
	attributes, at exit from the scope their associated cleanup
	functions are run in reverse order of definition (last defined,
	first cleanup).

	If -fexceptions is enabled, then cleanup_function is run during
	the stack unwinding that happens during the processing of the
	exception. Note that the cleanup attribute does not allow the
	exception to be caught, only to perform an action. It is
	undefined what happens if cleanup_function does not return
	normally.

This was only possible with the recent change in the kernel raising
the minimum C std to gnu11 (uapi is still c90 for compatibility):

	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
	Author: Arnd Bergmann <a class="moz-txt-link-rfc2396E"
        href="mailto:arnd@arndb.de">&lt;arnd@arndb.de&gt;</a>
	Date:   Tue Mar 8 22:56:14 2022 +0100

	    Kbuild: move to -std=gnu11

	    During a patch discussion, Linus brought up the option of changing
	    the C standard version from gnu89 to gnu99, which allows using variable
	    declaration inside of a for() loop. While the C99, C11 and later standards
	    introduce many other features, most of these are already available in
	    gnu89 as GNU extensions as well.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">this works, just confused how it works.

With that, any code which isn't easily understandable IMO is a negative
ROI as it just creates confusion in the long / makes problems harder to
understand. Again this is just my opinion.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think that is mainly about getting used to the pattern. I think we
just have to be careful not to overshoot on trying to use everywhere.
For example, I don't know why there's already a second use in a separate
thread when we are still discussing it on this one.

A very positive thing is that this is not xe's own invention and comes
from core kernel, maybe from the hottest path that is the scheduling and
locking. So I very much disagree with arguments raised here about
a) this is an alien thing and b) performance will be severely impacted
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">just for the record:
a) the alien thing is i915's with_runtime_pm... this is part of core kernel, so
it is not an alien thing. I still don't like C++isms, but that is just a preference
not a blocker.

b) it is an overhead, but I really doubt that this would impact performance.
Only data would show.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I've used __attribute__((cleanup)) in several userspace projects in the
past and it does help avoiding problems on the error path that is
usually not very well tested (and xe's track record on error path is not
very good either: those were the main issues being submitted in drm-xe-fixes
for the last release). So if we have a way to improve (and that I've already seen
being used successfully), I prefer failing on trying than on repeating
the same mistakes. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Pretty much agreeing here! Specially because this is a Linux core kernel
infra available. Let's try.

Cc Nirmoy Das <a class="moz-txt-link-rfc2396E"
      href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>

who is looking at the forcewake stuff and to solve the flow.
Specially to get his eyes here and see if this would cover all the needed
cases for the forcewake.</pre>
    </blockquote>
    Sorry for late reply. This looks fine for me. We are still missing a
    corner case where if <br>
    <pre class="moz-quote-pre" wrap=""><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">xe_force_wake_get() fails this is not be calling </span></span><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">xe_force_wake_put(). </span></span>
<span style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">xe_force_wake_get</span></span>() should revert the counter on failure.

<span style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">
Regards,
Nirmoy
</span></span></pre>
    <blockquote type="cite" cite="mid:ZnHtdMLEHFAHMqRr@intel.com">
      <pre class="moz-quote-pre" wrap="">If this series were suggesting another with_runtime_pm macro, then I would
push back hard.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> In kmod my only regret is that I didn't start it
earlier, during the bootstrap of the project.


Lucas De Marchi


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Matt

[1] <a class="moz-txt-link-freetext"
href="https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544">https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544</a>

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">			}
		}
	}

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Well, on the positive side, it is not adding a driver only thing like
i915's with_runtime_pm() macro.

But I'm also not sure if I like the overall idea anyway:

- I don't like adding C++isms in a pure C code. Specially something not
so standard and common that will decrease the ramp-up time for newcomers.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">does it mean that the use of other guard patterns seen elsewhere in the
tree is now prohibited on the Xe driver ? like:

	scoped_guard(mutex, &amp;lock)
		foo();

	scoped_guard(spinlock, &amp;lock)
		foo();
	...

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">- It looks like and extra overhead on the object creation destruction.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">from cleanup.h doc is sounds there is none:

 "And through the magic of value-propagation and dead-code-elimination,
it eliminates the actual cleanup call and compiles into:"


</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">- It looks not flexible for handling different cases... like forcewake for
instance where we might want to ignore the ack timeout in some cases.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">there is scoped_cond_guard() that likely will be able to deal with it,
but I guess we first need to cleanup existing force_wake api as expected
flow is not clear and there are different approaches in the driver how
to deal with errors

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Matt

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Cc: Rodrigo Vivi <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E"
                  href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>

Michal Wajdeczko (3):
  drm/xe: Introduce force-wake guard class
  drm/xe: Use new FW guard in xe_mocs.c
  drm/xe: Use new FW guard in xe_pat.c

 drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
 drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
 drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
 4 files changed, 82 insertions(+), 50 deletions(-)

--
2.43.0

</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------G8GXZMJ2RjA7E7oZkKAkEtMt--
