Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFE2C001DE
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 15:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5B10E1AA;
	Tue,  8 Aug 2023 15:06:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A8110E1AA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691507171; x=1723043171;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rPEEtRq/aBakgGGWfOoLMOcAfc9hbZ+s0UMVlEToibI=;
 b=i1cvcByyYcWm1GIgo/a808bUfgKh8XRjcSPeZckKL6lwwoeneZwQwq00
 iJ+/2kVJOmx6IQwKM/lgldwLeFKDaewLSbwp33t3OLk7pBHOncN1XbzN4
 8b3hU6PzDeFw9kJ0JEjCPxqBUWLYE8rIVFle9hIm/awGqdtbr+jHKcov8
 pDn+UNJ0RpauSbDS7dLSRVmd7gWuW9caoHTOm3nEK5e4uWxtXG5F9l3UZ
 pz2yakYU5CqmtBUZl28nOj+OtxF1HVNwRwNunO0kHDMgw0m/BZpNlcv/O
 CuIJHvMhts8yNaheiozaFZ2zgHbe+0401WjcN9p6dCdB761yzZmryAG3H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369748121"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="369748121"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 08:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845508678"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="845508678"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 08:05:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <a3bof7gwvoiqgcjlvhogomb45qhylrn6i3mbetvxofs4sthe5u@ka2lh4hbmsk6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713150611.7-1-francois.dugast@intel.com>
 <ZLBfsNWDeWYx+c/X@intel.com>
 <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
 <87fs4tu7xl.fsf@intel.com>
 <a3bof7gwvoiqgcjlvhogomb45qhylrn6i3mbetvxofs4sthe5u@ka2lh4hbmsk6>
Date: Tue, 08 Aug 2023 18:05:40 +0300
Message-ID: <87v8dpshff.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Aug 08, 2023 at 01:47:50PM +0300, Jani Nikula wrote:
>>On Mon, 17 Jul 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Thu, Jul 13, 2023 at 04:33:52PM -0400, Rodrigo Vivi wrote:
>>>>On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
>>>>> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.
>>>>
>>>>I wonder if we should do this with !fixup patches...
>>>
>>> I think that would be a nightmare to thread through the conflicts.
>>
>>For display it's a nightmare we have to plunge through. And this just
>>made it worse.
>
> This is automatically resolved when we move display up in the branch
> though.  "Automatically" meaning that the pour sould doing the rebase
> has to resolve the conflicts. I don't like doing it, but what's the
> alternative? Last rebase I did a "squash-heavy approach" because moving
> display up means some commits don't make sense anymore, even if they
> apply correctly.  Those coding style changes would just be squashed in
> the respective commits.

Squashing is easy if you have respective commits with 1:1 mapping, but
if you have one commit fixing multiple commits, it gets tricky.

BR,
Jani.


>
>
> Lucas De Marchi
>
>>
>>BR,
>>Jani.
>>
>>
>>> Let's just accept the mistakes happened when we werent' checking
>>> for checkpatch in CI.
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>>But we anyway need this,
>>>>
>>>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>for the series
>>>>
>>>>>
>>>>> Francois Dugast (7):
>>>>>   drm/xe: Cleanup SPACING style issues
>>>>>   drm/xe: Cleanup OPEN_BRACE style issues
>>>>>   drm/xe: Cleanup POINTER_LOCATION style issues
>>>>>   drm/xe: Cleanup CODE_INDENT style issues
>>>>>   drm/xe: Cleanup TRAILING_WHITESPACE style issues
>>>>>   drm/xe: Cleanup COMPLEX_MACRO style issues
>>>>>   drm/xe: Fix typos
>>>>>
>>>>>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  4 ++--
>>>>>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>>>>>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  4 ++--
>>>>>  drivers/gpu/drm/xe/xe_device.h                     |  6 +++---
>>>>>  drivers/gpu/drm/xe/xe_device_types.h               |  4 ++--
>>>>>  drivers/gpu/drm/xe/xe_engine.c                     |  4 ++--
>>>>>  drivers/gpu/drm/xe/xe_force_wake.c                 |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_gt.h                         |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_gt_clock.c                   |  8 ++++----
>>>>>  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
>>>>>  drivers/gpu/drm/xe/xe_gt_types.h                   |  8 ++++----
>>>>>  drivers/gpu/drm/xe/xe_guc.c                        |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_guc_debugfs.c                |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_guc_fwif.h                   | 12 ++++++------
>>>>>  drivers/gpu/drm/xe/xe_guc_submit.c                 | 14 +++++++-------
>>>>>  drivers/gpu/drm/xe/xe_huc_debugfs.c                |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_lrc.c                        |  4 ++--
>>>>>  drivers/gpu/drm/xe/xe_rtp.h                        |  4 ++--
>>>>>  drivers/gpu/drm/xe/xe_rtp_helpers.h                | 10 +++++-----
>>>>>  drivers/gpu/drm/xe/xe_sched_job.c                  |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_uc.c                         | 10 +++++-----
>>>>>  drivers/gpu/drm/xe/xe_uc_fw.c                      |  4 ++--
>>>>>  drivers/gpu/drm/xe/xe_vm.c                         |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_wa.c                         |  4 ++--
>>>>>  26 files changed, 69 insertions(+), 63 deletions(-)
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
>>
>>-- 
>>Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
