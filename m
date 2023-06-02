Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C5C7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303E410E63D;
	Fri,  2 Jun 2023 10:05:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC510E63D
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685700312; x=1717236312;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9bmTWFY6ufdhH/LJQf1jl/MNhePi359Cp9vt6K1qjqA=;
 b=WFIEPIHg6Dm4/g4PttZH4cb/efPYZVSIzqIhGZSto026n4oy6yQJGcgb
 HAgT6Hqfr3msQOqHi6vi6THU4PbjxczuqJfvuZH2eyy012fLQXzxwnQWG
 LYT+3x8qZExyGP9F/GGk0bmCorgApE2/wc4qAfzqhZiDArYByU0Nnd3wW
 zh1LMPO4vszr+hUkTC8OL2bDxIxYy016Vi8QBGeTpaxftM9Jt7CaG1Kki
 pBgUVHMjwm0dZ6BQctCgwRgiJRdRerH/g018lZ85cNpSXLF5NF/ThY9bv
 Mrv0jqi6F2Bcz4uOVedafPaPqocwzimp+GgWf+sm7ogihVlhBhrhEJG8c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384113000"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="384113000"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="710907610"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="710907610"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.180])
 ([10.249.254.180])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:05:10 -0700
Message-ID: <991172db-f013-5e0f-a2b6-1ac7c01a4898@linux.intel.com>
Date: Fri, 2 Jun 2023 12:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230602031241.9160-1-niranjana.vishwanathapura@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230602031241.9160-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Apply upper limit to sg
 element size
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 6/2/23 05:12, Niranjana Vishwanathapura wrote:
> Replace UINT_MAX with maximum value supported by sg->length.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

>
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d945675a259f..e6d08fa9c992 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -306,7 +306,10 @@ struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>    */
>   static inline unsigned int xe_sg_segment_size(struct device *dev)
>   {
> -	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
> +	struct scatterlist __maybe_unused sg;
> +	size_t max = BIT_ULL(sizeof(sg.length) * 8) - 1;
> +
> +	max = min_t(size_t, max, dma_max_mapping_size(dev));
>   
>   	/*
>   	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
