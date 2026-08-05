Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5EBC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 07:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD8510ED46;
	Wed,  5 Aug 2026 07:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcEAz4V8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5202710ED46
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785914743; x=1817450743;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=bJZbhvFgqxO3XUwj6a9fq0FhZBcSEeDMCMlRlOSiV+0=;
 b=CcEAz4V8TgL2YuD0ys2CbTI3cc1oOLHzS3wt7qm6ZVgAYr1o7mtAaZWR
 5rhs+Z4VUHkcKTKJ0ohjqvTT3g1RN5RAfGXw6md/W5bxnn291czGXA0XG
 E1j4VhgZ+vP4Fljm0jJ6PS+RoTGwx3MHVlJTCGUqQLVH6bo+KzmAA8YiZ
 U946zYZNL46RfnnH0pC1cXIpERm2Tu6YAm1f38YTYsLXHk2iLj3PzHs6c
 airZO6tx//+wN9GiCFDyE25Cxfng5B2Zl00liAWFu17j6oPsxa2DkXgPz
 wadzcdMoNa1JziAvdfUgQIwnu/mijvG0gF+aHKyuhzvXzdkcWnARtKE55 Q==;
X-CSE-ConnectionGUID: MCPjZa1XRCO8T1SCZ71Edg==
X-CSE-MsgGUID: 2oZrYKqWTp2lKD2WDury1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109268637"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="109268637"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 00:25:43 -0700
X-CSE-ConnectionGUID: AQEvSgLuT8OyzQRUFk/jWA==
X-CSE-MsgGUID: /yx49UzfTze8CZxWB5QnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261793112"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.64])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 00:25:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/xe/display: drop redundant
 intel_hpd_poll_fini() call
In-Reply-To: <DM4PR11MB6360EDF0058411C6CE544818F4D42@DM4PR11MB6360.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1785250188.git.jani.nikula@intel.com>
 <6c3a537d69af2bca21e9f04cd678aaf9d72f7c8e.1785250188.git.jani.nikula@intel.com>
 <DM4PR11MB6360EDF0058411C6CE544818F4D42@DM4PR11MB6360.namprd11.prod.outlook.com>
Date: Wed, 05 Aug 2026 10:25:38 +0300
Message-ID: <518135db2b7bc413acf620620f40fdccde1b7817@intel.com>
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

On Tue, 04 Aug 2026, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jani Nikula
>> Sent: Tuesday, July 28, 2026 8:20 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH 1/3] drm/xe/display: drop redundant intel_hpd_poll_fini() call
>> 
>> intel_hpd_poll_fini() is already being called via
>> xe_display_fini_early() -> intel_display_driver_remove_noirq(). Remove the
>> redundant call.
>
> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Thanks for the reviews, series pushed to din.

BR,
Jani.

>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>> b/drivers/gpu/drm/xe/display/xe_display.c
>> index 8da4c457a4a0..57088e24aba2 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -129,7 +129,6 @@ static void xe_display_fini(void *arg)
>>  	struct xe_device *xe = arg;
>>  	struct intel_display *display = xe->display;
>> 
>> -	intel_hpd_poll_fini(display);
>>  	intel_hdcp_component_fini(display);
>>  	intel_audio_deinit(display);
>>  	intel_display_driver_remove(display);
>> --
>> 2.47.3
>

-- 
Jani Nikula, Intel
