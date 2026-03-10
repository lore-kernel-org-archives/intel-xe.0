Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED27EB1054
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 14:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA2910E29D;
	Tue, 10 Mar 2026 14:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="aYAHaa7D";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA28B10E173;
 Tue, 10 Mar 2026 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1773151856;
 bh=VCSZ1DkN7DdRfFcUhifo5odP73Gr53B0inB2bVCoS7w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aYAHaa7DjmcCYvLU1x2ijmkpw9DE1Hd4BWDuhGIMKtLJeNyBiJ4MYBKsWiPTtjZeO
 SR7mfPJ7wAMz2MGf3Se9P0n5Sq94Jni4DKPim/C8+nKwxk+OLIzJRi/BBKlZ5px5f7
 Rr9H1xPpf8BS49F4oPwZJG/W0Pqkhw6sqmv8kWJZAsGNYlfwr5ZzzJFHPEA9v8Q8Ib
 aCsGdzNM6NK+uNMD3QMP/2x4BEF2rrLKszuH6wbo0QfCO0eTBKxs79ytK8nn6mzD7F
 2BfCTzjZHqjG53ICssSERjZbaNp4JvVVECvfojMGPGWMGfqQL7EWISKjQ4yWy46H2u
 x2KYVWgvmq5XA==
Message-ID: <1cac0638-c9e9-4dc9-be16-bc667cfa08c9@lankhorst.se>
Date: Tue, 10 Mar 2026 15:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ttm: Avoid invoking the OOM killer when reading
 back swapped content
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
 <20260227160012.82309-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260227160012.82309-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2026-02-27 kl. 17:00, skrev Thomas Hellström:
> In situations where the system is very short on RAM, the shmem
> readback from swap-space may invoke the OOM killer.
> 
> However, since this might be a recoverable situation where the caller
> is indicating this by setting
> struct ttm_operation_ctx::gfp_retry_mayfail to true, adjust the gfp
> value used by the allocation accordingly.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_backup.c | 6 ++++--
>  drivers/gpu/drm/ttm/ttm_pool.c   | 5 ++++-
>  include/drm/ttm/ttm_backup.h     | 2 +-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> index 6bd4c123d94c..81df4cb5606b 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -44,18 +44,20 @@ void ttm_backup_drop(struct file *backup, pgoff_t handle)
>   * @dst: The struct page to copy into.
>   * @handle: The handle returned when the page was backed up.
>   * @intr: Try to perform waits interruptible or at least killable.
> + * @additional_gfp: GFP mask to add to the default GFP mask if any.
>   *
>   * Return: 0 on success, Negative error code on failure, notably
>   * -EINTR if @intr was set to true and a signal is pending.
>   */
>  int ttm_backup_copy_page(struct file *backup, struct page *dst,
> -			 pgoff_t handle, bool intr)
> +			 pgoff_t handle, bool intr, gfp_t additional_gfp)
>  {
>  	struct address_space *mapping = backup->f_mapping;
>  	struct folio *from_folio;
>  	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
>  
> -	from_folio = shmem_read_folio(mapping, idx);
> +	from_folio = shmem_read_folio_gfp(mapping, idx, mapping_gfp_mask(mapping)
> +					  | additional_gfp);
>  	if (IS_ERR(from_folio))
>  		return PTR_ERR(from_folio);
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8fa9e09f6ee5..aa41099c5ecf 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -530,6 +530,8 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
>  		p = first_page[i];
>  		if (ttm_backup_page_ptr_is_handle(p)) {
>  			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +			gfp_t additional_gfp = ctx->gfp_retry_mayfail ?
> +				__GFP_RETRY_MAYFAIL | __GFP_NOWARN : 0;
>  
>  			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
>  			    should_fail(&backup_fault_inject, 1)) {
> @@ -543,7 +545,8 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
>  			}
>  
>  			ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
> -						   handle, ctx->interruptible);
> +						   handle, ctx->interruptible,
> +						   additional_gfp);
>  			if (ret)
>  				break;
>  
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> index c33cba111171..29b9c855af77 100644
> --- a/include/drm/ttm/ttm_backup.h
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -56,7 +56,7 @@ ttm_backup_page_ptr_to_handle(const struct page *page)
>  void ttm_backup_drop(struct file *backup, pgoff_t handle);
>  
>  int ttm_backup_copy_page(struct file *backup, struct page *dst,
> -			 pgoff_t handle, bool intr);
> +			 pgoff_t handle, bool intr, gfp_t additional_gfp);
>  
>  s64
>  ttm_backup_backup_page(struct file *backup, struct page *page,

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

Kind regards,
Maarten Lankhorst
