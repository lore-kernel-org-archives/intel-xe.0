Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B27BC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 04:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1075F10E974;
	Fri, 21 Jun 2024 04:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESxWnfmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B11710E974
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 04:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718943973; x=1750479973;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gsRbfO0p6l3rSx3EWplkjNMzOTE9lubfMHcE3L/08V8=;
 b=ESxWnfmRWgnvIZHeR7nWw3W7Xq42tEhOvH3a5eCjQ6QeyrEjRHKWGP9C
 cISoJCZEg7FzJ9Gmvup8QmGcThz4SfscK8bOooy/jNylygLZ30DVfc95E
 l7lQYicUMvmxCI2CGJFklC4BpoOCmX/7N5vujHXas2LopLz3xqX9CheoR
 HcMIVwB9/fXRFH5QHmyqJw6DJRFEAHj3Q1GOqoPbn8E9fxxf90sWldZxo
 2t8K/7YhnPKHvS4RFG5If/G8PKZMDK0wPV+sbKYfDxDOFkG1Mm8pbown1
 vNFbdx+Z1e2PT50QXStnvavPPNu2VxQXRByAndSpiFCztZaMRAfXYgQdC g==;
X-CSE-ConnectionGUID: KS1Y/0a1SC+MZTpZ9pFE7w==
X-CSE-MsgGUID: k620b1OYTrOk6Be88mbQqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27099733"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="27099733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 21:26:13 -0700
X-CSE-ConnectionGUID: PNSV+AYnTJ+71VYMcnuFZA==
X-CSE-MsgGUID: QKRl0j8bQ0WDO1wnwuDBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="65714043"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 21:26:10 -0700
Message-ID: <25d256e1-ce8f-41f4-b010-ca28b5eef557@linux.intel.com>
Date: Fri, 21 Jun 2024 09:59:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com, krishnaiah.bommu@intel.com
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <878qz8u1on.wl-ashutosh.dixit@intel.com>
 <af6df0d8-bafa-4fd5-a747-ff9e3092c3c6@intel.com>
 <875xubtu61.wl-ashutosh.dixit@intel.com> <ZnR/uGMcxOETqhsm@orsosgc001>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZnR/uGMcxOETqhsm@orsosgc001>
Content-Type: text/plain; charset=UTF-8
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


On 21/06/24 00:45, Umesh Nerlige Ramappa wrote:
> On Fri, Jun 14, 2024 at 08:34:30AM -0700, Dixit, Ashutosh wrote:
>> On Thu, 13 Jun 2024 22:50:39 -0700, Riana Tauro wrote:
>>>
>>> Hi Ashutosh
>>>
>>> On 6/14/2024 12:09 AM, Dixit, Ashutosh wrote:
>>> > On Thu, 13 Jun 2024 03:04:09 -0700, Riana Tauro wrote:
>>> >>
>>> >
>>> > Hi Riana,
>>> >
>>> >> There are a set of engine group busyness counters provided by HW which are
>>> >> perfect fit to be exposed via PMU perf events.
>>> >>
>>> >> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>> >>
>>> >> events can be listed using:
>>> >> perf list
>>> >>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>> >>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>> >>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>> >>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>> >
>>> > PMU patches merged previously were dropped in 90a8b23f9b85 ("drm/xe/pmu:
>>> > Remove PMU from Xe till uapi is finalized") because PMU uapi was expected
>>> > to change. Why are we re-posting these old patches again now, without
>>> > including the planned uapi changes?
>>>
>>> The uapi changes were dropped and there are no other upcoming changes for
>>> Group busyness. So re-posted the old series.
>>
>> What happened to VF busyness (which is why I thought the uapi was going to
>> change)?
>
> There are no plans to support group busyness from a VF, so we are just exporting group busyness to maintain parity with i915 for Native/PF behavior. The only change would be to expose the counters in ticks rather than ns. I still have to look at this series to see if that's happening.

how will the counter ticks be used to get the busyness in time

Regards,
Aravind.
>
> Regards,
> Umesh
>>
>>>
>>> Thanks,
>>> Riana
>>> >
>>> > Thanks.
>>> > --
>>> > Ashutosh
