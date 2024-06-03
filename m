Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AD1C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 15:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C67610E084;
	Mon,  3 Jun 2024 15:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bui/CqE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68B110E084
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 15:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717428508; x=1748964508;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JAc6N725N2kIajQmKgYcmLW+LvZjxA31VPWuW/hZrmI=;
 b=Bui/CqE2EHTM9ArSdyLfTCvHz5H788AZVPAhr87ecuYrsbIDiVRti7lI
 6Z5Jmiw9NjPe5Y9Ka+TUTYWR/7RPp1BN0K53AgwxbXW8Y7KbYgisSizCQ
 BX4yi8uemCiwjA4CFOXd63V9aUYkd8zN2Bjy0jLHmrxwj0dKEPhw03EC1
 7NGiFNyyOJce19VMPUADlnQ1F98KgbVeZ+X62kHT4CeJrrZJgfVbMfc2Z
 A/ryuDZkcaSC9QkSM15oHapqdN8NgsyqpkV8ZUbDOr4TB4bTD/1fLnCgb
 nOtj/MpkdGMc+oFmTraJ+WwygNtKdxPbvrOFj5oqQoGFTHwWfnQH5K3kq A==;
X-CSE-ConnectionGUID: KcgELBtQTFuo/TARtvLJSA==
X-CSE-MsgGUID: 4l/UGjQHRgKDorPFjzFUqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17713807"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17713807"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 08:28:27 -0700
X-CSE-ConnectionGUID: CiCEYo9XSpOQpCIr1B24kA==
X-CSE-MsgGUID: 0xb1VdhySOyzTIngaWRfTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41853030"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 03 Jun 2024 08:28:25 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BEBF3125B7;
 Mon,  3 Jun 2024 16:28:12 +0100 (IST)
Message-ID: <1a85d036-42a7-4cd2-b015-98e7378461f9@intel.com>
Date: Mon, 3 Jun 2024 17:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Request max GT freq during resume
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
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



On 31.05.2024 23:42, Vinay Belgaumkar wrote:
> We already request max freq in the load path, moving it
> to __xe_guc_upload will ensure this speeds up GuC load in
> the resume path as well.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f7886c00af01..63e1b685bd4f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -694,6 +694,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	/* Raise GT freq to speed up HuC/GuC load */
> +	xe_guc_pc_init_early(&guc->pc);

maybe it's just me, but usually we were using _init_early() name suffix
for functions with some early, one-time, likely software-only
initialization, while here this xe_guc_pc_init_early() seems to be doing
something else and now it could even be called many times

maybe it should be split/renamed to xe_guc_pc_boost() or something?

> +
>  	guc_write_params(guc);
>  	guc_prepare_xfer(guc);
>  
> @@ -779,9 +782,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
> -	/* Raise GT freq to speed up HuC/GuC load */
> -	xe_guc_pc_init_early(&guc->pc);
> -
>  	ret = __xe_guc_upload(guc);
>  	if (ret)
>  		return ret;
