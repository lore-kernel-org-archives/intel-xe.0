Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64832C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 12:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1B510E5D4;
	Tue, 12 Dec 2023 12:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3A610E607
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702384396; x=1733920396;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9wo20cjhrkqAvhR7KHQh/C/yaGDLOhDWKNelIyLkv2s=;
 b=cD1MwAG6pt52EU3nq3TP0V5BB91Del+Prtn3Khi8J3iq4APAUjFPhrkx
 koPHXE82AWwX38H8HptDVLiGWnTeKNrtmnxgCPDCQrrkMDfMI4sdthLce
 pwPHV8XhlFBM2quy8vdfQbo7V6RJgjWBF3Nlj2dMtTALWnUoq6VM4QW68
 +151K80w4LGBPWPjH2DgJW/T6TYIujFQ8ZrVjtxT87v28E+jVbuwyz6Xf
 9sH7gegeYcNZIDVcIg5/WL3mWlPsN1ZmFESDYf5qjkK0CKf+e9aNknHNq
 Kj5YiD7GDEDVLpJqB5bdutNcZCLbom60Ak5qWIeP5sGE0kNFzXj47wDDC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8167981"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="8167981"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917272812"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="917272812"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.140])
 ([10.249.254.140])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:33:14 -0800
Message-ID: <50552e46-ef1f-db06-ac22-d8e9cb0138f0@linux.intel.com>
Date: Tue, 12 Dec 2023 13:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 10/10] drm/xe/xe2: Support flat ccs
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-11-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231211134356.1645973-11-himal.prasad.ghimiray@intel.com>
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


On 12/11/23 14:43, Himal Prasad Ghimiray wrote:
> Enable flat ccs for XE2_GFX_FEATURES.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 260e8a6034a7..b75b629db886 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -164,7 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>   #define XE2_GFX_FEATURES \
>   	.dma_mask_size = 46, \
>   	.has_asid = 1, \
> -	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
> +	.has_flat_ccs = 1, \
>   	.has_range_tlb_invalidation = 1, \
>   	.has_usm = 0 /* FIXME: implementation missing */, \
>   	.va_bits = 48, \
