Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94946CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 09:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481A010E836;
	Wed, 10 Jun 2026 09:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8DCx0xN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A922410E832;
 Wed, 10 Jun 2026 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781083147; x=1812619147;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=dwapQEy2n2Hj9nMMfGh69aztzW/1dF/qDd9o71ii/VE=;
 b=V8DCx0xNIWLXJP0jZYtWhaZoBR5u846vXdEcuhnH3EZzzIxVk0C3ZCOs
 +G/0LikrTjmgFMVCEXnLBjszpD34q7i3vMiel0UuqqXzyQoDlUdMGh5hR
 gId9Hkle6YZnRST5FklOWYVBRA75E5VYAC17IcZ5Zae96H8GoIvkgdFwa
 kiZsORqHHEk4Ivtr+P2/S2ArmTZNYy3yp1Emg5HDdDxEfHlNW1EUbP44T
 WZbqDz9uREjDHLZ60H2oI+8CbXwsmasbDgnVkRS8c4B7JeNJqquaAxLt3
 OkkpnlzwUHrSehw7hfjzTbEDjAuA1cui9oxiLWZBIaCM/w8dH2asQfTnv A==;
X-CSE-ConnectionGUID: awMHQn2vSqGoq4dzyX7vxg==
X-CSE-MsgGUID: hxUjKWbxQS2b0ZkJ0TPjSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104536219"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="104536219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:19:07 -0700
X-CSE-ConnectionGUID: /Ei/dYc+Q5mNZdrcQARsGA==
X-CSE-MsgGUID: 5N8B1EWkQjC0HlKZrilCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="245974140"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:19:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm/i915/color: cleanup plane pre/post csc lut code
In-Reply-To: <3592f764-7e02-49ed-995b-f3c55c315df0@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1780499355.git.jani.nikula@intel.com>
 <3592f764-7e02-49ed-995b-f3c55c315df0@intel.com>
Date: Wed, 10 Jun 2026 12:19:02 +0300
Message-ID: <501ed863d5f1c34e0392cddfb5c20b6f4811c551@intel.com>
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

On Mon, 08 Jun 2026, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> On 6/3/2026 8:44 PM, Jani Nikula wrote:
>> While reviewing some patches I noticed the
>> xelpd_program_plane_pre_csc_lut() and xelpd_program_plane_post_csc_lut()
>> functions were a bit convoluted. Reduce the number of loops in each from
>> four to one, among other things.
>
>
> Other than the nit in patch 7, LGTM.
>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Thanks for the review, pushed to din, fixed the whitespace while
applying.

BR,
Jani.

>
>> 
>> BR,
>> Jani.
>> 
>> 
>> Jani Nikula (8):
>>    drm/i915/color: clean up variables in
>>      xelpd_program_plane_pre_csc_lut()
>>    drm/i915/color: clean up variables in
>>      xelpd_program_plane_post_csc_lut()
>>    drm/i915/color: reduce indent in xelpd_program_plane_pre_csc_lut()
>>    drm/i915/color: reduce indent in xelpd_program_plane_post_csc_lut()
>>    drm/i915/color: join loops in xelpd_program_plane_pre_csc_lut()
>>    drm/i915/color: join loops in xelpd_program_plane_post_csc_lut()
>>    drm/i915/color: deduplicate loops in xelpd_program_plane_pre_csc_lut()
>>    drm/i915/color: deduplicate loops in
>>      xelpd_program_plane_post_csc_lut()
>> 
>>   drivers/gpu/drm/i915/display/intel_color.c | 117 ++++++++-------------
>>   1 file changed, 45 insertions(+), 72 deletions(-)
>> 
>

-- 
Jani Nikula, Intel
