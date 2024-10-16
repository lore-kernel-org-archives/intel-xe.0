Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294BBD2A524
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 14:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063710E0A6;
	Wed, 16 Oct 2024 14:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htfL0K5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3D10E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729089883; x=1760625883;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=srmRxFnNeCyV+8njRBCEJvYWiBvNp6bnoTJSY/Xw6s4=;
 b=htfL0K5/zEi17IomJ4E68fYO3LSVIwnu4NFOJjN6NWlDr+wLdfzvaWyC
 gJraLMPB9lgz2BDcsHAmpHITUsDRT7CqOhvAmHDDOD5oI3H2Zzf09Jkoq
 dJ0POKj30BJhTfJ2yY/2WvcV0nBE4PaKWE54u//BkJfM4flJ6sZjXh8HP
 /vN7idduIZCz33pBlwpoFWcl8aKiV+dMCT8ndw/QPeMTiQWgfcWt80mbA
 vxF45l73lAFroKCrCPNwti3pyWxsHvwlMdA9EDQmIjkXpMX9iYysHf150
 ksrjVikU1dbLgwhqeKBXPCQXvKvWcO//1cxp9IKY3qw0W1shu2aKllx0n Q==;
X-CSE-ConnectionGUID: /qozZnPbTQKGnb+8p96t0g==
X-CSE-MsgGUID: V++ECcQcQQKRG83vyBXaag==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="46037411"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="46037411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:44:41 -0700
X-CSE-ConnectionGUID: jxk63d6GQCyjd2k4n8e/nw==
X-CSE-MsgGUID: xh+4cI6+T7y0DWOiaLLGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="77923432"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:44:41 -0700
Message-ID: <f57b1e3e-dbc9-4401-b2b8-0066213db11c@intel.com>
Date: Wed, 16 Oct 2024 15:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add caller info to xe_gt_reset_async
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20241016134405.769682-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241016134405.769682-1-nirmoy.das@intel.com>
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

On 16/10/2024 14:44, Nirmoy Das wrote:
> Add caller info to the xe_gt_reset_async() to help debug issues.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2874
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1c79660fb086..51324c7da0a9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -834,7 +834,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   void xe_gt_reset_async(struct xe_gt *gt)
>   {
> -	xe_gt_info(gt, "trying reset\n");
> +	xe_gt_info(gt, "trying reset from %pS\n", __builtin_return_address(0));

Probably ps is verbose enough?

>   
>   	/* Don't do a reset while one is already in flight */
>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
