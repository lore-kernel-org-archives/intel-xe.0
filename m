Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F4EB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 10:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3FE10E760;
	Tue, 10 Sep 2024 10:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aofEQlPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4851C10E760
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725963300; x=1757499300;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+TiGd3gNOkzXSv7Y/yPsZEpcWUmyIHAqcZCSAlVDmUA=;
 b=aofEQlPmYHS00RiZnxRGWv3Qv+SfEBki9Of1oAnZDFv8pVEYOtR/G1cI
 Q3iAvmVk+n5B93kSG7KR9PV50oFo13gp0wkGbuYzQoehAFkadPfgeV9nF
 hvlHwSWyu4EqgWgXYsGvfKqQVpA2N6kf3JgHngRUW7aJVRaT1UL77NT6v
 5gepBOb/o6tHCEQWyYk/gbqXVoG+lqS+jzPQymExcc4dc2u/DUMwIKDo+
 QfYxQxbWKUqsIvowL2nwxU1bHVfziQ8Br4+pQaoPRXDwS1CyZlZoh2ODC
 mFHb2C8+O2GuT0uEeeJIfKm/2diuJjY2okyv6E+fdjWc2kJhHJWTEa7+w A==;
X-CSE-ConnectionGUID: FWN5e9X4SDeJG5Bg9BYXyw==
X-CSE-MsgGUID: 4dNWx78QQ42AAinpv23Eow==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24515797"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24515797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:14:59 -0700
X-CSE-ConnectionGUID: 2U/86qk6TsWBGmuvioCOLg==
X-CSE-MsgGUID: OKU7o6X3S5ujV4MdFwUnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71956824"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:14:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Insert wmb/sfence before enabling OA
In-Reply-To: <20240910025907.2667875-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240910025907.2667875-1-ashutosh.dixit@intel.com>
Date: Tue, 10 Sep 2024 13:14:54 +0300
Message-ID: <87wmjjke75.fsf@intel.com>
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

On Mon, 09 Sep 2024, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> We are occasionally seeing that OA Buffer register is not programmed (has
> value 0) when OA is enabled. This means OA has been enabled before it has
> been fully configured. Or, the register write enabling OA has overtaken
> previous OA configuration register writes.
>
> Therefore, insert a wmb/sfence to preserve OA register write ordering
> before enabling OA.
>
> v2: s/wmb()/xe_device_wmb()/
>
> Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
> Reported-by: Guy Zadicario <guy.zadicario@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: stable@vger.kernel.org

Please do not resend patches just to tweak something in the commit
message. It can be fixed while applying. Or when you have to make
another version with actual functional changes.

Please appreciate that this uses a full CI test run. It's not an
unlimited resource.

BR,
Jani.


> ---
>  drivers/gpu/drm/xe/xe_oa.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 63286ed8457fa..4fb7aae37a94f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -440,6 +440,9 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
>  	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
>  		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
>  
> +	/* Flush previous writes to HW before enabling OA */
> +	xe_device_wmb(stream->oa->xe);
> +
>  	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
>  }

-- 
Jani Nikula, Intel
