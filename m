Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5ECC44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 17:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053C310E850;
	Wed, 21 Jan 2026 17:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNLl1vzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1792910E83E;
 Wed, 21 Jan 2026 17:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769018380; x=1800554380;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IDR8/G+cyyhrh7iRPx4Tmo/dVFILAUKn1SSAuuRLS3s=;
 b=dNLl1vzHVdFkggc/PHVhMnyH7BI15I2J/bVR1B56rsagNieIwLtdfhaS
 uJnaOER8BFPuMKBXJSGd+ORDlI9VHs6J9n9hmSJ138OaOCZ8jXgjsXnNe
 yrUfQOJPuQzNJm82mgIW2yS6CjziL6FquPsvAT/Ooe1QD4Ural+PLBNLg
 UsSHyWbVEZzaLPwQea6fFLNweK/0Jqag29MaZHPW937YZWzNIhsV7Yusx
 /lIS+FGdMX+u46xI3UQWNsxVEe18vF970R2EVYDAGloh+Di/WgWMCRble
 85EsqR0QNNuaCsu/4XbBOmaND8Dz23uU96+K1MOcO0LcyboR3rRg4UFse Q==;
X-CSE-ConnectionGUID: yyXkpXsUSUqLxBxavgXSDA==
X-CSE-MsgGUID: 82zA7sAXTf+K45yqIKgReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69977246"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69977246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:59:39 -0800
X-CSE-ConnectionGUID: 5cIk6aL5QO2InZAhiT4mxw==
X-CSE-MsgGUID: mIyIH0LgSU6G0BcRFHEGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206329185"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:59:37 -0800
Message-ID: <97681265-611b-4b5c-887d-579a3cc82258@intel.com>
Date: Wed, 21 Jan 2026 17:59:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when
 DRM_XE_GPUSVM is selected
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20260121091048.41371-1-thomas.hellstrom@linux.intel.com>
 <20260121091048.41371-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260121091048.41371-3-thomas.hellstrom@linux.intel.com>
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

On 21/01/2026 09:10, Thomas Hellström wrote:
> CONFIG_DEVICE_PRIVATE is a prerequisite for DRM_XE_GPUSVM.
> Explicitly select it so that DRM_XE_GPUSVM is not unintentionally
> left out from distro configs not explicitly enabling
> CONFIG_DEVICE_PRIVATE.
> 
> v2:
> - Select also CONFIG_ZONE_DEVICE since it's needed by
>    CONFIG_DEVICE_PRIVATE.
> v3:
> - Depend on CONFIG_ZONE_DEVICE rather than selecting it.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index c34be1be155b..4d7dcaff2b91 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -80,8 +80,9 @@ config DRM_XE_GPUSVM
>   	bool "Enable CPU to GPU address mirroring"
>   	depends on DRM_XE
>   	depends on !UML
> -	depends on DEVICE_PRIVATE
> +	depends on ZONE_DEVICE
>   	default y
> +	select DEVICE_PRIVATE
>   	select DRM_GPUSVM
>   	help
>   	  Enable this option if you want support for CPU to GPU address

