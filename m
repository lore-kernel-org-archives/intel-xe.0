Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0696EC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 11:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9CB88F94;
	Tue,  9 Jul 2024 11:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJbUkpSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8582C88F94
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720524380; x=1752060380;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hYXi75jDvtmJqQwkWTtjXfJ6uByuLp/KdbJCWrTYgn4=;
 b=LJbUkpSt7zBM63rOMFASqnRAUw29VucQnXW96d4p5g2dOqYAiAqCtFou
 IrxWA4dFP4BYZloSkhqQQfLCeKil66ws6pIfD04GRPTKSbsFbP2NJ8xgr
 uGuzgN6HypPzS9MHGjtRBO5NRVgh2R7yimYHVYg3tkEXMVO1goG6LcHma
 rDUIcLIsHFptaqQYwL9sOjIn2F4hVbtfKk/T/YqN6hX4rGNqtmMF8K9Li
 +8Vqg9dFuvtR18UnHnOfa6fNz8cCUVezEjyLAd18sLwD3fHras5xA7Ocl
 3jgTZKT6rc93oE7lOoaLSN+NCU3nio5jMJs+Bm9FQAs041J60oiAjahVh A==;
X-CSE-ConnectionGUID: Chv2x3njSpmWS2wjN57F5A==
X-CSE-MsgGUID: 8qBWRWbxQlCthLnjz7KzAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28375374"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="28375374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:26:19 -0700
X-CSE-ConnectionGUID: M4gBJ69fQeqsqiAEUlK6Sw==
X-CSE-MsgGUID: WfQKtQilThivyCV4DJKOvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47613692"
Received: from unknown (HELO [10.245.244.94]) ([10.245.244.94])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:26:17 -0700
Message-ID: <2a5772c2-8956-4de9-b4b6-e13260209241@intel.com>
Date: Tue, 9 Jul 2024 12:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Use 64K pages for scanout buffers for Xe2
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
 <20240709111231.490440-3-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240709111231.490440-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 09/07/2024 12:12, Zbigniew Kempczyński wrote:
> Set Xe2 platforms to use 64K pages for display.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 53b67f39c7d5..b629145d23fa 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -177,6 +177,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>   	.name = "Xe2_LPG / Xe2_HPG",
>   
>   	XE2_GFX_FEATURES,
> +	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K,

This change will also apply to lnl, but I don't think we have a way of 
forcefully getting 64K pages for system memory atm. Do we just need this 
for bmg or is it really all of xe2?

>   };
>   
>   static const struct xe_media_desc media_xem = {
