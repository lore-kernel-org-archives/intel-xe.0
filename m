Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75CFC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 17:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611C010E285;
	Fri, 13 Jun 2025 17:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWm4qkRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DD610E285
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749837594; x=1781373594;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cDGNJJCBY8iBPLzTsQwLZ2wDsTnopkO+afWtgZo6siE=;
 b=gWm4qkRLmOMlXHxiUgc2yG6Q5CnhK3Yps93XiXNLKLCue9AR2U2I9G6X
 MjxOvXYccmNKflxyYIwkIC4QY5KM9/sDaRSEiZ0dD4SaDYwg0kfZMnZsX
 7ufjofawpI0qZCRt2K9zav/azXRoX0xs0IhMrtPDVrYSs/YExZZeC2300
 YCDfIcSSYRKaisMyAuTamJZAoiWR1QB6cP06fMIk/JTvNAxQO+0cUzyHH
 WBuLcimRniKEjKMLfzchkZeG2GdglPDCoEWTuCESIwTcoX9ZIoppnlEhV
 YcV0lGt34ZMr19nL4tkZljl/lpMaDTfxy2KnShJL5np4qBkbvkERQnggr A==;
X-CSE-ConnectionGUID: t7vSIK6lTB+z9SO/nry9Vw==
X-CSE-MsgGUID: 1njffXhaQqqpWoqIz29iCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52157573"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52157573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:59:54 -0700
X-CSE-ConnectionGUID: bgbMP0cuS+eMK9c/UCfvuQ==
X-CSE-MsgGUID: AIGG95+WTBSAog9bz5zjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148359523"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 10:59:53 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0A87134339;
 Fri, 13 Jun 2025 18:59:51 +0100 (IST)
Message-ID: <de11c42c-98b4-4ae8-a91e-ed2f06cc8337@intel.com>
Date: Fri, 13 Jun 2025 19:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/tests/pci: Ensure all platforms have a valid
 GT/tile count
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
 <20250613001438.678728-10-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250613001438.678728-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 13.06.2025 02:14, Matt Roper wrote:
> Add a simple kunit test to ensure each platform's GT per tile count is
> non-zero and does not exceed the global XE_MAX_GT_PER_TILE definition.
> 
> We need to move 'struct xe_subplatform_desc' from the .c file to the
> types header to ensure it is accessible from the kunit test.
> 

...

> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index ede46800aff1..5abbf522f7a8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -14,13 +14,16 @@
>  struct xe_device;
>  struct xe_graphics_desc;
>  struct xe_media_desc;
> +struct xe_device_desc;
>  
>  typedef int (*xe_device_fn)(struct xe_device *);

note: this is not used, can be dropped/replaced

>  typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
>  typedef void (*xe_media_fn)(const struct xe_media_desc *);
> +typedef void (*xe_platform_fn)(const struct xe_device_desc *);

this is more like 'device_desc' function, so either:

	xe_device_desc_fn
or
	xe_device_fn

since previous typedef is not used anywhere

>  
>  void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
>  void xe_call_for_each_media_ip(xe_media_fn xe_fn);
> +void xe_call_for_each_platform(xe_platform_fn xe_fn);

to match above pattern maybe:

	void xe_call_for_each_device_desc(xe_device_desc_fn fn);

then later we could add really something like:

	typedef void (*xe_platform_fn)(enum xe_platform platform,
				       enum xe_subplatform subplatform);

	void xe_call_for_each_platform(xe_platform_fn xe_fn);

which would help us create new tests based on per-platform pattern.

or maybe we should already start converting existing tests that use
xe_call_for_each() into parametrized tests that use generators instead?


