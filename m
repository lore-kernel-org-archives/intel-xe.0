Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E362BC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A7A10E478;
	Mon,  6 May 2024 13:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPE2rJIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B9310E478;
 Mon,  6 May 2024 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002341; x=1746538341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f8a+KV2YSitrmARJFlJE1IvHn7ZWOi5O/nqFA9J+MwA=;
 b=kPE2rJIEFOv87CQ7KhDmnsVRW+DcUpD+E5tXTZKFmC4QZM2man0qSvPb
 FDVqseTSdVWsNiRCzjGPCQj5eWt1uS7R5LPYjdewmWxPr54iLoAfw2jwv
 gmPgLAJmiDoaTyZmJXsgSD0e93qZ0oOskLLHLzvtbySrYW70uXddw/33b
 o5HtFz01kZeTHn3UMygZRiihSlUsMeMR5/sXnJEaQWegroiIJd6SRFOpZ
 KasV6qSGpGV/zIpLtw0+3jAzcOnTshnjGJroyu0i00dnLkyAhhPi1YM/l
 7O06sEUfZyRD7s6XTZCqtD96qnVVldwFCKy2uuE8puOEF66QilBlaKpHg w==;
X-CSE-ConnectionGUID: QN6zWrPhQ+ugLpuJOhrEYA==
X-CSE-MsgGUID: zP+gyV6yT62ECViM7ZRZtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10868626"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10868626"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:32:21 -0700
X-CSE-ConnectionGUID: 5CMTjBBSRvyAnNQpZKvj4A==
X-CSE-MsgGUID: Q+f8MpljSSekZRcKPIN9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28158846"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.219])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:32:19 -0700
Date: Mon, 6 May 2024 15:32:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/intel_ctx: Propagate error from
 __intel_ctx_xe_exec wait timeout
Message-ID: <20240506133216.wuklmj5g7yshj6uu@zkempczy-mobl2>
References: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
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

On Mon, May 06, 2024 at 02:08:27PM +0200, Maarten Lankhorst wrote:
> Any wait timeouts are currently ignored, which might cause silent
> failures in test. Be more noisy about them.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/intel_ctx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> index b43dd6391..30325b906 100644
> --- a/lib/intel_ctx.c
> +++ b/lib/intel_ctx.c
> @@ -450,7 +450,7 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
>  		goto err;
>  
>  	if (!ctx->sync_bind || !ctx->sync_out)
> -		syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
> +		ret = syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
>  
>  err:
>  	if (!ctx->sync_bind)
> -- 
> 2.43.0
> 

Yes, you're definitely right:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

