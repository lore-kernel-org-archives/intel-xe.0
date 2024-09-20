Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC194C7883E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DF910E0EF;
	Fri, 20 Sep 2024 13:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kz9lHQ73";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CC810E0EF
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:29:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0B912A43686;
 Fri, 20 Sep 2024 13:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8308AC4CEC3;
 Fri, 20 Sep 2024 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726838980;
 bh=dZxrialGQHRoDVUnjWTATZbcwuiDB6KeGCqjmM6NTu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kz9lHQ73r71UmwHpB/nuLBr+lVDKo315h6omjjMICs0ygCyVrYQFGMnmhQNAuLwxw
 e4VCmuO0kQTuIuoz0WrJmfDNjXjlxP7MoShL0UggSuRWZ9vvWdjcqIkKoLdLJ/Unpr
 /oeRlOkOM1VwITJvsXP94fm8zer9B+Xuapk8Zg7727ZQ16qWpCc1eh5MnnAG7B2EkH
 smE8dfwrvdnhOSE4MQ5ChWzVnLvO0RN9hv7RXep8zkcikW4NE8lAnfIwwDMerv0yRK
 VlVISRuXiUnRrtO9+rcFmHeSn2S5qB4AJ652g/lTM5v5y+ly/CKAxYNlB/xOo/TbbD
 eZohT3VN0Dj7A==
Date: Fri, 20 Sep 2024 06:29:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [CI] drm/xe: Attempt to reduce execution time for the
 xe_bo_shrink dynamic test
Message-ID: <20240920132938.GA1924428@thelio-3990X>
References: <20240919165122.17751-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919165122.17751-1-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

On Thu, Sep 19, 2024 at 06:51:22PM +0200, Thomas Hellström wrote:
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 7d3fd720478b..9aa6d30345e4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -440,7 +440,7 @@ static int shrink_test_run_device(struct xe_device *xe)
>  	LIST_HEAD(bos);
>  	struct xe_bo_link *link, *next;
>  	struct sysinfo si;
> -	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
> +	size_t ram, ram_and_swap, purgeable, alloced, to_alloc;
>  	unsigned int interrupted = 0, successful = 0, count = 0;
>  	struct rnd_state prng;
>  	u64 rand_seed;
> @@ -451,25 +451,18 @@ static int shrink_test_run_device(struct xe_device *xe)
>  	kunit_info(test, "Random seed is 0x%016llx.\n",
>  		   (unsigned long long)rand_seed);
>  
> -	/* Skip if execution time is expected to be too long. */
> -
> -	limit = SZ_32G;
> -	/* IGFX with flat CCS needs to copy when swapping / shrinking */
> -	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> -		limit = SZ_16G;
> -
>  	si_meminfo(&si);
>  	ram = (size_t)si.freeram * si.mem_unit;
> -	if (ram > limit) {
> -		kunit_skip(test, "Too long expected execution time.\n");
> -		return 0;
> -	}
>  	to_alloc = ram * 2;
>  
> -	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
> +	ram_and_swap = get_nr_swap_pages() * PAGE_SIZE;
> +	/* Don't use more that 4G swap to save execution time. */
> +	ram_and_swap = min_t(size_t, ram_and_swap, SZ_4G);

I am guessing from the lack of commit message and the tag that this is
not intended to be accepted in its current form but I figured I would
still report that this resolves the instance of -Wuninitialized I
reported at [1] but it still results in an instance of -Woverflow when
targeting 32-bit, for which 'size_t' is 'unsigned int':

  In file included from include/linux/kernel.h:28,
                   from include/linux/cpumask.h:11,
                   from include/linux/smp.h:13,
                   from include/linux/lockdep.h:14,
                   from include/linux/spinlock.h:63,
                   from include/linux/mmzone.h:8,
                   from include/linux/gfp.h:7,
                   from include/linux/mm.h:7,
                   from include/linux/pagemap.h:8,
                   from include/drm/ttm/ttm_tt.h:30,
                   from drivers/gpu/drm/xe/xe_bo.h:9,
                   from drivers/gpu/drm/xe/xe_bo.c:6:
  drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
  include/linux/minmax.h:93:37: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Werror=overflow]
     93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
        |                                     ^
  include/linux/minmax.h:96:9: note: in expansion of macro '__cmp_once_unique'
     96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
        |         ^~~~~~~~~~~~~~~~~
  include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
    213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
        |                           ^~~~~~~~~~
  drivers/gpu/drm/xe/tests/xe_bo.c:460:24: note: in expansion of macro 'min_t'
    460 |         ram_and_swap = min_t(size_t, ram_and_swap, SZ_4G);
        |                        ^~~~~
  cc1: all warnings being treated as errors

Cheers,
Nathan

[1]: https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/

> +	ram_and_swap += ram;
> +	purgeable = 0;
>  	if (to_alloc > ram_and_swap)
>  		purgeable = to_alloc - ram_and_swap;
> -	purgeable += purgeable / 5;
> +	purgeable += to_alloc / 128;
>  
>  	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
>  		   (unsigned long)ram);
> -- 
> 2.46.0
> 
