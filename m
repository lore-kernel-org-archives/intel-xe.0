Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7020CC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 10:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3908B10E453;
	Wed, 26 Jul 2023 10:06:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699E810E1D2;
 Wed, 26 Jul 2023 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690365971; x=1721901971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c+MeJi3+McG4uXot2qYF/YANBXB24z9aPXsYg9r6XtE=;
 b=LNdeGaHOJeyPCmtLIPLI6Zx/CTjPXMEvWsAwiHZjOY6odZzKbY6lW+/9
 A1mu94dKZ05EJtfq+KSRGejtCwnzxu62VM0HVh7lnkxav+l1VpnoacCwn
 fQmv/DVOPUmM3hFumtGyzmsiRxjy5GWxPDvmoCrEvCa5SSErsti60sm13
 JJsw57sLnt7JVIcd8RS0KPdCvF+I46gJFnWMcHmPdjZRQxUbC81NHeajK
 kpzoIqhkvYi3WGZ1iep21YA0395j3JpmezYJbLc6nPUnBv5Xiky5O6kXb
 oKJcj94MYm8qMkXCH3lJHOpz8W3zYmRaWMxDeXGZoM/C29Dxu/aTVxGdm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366855897"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="366855897"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 03:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="973062173"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="973062173"
Received: from amuszyns-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.13.179])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 03:06:09 -0700
Date: Wed, 26 Jul 2023 12:06:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230726100607.fc3ntzkbaa2sp7ca@kamilkon-desk1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725205626.346256-1-rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 1/2] xe: Align uapi after
 removal of XE_QUERY_CONFIG_FLAGS_USE_GUC
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 2023-07-25 at 16:56:24 -0400, Rodrigo Vivi wrote:
> drm-xe-next commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
> 
> Also this is the header generated with:
> make -j21 headers_install  INSTALL_HDR_PATH=.
> ,as it should,
> what explains some other unrelated changes that are appearing
> in the diff below.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 9 ++++-----
>  tests/xe/xe_query.c       | 3 ---
-- ^^^^^^^^^^^^^^^^^^^
May you move this into second patch?

With that you can add my acked-by,

Regards,
Kamil

>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 02419c1d5..1ea453737 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _UAPI_XE_DRM_H_
> -#define _UAPI_XE_DRM_H_
> +#ifndef _XE_DRM_H_
> +#define _XE_DRM_H_
>  
>  #include "drm.h"
>  
> @@ -180,7 +180,7 @@ struct drm_xe_query_mem_region {
>  	 * zero.
>  	 */
>  	__u64 used;
> -	/*
> +	/**
>  	 * @cpu_visible_size: How much of this region can be CPU
>  	 * accessed, in bytes.
>  	 *
> @@ -246,7 +246,6 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define XE_QUERY_CONFIG_FLAGS			1
>  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> -	#define XE_QUERY_CONFIG_FLAGS_USE_GUC		(0x1 << 1)
>  #define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
> @@ -1051,4 +1050,4 @@ struct drm_xe_vm_madvise {
>  }
>  #endif
>  
> -#endif /* _UAPI_XE_DRM_H_ */
> +#endif /* _XE_DRM_H_ */
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index 47aa98a8f..a4e40afdd 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -371,9 +371,6 @@ test_query_config(int fd)
>  	igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
>  		config->info[XE_QUERY_CONFIG_FLAGS] &
>  		XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
> -	igt_info("  XE_QUERY_CONFIG_FLAGS_USE_GUC\t\t%s\n",
> -		config->info[XE_QUERY_CONFIG_FLAGS] &
> -		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "ON":"OFF");
>  	igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
>  		config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
>  	igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
> -- 
> 2.41.0
> 
