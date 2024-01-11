Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B5C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 12:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9A910E1D2;
	Thu, 11 Jan 2024 12:29:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DF710E1D2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704976194; x=1736512194;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RNCy4hnj8ntcPiJr1/bgEl2DelYD43FjM27RW1d//dg=;
 b=BzKrG3OINHwUvxxiakLXFokAMYpWBpGVFg9CozwMxFG3rjTNocs/pNUI
 xF4b7i4/QXHK13nN01C8GuOoGvbM3Pfv2AaN6RnR4CfOJunR7wvwTVd6c
 aY0EFsNeIq57Kc43AV0BP+N8NReAT+qkdPMP5K2YwFWAhK47gLeVxXIw6
 saq3/kSS0kCrMUEDbj+cYoyumqkX5BQZe8l8JC4s+rPuV3nYDy0VIeedy
 hG+k81miMGU4ydv33o5791OqIrST97baV1bH997nabHYjdp8PCvtK9Q+k
 0xQEojrDEemOcor9u83IgYH9+jWcW5kK8A9GYjPo6rzzlPVSp9k6iYYRs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5911773"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5911773"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 04:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="782626674"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="782626674"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 11 Jan 2024 04:29:44 -0800
Received: from [10.249.150.229] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BACB327BA1;
 Thu, 11 Jan 2024 12:29:41 +0000 (GMT)
Message-ID: <39c71ec0-36b9-45c2-94c0-d4dce0a6f849@intel.com>
Date: Thu, 11 Jan 2024 13:29:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/guc: Flush G2H handler when turning off CTs
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240109230149.1399302-1-matthew.brost@intel.com>
 <20240109230149.1399302-4-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240109230149.1399302-4-matthew.brost@intel.com>
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



On 10.01.2024 00:01, Matthew Brost wrote:
> Make sure G2H handler is not running when changing the CT state to drop
> messages or disabled. This will help prevent races in the code ensuring
> that G2H are not being processed after changing the state.

nit: we should also assert that during fini the CT was already disabled,
but that's for another patch

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5b122a926ccf..6a2baa9034c8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -333,14 +333,21 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +static void flush_g2h_handler(struct xe_guc_ct *ct)

you're cancelling a in-flight work, not flushing it, so maybe:

	static void stop_g2h_handler(struct xe_guc_ct *ct) ?

with that fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +{
> +	cancel_work_sync(&ct->g2h_worker);
> +}
> +
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
>  	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> +	flush_g2h_handler(ct);
>  }
>  
>  void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  {
>  	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
> +	flush_g2h_handler(ct);
>  	xa_destroy(&ct->fence_lookup);
>  }
>  
