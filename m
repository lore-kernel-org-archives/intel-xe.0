Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10503C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 10:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94FB10E3E0;
	Thu, 29 Feb 2024 10:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H901k+ki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEB510E3E0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709203367; x=1740739367;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=RMqAQsM/hTcHg9Zw1VYgtzJCA/OyXKxOmyAgQdkfPPQ=;
 b=H901k+kixaxFk4ITxC7Ru7jpa3uSZCb7gDkCv6bk3wIDQUUQNaqh0u02
 Tt+KZBoe5fY+Q05Rr66IFpX0EodQRdpEKVseKY51cMdTBEBoLKhzzEzBr
 biWyBAEc6T2l6qoAgTRfu/RYpsR+SGwHIPpyF60fPMb6Pmmq3gGDBfmTb
 zBCIrqDSVRsbxGm4e65WaD0X47LBnbFhKvrRANlZlOlYG9TH58xrFJ4v4
 BEReoCdjeVlie2Dx4J4mUSd0lHVNMPH5Jp83nycdxD3Z4D6MOQjQJdJiL
 X0zznR9M8rqu3FAIfvJbWQREiPA9oeA0/Oy7LxhFLTa+nM/jwfAMmC4xI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7492050"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7492050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12352466"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO [10.252.3.131])
 ([10.252.3.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:42:45 -0800
Message-ID: <1954d823-8d52-4106-b01a-0d6fc10aee0d@intel.com>
Date: Thu, 29 Feb 2024 10:42:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/kunitconfig: enable drm kunit tests
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240229103921.249108-2-matthew.auld@intel.com>
Content-Language: en-GB
In-Reply-To: <20240229103921.249108-2-matthew.auld@intel.com>
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

On 29/02/2024 10:39, Matthew Auld wrote:
> This ensures we run the kunit tests for components like drm_buddy,
> drm_mm etc which we make use of. The slow drm kunit subtests look to
> have been purged, so extra runtime should be minimal.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Please ignore this, just noticed there is drm/tests/.kunitconfig which 
should do the same thing.

> ---
>   drivers/gpu/drm/xe/.kunitconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
> index ad4b9b4a9f55..604e59b61338 100644
> --- a/drivers/gpu/drm/xe/.kunitconfig
> +++ b/drivers/gpu/drm/xe/.kunitconfig
> @@ -4,6 +4,7 @@ CONFIG_PCI=y
>   CONFIG_PCI_IOV=y
>   CONFIG_DEBUG_FS=y
>   CONFIG_DRM=y
> +CONFIG_DRM_KUNIT_TEST=y
>   CONFIG_DRM_FBDEV_EMULATION=y
>   CONFIG_DRM_KMS_HELPER=y
>   CONFIG_DRM_XE=y
