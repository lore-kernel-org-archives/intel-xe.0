Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3893C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 10:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8102410E0A8;
	Tue,  8 Aug 2023 10:47:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C710E0A8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691491675; x=1723027675;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AlyDn2p/wsOEDolPqWIjk7kKj0CRWNPY7LVlXTLgYqg=;
 b=RBBGIL+aI4G27y8O9HlF2Ma2LpSj0Sr62aoKm1DFJP79PiYJEIWAlSB6
 xJsfAYQX9wfzgJkPLLyVqdZuVJE5Ab5Aw5eHUf6+EQ/vXDNYYuQEfxuML
 h5NM/5np4Nab+sj3OEqy4mJ3kl8xpBxq6JIN/fTaabPfYP2V3cp4LTNuf
 3qeWhsBv9Snk3QZ/yueYJ9Wz/iPae+mOdNVDLMJ8DAzCH4mpkvMz7X8B6
 nJQ9mzjsYwV/4SDZNfIocdGVs/BRUGSuV2txmYRXRYg4Gojtt1sOlcaoo
 Rfg1++u9wca0FIlyb12WvgWVEvKf3FfesMzH2Ha0+/Gt179F3na7Wv/oO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434635937"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="434635937"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 03:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061962440"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="1061962440"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 03:47:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
In-Reply-To: <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713150611.7-1-francois.dugast@intel.com>
 <ZLBfsNWDeWYx+c/X@intel.com>
 <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
Date: Tue, 08 Aug 2023 13:47:50 +0300
Message-ID: <87fs4tu7xl.fsf@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Jul 13, 2023 at 04:33:52PM -0400, Rodrigo Vivi wrote:
>>On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
>>> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.
>>
>>I wonder if we should do this with !fixup patches...
>
> I think that would be a nightmare to thread through the conflicts.

For display it's a nightmare we have to plunge through. And this just
made it worse.

BR,
Jani.


> Let's just accept the mistakes happened when we werent' checking
> for checkpatch in CI.
>
> Lucas De Marchi
>
>>
>>But we anyway need this,
>>
>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>for the series
>>
>>>
>>> Francois Dugast (7):
>>>   drm/xe: Cleanup SPACING style issues
>>>   drm/xe: Cleanup OPEN_BRACE style issues
>>>   drm/xe: Cleanup POINTER_LOCATION style issues
>>>   drm/xe: Cleanup CODE_INDENT style issues
>>>   drm/xe: Cleanup TRAILING_WHITESPACE style issues
>>>   drm/xe: Cleanup COMPLEX_MACRO style issues
>>>   drm/xe: Fix typos
>>>
>>>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  4 ++--
>>>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>>>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  4 ++--
>>>  drivers/gpu/drm/xe/xe_device.h                     |  6 +++---
>>>  drivers/gpu/drm/xe/xe_device_types.h               |  4 ++--
>>>  drivers/gpu/drm/xe/xe_engine.c                     |  4 ++--
>>>  drivers/gpu/drm/xe/xe_force_wake.c                 |  2 +-
>>>  drivers/gpu/drm/xe/xe_gt.h                         |  2 +-
>>>  drivers/gpu/drm/xe/xe_gt_clock.c                   |  8 ++++----
>>>  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  2 +-
>>>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
>>>  drivers/gpu/drm/xe/xe_gt_types.h                   |  8 ++++----
>>>  drivers/gpu/drm/xe/xe_guc.c                        |  2 +-
>>>  drivers/gpu/drm/xe/xe_guc_debugfs.c                |  2 +-
>>>  drivers/gpu/drm/xe/xe_guc_fwif.h                   | 12 ++++++------
>>>  drivers/gpu/drm/xe/xe_guc_submit.c                 | 14 +++++++-------
>>>  drivers/gpu/drm/xe/xe_huc_debugfs.c                |  2 +-
>>>  drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
>>>  drivers/gpu/drm/xe/xe_lrc.c                        |  4 ++--
>>>  drivers/gpu/drm/xe/xe_rtp.h                        |  4 ++--
>>>  drivers/gpu/drm/xe/xe_rtp_helpers.h                | 10 +++++-----
>>>  drivers/gpu/drm/xe/xe_sched_job.c                  |  2 +-
>>>  drivers/gpu/drm/xe/xe_uc.c                         | 10 +++++-----
>>>  drivers/gpu/drm/xe/xe_uc_fw.c                      |  4 ++--
>>>  drivers/gpu/drm/xe/xe_vm.c                         |  2 +-
>>>  drivers/gpu/drm/xe/xe_wa.c                         |  4 ++--
>>>  26 files changed, 69 insertions(+), 63 deletions(-)
>>>
>>> --
>>> 2.34.1
>>>

-- 
Jani Nikula, Intel Open Source Graphics Center
