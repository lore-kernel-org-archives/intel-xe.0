Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38322C7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 08:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B6D10E049;
	Fri, 27 Jun 2025 08:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgmrcDYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1A210E32A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751013590; x=1782549590;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MMwFHxh37UlcT2hv5pEFV6MfGayngYYFrk3r2EdOHIQ=;
 b=QgmrcDYUC3quMPAhrOu9nFV4ctfDO6BaZrAPcyUGcdJNXLkdTk7VnXX3
 PkZaNR5BK1sJ9tDJBvNeaM9o3Edm2rriSZQnub9UwIJBjdXtGYC4tZtcg
 LnioTEpAkN/gxksBj0+U9oWMYt/7cdjdmaS/L5tQuapCDlXUN0+JfmNVA
 7wwFLCZLwE9jGG9qjZsP+vcvrtEwrd0gxamxXPDTeeJ7P3/Dc/lJArhCS
 jbdYNce6yusiR//0WBQq1P5mB9/WVAsjyPwKi0ClnQroD+ZglHlESLnaq
 /Zij9Rzv3n2W/piygiSDB/oByMh3UZ4X3y+V9GRdyGyjJmWQfgpAsYUqN Q==;
X-CSE-ConnectionGUID: N6o6x2T9SN6Q99ncxDuHvw==
X-CSE-MsgGUID: g3aWozeiRTWwqDVp877BHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52555631"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="52555631"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:39:48 -0700
X-CSE-ConnectionGUID: IwSflFslQCCpu/8s9aZ4nQ==
X-CSE-MsgGUID: vfZ6Y5QUT76JiBsDOo/F6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152364763"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.99])
 ([10.245.245.99])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:39:46 -0700
Message-ID: <8b8f41a4-779d-4b6c-ae5f-ad780474577f@intel.com>
Date: Fri, 27 Jun 2025 09:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fxi typo in Kconfig
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
References: <20250627074119.347826-1-dev@lankhorst.se>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250627074119.347826-1-dev@lankhorst.se>
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

On 27/06/2025 08:41, Maarten Lankhorst wrote:
> doubut -> doubt.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

In the commit title also s/Fxi/Fix :)

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 553c29e1030b1..4048a781323b6 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -85,7 +85,7 @@ config DRM_XE_GPUSVM
>   	  Enable this option if you want support for CPU to GPU address
>   	  mirroring.
>   
> -	  If in doubut say "Y".
> +	  If in doubt say "Y".
>   
>   config DRM_XE_PAGEMAP
>   	bool "Enable device memory pool for SVM"
> @@ -96,7 +96,7 @@ config DRM_XE_PAGEMAP
>   	  Disable this option only if you don't want to expose local device
>   	  memory for SVM. Will reduce KMD memory footprint when disabled.
>   
> -	  If in doubut say "Y".
> +	  If in doubt say "Y".
>   
>   config DRM_XE_FORCE_PROBE
>   	string "Force probe xe for selected Intel hardware IDs"

