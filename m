Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C644FCD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 09:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8683D1130FF;
	Mon,  1 Jun 2026 09:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbnjMxqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83697113108
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780307062; x=1811843062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1L6KrngjH6xSLb9TvkUid5T0lspiFANgJ5/ZIMa1fO8=;
 b=GbnjMxqPrS6CbZE766IYmddjI8drum7+iOgg98G+MjVXXGvVTZLlRTkE
 M1CCr3vb/LCtYOA1wtGRRkH/g5FAtOfbqqT0rWzWyxyxn/I4CpBaGxRzX
 p+92om+/Utj+/J1KxA3nNDTJVkfUmD8MlFYBr3Dgpc4Eyy++E7piy3h4l
 2ucxJO9HAQ/75Nl0Ygl8HXTTQiSsdok6rqLRTzTCp03vM8KUyuu8Fn9/2
 sJUnv3x6ljvS0/hLKZIs1JeRiGhDxZVhvN0wK51rxBnuVgQAUVFkV/qnI
 hESaErieBKoT+Y7SBoBS1CjU6j/zNdaUp1Xkkx87HLXLi4OIjzRH/tjDQ w==;
X-CSE-ConnectionGUID: hkGXonEbQUii2FFR9OyP4w==
X-CSE-MsgGUID: O6CedX/fSye9YmcCU62FEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81121401"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="81121401"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 02:44:21 -0700
X-CSE-ConnectionGUID: zUB/yUtQQ0eAoOG4FBBagw==
X-CSE-MsgGUID: 6o9FWBcyS1WypYnSqk36+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="239117594"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 02:44:19 -0700
Date: Mon, 1 Jun 2026 11:44:16 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v8 2/6] drm/xe/xe_ras: Add support to get error counter
 value
Message-ID: <ah1UcJZubg2ERgJF@black.igk.intel.com>
References: <20260601084146.3808639-8-riana.tauro@intel.com>
 <20260601084146.3808639-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601084146.3808639-10-riana.tauro@intel.com>
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

On Mon, Jun 01, 2026 at 02:11:49PM +0530, Riana Tauro wrote:
> Add request/response structures and helper functions to query system
> controller to get error counter value.

...

> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..317b877e375d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,10 +6,13 @@
>  #ifndef _XE_RAS_H_
>  #define _XE_RAS_H_
>  
> +#include <uapi/drm/xe_drm.h>

Why do you need this? Also, missing types.h.

>  struct xe_device;
>  struct xe_sysctrl_event_response;
>  
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response);
> +int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
>  
>  #endif

...

> +/**
> + * xe_sysctrl_create_command() - Create system controller command
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()

create

Raag

> + */
