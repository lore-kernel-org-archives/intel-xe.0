Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A6DC05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 18:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F7010E87C;
	Tue, 14 Mar 2023 18:27:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B144C10E878
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 18:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678818457; x=1710354457;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Bp5RlUUFS5s3+WclISinxgRSC31nem3NqNAhQa782bs=;
 b=ZWgxq1wpDqqAaaYyjDvAa09PahPI1ZJhXmkrduHq3zaa4lhuvb4PYzsP
 8xY9Y9dmJCxGtau2vqsnR7tCBdKXoF4h+DCV/CT2VrZatPZNO12x3ztF3
 PvRIdiiGcchHvwbP3B9GeeLOHxgPUP/X9iLUzAcaPnwxvPqZCGoK2E0UI
 LQX5zdE2OdKkalKzJBqHWEtpgkLwyFtNiuvAQZfvNXZQFre3Fqcq9uvdd
 PoIMdIdFd1ETtexVA2fDhEq5O+ODwRV3hJdRBJNum5NoaRv9amv7YsQSi
 P+5pArbavMYwC9nLtB+bvvmBQmlJlmGkDhLjlNw2MVTqXrdi7CbNYP6Lu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339873836"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339873836"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="925035730"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="925035730"
Received: from mjtillin-mobl.ger.corp.intel.com (HELO [10.213.236.227])
 ([10.213.236.227])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:27:35 -0700
Message-ID: <93bb2619-348d-4061-ac7c-a5f4804fc8a8@linux.intel.com>
Date: Tue, 14 Mar 2023 18:27:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <877cvj7e39.fsf@intel.com>
 <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
 <874jqn708f.fsf@intel.com>
 <20230314172237.424zwdox7mnod5s4@ldmartin-desk2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230314172237.424zwdox7mnod5s4@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC] drm/i915: add kconfig option to enable/disable
 legacy platform support
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
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-xe@lists.freedesktop.org, "Shankar, Uma" <uma.shankar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 14/03/2023 17:22, Lucas De Marchi wrote:
> On Tue, Mar 14, 2023 at 06:42:56PM +0200, Jani Nikula wrote:
>> On Tue, 14 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> 
>> wrote:
>>> On 14/03/2023 11:43, Jani Nikula wrote:
>>>> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>>>>> support. This is primarily for the benefit of the drm/xe driver, and
>>>>> legacy is defined in terms of the platforms drm/xe does not support,
>>>>> i.e. anything before Tigerlake.
>>>>>
>>>>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
>>>>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=1 in
>>>>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=y, while the xe Makefile
>>>>> does no such thing, regardless of the kconfig value.
>>>>>
>>>>> Initially, the knob does the bare minimum: drops the legacy platforms
>>>>> from module PCI ID table (and the compiler in turn automagically drops
>>>>> all the unreferenced device infos).
>>>>>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>
>>>> The discussion stalled a bit.
>>>>
>>>> Do we have consensus to start adding this to upstream i915?
>>>
>>> I always liked the idea of compiling out platform support so I could be
>>> convinced. I view that as a "power user" use case - compiles their own
>>> kernel for a targeted machine. It also translates to building smaller
>>> images in production settings although that is kind of not interesting
>>> with the storage amounts these days. So overall feels could be
>>> justified. There is some benefit and could be done with minimal
>>> maintenance cost.
>>>
>>> But to add a Kconfig calling something "legacy", by the definition of
>>> what Xe will support feels maybe a bit premature. Sure it will become
>>> super useful once Xe is in the tree, to allow exactly the same class
>>> use-case as above, but until then it feels questionable under your own
>>> criteria too.
>>
>> I don't disagree. Partially the idea with "legacy" was to be a bit
>> vague, so we could tweak what it really means later.
>>
>>> If you could add a set of more generic options, which Xe could later tie
>>> into that would work for me. For instance we have some more natural
>>> cross-over points than Tigerlake. So if not per individual platform,
>>> maybe for like ring buffer -> execlists -> GuC transitions. And naming
>>> them without saying legacy for now, but use some descriptive names, and
>>> listing platform code names in help text. "Select this to support
>>> Broadwell, Skylake, etc..", "Select this to support Sandybridge..". Out
>>> of the tree Xe build can then just not use the corresponding defines in
>>> its own build and it would achieve what you need?
>>
>> I kind of wanted to avoid adding a lot of config options, because I
>> think they'll be difficult to maintain and get all the combos right. I
>> don't particularly want all the build bot reports about various kconfig
>> combos failing.

Hm these should not be tricky to that extent to cause any combinatorial 
issues. Famous last words? :)

>> One other problem is that I can't think of a way to do this by using the
>> kconfig CONFIG_FOO macros directly; you have to add separate variables
>> because the same files are built for two drivers. You can't force the
>> CONFIG_FOO macros to different settings for different drivers. So we'd
>> get a lot of proxy macros too.
>>
>> I wonder if there's a name we could use instead of legacy to reasonably
>> match what Xe needs to avoid adding tons of configs at once?
> 
> considering TGL itself is also "xe" arch (not to be confused with xe,
> the kernel module), maybe CONFIG_DRM_I915_PRE_XE?

Makes sense as a name I think. But why is the tricky question? :) Why do 
Xe+ users deserve the privilege of being able to compile out the old 
cruft but users of old machines cannot compile out Xe+? In other words 
how to make the thing attractive for not just Xe (the driver).

Mind you I am not really opposed, as long as it will be made in a 
flexible way. Just would like to explore the option of making it more 
widely useful.

Regards,

Tvrtko
