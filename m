Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BE2D6DDEF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 10:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5410E845;
	Fri, 15 Nov 2024 10:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2x6HpCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A3610E841;
 Fri, 15 Nov 2024 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731666427; x=1763202427;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iLwrt0mk0fNSpr4zMr+ANpsoIKJnuws8+Mnm6xYRS7c=;
 b=h2x6HpCpE+XULHxLijwM/qEgeMzONb/Cil9nwZFkZ5fkL0LdIfuDOgdo
 Xrl9Kig0OW0+OwopcPJANh6dHBv+AxjJ1ezjb+TBxx9Al4GKG80fLdj8f
 v/ndI9YomfkFP/E9wRm87JWKyIj4kd6ZBDtc5GneUNCFESSaqV4vwKQRI
 kCVsQVWwsB3J95XxZ9iDpSaUASDq+J5ylMdjTeaLsKg+REpNrr8SuH/dU
 vS9qhaoEp2URL0VYX8JXozFZO4QQlKXwJUr7zNSwEg9Sjse8Q0HVIP5mg
 e/6lJwhtfQDWNQYDNDcqDSewbW/nmN1btPCu5DJmwWwjztaWMyDcZkZmN Q==;
X-CSE-ConnectionGUID: FSc7e7IiStGSaM2NVA/dtQ==
X-CSE-MsgGUID: xkCuWyABQkSf/FEW5cS78Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31510571"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31510571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:27:07 -0800
X-CSE-ConnectionGUID: fATzC2PFTr+vzBLzBjy1fQ==
X-CSE-MsgGUID: 2JWVeb6zRJiQmhe6gW6klA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88404676"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:27:06 -0800
Message-ID: <59554420-7a6e-4475-b72e-9c41088a322a@intel.com>
Date: Fri, 15 Nov 2024 10:27:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
 <20241114050129.1381711-4-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241114050129.1381711-4-tejas.upadhyay@intel.com>
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

On 14/11/2024 05:01, Tejas Upadhyay wrote:
> For now dump into intel_drm_local.h. Once the uapi on the kernel side is
> merged, and is part of drm-next, we can sync the kernel headers and
> remove this.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Although not sure if we should still have separate i915 and xe headers, 
just how it is in the official kernel headers. Maybe that is a bikeshed 
though.

> ---
>   include/drm-uapi-experimental/intel_drm_local.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> index 1773c649b..4afe588ec 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,6 +20,8 @@ extern "C" {
>    * clean these up when kernel uapi headers are sync'd.
>    */
>   
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
> +
>   #if defined(__cplusplus)
>   }
>   #endif

