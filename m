Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0EFC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 13:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7624710E69D;
	Tue,  5 Aug 2025 13:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eB1fS+MC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF56D10E69D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754401257; x=1785937257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y5XpQDLAYczhxAMP1ZJKkbQiznCZNfdj2q/5MX9YvY8=;
 b=eB1fS+MCnpfRUHJaZ4S/fms94+TwJnAnaV5fiwaFT9/ebTI723h4zzBY
 zmTMbB7W15locnxZ902RlciIAZSiHGymp88ZGbs39ZCqBfXGPbkOnxfAX
 V4N1qwiNr4uBEcT0gNE6Ow0BT6q7ptCg4QWLbooAykJBmwAsULvZXD6lB
 4f3OKTMLh/qCViEzpTikvYeMtdNRHG9s38WT8YIzjjU9vs8kEzxEIwpB1
 eHoWmwN8/ZivcEe4mcMFTY+GtyvYuKOJLPry+hxjK70t7pFKZ36pWnojQ
 7vjy0K+GHXu5WZYJ87vBw79R9RUb/SfM1nRKNvjn7ROdlkcQSh4WPt0iS w==;
X-CSE-ConnectionGUID: u+y9zrxJTomkl0cue9saXQ==
X-CSE-MsgGUID: oNDfRF8dQdKe5TGyM1b4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="82143308"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="82143308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:40:56 -0700
X-CSE-ConnectionGUID: X8xNhcgISce8jnz3JY3Oqw==
X-CSE-MsgGUID: 3o3ONoUKT4WZUUdJ+c9zNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201682708"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.244.5])
 ([10.245.244.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:40:55 -0700
Message-ID: <c4346dd6-ec12-46cc-93c2-7bc3aa16c6c4@intel.com>
Date: Tue, 5 Aug 2025 14:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Defer buffer object shrinker write-backs and
 GPU waits
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: melvyn <melvyn2@dnsense.pub>, Summers Stuart <stuart.summers@intel.com>,
 stable@vger.kernel.org
References: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05/08/2025 08:48, Thomas Hellström wrote:
> When the xe buffer-object shrinker allows GPU waits and write-back,
> (typically from kswapd), perform multiple passes, skipping
> subsequent passes if the shrinker number of scanned objects target
> is reached.
> 
> 1) Without GPU waits and write-back
> 2) Without write-back
> 3) With both GPU-waits and write-back
> 
> This is to avoid stalls and costly write- and readbacks unless they
> are really necessary.
> 
> v2:
> - Don't test for scan completion twice. (Stuart Summers)
> - Update tags.
> 
> Reported-by: melvyn <melvyn2@dnsense.pub>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5557
> Cc: Summers Stuart <stuart.summers@intel.com>
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_shrinker.c | 51 +++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 1c3c04d52f55..90244fe59b59 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -54,10 +54,10 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
>   	write_unlock(&shrinker->lock);
>   }
>   
> -static s64 xe_shrinker_walk(struct xe_device *xe,
> -			    struct ttm_operation_ctx *ctx,
> -			    const struct xe_bo_shrink_flags flags,
> -			    unsigned long to_scan, unsigned long *scanned)
> +static s64 __xe_shrinker_walk(struct xe_device *xe,
> +			      struct ttm_operation_ctx *ctx,
> +			      const struct xe_bo_shrink_flags flags,
> +			      unsigned long to_scan, unsigned long *scanned)
>   {
>   	unsigned int mem_type;
>   	s64 freed = 0, lret;
> @@ -93,6 +93,48 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
>   	return freed;
>   }
>   
> +/*
> + * Try shrinking idle objects without writeback first, then if not sufficient,
> + * try also non-idle objects and finally if that's not sufficient either,
> + * add writeback. This avoids stalls and explicit writebacks with light or
> + * moderate memory pressure.

Just one question here, with writeback=false it doesn't really influence 
which objects are chosen for shrinking, unlike with no_wait_gpu, right? 
Will having another pass just with writeback=true yield anything 
different, assuming here that the previous two passes would have already 
hoovered ~everything up that was a possible candidate, so this pass 
won't really find anything in practice? If so, does that also mean we 
never really end up using the writeback=true behaviour any more?

> + */
> +static s64 xe_shrinker_walk(struct xe_device *xe,
> +			    struct ttm_operation_ctx *ctx,
> +			    const struct xe_bo_shrink_flags flags,
> +			    unsigned long to_scan, unsigned long *scanned)
> +{
> +	bool no_wait_gpu = true;
> +	struct xe_bo_shrink_flags save_flags = flags;
> +	s64 lret, freed;
> +
> +	swap(no_wait_gpu, ctx->no_wait_gpu);
> +	save_flags.writeback = false;
> +	lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
> +	swap(no_wait_gpu, ctx->no_wait_gpu);
> +	if (lret < 0 || *scanned >= to_scan)
> +		return lret;
> +
> +	freed = lret;
> +	if (!ctx->no_wait_gpu) {
> +		lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
> +		if (lret < 0)
> +			return lret;
> +		freed += lret;
> +		if (*scanned >= to_scan)
> +			return freed;
> +	}
> +
> +	if (flags.writeback) {
> +		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned);
> +		if (lret < 0)
> +			return lret;
> +		freed += lret;
> +	}
> +
> +	return freed;
> +}
> +
>   static unsigned long
>   xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>   {
> @@ -199,6 +241,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
>   		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
>   
>   	shrink_flags.purge = false;
> +
>   	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
>   				nr_to_scan, &nr_scanned);
>   	if (lret >= 0)

