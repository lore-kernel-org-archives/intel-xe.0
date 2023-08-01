Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61F3C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A0210E327;
	Tue,  1 Aug 2023 08:19:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8130510E327
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690877952; x=1722413952;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=V1AQgvLOvsRyLN0VdqoHo5T7Wh9Ye7SO6Ry6s/Txsa4=;
 b=niu8098QX316VSXwqjS+i5Nsq8n44OK0SaVOgXZ9qK26wK7f9epyzw0W
 rayhafofz2uvaTgCLWoLor87RezaKRMTyiDn84shyi4F5CtoNS0dHKO/5
 4ftsLIygeyI5ikOA8+TLci1+O3mc7m7zeymy3xtqFANcUXR6qPmk1mYLZ
 GmDFXfs742tl5sX8UEKzP97pxS5bBkCJhR9pOy2E5UbNl+J41z4nJX+T6
 8zHNXf+ahYzQP+F0WkQDAo461m5jepO8cZHE2wvItLW51nTDciXFZc04W
 pKS4DjsCFUTfA3mVOlaFBDzzsqSWhvA5zF4ihUKyWjWcF41YN7fs06XwV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="372865019"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="372865019"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818708977"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="818708977"
Received: from igorban-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:19:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <5e88b39b-6c15-cae4-0a15-0dbd7ef594b4@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230728192518.1951-1-michal.wajdeczko@intel.com>
 <5abeaa6e197e6f63cb3ae7f66084f011be2fa662.camel@intel.com>
 <5e88b39b-6c15-cae4-0a15-0dbd7ef594b4@intel.com>
Date: Tue, 01 Aug 2023 11:19:07 +0300
Message-ID: <87r0onw4xw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC] drm/xe: Introduce xe_ASSERT macros
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 28.07.2023 21:47, Vivi, Rodrigo wrote:
>> On Fri, 2023-07-28 at 21:25 +0200, Michal Wajdeczko wrote:
>>> As we are moving away from the controversial XE_BUG_ON macro,
>>> relying just on WARN_ON or drm_err does not cover the cases
>>> where we want to annotate functions with additional detailed
>>> debug checks to assert that all prerequisites are satisfied,
>>> without paying footprint or performance penalty on non-debug
>>> builds, where all misuses introduced during code integration
>>> were already fixed.
>>>
>>> Introduce family of xe_ASSERT macros that try to follow classic
>>> assert() utility and can be compiled out on non-debug builds.
>>=20
>> This is indeed much better and clear then the XE_BUG_ON.
>>=20
>> Also, let me be clear that my intention with reply is not to
>> block the introduction of this assert macro.
>
> thanks
>
>>=20
>> But I'd like to raise my concern(s?) with such assert macros:
>>=20
>> In many cases that we currently use these macros are actually
>> very useful on production build. Whenever we receive bug reports
>> we should be able to ask the reporter to get a dmesg or enable
>> a drm.debug and get a message and we could see these, without
>> ever having to ask the report to rebuild the kernel with a debug
>> config.
>
> you should think of xe_assert() as extension to static_assert() but
> aimed to be executed during internal CI builds only, when we run basic
> integration tests, and were we are able to quickly catch all misuses,
> caused by rapid or multiple changes going in.
>
>>=20
>> Then, we add this in the code and we start using this everywhere
>> without stopping to think if that would be good in a report and
>> we end up with a code full of asserts and big problem to get the
>> useful information from the bug reports.
>
> those asserts shouldn't fire beyond integration builds - if someone uses
> assert() to tag unfinished work, then it's simply wrong, in such cases
> true WARN and correct fallback shall be implemented - and that's the
> role of the reviewers to spot it ;)

Naming this ASSERT is the first step towards proper usage, because it
implies it might be different for regular and debug builds.

The second step would be adding a comment documenting the usage.

I think in general the idea behind the conditional GEM_BUG_ONs was to
avoid the performance impact of leaving them in place. But then we've
started sprinkling GEM_BUG_ON indiscriminately, because you didn't have
to think about performance. 1200+ instances of GEM_BUG_ON in i915. It's
just crazy.

>
>>=20
>> Aside from the fact that we end up going far from other drm and
>> non-drm kernel drivers and starting from day 0 a driver full of
>> driver-isms.
>
> maybe because our driver(s) are bigger and more complex ? also much more
> developers are working on it, with multiple refactoring going constantly
> on, so we should have mechanism to allow us catching unexpected uses
> without polluting production driver too much.
>
> btw, DRM already has assert() but named as bug()

Do git blame on that and realize it originated from us following the
same pattern as GEM_BUG_ON, which got copy-pasted as XE_BUG_ON. It's
just problematic all around, and upstream consensus is that BUG_ON() is
not even for CI. Use warn and panic_on_warn instead.

BR,
Jani.

>
> [1] https://elixir.bootlin.com/linux/latest/C/ident/DRM_MM_BUG_ON
>
>>=20
>> I would prefer we have a driver where we make usage of the all
>> the drm error, warning, debug, info variants on a case by case,
>> carefully analyzing the needs and thinking about the bug reports
>> that we might receive from end users.
>
> +1
>
> it would be also nice if driver is correctly handling all errors or
> invalid input paths, but at the same time, it shouldn't duplicate checks
> that shall be already done at higher layer/caller - with asserts() we
> just express our expectations without ignoring other bugs by trying
> handle that unexpected case down the stack
>
>>=20
>>>
>>> Macros are based on drm_WARN, but unlikely to origin, disallow
>>> use in expressions since we will compile that code out.
>>>
>>> As we are operating on the xe pointers, we can print additional
>>> information about the device, like tile or GT identifier, that
>>> is not available from generic WARN report:
>>>
>>> [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
>>> =C2=A0=C2=A0=C2=A0 graphics: Xe_LP 12.0 media: Xe_M 12.0 GT0
>>> [ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280
>>> xe_device_probe+0x2f5/0x4a0 [xe]
>>> [ ] RIP: 0010:xe_device_probe+0x2f5/0x4a0 [xe]
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>> =C2=A0drivers/gpu/drm/xe/xe_assert.h | 47
>>> ++++++++++++++++++++++++++++++++++
>>> =C2=A01 file changed, 47 insertions(+)
>>> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h
>>> b/drivers/gpu/drm/xe/xe_assert.h
>>> new file mode 100644
>>> index 000000000000..65306768d637
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>>> @@ -0,0 +1,47 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright =C2=A9 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __XE_ASSERT_H__
>>> +#define __XE_ASSERT_H__
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +
>>> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...)
>>> ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *__xe =3D
>>> (xe);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int __passed =3D
>>> !!(condition);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_WARN(&__xe->drm, !__pass=
ed, "[" DRM_NAME "] Assertion
>>> `%s` failed!\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "graphics: %s %u.%u media: %s %u.%u "
>>> fmt,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
>>> __stringify(condition),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __xe-
>>>> info.graphics_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __xe->info.graphics_verx100 / 100, __xe-
>>>> info.graphics_verx100 % 100,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __xe-
>>>> info.media_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __xe->info.media_verx100 / 100, __xe-
>>>> info.media_verx100 % 100,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ##
>>> arg);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(void)(__passed);=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0\
>>> +})
>>> +
>>> +#else
>>> +
>>> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...)
>>> ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0typecheck(struct xe_device *,
>>> xe);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUILD_BUG_ON_INVALID(conditi=
on);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0\
>>> +})
>>> +
>>> +#endif
>>> +
>>> +#define xe_ASSERT(xe, condition) \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_ASSERT_MSG((xe), conditio=
n, "")
>>> +
>>> +#define xe_tile_ASSERT(tile, condition)
>>> ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_tile *__tile =3D
>>> (tile);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_ASSERT_MSG(tile_to_xe(__t=
ile), condition, "tile%u ",
>>> __tile->id);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +})
>>> +
>>> +#define xe_gt_ASSERT(gt, condition)
>>> ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_gt *__gt =3D
>>> (gt);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_ASSERT_MSG(gt_to_xe(__gt)=
, condition, "GT%u ", __gt-
>>>> info.id);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0\
>>> +})
>>> +
>>> +#endif /* __XE_ASSERT_H__ */
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
