Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F6CCFA779
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 13:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6742610E9F0;
	Fri,  4 Oct 2024 13:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PndmXPNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BA610E9F0
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728047406; x=1759583406;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dxSqBZEXZJMRp1U4W9RyBKHjN3X0upLBvchjwNvZGfw=;
 b=PndmXPNvcvYy1Yg22gnldgM4dzqsYn2EGoxtZzKDa7n9F/kn8ZGO6czV
 02WtlawuCIPtA05eOAawYi47NsUPDQWBzg6qTLl4bLvMG2Loim3ckgSmr
 49SZTXKcu0nD8+Uf1GV6I/QfZjHoQKVfxnj7XOOqVf6lmdq4ngO2e3ZtD
 XO1z+KdJOUktO0WaFYYF6CLA2BMJkQTYHuzVHbltowfvzPQHMBwXuS96r
 AF7KhbtiQMr0DKtgzR1fmfKH7Nj7sBuS3Xngd7vN2Ywb/nkHcmZkqsa2x
 rFV7h/4VADt31ngXGQ1FurPAH2UhZrhTbEvWsGf0aV/GqWarJ66viFlAc w==;
X-CSE-ConnectionGUID: S8pTLh3HRueYPT6bqsUfsg==
X-CSE-MsgGUID: mDbUcwPQQpKuQnN9EUi9/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38401891"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="38401891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:10:05 -0700
X-CSE-ConnectionGUID: naf9haNXQPO06o6L0lx9qA==
X-CSE-MsgGUID: +opM6NSyR0mIM2LLbhLAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="75027963"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.57])
 ([10.245.245.57])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:10:04 -0700
Message-ID: <3e661da9-126f-429f-bcbc-897e481470da@intel.com>
Date: Fri, 4 Oct 2024 14:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Fix the shrinker test compiler warnings.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Nathan Chancellor <nathan@kernel.org>
References: <20241004123922.38904-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241004123922.38904-1-thomas.hellstrom@linux.intel.com>
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

On 04/10/2024 13:39, Thomas Hellström wrote:
> The xe_bo_shrink_kunit test has an uninitialized value and illegal
> integer size conversions on 32-bit. Fix.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/
> Fixes: 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 7d3fd720478b..1562c08aaf34 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -440,7 +440,7 @@ static int shrink_test_run_device(struct xe_device *xe)
>   	LIST_HEAD(bos);
>   	struct xe_bo_link *link, *next;
>   	struct sysinfo si;
> -	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
> +	u64 ram, ram_and_swap, purgeable = 0, alloced, to_alloc, limit;

Maybe just double check that this doesn't now introduce 64b division 
errors on 32b arch.

Assuming it doesn't,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	unsigned int interrupted = 0, successful = 0, count = 0;
>   	struct rnd_state prng;
>   	u64 rand_seed;
