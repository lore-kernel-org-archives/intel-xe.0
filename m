Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB41C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0B710E0B4;
	Tue,  4 Feb 2025 18:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeE+JLtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0382110E0B4
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738695367; x=1770231367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YUYOhGGVHyfAPDUFvVoIoSSSz0UIZobNCGzG3hRDsZQ=;
 b=BeE+JLtNFzcU33QzBynm2xxrIrHsl3mnHs7lmyPDB0VJRq4tLQBFAFVJ
 xAzbAxWGwuZX8d5At8iGAs/lVhYYx8MNx8cVEbWlUz+EVb8/S8mHHKGnr
 N8kdVCe4NUCBdzJIqtPGsoMb7BVG0SFbVSnzRRV35tg6UJOA+FPb0dY4S
 EgEGsBQjn1+0fcLop3ZaB52ZHREzjjhlQPR4SyrFTei2HV0v7Cik4h+HD
 22Iw+fnTOarzrk/JQL/QBNyImcamMdSHsWVQ/0VESX7r14k9gLQdF2U13
 Z5HBQle1G5aPoc9KEcI3MFsHeAvnkpxrUVbL/dCNJJZ/Vd/hFyuwxTTQx g==;
X-CSE-ConnectionGUID: 9W+qWwHuToa2r8oyAw0fhg==
X-CSE-MsgGUID: sBU/StrSTuaBkdJTUoDBeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49494200"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="49494200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:56:07 -0800
X-CSE-ConnectionGUID: LLw+lD09Sc+MPrPQCFBfKg==
X-CSE-MsgGUID: Dy1x/A2lRM2+LnRJx1t/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133931554"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2025 10:56:05 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E3F2132EB9;
 Tue,  4 Feb 2025 18:56:03 +0000 (GMT)
Message-ID: <15799e7d-1259-4a87-831b-1b6ceb8fee1a@intel.com>
Date: Tue, 4 Feb 2025 19:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/client: Skip drm-total-cycles if unable to
 read timestamp
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
 <20250204180522.2327214-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250204180522.2327214-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 04.02.2025 19:05, Marcin Bernatowicz wrote:
> Ensure show_run_ticks() only prints drm-total-cycles when timestamp
> retrieval succeeds.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 63f30b6df70b..e5c4f342380e 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -323,6 +323,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	u64 gpu_timestamp;
>  	unsigned int fw_ref;
> +	int err;
>  
>  	/*
>  	 * Wait for any exec queue going away: their cycles will get updated on
> @@ -350,7 +351,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  	}
>  	mutex_unlock(&xef->exec_queue.lock);
>  
> -	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> +	err = xe_hw_engine_read_timestamp(hwe, &gpu_timestamp);

can't we just check for !IS_SRIOV_VF here?

>  
>  	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>  	xe_pm_runtime_put(xe);
> @@ -371,8 +372,10 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  		class_name = xe_hw_engine_class_to_str(class);
>  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>  			   class_name, xef->run_ticks[class]);
> -		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
> -			   class_name, gpu_timestamp);
> +
> +		if (!err)
> +			drm_printf(p, "drm-total-cycles-%s:\t%llu\n",

are we sure we don't break any tools that might look for this?

> +				   class_name, gpu_timestamp);
>  
>  		if (capacity[class] > 1)
>  			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",

