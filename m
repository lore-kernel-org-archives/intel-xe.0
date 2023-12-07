Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E673C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428A10E06A;
	Thu,  7 Dec 2023 13:01:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6F810E06A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954116; x=1733490116;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wh5nNDadIo9Ye97q6/aSwls5tSYLQ8JiQrn6BHASXTc=;
 b=jo7BO8jDNB9EhqLpPy41jdzQ9kZuMwasNxGUnYcFOyDtYU8LhSlf4nNp
 BfslYheVnzBel55/24Ecb5fIq0BQKH6PPVl8Q+59SP1Wsq125VRs0vZ4E
 oFIJpqfItGt+ZZJzL+wXGBwXg++/sZMN+P8LJfx64VPzlzIr1kTPF6X6Q
 ykSMZiWkklJu/JSaWq3lS4bDbH1jKgwKJJesdhxB2dGBNeVOane9mRqnD
 KW83sp7utIpZ73qng0Lxk//GvAGpZaB6RsoMnaqoerLPFL5iB5G7Q1XSK
 owLdt1lbltnLtIiLXvj9tY1+005gdgOmQM3IkpmGB/65bst/DyFqMLfDG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480413234"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="480413234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800721155"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800721155"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:54 -0800
Message-ID: <e10e828c-1100-f735-f781-a4e030648094@linux.intel.com>
Date: Thu, 7 Dec 2023 14:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 9/9] drm/xe/xe2: Support flat ccs
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-10-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207091922.1224800-10-himal.prasad.ghimiray@intel.com>
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


On 12/7/23 10:19, Himal Prasad Ghimiray wrote:

> Enable flat ccs for XE2_GFX_FEATURES.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

What happens when we run this on XE2 | DGFX?

/Thomas



> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2186ebfbe05c..c3032143096f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -164,7 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>   #define XE2_GFX_FEATURES \
>   	.dma_mask_size = 46, \
>   	.has_asid = 1, \
> -	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
> +	.has_flat_ccs = 1, \
>   	.has_range_tlb_invalidation = 1, \
>   	.supports_usm = 0 /* FIXME: implementation missing */, \
>   	.va_bits = 48, \

