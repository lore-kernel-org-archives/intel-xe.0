Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED02C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056A410E296;
	Wed, 19 Jun 2024 23:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iat3ZzWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E678510E296
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718838288; x=1750374288;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=C6DTyXMTlXgmRiBfTRaoCBAxna3DzxoE3Ees70ht2Qs=;
 b=Iat3ZzWTFNid6OvfUD9MpmLAMg5OZZI3mwPYaHbYes8/2sFj5lD8+0qp
 gGxbCtSJg49tmxTwsHOCBy/QUDzRh+cbNpmkh99ATPbmXEa0NX3B1f15k
 KZ5RbXe5L0XK5qgMi6DdmNCxy/5PwXbOVOMaYk8BbCAu4qqIR8eYin4ys
 to7u12g51N9sY6T4eyD7rq/oeQHsnKUCoVmjTt4DYmKI+OR54E+Q4Y5nW
 QxCH5jhQtmOy9l7P6BcKZi6dKCvrvVvA0alRD+oaYHB4NR4PP8fbmYpKC
 HhSRUATHI7X2sF8D6wk9z1qJvE4H9vXPyXnyoBkGFP7IB8NXytiY7iiQL g==;
X-CSE-ConnectionGUID: Ja/UogpVQUCJ1vNtprdnLw==
X-CSE-MsgGUID: JXnj4MVxT9OQesKPBftnhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27202864"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="27202864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:04:47 -0700
X-CSE-ConnectionGUID: r0PFOXNvQ/WrqY1qtTrE+Q==
X-CSE-MsgGUID: kBqYfzTZSiame8awfVPUNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42145624"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2024 16:04:44 -0700
Received: from [10.246.25.139] (unknown [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 590CF28184;
 Thu, 20 Jun 2024 00:04:42 +0100 (IST)
Message-ID: <d36fc332-59e8-4090-9741-154052bc1046@intel.com>
Date: Thu, 20 Jun 2024 01:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/oa: Remove WARN_ON's for unsupported configurations
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
References: <20240619225617.3465899-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240619225617.3465899-1-ashutosh.dixit@intel.com>
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



On 20.06.2024 00:56, Ashutosh Dixit wrote:
> The OA ioctl's already have drm_dbg's which are sufficient to tell the user
> that OA is not supported on unsupported configurations (execlist mode and
> platform gen < 12). Having additional WARN_ON's for these during driver
> probe create unnecessary noise. Just remove these WARN_ON's.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 34206e0b6a08..5093a89a31f1 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2382,7 +2382,7 @@ int xe_oa_init(struct xe_device *xe)
>  	int ret;
>  
>  	/* Support OA only with GuC submission and Gen12+ */
> -	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
> +	if (!xe_device_uc_enabled(xe) || GRAPHICS_VER(xe) < 12)
>  		return 0;
>  
>  	oa->xe = xe;
