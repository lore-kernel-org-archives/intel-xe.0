Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E059C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 19:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D181910E676;
	Fri,  5 Jan 2024 19:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEA310E676
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704484783; x=1736020783;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ibjuoiAqqIPFmJOVom/JkQz+/R72JCvZE9f0qKw0hXU=;
 b=PimrkHpuXklFA0LipFooWOZUf8AoDzlZWjvlxeGhSaRgJWd+xnM0p+os
 GaVoILgC2mT/NDcrup92xahm00Iyj7PswDJ65+eYKUe1z1l7JS6lBhMTt
 jxILVYxhz52919DHIpZOVeD4v2m4HwIMr6+WheZ0PZD3ExWSu10/SisUd
 dDnOY8/TT4Bd37BSZTkLk5uRU1RMef3v3Y3UAO6RrMtuhq68EuykdHJAu
 D2b32lVM7yaupYKJyP4mwBQikiYjcxrV3fDDNHgGl+/gP/qA+7g/AlcQ2
 nAMYFvN9Zl5UTS6kTCV1SaTUvjd+CeZa5O6YQCN2go39wM2Nu7EoBYKQD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4337954"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4337954"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="773927032"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="773927032"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 05 Jan 2024 11:59:39 -0800
Received: from [10.249.149.166] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.149.166])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A6C1734334;
 Fri,  5 Jan 2024 19:59:38 +0000 (GMT)
Message-ID: <c2af7f83-d615-48db-8d7e-c660d0db71ec@intel.com>
Date: Fri, 5 Jan 2024 20:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Only take actions in CT irq handler if CTs
 are enabled
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240102214320.1255783-1-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240102214320.1255783-1-matthew.brost@intel.com>
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



On 02.01.2024 22:43, Matthew Brost wrote:
> Protect entire IRQ handler by CT being enabled rather than just G2H
> handler.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..05302db02e08 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -24,10 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
>  
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  {
> -	wake_up_all(&ct->wq);
> -	if (ct->enabled)
> +	if (ct->enabled) {

nit: to simplify the code I would rather exit early if (!ct->enabled)

> +		wake_up_all(&ct->wq);

btw, shouldn't we wake up wq _after_ we process a g2h message?
and maybe this should be done in fast_path or worker?

>  		queue_work(system_unbound_wq, &ct->g2h_worker);
> -	xe_guc_ct_fast_path(ct);
> +		xe_guc_ct_fast_path(ct);
> +	}

anyway, since we move forward,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  }
>  
>  /* Basic CT send / receives */
