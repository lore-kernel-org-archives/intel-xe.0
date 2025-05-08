Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C106CC3ABC6
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 19:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8762B10E0DC;
	Thu,  8 May 2025 19:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rw3eilpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827D10E0DC
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746733848; x=1778269848;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=L2DT+ww+/+drx5G4lCtKkMSEXUVL7+92Wu6wU/e7AVU=;
 b=Rw3eilpLDmOSG4O/0baFKOgkymDq0xtw4NV9L291PcM4UvzOAoPxo9Gp
 32TGIxI9MuB1BvkxkWKXc0RQ7fRb2NfWrovAbNCxEVuO3iMMAUiBkewKi
 Cy4GZxebxbB/INpxdDyi7vaSLWu+CcRj6alSZD22ejvR43H3ZQjhr2g7K
 B3kWw9A8+0R8oanhmjGwCqusCTAHRNwvfmgqDZxk6QhI9+pPEbM41iaaR
 xyyrzexNk6cpjN+ovgNhn0VqMXo4HUX1f66YmNDESVxFh7av7qzAsijiu
 1es2os/s0CcW95t5EoWd3dteBRBTtR5AZmTiGag6rZ8FGxFIfpvZvQpw5 Q==;
X-CSE-ConnectionGUID: xvPD0NtdRDOx6laxJ5dQFQ==
X-CSE-MsgGUID: bUi4StXdQeCoBXZjY8I3yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48653680"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="48653680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:50:47 -0700
X-CSE-ConnectionGUID: gOVflFz6T1yqNp+5WDOx+Q==
X-CSE-MsgGUID: QcXsgFyRQaCG1xdlC145eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136280184"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 08 May 2025 12:50:46 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C64B334971;
 Thu,  8 May 2025 20:50:44 +0100 (IST)
Message-ID: <d8969391-26de-465f-894a-aa75c0947bc5@intel.com>
Date: Thu, 8 May 2025 21:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Add missing H2G error code definitions
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
 <20250508013437.652982-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250508013437.652982-3-John.C.Harrison@Intel.com>
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
> These error codes are not actually used in the driver but it is
> extremely useful to have them available to understand error messages.
> 
> v2: Add a bunch more error codes and drop 'status' from names (review
> feedback by Michal W).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with one nit below

> ---
>  drivers/gpu/drm/xe/abi/guc_errors_abi.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> index 2c627a21648f..cf00300add37 100644
> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> @@ -6,8 +6,8 @@
>  #ifndef _ABI_GUC_ERRORS_ABI_H
>  #define _ABI_GUC_ERRORS_ABI_H
>  
> -enum xe_guc_response_status {
> -	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
> +enum xe_guc_response {
> +	XE_GUC_RESPONSE_SUCCESS                             = 0x0,

this value seems to be some leftover from an earlier GuC ABI where there
was single H2G RESPONSE message, but today, as we have separate HXG
RESPONSE SUCCESS and FAILURE message types, there is no place for the
success code in SUCCESS message and in the FAILURE message we expect
only error responses, and 0 there can't be treated as success any more

maybe we can put some note here until official spec is fixed?

>  	XE_GUC_RESPONSE_ERROR_PROTOCOL                      = 0x04,
>  	XE_GUC_RESPONSE_INVALID_STATE                       = 0x0A,
>  	XE_GUC_RESPONSE_UNSUPPORTED_VERSION                 = 0x0B,
> @@ -21,12 +21,20 @@ enum xe_guc_response_status {
>  	XE_GUC_RESPONSE_CANNOT_COMPLETE_ACTION              = 0x41,
>  	XE_GUC_RESPONSE_INVALID_KLV_DATA                    = 0x50,
>  	XE_GUC_RESPONSE_INVALID_PARAMS                      = 0x60,
> +	XE_GUC_RESPONSE_INVALID_CONTEXT_INDEX               = 0x61,
> +	XE_GUC_RESPONSE_INVALID_CONTEXT_REGISTRATION        = 0x62,
> +	XE_GUC_RESPONSE_INVALID_DOORBELL_ID                 = 0x63,
> +	XE_GUC_RESPONSE_INVALID_ENGINE_ID                   = 0x64,
>  	XE_GUC_RESPONSE_INVALID_BUFFER_RANGE                = 0x70,
>  	XE_GUC_RESPONSE_INVALID_BUFFER                      = 0x71,
> +	XE_GUC_RESPONSE_BUFFER_ALREADY_REGISTERED           = 0x72,
>  	XE_GUC_RESPONSE_INVALID_GGTT_ADDRESS                = 0x80,
>  	XE_GUC_RESPONSE_PENDING_ACTION                      = 0x90,
> +	XE_GUC_RESPONSE_CONTEXT_NOT_REGISTERED              = 0x100,
> +	XE_GUC_RESPONSE_CONTEXT_ALREADY_REGISTERED          = 0X101,
>  	XE_GUC_RESPONSE_INVALID_SIZE                        = 0x102,
>  	XE_GUC_RESPONSE_MALFORMED_KLV                       = 0x103,
> +	XE_GUC_RESPONSE_INVALID_CONTEXT                     = 0x104,
>  	XE_GUC_RESPONSE_INVALID_KLV_KEY                     = 0x105,
>  	XE_GUC_RESPONSE_DATA_TOO_LARGE                      = 0x106,
>  	XE_GUC_RESPONSE_VF_MIGRATED                         = 0x107,
> @@ -40,10 +48,11 @@ enum xe_guc_response_status {
>  	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
>  	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
>  	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
> +	XE_GUC_RESPONSE_HW_TIMEOUT                          = 0x30C,
>  	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
>  	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
>  	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
> -	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
> +	XE_GUC_RESPONSE_GENERIC_FAIL                        = 0xF000,
>  };
>  
>  enum xe_guc_load_status {

