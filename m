Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE3EA3F26
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 08:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFAB10E284;
	Tue, 10 Feb 2026 08:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnO5DsX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FAD10E284;
 Tue, 10 Feb 2026 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770713330; x=1802249330;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hME6NGp8PSzwjSjhyXIsdhqFlAIB2lbW5qJj68gYEns=;
 b=AnO5DsX1Vblgn/oJzmxQgzAUxEr1pwxIDOKScR9LhqzMzU7PpUYShV4g
 t1p7PwD9T9OoquvOat6bzJ7pUCEICm8KxkG4bDkybXW8EkJqD6CtnxTsu
 NUtD9Rjm7ngvPOQO/zhHyFJyOZOgu+ELNFlHoY/1cmS392UUaidlYfrcE
 luxt9P9N0Vkt7qVsF1Grx/sSq/LJkOStulBklRBYsx7O2ZnWSyP7Gns/H
 jjuQpgmKAyWy4ZgOYTc3avCQeYOtpJ4Yp+sR2UQemmu0H7yw7YY/D3T/H
 WnDN43SUWKaWzj4aaqfoAzZu1ZMSeXvc2vDvsafNv1tBxjnQ4X2U4wOKW g==;
X-CSE-ConnectionGUID: xhKIyIplRCex/+ABQo4OuQ==
X-CSE-MsgGUID: apGfPjEPT+CtdR3bW/nvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71878623"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71878623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 00:48:49 -0800
X-CSE-ConnectionGUID: OPBnJCQGQoG0S4XSG2er3w==
X-CSE-MsgGUID: 35PtUuv5T0m5PxbhPuGyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211689610"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 00:48:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH v3 14/15] drm/i915/nvlp: Hook up display support
In-Reply-To: <87tsvp4bv1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
 <20260206-nvl-p-upstreaming-v3-14-636e1ad32688@intel.com>
 <87tsvp4bv1.fsf@intel.com>
Date: Tue, 10 Feb 2026 10:48:44 +0200
Message-ID: <7959152f5fc1d5accf13e19bf26ed49330bbdf48@intel.com>
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

On Mon, 09 Feb 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Gustavo Sousa <gustavo.sousa@intel.com> writes:
>
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Although NVL-S and NVL-P are quite different on the GT side, they use
>> identical Xe3p_LPD display IP and should take all the same codepaths.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Jani or Rodrigo,
>
> Ack to apply this via drm-xe-next?

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> --
> Gustavo Sousa
>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
>> index 471f236c9ddf..1a7f3ca079e8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
>> @@ -1500,6 +1500,7 @@ static const struct {
>>  	INTEL_PTL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
>>  	INTEL_WCL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
>>  	INTEL_NVLS_IDS(INTEL_DISPLAY_DEVICE, &nvl_desc),
>> +	INTEL_NVLP_IDS(INTEL_DISPLAY_DEVICE, &nvl_desc),
>>  };
>>  
>>  static const struct {
>>
>> -- 
>> 2.52.0

-- 
Jani Nikula, Intel
