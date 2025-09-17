Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A8CCAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 18:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E810E579;
	Wed, 17 Sep 2025 18:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BXqrozKH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C33D10E579
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 18:26:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB3004089F;
 Wed, 17 Sep 2025 18:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D81CC4CEFB;
 Wed, 17 Sep 2025 18:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758133615;
 bh=tfqrrEsYDY0CKxjKwsvLkKuQfSqpr5LOpWdaT6iovXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BXqrozKHx9SdNp3blThK7qPJYMlDgjxbip+AkeXecR9mGSYKFhDGcjtZsW4xxm0Qh
 kX8THD478Jdi8KxjtG1/sT83+yyuxFElv8+EU+cdkw7IUuf6u2tquZ6P1UUWcWqOZB
 cTzrp3X+3X+qVx31W0j4tdJiJZhFOfElekQCl5hQSKH59TIRr7rHnsADZOKMyEky/t
 2fjdIHlVFV84b93/BRrgxX+81d9pc8Mj1bzAbsFOXWaU2EzVG0x2H60F7vang02RhG
 UVQi+/fFAKjElYlrYuzpe6OXSlNN5LwXqSrZahrSv6YUsJvogAJ2w/+FYEqnQjqKXh
 vm5eQaGPmVT4w==
Date: Wed, 17 Sep 2025 11:26:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/xe: Work around clang multiple goto-label error
Message-ID: <20250917182651.GA383510@ax162>
References: <20250911080324.180307-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911080324.180307-1-thomas.hellstrom@linux.intel.com>
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

On Thu, Sep 11, 2025 at 10:03:24AM +0200, Thomas Hellström wrote:
> When using drm_exec_retry_on_contention(), clang may consider
> all labels for which we take addresses in a function as
> potential retry goto targets, although strictly only one
> is possible. It will then in some situations generate false
> positive errors.
> 
> In this case, the compiler, for some architectures, consider the
> 
> might_lock(&m->job_mutex);
> 
> as a potential goto target from drm_exec_retry_on_contention(),
> and errors.
> 
> Work around that by moving the xe_validate / drm_exec
> transaction to a separate function.
> 
> v2:
> - New commit message based on analysis of Nathan Chancellor
> 
> Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6fad5d469629..1d667fa36cf3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -394,6 +394,24 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
>  	return m;
>  }
>  
> +static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m, struct xe_vm *vm)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	int err = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
> +		err = xe_vm_drm_exec_lock(vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &err);
> +	}
> +
> +	return err;
> +}
> +
>  /**
>   * xe_migrate_init() - Initialize a migrate context
>   * @m: The migration context
> @@ -405,8 +423,6 @@ int xe_migrate_init(struct xe_migrate *m)
>  	struct xe_tile *tile = m->tile;
>  	struct xe_gt *primary_gt = tile->primary_gt;
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_validation_ctx ctx;
> -	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	int err;
>  
> @@ -416,14 +432,7 @@ int xe_migrate_init(struct xe_migrate *m)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> -	err = 0;
> -	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
> -		err = xe_vm_drm_exec_lock(vm, &exec);
> -		drm_exec_retry_on_contention(&exec);
> -		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
> -		drm_exec_retry_on_contention(&exec);
> -		xe_validation_retry_on_oom(&ctx, &err);
> -	}
> +	err = xe_migrate_lock_prepare_vm(tile, m, vm);
>  	if (err)
>  		return err;
>  
> -- 
> 2.51.0
> 
