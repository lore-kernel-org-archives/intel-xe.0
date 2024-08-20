Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41619C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 09:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1209F10E566;
	Tue, 20 Aug 2024 09:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGkiFLSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3FD10E566
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724145259; x=1755681259;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zKc+w5xsRq6Zc+dcNjwnJQKeu0NX5y+YkQiGDhtyi0s=;
 b=AGkiFLSBSoG3btHuPaZDJ6xxEDMD1vxpQzQBrMMgHSQImAdG0cCgK2rz
 8+lZFOKnT4KibTX9Upsjx7PBWvv38SK/YknpkzMi1YPO2jeeV+sVhGHOq
 /YtapaKxqB1EmiINaKyd/bNg/nsG/f5WQeb9c0r++bFCZf/gvgXBJBj78
 AXdHSaJx/ssGFI2j0gP/pu8fVJU5KREtDPs0UHe6rCWq9OnExLvXsM87a
 9dRX/2yOfAmMDaU8Rz48drYin9/uoaJf3IYWQHez6U5yv1IhmN4OjDS/c
 vRjDZiOIvuceEJXaE9LgXvSyOe7ZNWNEuX3z8WivDM71Q/f03sb3Wtljk A==;
X-CSE-ConnectionGUID: t4tp8Y+3R5yeGydHOWNJug==
X-CSE-MsgGUID: DigttofyQ9SyW7BhIVr1ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44954399"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="44954399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:12:43 -0700
X-CSE-ConnectionGUID: F/RcBoSwT+C8fIJD7AoOMQ==
X-CSE-MsgGUID: yKp0ldt7TjSTmY4NqpzPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="98126776"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:12:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe: Read out rawclk_freq for display
In-Reply-To: <87msl763mb.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
 <20240819133138.147511-2-maarten.lankhorst@linux.intel.com>
 <87msl763mb.fsf@intel.com>
Date: Tue, 20 Aug 2024 12:12:36 +0300
Message-ID: <87bk1n5zi3.fsf@intel.com>
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

On Tue, 20 Aug 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 19 Aug 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>> Failing to read out rawclk makes it impossible to read out backlight,
>> which results in backlight not working when the backlight is off during
>> boot, or when reloading the module.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>> Cc: <stable@vger.kernel.org> # v6.8+
>
> Please find another way. See [1]. I'm trying to clean up the whole
> RUNTIME_INFO() and rawclk_freq thing, and this makes it harder.

Had another look, and brushed up my old patches, new version at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1724144570.git.jani.nikula@intel.com


>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/ddd05f84ca4a6597133bee55ddf4ab593a16e99d.1717672515.git.jani.nikula@intel.com
>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 30dfdac9f6fa9..79add15c6c4c7 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -159,6 +159,9 @@ int xe_display_init_noirq(struct xe_device *xe)
>>  
>>  	intel_display_device_info_runtime_init(xe);
>>  
>> +	RUNTIME_INFO(xe)->rawclk_freq = intel_read_rawclk(xe);
>> +	drm_dbg(&xe->drm, "rawclk rate: %d kHz\n", RUNTIME_INFO(xe)->rawclk_freq);
>> +
>>  	err = intel_display_driver_probe_noirq(xe);
>>  	if (err) {
>>  		intel_opregion_cleanup(display);

-- 
Jani Nikula, Intel
