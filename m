Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E79C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 10:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76710E2F9;
	Tue, 13 Aug 2024 10:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXhe3jjn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9E110E2F9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723546760; x=1755082760;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vOxnPQkXCxREYSO2V/uiImUS1fj09yEjFKnR9877Ugo=;
 b=eXhe3jjnnqx+Rg6A/e4nK/na7DwBA5QnpoeDmcAXaZ1wj9O9g5P6mpEt
 O+2Kq3n5/bzPQnS64gxeSSWs+BlBQgvgDOTfBTd3YpTjmaegv6f22WIfN
 T7Ek9o0ur8MljS/E/k5/jTSzgRr7gY+iD0O5lQDqkv8YaOLLjNPiZBSuR
 Sc6L73Y4WCrS+xSlqbAhwWwbT+w2eGwP52bKw1Tcul1ZqNR84CtzrzcS1
 1UFrMKVygbE8BGVua91uACsZWd8bqAYPE1tOZixokMuV9Ry2hc3yKZ55R
 vjIGvtBkvknp/mqldhqF3LxVRodvTcP4DEKpXj1PUIIg48ivov+poyARz Q==;
X-CSE-ConnectionGUID: NhrbZUt6RSad8FdosQnJJA==
X-CSE-MsgGUID: IDKQje7OQ6ycv+5lzY/I/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25492070"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25492070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:59:19 -0700
X-CSE-ConnectionGUID: 922UyYxaRHOaQ1nOK00NBw==
X-CSE-MsgGUID: Agwp2pNlS2CpL47ef3oWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="62790484"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:59:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/1] drm/xe: Add driver load error injection
In-Reply-To: <ZrduH7WZvUGDxUSg@DUT025-TGLU.fm.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240809224424.3212551-1-matthew.brost@intel.com>
 <20240809224424.3212551-2-matthew.brost@intel.com>
 <sm7bvlh4s6djffddiywpjuboui6qdzcww3pjvtybt46c2xbp5f@c3s4vcaqe3ja>
 <ZrduH7WZvUGDxUSg@DUT025-TGLU.fm.intel.com>
Date: Tue, 13 Aug 2024 13:59:13 +0300
Message-ID: <87ttfozo1q.fsf@intel.com>
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

On Sat, 10 Aug 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> On Sat, Aug 10, 2024 at 12:16:32AM -0500, Lucas De Marchi wrote:
>> On Fri, Aug 09, 2024 at 03:44:24PM GMT, Matthew Brost wrote:
>> > Port over i915 driver load error injection.
>> > 
>> 
>> I don't like much the manual approach, but it's better to get the driver
>> not exploding. Then we can think of replacing this.  Some comments below
>
> Yep. I chatted with Rodrigo about this and we agreed their isn't a great
> way with the existing kernel error injection to easily get coverage like
> this plus a very simple test case [1]. Agree longterm we should not
> invent our own things and come up with either a kernel or drm level
> solution.
>
> In the short term, yes this better than our driver exploding. View this
> as a force probe blocker, so we need to get our driver fixed in a matter
> of weeks and this seems like the only viable path for now.
>
> [1] for i in {1..N}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done

*sad trombone*

It just pains me that we keep copy-pasting stuff from i915, especially
when it's the hacky less than stellar parts. Like this one.

Fixing this needs to go to some tracker somewhere, and get it assigned,
otherwise later means never.


BR,
Jani.


-- 
Jani Nikula, Intel
