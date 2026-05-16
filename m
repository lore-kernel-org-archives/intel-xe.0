Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE9ECD4F21
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 09:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3361D10E0D4;
	Sat, 16 May 2026 09:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnINnkac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755A310E0D4
 for <intel-xe@lists.freedesktop.org>; Sat, 16 May 2026 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778923146; x=1810459146;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eOb5sbdQV10aHUonwTo2zubM7o6+2xf0HTAp6nThwfw=;
 b=KnINnkacvexZQo6xn4QoIYeYBp8jmCvYVjoDMLdSyxMPM4rEizdaLpdf
 3CFviCMmlfoxgzTP8KUBXPACcYncqJOdOXVTh0RtLb3zpDdQzkgI0c8xn
 1PyaiiOFBUt+8IJ3+KcIBkhLFbj+PYOsJXRMQHkphVX5YnR9BP4aZoVv1
 AoriaEYJC2lqUF0RXzKMtiA13LrPQA3DqavM2UrbxYy8U5WvjiPifYHEk
 SgHbzHy21zEE3bBB3vce+KO50mtWnQbxcFI9sfoNQMfeQyCtWVKv93wBt
 Jr4ek853Z3DF+HpcpJxL+yCbbpPQGgf74QpxXHjEPDPq09aby0+Q5UsKl A==;
X-CSE-ConnectionGUID: oHqnGmMUQR+h+oxABeyzKg==
X-CSE-MsgGUID: vwM/EWNHQbSuioP7l4B0zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79579656"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="79579656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 02:19:05 -0700
X-CSE-ConnectionGUID: dR1vF0YzQWy4kKwKWQ4/7A==
X-CSE-MsgGUID: oVmPZFnSQbaR2aD12Xo0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="277033151"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 02:19:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/xe/display: fix oops in suspend/shutdown without
 display
In-Reply-To: <DM3PPF208195D8D504F655566B2A718B650E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260515160920.1082842-1-jani.nikula@intel.com>
 <DM3PPF208195D8D504F655566B2A718B650E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Sat, 16 May 2026 12:19:01 +0300
Message-ID: <47fc29d462ebaa0fde9f229c8384099e9ccd99c0@intel.com>
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

On Fri, 15 May 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH] drm/xe/display: fix oops in suspend/shutdown without
>> display
>> 
>> The xe driver keeps track of whether to probe display, and whether display
>> hardware is there, using xe->info.probe_display. It gets set to false if there's no
>> display after intel_display_device_probe(). However, the display may also be
>> disabled via fuses, detected at a later time in
>> intel_display_device_info_runtime_init().
>> 
>> In this case, the xe driver does for_each_intel_crtc() on uninitialized mode
>> config in xe_display_flush_cleanup_work(), leading to a NULL pointer
>> dereference, and generally calls display code with display info cleared.
>> 
>> Check for intel_display_device_present() after
>> intel_display_device_info_runtime_init(), and reset
>> xe->info.probe_display as necessary. Also do unset_display_features()
>> for completeness, although display runtime init has already done that. This will
>> need to be unified across all cases later.
>> 
>> Move intel_display_device_info_runtime_init() call slightly earlier, similar to
>> i915, to avoid a bunch of unnecessary setup for no display cases.
>> 
>> Note #1: The xe driver has no business doing low level display plumbing like
>> for_each_intel_crtc() to begin with. It all needs to happen in display code.
>> 
>> Note #2: The actual bug is present already in commit 44e694958b95
>> ("drm/xe/display: Implement display support"), but the oops was likely
>> introduced later at commit ddf6492e0e50 ("drm/xe/display: Make display
>> suspend/resume work on discrete").
>> 
>> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7904
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/6150
>> Cc: <stable@vger.kernel.org> # v6.8+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Thanks, pushed to drm-intel-next (and not drm-xe-next) to avoid
conflicts with other display changes.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>> b/drivers/gpu/drm/xe/display/xe_display.c
>> index 053abd6f6514..5f25932730f4 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -104,6 +104,15 @@ int xe_display_init_early(struct xe_device *xe)
>> 
>>  	intel_display_driver_early_probe(display);
>> 
>> +	intel_display_device_info_runtime_init(display);
>> +
>> +	/* Display may have been disabled at runtime init */
>> +	if (!intel_display_device_present(display)) {
>> +		xe->info.probe_display = false;
>> +		unset_display_features(xe);
>> +		return 0;
>> +	}
>> +
>>  	/* Early display init.. */
>>  	intel_opregion_setup(display);
>> 
>> @@ -117,8 +126,6 @@ int xe_display_init_early(struct xe_device *xe)
>> 
>>  	intel_bw_init_hw(display);
>> 
>> -	intel_display_device_info_runtime_init(display);
>> -
>>  	err = intel_display_driver_probe_noirq(display);
>>  	if (err)
>>  		goto err_opregion;
>> --
>> 2.47.3
>

-- 
Jani Nikula, Intel
