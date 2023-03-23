Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D1DC6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 09:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5762310E342;
	Thu, 23 Mar 2023 09:22:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4F810E342
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679563377; x=1711099377;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=E2f+gG627t9nXmbFvbyYOjWo2viLkvzl19SRTvUP/0M=;
 b=j9QsJOkkCegKhbqOs1QucmVMAfgA7tp+At/SFG/NMC8ywVtl9QDkMrrE
 o+6WeumV3nqZMeefH/3jI7QjBDLksOA8JqePVoxRS0UeFz1oo7frK56Jb
 edrqwwQHBDcfnhnDU6Nr/D4f+uF2/EU9hPvvWT9NWB7KPA2k/8xS+kcX0
 DR525rMo0g6yCL2eX3ZbodleegzBSwVHELWejHPMKWiuWG6T8FTBzBmhO
 M6/PLvkggQFZ1SlGmyZ9sUt7dlQzRbi++7YEZheBs4A8jwHUGjYvIM2JA
 UrrvUGj0vOT41by8yXW04VbiK5J9lNqDa0reWtRLUFyZL3xhYG0ExbAMN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319827470"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="319827470"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 02:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="806181792"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="806181792"
Received: from auliel-mobl1.ger.corp.intel.com (HELO [10.249.254.186])
 ([10.249.254.186])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 02:22:45 -0700
Message-ID: <25fd9bba-0a41-4f7c-a142-a88d440eace0@linux.intel.com>
Date: Thu, 23 Mar 2023 10:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename intel_de.h to xe_de.h
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


On 3/23/23 09:50, Maarten Lankhorst wrote:
> Rename intel_de.h to xe_de.h in order to remove #include_next,
> and change the ifdef guard to be the same as the rest of xe headers.
>
> This is consistent with the other files that are inside xe/display,
> and implement xe specific behavior.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_de.h            | 2 +-
>   drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
>   rename drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} (97%)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
> index 5c223ff6b3ec..267b1108abbb 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -4,7 +4,7 @@
>    */
>   
>   #ifdef BUILD_FOR_XE
> -#include_next "intel_de.h"
> +#include "xe_de.h"
>   #else
>   #ifndef __INTEL_DE_H__
>   #define __INTEL_DE_H__
> diff --git a/drivers/gpu/drm/xe/display/intel_de.h b/drivers/gpu/drm/xe/display/xe_de.h
> similarity index 97%
> rename from drivers/gpu/drm/xe/display/intel_de.h
> rename to drivers/gpu/drm/xe/display/xe_de.h
> index 0d0504b483ef..9f92fdb4159a 100644
> --- a/drivers/gpu/drm/xe/display/intel_de.h
> +++ b/drivers/gpu/drm/xe/display/xe_de.h
> @@ -1,10 +1,10 @@
>   /* SPDX-License-Identifier: MIT */
>   /*
> - * Copyright © 2019 Intel Corporation
> + * Copyright © 2019-2022 Intel Corporation
>    */
>   
> -#ifndef __INTEL_DE_H__
> -#define __INTEL_DE_H__
> +#ifndef _XE_DE_H_
> +#define _XE_DE_H_
>   
>   #include "i915_drv.h"
>   #include "xe_mmio.h"
> @@ -159,4 +159,4 @@ static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox
>   				timeout_base_ms);
>   }
>   
> -#endif /* __INTEL_DE_H__ */
> +#endif
