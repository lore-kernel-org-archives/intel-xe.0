Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EACCC02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 11:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BE410E2BA;
	Tue, 18 Feb 2025 11:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV3YzIhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53D910E2BA
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739879696; x=1771415696;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3/Kg8RjSisCdlirKzIiE1cXxfH+WYoljYqoTszxuLZI=;
 b=DV3YzIhBdyagsjVqVA+f7mHNGTjGd4EC5XlBT96/i7l4KzJF8a9eg1r1
 FrTOuZz3aYfZAx8DCjNB5fAOOFT15b8gUrzcw8VdqmErCAvw5cKRH7X/C
 l20D3uKKZ5JOIJB/s6cMljL5ZJCfyoeYonRnW6omMHjtgIH4x33IN0bQk
 S7FNpDEqA2w6R2L6PJd+6Tl8mv+03WIO7TySNIrg9hPPWUEGvzu2Kms5R
 UO+hKmTREZppKmoavImb+3IMMIug41lCoNiLe9PHvbNx9tx6hXHIkpHAI
 hE+KoRSzZMyts33Rc7zdKd26YW+kGKJEaZyjmzdJznKJo43rfUUaixGs+ w==;
X-CSE-ConnectionGUID: UNdp3l2VT3qYLdTSis6GQg==
X-CSE-MsgGUID: 865boAqKQeWXT6YMwkKr+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="50783751"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="50783751"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:54:56 -0800
X-CSE-ConnectionGUID: hi7e1P2UTvWyf6YLUNOEPQ==
X-CSE-MsgGUID: AIchEbgjRcegbPYHFBwxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="145226429"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:54:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v9 2/8] drm/xe/uapi: Introduce API for EU stall sampling
In-Reply-To: <85zfim1ls8.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <36d701413aeb171c86d5dd2ce7272918eb4ab818.1739193510.git.harish.chegondi@intel.com>
 <85h6512ybc.wl-ashutosh.dixit@intel.com> <Z600wXtGm8a1bfD2@intel.com>
 <85v7te7eks.wl-ashutosh.dixit@intel.com> <Z7FEHKxuSKrdH3Ze@intel.com>
 <85zfim1ls8.wl-ashutosh.dixit@intel.com>
Date: Tue, 18 Feb 2025 13:54:49 +0200
Message-ID: <87eczvo4c6.fsf@intel.com>
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

On Sat, 15 Feb 2025, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> On Sat, 15 Feb 2025 17:49:16 -0800, Harish Chegondi wrote:
>>
>> > > > > +struct eu_stall_open_properties {
>> > > > > +	unsigned int sampling_rate_mult;
>> > > > > +	unsigned int wait_num_reports;
>> > > >
>> > > > I already said no need to be so specific. Just use int or u32 as types for
>> > > > these.
>> > > Okay, will try to change these back to u8/u32 in the next version.
>> >
>> > Use int or u32, not u8.
>> Any reason why I can't use u8? The maximum value of sampling_rate_mult
>> is 7.

There is zero benefit in using a smaller type just because you think
your value range fits the type.

Default to using an int. You need a reason to use smaller types or
unsigned, not the other way round.

For example, many hardware registers are u32. That's a good reason to
use u32 when reading/writing registers. Sometimes reducing the memory
footprint matters, and you may want to use a smaller type. Likely not
the case here.


BR,
Jani.


>
> Use whatever you want. The real question to ask is why can't we use a
> generic type like int? Whether you use u8 or int, the CPU will still fetch
> a 64 byte cacheline. And this structure is only used at initialization, so
> performance is not a concern.

-- 
Jani Nikula, Intel
