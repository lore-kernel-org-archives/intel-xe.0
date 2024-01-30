Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3386C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B80E10F836;
	Tue, 30 Jan 2024 17:58:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214CD11322F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706637486; x=1738173486;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NS6W6bvIIHSj/t4/SYr3QVYYNXJ7JpIueax54sA5rKI=;
 b=F3wJRAb0csb358CL5mpUcxA8XvVXtSc0AC2VSZbHclIe9ojjC6L9mTLX
 5xlHmUxJXOIav3lWO5ChGU9z26fUSwXpKm2FZ35hcFy1b6z9+cKSU3dKn
 /uUNe5VOiVUni/9cTrC050G3rpb+4pLR17iCGAMx+s+zPZBXT3/0L9b3x
 hffVn/HTff9gPkguLrC15fkEW8yqJbTtHVxKWMvaJwEM5bLOByw/dTEo7
 7bQi0EsVuAal3P84lwBoWp7ESd2qMlLf5ITK/i44G/RIW0NHZjpKFf8aS
 Co0G93yqUiwkTqQUGprZLE19KDytjJhDa+qUJreC65LFsWNM1T8wRqPcn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434529651"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="434529651"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="29975472"
Received: from dcarleto-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:58:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Prefer BIT/GENMASK macros over shifts
In-Reply-To: <ZbkuXLIG1qpEd1Wg@DUT025-TGLU.fm.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240123212317.1600836-1-matthew.brost@intel.com>
 <87il3jkqtn.fsf@intel.com> <ZbkuXLIG1qpEd1Wg@DUT025-TGLU.fm.intel.com>
Date: Tue, 30 Jan 2024 19:58:00 +0200
Message-ID: <87ttmuitzr.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> On Wed, Jan 24, 2024 at 11:45:24AM +0200, Jani Nikula wrote:
>> On Tue, 23 Jan 2024, Matthew Brost <matthew.brost@intel.com> wrote:
>> > Using BIT/GENMASK macros is a better convention than using manual shift
>> > and will also fix build errors [1].
>> 
>> One of the reasons i915 does not really use BIT and GENMASK directly is
>> that their type is unsigned long, and thus their size is different on 32
>> and 64 bit builds, while almost invariably you need one or the other to
>> describe hardware or firmware interfaces. Not something that depends on
>> the build.
>> 
>> Using %lu or %lx as format specifier should work, but people find it
>> weird to have to use that for essentially 32-bit things, and forget. And
>> there's confusion when you still have stuff like:
>> 
>> #define GUC_CTB_STATUS_NO_ERROR				0
>> 
>> instead of 0UL i.e. some of the macros end up being unsigned long with
>> variable size, and some, like this, not.
>> 
>> I'm sure the REG_BIT and REG_GENMASK macros feel off-putting for things
>> that aren't exactly registers (like the firmware interface), but let's
>> hope we get Lucas' fixed-size BIT and GENMASK macros merged [1], and can
>> use them.
>> 
>
> I'm fine with using these new macros but I believe we need to get a fix
> into 6.8 and unsure if Lucas's series is going to land before then. Are
> you ok with landing this series as is for now and updating all of the
> defines in Xe in a follow up? Or do you have other ideas of how to
> proceed for 6.8?

I'll defer to the xe maintainers on this one. Just giving some
background what the issues with BIT/GENMASK were.

BR,
Jani.


-- 
Jani Nikula, Intel
