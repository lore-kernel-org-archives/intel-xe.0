Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729E1C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 12:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEC210E7D0;
	Wed, 29 May 2024 12:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv96yKKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7735112A99
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 12:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716986716; x=1748522716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FZ4+DRfu5kGzvqgdQDydiIA1no0Hx0BViM/Myt46/SQ=;
 b=Lv96yKKLWLHEyQIxjWFSWEYrTkYlaitILA79tEXUZdb9walqQ4BG3Pvc
 +ZoPEGWCNpEVTlXCA1QSkVAx5Yf+mEQsSmWG1gIXHuCQ0fa6hRGNMpWkW
 MuLYB9eAtUTjqK7+NuAOxdb7JsW+DHewiLAxFiYLEoEYP0n/s2bK7zAV/
 zUamlHRnjuSOsXehQBlxpju/kQUoeMBb27l5HWyMOL91jsZiPNKUe46x4
 YTxALlbi9LwH4TfTZ4DMg8C5/m/D6X8B6erHScifPDCW/f3N7PA+2MkkX
 KXsEuy1XecMDZTk9nFJuLZa1qf6aEaXZjqV1oRL87tX8XCRVuFB5JFI4S g==;
X-CSE-ConnectionGUID: tyAYt9UITSeGpKlLHqFpEg==
X-CSE-MsgGUID: bjausW4mQMiy1swcyefd4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13550692"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13550692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:45:15 -0700
X-CSE-ConnectionGUID: RP+pZ1+BTc+UthTsks0Plg==
X-CSE-MsgGUID: 7gTbCVVeTrWaSUrIMrx6jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="39858311"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 29 May 2024 05:45:13 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EC4E527BC4;
 Wed, 29 May 2024 13:45:07 +0100 (IST)
Message-ID: <c368cc90-2d0f-4e6e-9cdb-8ccef42e2d0d@intel.com>
Date: Wed, 29 May 2024 14:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
 <46164a96-f72c-4991-a41d-eea299540d75@intel.com> <87bk4okfb4.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87bk4okfb4.fsf@intel.com>
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



On 29.05.2024 13:50, Jani Nikula wrote:
> On Wed, 29 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> ++ maintainers
>>
>> On 29.05.2024 00:15, Matthew Brost wrote:
>>> We have talked about this before and I think the consensous was "xe_"
>>> prefixes for static functions are fine, perhaps even desired. I can't
>>
>> IMO use of "xe_foo" prefix for static functions is inconsistent (as its
>> name suggests that it is public function while OTOH it is declared as
>> static) and may mislead that it could be used in other compilation unit.
>>
>> thus use of "xe_" (for static) should be rather discouraged but also at
>> the same time it shouldn't be treated as showstopper (with the hope
>> better name will be provided later)
>>
>>> find a reference but I do recall a discussion on the list about this.
>>>
>>> I think the maintainers should make / document a rule wrt to "xe_"
>>> prefixes before we start making changes in this area as it is not clear.
> 
> IMO the prefix is useful even for static functions for a few reasons:
> 
> - C has no namespaces. The use of prefixes in the kernel global
>   functions and macros is inconsistent at best. Prefixes avoid clashes.

good point but I guess any new global function will be named in a way
that will minimize risk of clash

> 
> - It's quite handy to be able to just glance at a backtrace to see where
>   it's originating from. With a bunch of generic non-prefixed functions
>   in there, you kind of lose track, and have to look at the source.

if you are unlucky and not all static functions were inlined then still
the backtrace shall include top level public xe_foo() function

> 
> - During refactoring, it's not uncommon to make functions
>   static/non-static, and having to rename at that point is a bit
>   tedious.

another good reason to avoid refactoring and come with good design in
the first place ;)

> 
> That said, we haven't required this in i915. Also platform acronym
> prefixes are common especially in display code. Some people have started
> adding single underscore prefixes for static functions in a few places,
> but I pretty much frown on that.

and sometimes static functions names are defined/added to clarify the
flow or function logic, and strict adhere to rules to have a prefix
might make it less clear, so some room for common sense is still needed

> 
>> before we start writing rules for static functions, better to focus only
>> on rules for public naming convention for the components, like:
>>
>> files:
>> 	GOOD
>> 		xe_foo.ch
>> 		xe_foo_types.h
>> 		xe_foo_helpers.h
>> 	FINE
>> 		xe_gt_foo.ch
>> 	BAD
>> 		foo.ch
>>
>> types:
>> 	GOOD
>> 		struct xe_foo_xxx
>> 		enum xe_foo_yyy
>> 		typedef xe_foo_zzz
>> 	BAD
>> 		struct foo
>> 		struct xe_bar
>>
>> functions:
>> 	GOOD
>> 		xe_foo_bar(struct xe_foo *foo, ...)
>> 	FINE
>> 		xe_foo_bar(struct xe_device *xe, ...)
>> 		xe_gt_foo_bar(struct xe_gt *gt, ...)
>> 	BAD
>> 		xe_foo_bar(..., struct xe_foo *foo)
>> 		xe_bar_foo(struct xe_foo *foo, ...)
> 
> And sometimes you want to prefer names that are easy to pronounce and
> make sense over names that strictly adhere to rules...

but then it should be treated as an exception, to be approved by the
maintainer, from general guidelines that maintainers can still document

> 
> BR,
> Jani.
> 
> 
