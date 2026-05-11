Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A47BCD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BA010E6D7;
	Mon, 11 May 2026 12:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSjgcdFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B697210E6C3
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778501012; x=1810037012;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=O4A6rm6VM6NC/EhbObVukyH2SCgMK+NvrcSTe6rXOMQ=;
 b=XSjgcdFcyLIvV0IAVUsy2CAopli8v1q1UPqCmWVkMp7UzxqqCN4HtSTt
 rg+KgIDKDss48hmFEhOn8tuXsYWESMwKjqSQxDdqYQoGNAO3kAJqW3wHu
 Kg2h/hdFe7imhrZyY0sbLS95JgxxL2WgtaBGVHqo5B4JflFqDU5PqywT6
 O/ARYwlT2WsJQwqR1+ZhVMyrnUic3DVFLQoTQ7wd6c74lAEc/EgAmRiJw
 Cy1Qy0WbUYrMEI5xfxnIMJBvk6jxS1zQ44H2GDFZYh96qwy430unRV/hx
 ou0f4J8ZZjtUHWDxuTyEjzV70s/S84o1dF7jVMImHpgnsZ0alVA4XQQ9a w==;
X-CSE-ConnectionGUID: VvmKPScLRMeKWdswVaW/fQ==
X-CSE-MsgGUID: H6O5Nt/8Qzq7njArrisjzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90850677"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90850677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:03:32 -0700
X-CSE-ConnectionGUID: 4tyGwudyQQK4gWuKmbBQbA==
X-CSE-MsgGUID: Q2dcD7dYS7eLMU5aGrl/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="231043652"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:03:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <871pfirwy7.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
 <871pfirwy7.fsf@intel.com>
Date: Mon, 11 May 2026 15:03:26 +0300
Message-ID: <619ba2cfdac33128f92c4f83b8573770146cead8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Jani Nikula <jani.nikula@linux.intel.com> writes:
>
>> On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>> +/**
>>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
>>> + * @test: the &kunit test
>>> + *
>>> + * Return: True for a live test and false otherwise.
>>> + */
>>
>> Pardon me for being blunt, but I think this is the worst kind of
>> kernel-doc comment.
>
> I appreciate the bluntness! :-)
>
>>
>> It doesn't provide any additional information to what the function name
>> and signature already convey (which is to say excellent job on naming
>> the function), but it fails to explain what "live test" means.
>
> I kind of just added this kernel-doc to fill a hole for "consistency",
> but, yeah, it does not provide any new info.
>
>>
>> The extra bits of useful information people might need after seeing the
>> function xe_kunit_helper_is_live_test() in code are: What is a live
>> test, and what is it if it's not live? Dead?
>
> Zombie? ;-)
>
> Joking apart, I personally tend to use "regular" to refer to non-live
> tests. I do agree we are missing some documentation on the subject.  I'm
> not sure though this function should be the place to do it.  I think we
> would be better off with a "DOC:" section for that (and also explain
> other bits in there).  I think it would be sensible to rename
> xe_kunit_helpers.c to simply xe_kunit.c and add such a section.
>
> With that in place, this function would be kind of self-explanatory,
> right? Is this a case we just drop the kernel-doc?
>
> Or should we try to be consistent on "every public function should have
> a kernel-doc"?  Is that even a rule or am I imagining things? :-)

I believe xe maintainership leans more towards requiring kernel-doc
comments than we do with i915 or display. I think the hard requirement
leads to a lot of unnecessary boilerplate, more geared towards filling
the requirement than being informative and helpful.

Personally, I value overview DOC: comments much more than kernel-doc
comments. If I were to add any hard requirement for documentation, it
would be for DOC: comments for each .c file.

Bottom line, for xe, ask for xe maintainer opinion.


BR,
Jani.

>
> --
> Gustavo Sousa
>
>>
>>
>> BR,
>> Jani.
>>
>>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
>>> +{
>>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
>>> +	return false;
>>> +}
>>
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
