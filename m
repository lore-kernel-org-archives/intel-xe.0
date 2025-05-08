Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C8C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 19:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9517510E0DC;
	Thu,  8 May 2025 19:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSTVdXxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C0510E0DC
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746733976; x=1778269976;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=31OTg5LW1lPU8POoFYWAb60JNht4t7l5NPpYEYnfFyI=;
 b=GSTVdXxqoOk7mSp0DcuqylSCnFFlUHEeEPwRpVqY17VsTzyPM8C1G/k+
 LDDPBXBFe/N5JLasYgnupZaIPlV5khXvOgxUw50rh1t9F6P+0IAmEEM9E
 jMSjdsJkdWRQ1OJfZn3znroSVaEWcMZkX9IRbbssv5aD4k64LaYRkeNuQ
 1vlo9cjlR7dh8VvfKv2x2OEYGjLgoV39lObZ1qCJbWUEtolThDhTrggsq
 AL43QNhpdyT+fY5tBfKHPOO3xhBJKWH6PIeZTnJ0vO6ruBLYIJuC0JnnQ
 NG37a1x1/0tL80I4haAeowX1h1YfbKYTNSzdp9g3WVS69ooNTENuEs6UE Q==;
X-CSE-ConnectionGUID: MJ2waaoqRnWyTW8n/z9mTQ==
X-CSE-MsgGUID: tn5TbsFfQ/SMstlRdcJuHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58754256"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="58754256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:52:56 -0700
X-CSE-ConnectionGUID: pRkbj/p/Q+G8b3l3osVBWQ==
X-CSE-MsgGUID: xLQdfmEiSXarVZWt8Wv6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="141598931"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 12:52:55 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3A88F34971;
 Thu,  8 May 2025 20:52:54 +0100 (IST)
Message-ID: <5ec1694b-0fdd-43bf-9dc7-545b744c0d44@intel.com>
Date: Thu, 8 May 2025 21:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
 <20250508013437.652982-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250508013437.652982-4-John.C.Harrison@Intel.com>
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



On 08.05.2025 03:34, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Rename XE_LARGE_GUC_BUFFER to XE_DEBUG_GUC to allow for more debug
> only code (in subsequent patch) without adding more config defines
> that each control only a single thing.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig.debug | 8 +++++---
>  drivers/gpu/drm/xe/xe_guc_log.h  | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 0d749ed44878..db063a513b1e 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -86,12 +86,14 @@ config DRM_XE_KUNIT_TEST
>  
>  	  If in doubt, say "N".
>  
> -config DRM_XE_LARGE_GUC_BUFFER
> -        bool "Enable larger guc log buffer"
> +config DRM_XE_DEBUG_GUC
> +        bool "Enable extra GuC related debug options"
> +        depends on DRM_XE_DEBUG
>          default n
>          help
>            Choose this option when debugging guc issues.
> -          Buffer should be large enough for complex issues.
> +          The GuC log buffer is increased to the maximum allowed, which should
> +          be large enough for complex issues.
>  
>            Recommended for driver developers only.
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 5b896f5fafaf..f1e2b0be90a9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -12,7 +12,7 @@
>  struct drm_printer;
>  struct xe_device;
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>  #define CRASH_BUFFER_SIZE       SZ_1M
>  #define DEBUG_BUFFER_SIZE       SZ_8M
>  #define CAPTURE_BUFFER_SIZE     SZ_2M

