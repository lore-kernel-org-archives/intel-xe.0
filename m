Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DDBF94CD8
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 07:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CD789664;
	Wed, 22 Apr 2026 07:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Ha8ClyoB";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDD08994A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 07:32:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so31761955e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1776843131; x=1777447931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FfMjYVt0OEJw9kTPbllj7wGPjeMaDQDeFyapIKBwi04=;
 b=Ha8ClyoBG+CrQo1TNJzizQHkPFovPYZLw8JQQb/AZInMU1AbaLGXNOqbL8WLej8iF6
 ZF0ozGP27ozQUpoeDUcWmqGjYoGhYiZHsngJ0/uxKvCpozYsnFfhSdpO7l/vFhl5li6Z
 s609OB0EXG6gGaxLGdk167NT1hEvjMcUUCJ/fOgyASput5OgumXDuJKG97jAFtMQg8pl
 X9gMbaw/zQJahDLVZruXEgo96SALlEBgXVE6C2YyP9XzfwXdn3qQjHiaL5OaEUVE+Idd
 +IW7Ae+iAWhsSxqW9rG0xXT4aaysa4yyC6QzB4s6txVcPmH+d7ibJb+3UUkFdu26kRCz
 uvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776843131; x=1777447931;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfMjYVt0OEJw9kTPbllj7wGPjeMaDQDeFyapIKBwi04=;
 b=FfEoWmv6gcis4C47ZsH9Rxkdf4TR8HjpXybVp342LieJGSAitJtZlvAUvAgXesSFo1
 CTFD9Qk6NOPslLcd1Y+poNHzZQ+ABUnhUVFGSvvwlRySu63MuGQDkwb4z1aw10ephiQO
 DT3bpyQgszCVcAYK8CoHaU6FAyS5F6OJfmTxoIRyoi4FZ2Zam9gI1BvkqmodZ5OZ1gv6
 vCaEbdyXjqPh8VyVx79i0gOACRK7ZNZCuv0oVdwGikgYYGDYp+2yXCrKsbl3uLGFTUDm
 /Njnsx1wkNVxSbAZEOauQVlOdISsC4yGQgHvJi2FUAVlYVdkKLIFt+6k5/laH4uYrACn
 4Uvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Fp918DHVZ0FNUepa+iug2z52Yj1z8jeZfdA5KwPHmaDBRQIVeNoc6yyRSBCjj8GipoXRKoyc0cw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhB+Ml+8m0ty9YS9YmiIbAedkF56HHZ3AGnbv+FlHMqu002lMy
 d1rLEQnNCMIL+aVHpyV30nOs6TtXSijIYo7N8Ly+oyXaa+aMOuxXNtWzrVpjeiSVxdY=
X-Gm-Gg: AeBDieuUyLc03ZXMJAoulemY0gWCeyaAsaJlQyCL4C1VBC9207aVqGCYX0USI3ZddsS
 tiW8n+qEoIXpQs2FpZ52zKOIMpApNYHXez4hjbzXBnAT+vN3eas7qjOdnu4Ar3fWrTvVwQ6beBg
 bo+KDY+cAqZl8A9tIhNHZW9R/Q3pfPsXQgLe66t+IOtYUUgWaa9ADcayETpJb80nkm4SynyFteU
 2zFvOcNjE3YC+YRPTsiS98acVvjbQrCFGE9VwDfnlJ06RjWwzBAW7VBoxO0qZMjH1a6UMUamVYn
 OUUPCCIH/gHogW6cCubI9zJ721EXZAg8e4lJdMR7UlzvtSh00c8VHh2R64tIojQXzHcozmgqn5W
 mA9rYYmD5c1kO1KBmhZJNc8MvIrwGZKHh0FX29I1jmvJdQttHqnVqLq+z3RN7abt1VcKC2oVx9M
 tB160A4nTikL+6IFkRld84tNyZLPvOv3Ne48pjZ4yIBuu6HN1FVQgNzHA=
X-Received: by 2002:a05:600c:c0cf:b0:489:1f3e:5f6f with SMTP id
 5b1f17b1804b1-4891f3e62a7mr113857145e9.12.1776843130310; 
 Wed, 22 Apr 2026 00:32:10 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb762f56sm133492965e9.15.2026.04.22.00.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 00:32:09 -0700 (PDT)
Message-ID: <30c84c41-192c-44ae-a614-2b9951c55727@ursulin.net>
Date: Wed, 22 Apr 2026 08:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/ttm: Issue direct reclaim at beneficial_order
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Carlos Santa <carlos.santa@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Colascione <dancol@dancol.org>
References: <20260421012608.1474950-1-matthew.brost@intel.com>
 <20260421012608.1474950-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260421012608.1474950-2-matthew.brost@intel.com>
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


On 21/04/2026 02:26, Matthew Brost wrote:
> Triggering kswap at an order higher than beneficial_order makes little
> sense, as the driver has already indicated the optimal order at which
> reclaim is effective. Similarly, issuing direct reclaim or triggering
> kswap at a lower order than beneficial_order is ineffective, since the
> driver does not benefit from reclaiming lower-order pages.
> 
> As a result, direct reclaim should only be issued with __GFP_NORETRY at
> exactly beneficial_order, or as a fallback, direct reclaim without
> __GFP_NORETRY at order 0 when failure is not an option.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> CC: dri-devel@lists.freedesktop.org
> Cc: Daniel Colascione <dancol@dancol.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 26a3689e5fd9..8425dbcc6c68 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -165,8 +165,8 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   	 * Do not add latency to the allocation path for allocations orders
>   	 * device tolds us do not bring them additional performance gains.
>   	 */
> -	if (beneficial_order && order > beneficial_order)
> -		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> +	if (order && beneficial_order && order != beneficial_order)
> +		gfp_flags &= ~__GFP_RECLAIM;
>   
>   	if (!ttm_pool_uses_dma_alloc(pool)) {
>   		p = alloc_pages_node(pool->nid, gfp_flags, order);

I missed this conversation so don't know if this was discussed -
having less of 64k pages is not a concern? I mean slightly higher TLB 
pressure etc on hardware which supports this PTE size.

Also, does clearing __GFP_RECLAIM disable compaction completely and is 
that wanted?

Regards,

Tvrtko

