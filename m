Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43230C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 19:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D258910E21C;
	Thu,  8 May 2025 19:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKLb9w1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE8E10E21C
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746733063; x=1778269063;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ttGm39pI5wUER3nohz6Jibn5GfOa5y2xE+48hSBY66Y=;
 b=VKLb9w1gVcTsM4cLtXQiaMJir8METpBIslMBeOTA34fDg9Ofundf9JjL
 +6jm6gAvRtpfuim2hmlE1AKaz0uHU26uSBqHmUlR4bxlE8p1e8kNJLSGM
 rS+QeHw4wafmUnMof9S1sUQ6XqpSJkLWY8m9380G3zZ6JY4dDiYbloTSQ
 k7ixBzpqT7TEjLG8nD1A0l2xcxaoQoiKFc2gWXIPLWaDvZb6jFk+lQIWo
 caoybkNRAa1Kpy8BnvfykQxXJjlTYcilhFiLpNRymEuY5+hPFuJrutKvA
 Zu9yEO+U4DX82mfWH7L6QB5jgYIilZwvplJ18EkDKO2rIZtglBKsMnuKT w==;
X-CSE-ConnectionGUID: AvV29JQ7Q6mNTRM54hlBCQ==
X-CSE-MsgGUID: Jtk1PFNnSyKIvMO0vbANPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51201946"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="51201946"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:37:42 -0700
X-CSE-ConnectionGUID: Ph4evU8mRuaaBBJHJGMfeA==
X-CSE-MsgGUID: 6Nx15yO3TZ6hFX38UZoVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="141294104"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 12:37:41 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0EBAE34967;
 Thu,  8 May 2025 20:37:39 +0100 (IST)
Message-ID: <e73487cb-eff4-449e-845b-5a55accd42e4@intel.com>
Date: Thu, 8 May 2025 21:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/guc: Remove double blank line
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
 <20250508013437.652982-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250508013437.652982-2-John.C.Harrison@Intel.com>
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
> An earlier patch moved a drm_print a few lines lower but accidentally
> left a double blank line behind. So fix that.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2447de0ebedf..9213fdc25950 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1830,7 +1830,6 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>  		return;
>  	}
>  
> -
>  	/* Can't generate a genuine core dump at this point, so just do the good bits */
>  	drm_puts(&lp, "**** Xe Device Coredump ****\n");
>  	drm_printf(&lp, "Reason: CTB is dead - 0x%X\n", dead->reason);

