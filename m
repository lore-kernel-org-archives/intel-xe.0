Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE2EC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 15:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7385110E22A;
	Fri,  2 Jun 2023 15:40:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74010E22A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685720402; x=1717256402;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=64yql3tieaZC5Irr2H5PIhDVul378RfUFaR1QS2DAHA=;
 b=ac7C7eR7yEJdIrh+MDvSxwLjz3fJ2g3HFoy1ZFL8AIMdrb8zEHqso+0a
 DN30X1aQI6xovJ7UTBjiFEglc7RFYoCSevhhSfYW1ez/D/ZUMq1cz8XOM
 ClV5ihT9Z4J3AkKVWOQk9NoLKwIBkPmXrFpVjf1swahU0r4D7ytCHyG9f
 6dMGfHbQnXR4B4x9PN7W7oUK3Gd72A8NmcuHPObLTouRvaZS+Nt0lpGwg
 qH6zOaAtf2xBqM80ovbOBbHnjOxRmWFCicqLBM0GWyc75iu7foUTVY19J
 KvQo3d8JLlvoUk42q6IdnY//5dpAuodQMCmNcvd6RMKQcFKl4B2KVDWMY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419430634"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="419430634"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882112631"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="882112631"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.106])
 ([10.249.254.106])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:40:00 -0700
Message-ID: <222d12cd-affe-1085-ebe9-85befd2dd683@linux.intel.com>
Date: Fri, 2 Jun 2023 17:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230602152149.998293-1-mika.kuoppala@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230602152149.998293-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Get the engine ref while holding a
 lock
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

Hi, Mika,

There is a reviewed patch on the list that fixes half of this already,

"Fix engine lookup refcount race", but I'm holding off commiting because 
we need to sort out where to
push fixes in response to Oded's review.

But since your patch is more complete, we can use that instead.

One comment below, though. Otherwise LGTM.

/Thomas


On 6/2/23 17:21, Mika Kuoppala wrote:
> The engine xarray holds a ref to engine, guarded by the lock.
> While we do lookup for engine, we need to take the ref inside
> the lock to prevent potential use-after-free during
> ioctls.
>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_engine.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index b3036c4a8ec3..ec5a79c9f2a3 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
>   
>   	mutex_lock(&xef->engine.lock);
>   	e = xa_load(&xef->engine.xa, id);
> -	mutex_unlock(&xef->engine.lock);
> -
> -	if (e)
> +	if (likely(e))
>   		xe_engine_get(e);

Old rule is the branch prediction hints shouldn't be used in drivers, 
but exceptions might be
in place where a code path is hit so often it might actually make a 
difference. Not sure this is such a path though?

> +	mutex_unlock(&xef->engine.lock);
>   
>   	return e;
>   }
> @@ -641,26 +640,27 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_engine_get_property *args = data;
>   	struct xe_engine *e;
> +	int ret;
>   
>   	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> -	mutex_lock(&xef->engine.lock);
> -	e = xa_load(&xef->engine.xa, args->engine_id);
> -	mutex_unlock(&xef->engine.lock);
> -
> +	e = xe_engine_lookup(xef, args->engine_id);
>   	if (XE_IOCTL_ERR(xe, !e))
>   		return -ENOENT;
>   
>   	switch (args->property) {
>   	case XE_ENGINE_GET_PROPERTY_BAN:
>   		args->value = !!(e->flags & ENGINE_FLAG_BANNED);
> +		ret = 0;
>   		break;
>   	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>   	}
>   
> -	return 0;
> +	xe_engine_put(e);
> +
> +	return ret;
>   }
>   
>   static void engine_kill_compute(struct xe_engine *e)
