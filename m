Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24A1C369BD
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 15:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800B710E7EC;
	Tue, 15 Apr 2025 15:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiGgUbej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F4510E7E8
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744732759; x=1776268759;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HvVR4rAufJRRKPr0PT/haXSGYk7VoT8pOYFtGI3oG7M=;
 b=aiGgUbejJutr/TxGowDYKAj2JuCVJUCVhROIYVdstleuYFP2khcTzeXx
 gfd0voWOS1DTc3Ftg6bYraK5mr1DBFEjnyEKpZwcoavPjTTEAPbyASptc
 IL6Gg+CurjWzs1uiErr8mTNPLSWEHfseiCy98us/g1Sb8tmr0SdAXtMvB
 iOrSjeYmo+ZGb30sI/n9FQ23QCiXSXPgUtzatvaEsC+xxcJ0PkDW89YWs
 ov/crFIdRqjVowYwZDHqUOAswcrLph+IkVovMIX4teEE/hkB3ZeWHDVny
 5JBfhasrN87YiDf22LqIXllkXWzh9V9CPD0o80eG/KtbSw8ZXNBdVI/Vs A==;
X-CSE-ConnectionGUID: WeM2JK4MQVGw3UWBLNe2yA==
X-CSE-MsgGUID: 2gjn09AdTFeXWxgiseUxDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33866428"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="33866428"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:59:18 -0700
X-CSE-ConnectionGUID: UYT3khtgT/O1wko3DlDhOw==
X-CSE-MsgGUID: lEt7LhtJSXSJ8e5XerhaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="153353794"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2025 08:59:17 -0700
Received: from [10.245.83.107] (unknown [10.245.83.107])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EE92A34909;
 Tue, 15 Apr 2025 16:59:15 +0100 (IST)
Message-ID: <28c68ba0-27fe-4d94-b210-218ec4909fc4@intel.com>
Date: Tue, 15 Apr 2025 17:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Introduce fault injection for guc mmio
 send/recv.
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
 <20250403120641.7258-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403120641.7258-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 03.04.2025 14:06, Satyanarayana K V P wrote:
> Fault can be injected with below steps.
> 
> FAILTYPE=fail_function
> FAILFUNC=xe_guc_mmio_send_recv
> 
> echo > /sys/kernel/debug/$FAILTYPE/inject
> echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> printf %#x -5 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
> 
> echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> echo -1 > /sys/kernel/debug/$FAILTYPE/times
> echo 0 > /sys/kernel/debug/$FAILTYPE/space
> echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

nit: IMO without FAILTYPE var it would look simpler

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index bc5714a5b36b..ca0823df252e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1393,6 +1393,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	/* Use data from the GuC response as our return value */
>  	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
>  }
> +ALLOW_ERROR_INJECTION(xe_guc_mmio_send_recv, ERRNO);
>  
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
>  {

but still LGTM,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

