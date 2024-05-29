Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E84C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 11:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B681134AC;
	Wed, 29 May 2024 11:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JourbTBV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1881134AC
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716983422; x=1748519422;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=R02qc3Twe9sYRC9WgOUcHiA0byQ6r9ms76MeUyHwA64=;
 b=JourbTBVfxzMSezDNnYQEfxGMHNbrVgTnGYc0lvxy24DqNzx3Ri3HCVK
 yngFtCjyI39OaLtkmhULtkORcna2ExvAA89qiaMyICJsuC3Fn1mB9+bUc
 6ap51bBz5ZJTDT1uMLHL/S9oXUMUcVc6rJFxkzGqqcnDuVEZNe04XOBlI
 vfFGNdJBKWGSK+rVxmdl9POaBoSQRbk2w7mt1Gx4891d6/nuvDeMHLEfo
 Bph5pcsJG8PeVLRNUuE1gkoZrk3DVbJ7aIn0K67M9Qmq4/5SOTCtuom3w
 hJhf/S4Ziszmi/FeU9c5Ynx32V77RfLlIlUl44xPe0d7J3U3q92caGFc+ g==;
X-CSE-ConnectionGUID: 2BA8s1atQL6zNh3BrIVJaQ==
X-CSE-MsgGUID: pzXGfiEQQ4ewmHFhK3Y2vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11748274"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="11748274"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 04:50:21 -0700
X-CSE-ConnectionGUID: uFrGWSPxTEO2RriA/HWIYQ==
X-CSE-MsgGUID: PrLrux16RvCN42hvzhjR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35474838"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 04:50:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
In-Reply-To: <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
 <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
Date: Wed, 29 May 2024 14:50:23 +0300
Message-ID: <87bk4okfb4.fsf@intel.com>
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

On Wed, 29 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> ++ maintainers
>
> On 29.05.2024 00:15, Matthew Brost wrote:
>> We have talked about this before and I think the consensous was "xe_"
>> prefixes for static functions are fine, perhaps even desired. I can't
>
> IMO use of "xe_foo" prefix for static functions is inconsistent (as its
> name suggests that it is public function while OTOH it is declared as
> static) and may mislead that it could be used in other compilation unit.
>
> thus use of "xe_" (for static) should be rather discouraged but also at
> the same time it shouldn't be treated as showstopper (with the hope
> better name will be provided later)
>
>> find a reference but I do recall a discussion on the list about this.
>> 
>> I think the maintainers should make / document a rule wrt to "xe_"
>> prefixes before we start making changes in this area as it is not clear.

IMO the prefix is useful even for static functions for a few reasons:

- C has no namespaces. The use of prefixes in the kernel global
  functions and macros is inconsistent at best. Prefixes avoid clashes.

- It's quite handy to be able to just glance at a backtrace to see where
  it's originating from. With a bunch of generic non-prefixed functions
  in there, you kind of lose track, and have to look at the source.

- During refactoring, it's not uncommon to make functions
  static/non-static, and having to rename at that point is a bit
  tedious.

That said, we haven't required this in i915. Also platform acronym
prefixes are common especially in display code. Some people have started
adding single underscore prefixes for static functions in a few places,
but I pretty much frown on that.

> before we start writing rules for static functions, better to focus only
> on rules for public naming convention for the components, like:
>
> files:
> 	GOOD
> 		xe_foo.ch
> 		xe_foo_types.h
> 		xe_foo_helpers.h
> 	FINE
> 		xe_gt_foo.ch
> 	BAD
> 		foo.ch
>
> types:
> 	GOOD
> 		struct xe_foo_xxx
> 		enum xe_foo_yyy
> 		typedef xe_foo_zzz
> 	BAD
> 		struct foo
> 		struct xe_bar
>
> functions:
> 	GOOD
> 		xe_foo_bar(struct xe_foo *foo, ...)
> 	FINE
> 		xe_foo_bar(struct xe_device *xe, ...)
> 		xe_gt_foo_bar(struct xe_gt *gt, ...)
> 	BAD
> 		xe_foo_bar(..., struct xe_foo *foo)
> 		xe_bar_foo(struct xe_foo *foo, ...)

And sometimes you want to prefer names that are easy to pronounce and
make sense over names that strictly adhere to rules...

BR,
Jani.


-- 
Jani Nikula, Intel
