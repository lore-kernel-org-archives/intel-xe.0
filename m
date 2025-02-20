Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AE2C021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 16:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59D810E9AF;
	Thu, 20 Feb 2025 16:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0m2pT01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0328710E9AF
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740069000; x=1771605000;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+X7fXaT27xsOB7t/9HI+icxgss1vumTbN5y/o3GO0lM=;
 b=U0m2pT01jkRyfiZqiGCcEXOAhZHFGgjAZXbIFPqg3qjojdaxbWpGGwDT
 urXn/SL/n3Kbg0Z7OL/vubPrGAlEXXXu/SbckUR25ZaC9eBijk3Mlaqou
 6AiqSxhqh7HODJAgilm96ent3Bwj7e9BoTJnukat7X1kOvdf4WZRu36tU
 bqfjYQyzodXYHia4Qy2zmkl+v8PjLb0BId5U2rVgjm9XPYSMkHVxRvjmN
 hH4wlM87eevlpQwkwlv53fHPGWz+Ch5vFSv5Z8i+2fLM2m+v3NHcc/frv
 QO8hasHMXFqsbN7YkeIeBNY32J+ghDRfBR2EfaTNxw15WLoj2bRC3WAIV w==;
X-CSE-ConnectionGUID: uNZteisFRj2mHX2oq6wtWQ==
X-CSE-MsgGUID: eME9jhxdT+uj8pGpidkQnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51846873"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="51846873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 08:30:00 -0800
X-CSE-ConnectionGUID: B5i9485iT2ulTuNoHALA8A==
X-CSE-MsgGUID: qyfKeYWHQUazaBwgeZLoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="120189300"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 20 Feb 2025 08:29:58 -0800
Received: from [10.245.96.217] (unknown [10.245.96.217])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2DC2934304;
 Thu, 20 Feb 2025 16:29:57 +0000 (GMT)
Message-ID: <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
Date: Thu, 20 Feb 2025 17:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250220001710.1803749-3-shuicheng.lin@intel.com>
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



On 20.02.2025 01:17, Shuicheng Lin wrote:
> kzalloc returns a valid pointer or NULL if the allocation fails.
> It never returns an error pointer. It is better to check for NULL directly.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 60d15e455017..81b9d9bb3f57 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>  		drm_printf(p, "Offset not word aligned: %zu", offset);
>  
>  	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> -	if (IS_ERR_OR_NULL(line_buff)) {
> -		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
> +	if (!line_buff) {
> +		drm_printf(p, "Failed to allocate line buffer\n");

btw, since this line will be included in the output, where one could
expect ascii85 data, shouldn't we print that diagnostic message with
some special prefix to make it clear there is nothing to parse? like

	"# Failed to allocate internal data\n"

also since caller may have already provided a prefix, shouldn't we also
include it in this diagnostic message?

	"%s%s# Failed to allocate internal data\n",
	prefix ?: "",
	prefix ? ": " : ""

>  		return;
>  	}
>  

