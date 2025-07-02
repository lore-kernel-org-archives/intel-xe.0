Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DD8C83F04
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 16:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F27D10E744;
	Wed,  2 Jul 2025 16:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MN+8Yuxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD8C10E748
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751473564; x=1783009564;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+IohrlHacYNwpvKJMLbFAtwZtGFiqf2KIswwqB95vHw=;
 b=MN+8YuxsT+wXInJt1O4F3pwaCsp33CC1fAcPoWG3fga+fbbeIvWh3Fpp
 xexIBc02GAG9ZgFpVLDtXz3kGGrU5mu2sUeBlgv8fYsQOWQ3FHUCKDlnS
 y4s1sKu0+69/02jAxdaQtWn0cuB2/hUEkd158VQyoQBFeK2nxIzfadiyw
 cRZS+aKTTgasp56KHzdKQI2kE3vB2hHIrg//LANCJvzcigr0w/Bo6Pahu
 O1C8l3QZnGlnrz56jurkqeUTO49Br48+yAUDcYXIYcAjYeLJxGg61RULs
 87Ah5Nv9UbEWTIP7y2Kk2UV+rOQS53vX08KPQXnmrx4tnMiw6vflscoql Q==;
X-CSE-ConnectionGUID: FMJkmWx5Rsixz3mE5oRWtw==
X-CSE-MsgGUID: IeSeFv5aRyOh0KvlFT1OWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53747729"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53747729"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:26:04 -0700
X-CSE-ConnectionGUID: zRgUBc/HTQe8oZigFi6OXA==
X-CSE-MsgGUID: 7/Z2DwhZTCG+kRAe18ZVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154631354"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 02 Jul 2025 09:26:01 -0700
Received: from [10.245.112.168] (unknown [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 982C8312F0;
 Wed,  2 Jul 2025 17:26:00 +0100 (IST)
Message-ID: <a1abff7e-62ce-493b-b5fa-094312411e58@intel.com>
Date: Wed, 2 Jul 2025 18:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Don't allocate temporary policies object
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250702142504.1656-1-michal.wajdeczko@intel.com>
 <aGVaSt6g9og1Iyir@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aGVaSt6g9og1Iyir@lstrano-desk.jf.intel.com>
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



On 02.07.2025 18:11, Matthew Brost wrote:
> On Wed, Jul 02, 2025 at 04:25:04PM +0200, Michal Wajdeczko wrote:
>> Since we are already using reusable buffer objects from the GuC
>> buffer cache, we can directly write into their CPU pointers and
>> spare unnecessary temporary allocation.
>>
>> While around, also make sure to clear obtained buffer, to avoid
>> sending some stale data.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Patch LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> QQ semi-related though - guc_ads_action_update_policies. The GGTT
> address passed in is 32 bits. I thought the GuC firmware interface
> changed everywhere to use 64 bit GGTT addresses to future proof. Did
> this H2G get missed?

dunno, I was not included in any non-SRIOV GuC ABI reviews

but I guess we can still add new action (minor ABI change) that just
will be a new baseline for any future platform with 64b GGTT, no?


