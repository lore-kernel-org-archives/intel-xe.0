Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7AFC369DE
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 08:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD1410E1AE;
	Wed, 23 Apr 2025 08:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcRaU0hI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDF010E1AE
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Apr 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745398286; x=1776934286;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wUZ7e/at9/EZ4y/5Lz9yEItUGvYaXenfKXYWtxSWyXg=;
 b=hcRaU0hIkJaXzp1oMXGJs58w+WzhJexVbmWhqPTTK54I8wGRm9YfWYTy
 JP+IOkaX2DiRFCAZAYpTJntS3yp4Su5mKRYdmjzqOtneY+t5a0LT/FcgA
 Xqvi8D/H7YoJclH4jA8ijyhh1YL5pAYhLFJeKy+nPD7Rcv3Qi5towrZO/
 DhTyKvPoc8uC7+DBwKpKju6U94dxjUKtk3B5Vx67DlD97C2F1qDigZiHN
 eegz7xaA9Y53AD0hvfGaWlyDEanL3UFcckFIQZlDq5KffetQJUK3BZOmg
 K6vmiW9eHUI/r/CD0+i/l+9LoGBFNMHrSAP1ZtNjYn2iEN/0HGjoBtEK0 Q==;
X-CSE-ConnectionGUID: Lznw7QIyRe+GvSHhUbGZZQ==
X-CSE-MsgGUID: D8kePrmjRuey7G7c+dp4CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47082322"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47082322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 01:51:25 -0700
X-CSE-ConnectionGUID: e/cRNe45TKOc5uB5pSje6g==
X-CSE-MsgGUID: IQnUbb2MRZ6wbvZkBxn9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136328940"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 01:51:23 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CF46D33BE1;
 Wed, 23 Apr 2025 09:51:22 +0100 (IST)
Message-ID: <4140c754-6bb5-4ad6-88e1-e2665e2e1b8e@intel.com>
Date: Wed, 23 Apr 2025 10:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add a missing H2G error code definition
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
 <20250326193240.4165833-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250326193240.4165833-2-John.C.Harrison@Intel.com>
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



On 26.03.2025 20:32, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> These error codes are not actually used in the driver but it is
> extremely useful to have them available to understand error messages.
> The most recent spate of FAST_REQ errors being reported have been
> about error 0x30C, so add in the missing define for that.

maybe we should try to sync more missing error codes than this only one
that we seen recently, to avoid being surprise another day when some new
unrecognized error will be seen like:

INVALID_CONTEXT_INDEX               = 0x61,
INVALID_CONTEXT_REGISTRATION        = 0x62,
INVALID_ENGINE_ID                   = 0x64,
BUFFER_ALREADY_REGISTERED           = 0x72,
CONTEXT_NOT_REGISTERED              = 0x100,
CONTEXT_ALREADY_REGISTERED          = 0x101,

then above quote "extremely useful to have them available to understand
error messages" will still hold

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_errors_abi.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> index 2c627a21648f..c25ea52a6e61 100644
> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> @@ -40,6 +40,7 @@ enum xe_guc_response_status {
>  	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
>  	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
>  	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
> +	XE_GUC_RESPONSE_STATUS_HW_TIMEOUT                   = 0x30C,

STATUS seems redundant here, most of other enums don't have it

	XE_GUC_RESPONSE_HW_TIMEOUT

>  	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
>  	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
>  	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,

with more error codes added,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

