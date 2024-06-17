Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BE5C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EED810E4C9;
	Mon, 17 Jun 2024 19:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1dh2hUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45DF10E4C9
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718652304; x=1750188304;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xq8c4IE3ZDmGVdQCgHSPpNe6DebEIIY4IDCtxogXw84=;
 b=K1dh2hUdOhCMuNYkllAQhJnBEsP0+K9nJBS63jeog0HrJ3Yt6ncDoLq0
 /CpUXKWSwBCEIMhgBmdNEScN3aFFk70aCpQ6WxWuTrBW71bsoRI383qva
 1QIJcL1myckmEPvrP48kEMVdEOe0L2yI3AuPN0I4dhOMoVqIZaFoVlBi3
 PrHJWmEVlU9iEUpiT+iE3zXflejy5EfCYuDvN2b+t8qX1OjcdErOksJ5V
 RAVHlijZlE8gwPwGKROpoZtsuDUNWZaNFqv6iJWsIzU383Tff7bohvl1D
 EWfGAZcVGgOG2XFa91I9SCJJ7HYIQvNg/w+FMjH8tBqm84h3Dtfcca9oE g==;
X-CSE-ConnectionGUID: zujpmFQIQva8Ex4NLORkmA==
X-CSE-MsgGUID: fW3VZhTQT/WzjRntUZbLGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15641973"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15641973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:25:04 -0700
X-CSE-ConnectionGUID: zVGceaOmRRivzWGPvKUmnA==
X-CSE-MsgGUID: vzAbosaZS2Sm1WIO6ZAEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="64504205"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 17 Jun 2024 12:25:02 -0700
Received: from [10.245.119.62] (unknown [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B902533724;
 Mon, 17 Jun 2024 20:24:51 +0100 (IST)
Message-ID: <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
Date: Mon, 17 Jun 2024 21:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] FW guard class
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com> <ZnB51-d3XtwUfPfT@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZnB51-d3XtwUfPfT@intel.com>
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



On 17.06.2024 20:00, Rodrigo Vivi wrote:
> On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
>> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
>>> There is support for 'classes' with constructor and destructor
>>> semantics that can be used for any scope-based resource management,
>>> like device force-wake management.
>>>
>>> Add necessary definitions explicitly, since existing macros from
>>> linux/cleanup.h can't deal with our specific requirements yet.
>>>
>>> This should allow us to use:
>>>
>>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
>>> 		foo();
>>> or
>>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
>>>
>>> without any concern of leaking the force-wake references.
>>>
>>> Note: this is preliminary code as right now it's unclear how to
>>> correctly handle errors from the force-wake functions.
>>>
>>
>> I'm personally don't like this at all. IMO it obfuscate the code with
>> little real benefit. This is just an opinion though, others opinions may
>> differ from mine.

except that is more robust than hand-crafted code that is error prone,
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
			}
		}
	}

> 
> Well, on the positive side, it is not adding a driver only thing like
> i915's with_runtime_pm() macro.
> 
> But I'm also not sure if I like the overall idea anyway:
> 
> - I don't like adding C++isms in a pure C code. Specially something not
> so standard and common that will decrease the ramp-up time for newcomers.

does it mean that the use of other guard patterns seen elsewhere in the
tree is now prohibited on the Xe driver ? like:

	scoped_guard(mutex, &lock)
		foo();

	scoped_guard(spinlock, &lock)
		foo();
	...

> - It looks like and extra overhead on the object creation destruction.

from cleanup.h doc is sounds there is none:

 "And through the magic of value-propagation and dead-code-elimination,
it eliminates the actual cleanup call and compiles into:"


> - It looks not flexible for handling different cases... like forcewake for
> instance where we might want to ignore the ack timeout in some cases.

there is scoped_cond_guard() that likely will be able to deal with it,
but I guess we first need to cleanup existing force_wake api as expected
flow is not clear and there are different approaches in the driver how
to deal with errors

> 
>>
>> Matt
>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> Michal Wajdeczko (3):
>>>   drm/xe: Introduce force-wake guard class
>>>   drm/xe: Use new FW guard in xe_mocs.c
>>>   drm/xe: Use new FW guard in xe_pat.c
>>>
>>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
>>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
>>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
>>>  4 files changed, 82 insertions(+), 50 deletions(-)
>>>
>>> -- 
>>> 2.43.0
>>>
