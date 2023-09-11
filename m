Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35BAEE57DF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 14:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31010E307;
	Mon, 11 Sep 2023 14:35:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F0E10E307
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694442912; x=1725978912;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jzhnvz3gU0Mcda8rinnn9FFmYNZjIRC7mv1oiJ/T1Gc=;
 b=iErZqan0bMwF2R3/JSBjuLdOo5tsPNdTv/qSsO+7r04PBUCsBR3ECcGy
 fsYCgGNSI4xDB9nT/GYIfzFCOG1K6FsT5/k/dpBIW1byCAsbozCYj/pY7
 Yr1EyYQHrmaiKQ9FsQyPieO2HiwTbAc0bT/B50bNUI0ePeJX3ZZPZN89u
 48wPTMcS6DKerMgVWtTiQc86yvGOinz8DfXhKfNGP43ZZ9Vh45Gav98tL
 f+noLDfUf+boNFHmnCFt8777wwqexL6C6hRljIZRK4SJFOIWASeX8w/u7
 TbRu5hphzQcUTvg89mDV7XUUB/SIdqvb8prwsJ+pUv459Bs/fXQ/9iSsw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464466411"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="464466411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 07:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858338849"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="858338849"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 07:35:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZPuR8zorq32uh3Bn@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230905141347.1027082-1-jani.nikula@intel.com>
 <ZPuR8zorq32uh3Bn@intel.com>
Date: Mon, 11 Sep 2023 17:35:07 +0300
Message-ID: <87zg1seq1w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/5] drm/xe: drop unnecessary i915 display
 commits
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 08 Sep 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Sep 05, 2023 at 05:13:42PM +0300, Jani Nikula wrote:
>> Revert five unnecessary commits.
>> 
>> The rebased version with all the commits just thrown away is at
>> [1]. That also drops "drm/i915/display: Make FBC check stolen at use
>> time." which has become an empty commit.
>> 
>> [1] https://gitlab.freedesktop.org/jani/xe/-/commits/xe-drop-unnecessary-commits-2023-09-05
>> 
>> 
>> Jani Nikula (5):
>>   Revert "FIXME: drm/i915: display/intel_display_types.h random
>>     whitespace changes"
>>   Revert "FIXME: drm/i915: include i915_utils.h from
>>     intel_display_types.h"
>>   Revert "FIXME: drm/i915: revert the earlier mmio_offset change"
>>   Revert "FIXME: drm/i915/display: Prefer i915->uncore over plain
>>     uncore"
>>   Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"
>
> I honestly confess that I got a bit lost here, but the end result
> makes sense, so I just force-pushed the removal of these 6 patches.

Thanks. So I sent these as reverts to get CI results, and the branch was
just the reverted patches removed altogether.

BR,
Jani.

>
>> 
>>  drivers/gpu/drm/i915/display/intel_bios.c          | 13 ++++++-------
>>  drivers/gpu/drm/i915/display/intel_display_types.h |  3 ++-
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>> 
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
