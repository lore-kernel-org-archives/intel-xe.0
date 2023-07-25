Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5A5C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40AB10E0DE;
	Tue, 25 Jul 2023 11:43:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E17010E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285405; x=1721821405;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mx+ap0gQ5etbsFZDhlz869bs9lbEPIMRaGJ1vuoGjGE=;
 b=iCMYpVbVdBbyCi/CNZWWgx3nWkIOsvNlCOtyuI8eRuz7kdvBCfGMZ/UX
 o6XRv5mzp72cmbxiLRSWbcm95m5dniF9ifGrqJxqYKqxigr+mUl/bG8PZ
 B+wPrjgHlmCw5J5it34xUubS5xXtfteyg9K607nmUcqfKA5QayziQUOOt
 cLffqsPRn5hgSTLbLQckrF/BOy2MdY0Rc8uDk4L5gHH1DhA+NIp/EuEyu
 /MfautNOtHaVe8lUBnK89wPVMp9COykX+Yo4mP7SUq+jyKrIUQATkhVHa
 VsKtSDfg2WGqDq+W+aLURdc6pl9gEImmBnyeLJufsBhZDIWYMCzwJfClh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="357698554"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="357698554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755728991"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="755728991"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.37.117])
 ([10.249.37.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:23 -0700
Message-ID: <23c24c9e-8865-7e00-ef92-60ccc3682ef7@linux.intel.com>
Date: Tue, 25 Jul 2023 13:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230725003433.1992137-3-matthew.d.roper@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230725003433.1992137-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 7/25/2023 2:34 AM, Matt Roper wrote:
> On MTL and beyond, the GPU performs non-coherent accesses to the PPGTT
> page tables.  These page tables should be mapped as CPU:WC.
>
> Removes CAT errors triggered by xe_exec_basic@once-basic on MTL:
>
>     xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with range [1a0000...1a0fff) engine 0000000000000000.
>     xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]] 1 entries to update
>     xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]]  0: Update level 3 at (0 + 1) [0...8000000000) f:0
>     xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>     xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>     xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4
>
> v2:
>   - Rename to XE_BO_PAGETABLE to make it more clear that this BO is the
>     pagetable itself, rather than just being bound in the PPGTT.  (Lucas)
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
>   drivers/gpu/drm/xe/xe_bo.h |  1 +
>   drivers/gpu/drm/xe/xe_pt.c |  3 ++-
>   3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 538501c46b8b..10858fcf4f62 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -301,6 +301,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   	struct xe_device *xe = xe_bo_device(bo);
>   	struct xe_ttm_tt *tt;
>   	unsigned long extra_pages;
> +	enum ttm_caching caching = ttm_cached;
>   	int err;
>   
>   	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> @@ -314,10 +315,18 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>   					   PAGE_SIZE);
>   
> -	/* TODO: Select caching mode */
> -	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> -			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
> -			  extra_pages);
> +	/*
> +	 * Display scanout is always non-coherent with the CPU cache.
> +	 *
> +	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
> +	 * require a CPU:WC mapping.
> +	 *
> +	 */
> +	if (bo->flags & XE_BO_SCANOUT_BIT ||
> +	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
> +		caching = ttm_write_combined;
> +
> +	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>   	if (err) {
>   		kfree(tt);
>   		return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 72c68facd481..43ddfa998141 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -31,6 +31,7 @@
>   #define XE_BO_DEFER_BACKING		BIT(9)
>   #define XE_BO_SCANOUT_BIT		BIT(10)
>   #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
> +#define XE_BO_PAGETABLE			BIT(12)
>   /* this one is trigger internally only */
>   #define XE_BO_INTERNAL_TEST		BIT(30)
>   #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index bbc319fba9e8..d4660520ac2c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>   				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
>   				  XE_BO_CREATE_PINNED_BIT |
> -				  XE_BO_CREATE_NO_RESV_EVICT);
> +				  XE_BO_CREATE_NO_RESV_EVICT |
> +				  XE_BO_PAGETABLE);
>   	if (IS_ERR(bo)) {
>   		err = PTR_ERR(bo);
>   		goto err_kfree;
