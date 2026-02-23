Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5388AEA4FAF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 11:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1053510E2D8;
	Mon, 23 Feb 2026 11:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8K3+Ikc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572FC10E36E;
 Mon, 23 Feb 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771845475; x=1803381475;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n/U3rNAxPq1dEtHVbMI+BwWu1GjFm9OiSZMZ0wMG/EU=;
 b=C8K3+Ikcwuvw9J5kYVHSBC1YnefpwexCLnOhnwBY8LiW5UEWESdkHZUp
 sdenzDc2PJaflw51nwKHJmuN3LtGmQ6CfIPji0fNlv5CME0aZ3wih43t2
 pgGBOKfJi9mICXh4zJa3CGC9EloolLTiCZgu8SX5IjL9/ZFl8sIF8vZjA
 UjdRgq+47Q0E/FzhoUMxQ0Z1+D1oSkmU0MleEWqFUPJjEB3jGbvbxKien
 ANlBVOpA5o5gOJlW3gIQVaUdUeL2IJVhZ5SI36zrcpfGLqobU73JaRX83
 m7XcNqd0JJE8i3Q8I3g/H3jE0urfWIme4zOEHSdnxbcvUaW9p6u4+8VIX g==;
X-CSE-ConnectionGUID: MDMn8FmwQPmLCd5Wk3kJvg==
X-CSE-MsgGUID: uoGsxolxRBGrnbY9lQNrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72876950"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72876950"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:17:54 -0800
X-CSE-ConnectionGUID: D8Ej2C7lRZmFDyd7mPYpIA==
X-CSE-MsgGUID: xM7oQD46SDSdCDeH8/gyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="253253512"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.13])
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:17:52 -0800
Message-ID: <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
Date: Mon, 23 Feb 2026 12:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com> <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
Content-Language: en-US
From: Koen Koning <koen.koning@linux.intel.com>
In-Reply-To: <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
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

On Mon Feb 23, 2026 at 01:49 +0100, Joel Fernandes wrote:
> On 2/21/2026 12:44 AM, Greg KH wrote:
>> On Fri, Feb 20, 2026 at 08:55:52AM -0500, Joel Fernandes wrote:
>>>> On Feb 20, 2026, at 5:17 AM, Danilo Krummrich <dakr@kernel.org> wrote:
>>>>
>>>> ﻿On Fri Feb 20, 2026 at 7:06 AM CET, Greg KH wrote:
>>>>>> On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
>>>>>> Use subsys_initcall() instead of module_init() (which compiles to
>>>>>> device_initcall() for built-ins) for buddy, so its initialization code
>>>>>> always runs before any (built-in) drivers.
>>>>>> This happened to work correctly so far due to the order of linking in
>>>>>> the Makefiles, but this should not be relied upon.
>>>>>
>>>>> Same here, Makefile order can always be relied on.
>>>>
>>>> I want to point out that Koen's original patch fixed the Makefile order:
>>>>
>>>> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
>>>> index 5cd54d06e262..b4e5e338efa2 100644
>>>> --- a/drivers/gpu/Makefile
>>>> +++ b/drivers/gpu/Makefile
>>>> @@ -2,8 +2,9 @@
>>>> # drm/tegra depends on host1x, so if both drivers are built-in care must be
>>>> # taken to initialize them in the correct order. Link order is the only way
>>>> # to ensure this currently.
>>>> +# Similarly, buddy must come first since it is used by other drivers.
>>>> +obj-$(CONFIG_GPU_BUDDY)    += buddy.o
>>>> obj-y            += host1x/ drm/ vga/ tests/
>>>> obj-$(CONFIG_IMX_IPUV3_CORE)    += ipu-v3/
>>>> obj-$(CONFIG_TRACE_GPU_MEM)        += trace/
>>>> obj-$(CONFIG_NOVA_CORE)        += nova-core/
>>>> -obj-$(CONFIG_GPU_BUDDY)        += buddy.o
>>>>
>>>> He was then suggested to not rely on this and rather use subsys_initcall().
>>>
>>> I take the blame for the suggestion; however, I am not yet convinced it is a bad
>>> idea.
>>>>
>>>> When I then came across the new patch using subsys_initcall() I made it worse; I
>>>> badly confused this with something else and gave a wrong advise -- sorry Koen!
>>>>
>>>> (Of course, since this is all within the same subsystem, without any external
>>>> ordering contraints, Makefile order is sufficient.)
>>>
>>> If we are still going to do the link ordering by reordering in the Makefile,
>>> may I ask what is the drawback of doing the alternative - that is, not
>>> relying on that (and its associated potential for breakage)?
>>>
>>> Even if Makefile ordering can be relied on, why do we want to rely on it if
>>> there is an alternative? Also module_init() compiles to device_initcall() for
>>> built-ins and this is shared infra.
>>>
>>> We use this technique in other code paths too, no? See
>>> drivers/i2c/i2c-core-base.c:
>>>
>>>    /* We must initialize early, because some subsystems register i2c drivers
>>>     * in subsys_initcall() code, but are linked (and initialized) before i2c.
>>>     */
>>>    postcore_initcall(i2c_init);
>>>
>>> If there is a drawback I am all ears but otherwise I would prefer the new
>>> patch tbh.
>>
>> The "problem" is that the init levels are very "coarse", and the link
>> order is very specific.  You can play with init levels a lot, but what
>> happens if another driver also sets to the same init level, or an
>> earlier one to try to solve something that way?
>>
>> So it can be a loosing battle for many things, choose the best and
>> simplest solution, but always remember, Makefile order matters, which is
>> what I was wanting to correct here.
> Fair enough, the solution you are suggesting also sounds good to me.

Thanks that makes sense, then let's just stick to addressing the current 
regression with gpu/buddy in the drm-tip tree.

Joel, could you grab the v1 of this patchset (or the v2 with with 
subsys_initcall, either works) and try to get it applied to drm-tip? 
Since this is my first time submitting patches, I'm not really sure how 
to proceed from here, and it will probably be faster if you have a look.

