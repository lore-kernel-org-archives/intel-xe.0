Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4CFC48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 11:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7941124E4;
	Mon,  5 Feb 2024 11:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T295TmDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6171124DF
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 11:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707132200; x=1738668200;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hsJAIG3PQwNkt3felVZmuW0mOExWZQwCLVvMjV6lNM8=;
 b=T295TmDtJzUldto7rdmm4i24PQ0YlJnjo71fwWzRaV6JtVgaEr3WXFt+
 Nfayu47KVRO4LWFpry/h1IdESLP6PgP+hCwA3wSPXwpFwrtaW4l8DVWUs
 C98h8z80L5P40qHCQZZ//ZZureI+58McMVbkhlTnbn1tQeNnv0D3ScMyE
 HUT0Zex+L2bq20WIcZH9AWxPUBV55FI/99cU/ehlgHCqsllBz+6uNjQht
 dt0jLoISwfQNHzfxz1PvhohxUhGkvIU+lyBvDSkCds2HlUFHWAN+1/uHb
 v9jD/QAzoLI6OF3c2p0ExfqdQcr+h1+7KI+AEZBU1KjkSF02T2WQVL+vA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11088707"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11088707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="700288"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:23:14 -0800
Message-ID: <31c63724-55f4-4657-aff4-e298b1865e0d@intel.com>
Date: Mon, 5 Feb 2024 11:23:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/34] drm/xe: Removing extra mem_access protection from
 runtime pm
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-17-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-17-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> This is not needed any longer, now that we have all the protection
> in place with the runtime pm itself.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 8 --------
>   drivers/gpu/drm/xe/xe_device.h | 1 -
>   drivers/gpu/drm/xe/xe_pm.c     | 3 ---
>   3 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ab41202ecaf8..1711d9064ecc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -673,14 +673,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>   		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>   }
>   
> -bool xe_device_mem_access_ongoing(struct xe_device *xe)
> -{
> -	if (xe_pm_read_callback_task(xe) != NULL)
> -		return true;
> -
> -	return atomic_read(&xe->mem_access.ref);
> -}
> -
>   /**
>    * xe_device_assert_mem_access - Inspect the current runtime_pm state.
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 270124da1e00..74074939d157 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -146,7 +146,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
>   void xe_device_mem_access_put(struct xe_device *xe);
>   
>   void xe_device_assert_mem_access(struct xe_device *xe);
> -bool xe_device_mem_access_ongoing(struct xe_device *xe);
>   
>   static inline bool xe_device_in_fault_mode(struct xe_device *xe)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d98f4bb3ad02..967d3dc0ded5 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -281,9 +281,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	u8 id;
>   	int err = 0;
>   
> -	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
> -		return -EBUSY;

Note that this is always impossible. If access_ongoing is true here 
something is very broken. Not sure what the point of this is. Maybe 
reword the commit message?

> -
>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>   	xe_pm_write_callback_task(xe, current);
>   
