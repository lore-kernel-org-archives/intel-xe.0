Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F859C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 07:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE0410E72C;
	Wed,  4 Jun 2025 07:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eHA6kM9S";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0675710E767;
 Wed,  4 Jun 2025 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bgRyunu03kM1wSbo8lg2xiEr3S0OMbyJR04D6HO5uVs=; b=eHA6kM9SzkmUkdQT8UvcgDOEcX
 xGigOp9OcTLEjVZs0D7N3327UNZYwbsegddwAX8UzfquWjvw727AaE9rc9W8sLzMY6/Ev+1SG9hs4
 kAZn+UU5QrZLMLS778d4lF6Z2dXrk9Hc8xcKIXQvVYDi/8ZTg0GOnCdj3fM0rtiG4iOMSIimNp5RF
 rsjZT3bZcU0+DEyMVpBq0Ye+2IhwIWB+Nx1yK+iUpxRYzA19CEeyrVbynsrB2TZNmvqgVc5PgnNCy
 j2mVvNq5D/sOioHnIHPiTaKLg1lUwCy9OTrNqCGmEqN70uI1VWL6xMJsamTze29amzfrmCpQUnx54
 E7g03HYQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uMiQg-00GzNT-JM; Wed, 04 Jun 2025 09:20:54 +0200
Message-ID: <23ccc7be-641c-460d-94bf-4df31aacc40c@igalia.com>
Date: Wed, 4 Jun 2025 08:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix build with CONFIG_DEBUG_FS=n
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250603184750.3304647-2-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250603184750.3304647-2-lucas.demarchi@intel.com>
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


On 03/06/2025 19:47, Lucas De Marchi wrote:
> Move the define outside the ifdef for CONFIG_DEBUG_FS to fix the build.
> This currently breaks drm kunit tests:
> 
> 	$ ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/ttm/tests/.kunitconfig
> 	ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
> 	../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
> 	 1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
> 
> Fixes: 22b929b25293 ("drm/ttm: Increase pool shrinker batch target")
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index e671812789ea7..2dead28a6c1c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1132,6 +1132,9 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   }
>   EXPORT_SYMBOL(ttm_pool_fini);
>   
> +/* Free average pool number of pages.  */
> +#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
> +
>   static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>   					    struct shrink_control *sc)
>   {
> @@ -1265,9 +1268,6 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>   }
>   EXPORT_SYMBOL(ttm_pool_debugfs);
>   
> -/* Free average pool number of pages.  */
> -#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
> -
>   /* Test the shrinker functions and dump the result */
>   static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>   {

Ah sorry!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I'll merge it straight away.

Regards,

Tvrtko

