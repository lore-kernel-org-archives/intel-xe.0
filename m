Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC254CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 11:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BA610E234;
	Mon, 25 Sep 2023 11:29:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCD410E234
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695641368; x=1727177368;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FNa63m63wR8xlrrvMI32gdSbWwEQRb8xmCaSapClvfg=;
 b=IeSfBUFdoDKqrMWW4ocAYYoNt6paqaEPnOv8rahIg/md67rp8fdmp0OC
 gGUyzVsAPAVGk9sVWAlpvnJkcr3ENiKpyvy5bbXLSH/5h8wGRIqy4KmTr
 FTBmldetyHOSyRFd6jkWAgpGH0q9ZRBQVz4rMzZNalp1atVDahaywRh2C
 xwlBoG2dyELPZhQARXyiFEo0JKDyVpew2+b8aF3p4qIQsa7Ggi3tBQPmd
 tno/KipyUrfsIuigEkwdC4ucVjcSpejai4VsUcBUlwF4xr5Xqc5j0t2Nq
 QWbawomm1Ea0umdfbRbqPoXkhphgj0VzPbaQpeHFT75m+CtLk9KTMPa3k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445337629"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="445337629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783456338"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="783456338"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.46])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:29:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <CY5PR11MB63445AE80355495983540166F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <CY5PR11MB63445AE80355495983540166F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
Date: Mon, 25 Sep 2023 14:29:23 +0300
Message-ID: <874jjio5ik.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
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
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun R
>> Murthy
>> Sent: Sunday, September 24, 2023 8:18 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
>> 
>> Fastboot is by default enabled on all Display 9+ platforms.
>> Module param is added in xe for controlling the same.
>
> On Xe, we don't have the module param yet. So, there is no
> way to change the default what we set here in this patch as of
> now. We should modify the statement here.
>
> It should be ok to get rid of the #define and have fastboot disabled
> by default for now. But we should work on the task to get the
> module param or any other mechanism acceptable by maintainers
> to control fastboot feature.

The question is, do we *want* that module parameter in xe?

BR,
Jani.



>
> Regards,
> Uma Shankar
>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h | 1 +
>>  drivers/gpu/drm/xe/xe_display.c      | 1 +
>>  2 files changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index a82f28c6a3a0..f73c0672bd54 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -458,6 +458,7 @@ struct xe_device {
>>  		s32 panel_use_ssc;
>>  		const char *vbt_firmware;
>>  		u32 lvds_channel_mode;
>> +		int fastboot;
>>  	} params;
>>  #endif
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index bb4938a84f47..8a80d85eb104 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -123,6 +123,7 @@ int xe_display_create(struct xe_device *xe)
>>  	xe->params.enable_psr2_sel_fetch = -1;
>>  	xe->params.enable_sagv = true;
>>  	xe->params.panel_use_ssc = -1;
>> +	xe->params.fastboot = -1;
>> 
>>  	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
>>  	if (err)
>> --
>> 2.25.1
>

-- 
Jani Nikula, Intel
