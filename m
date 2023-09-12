Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146F7CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 13:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D855B10E22F;
	Tue, 12 Sep 2023 13:20:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0ED10E22F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694524801; x=1726060801;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=L3/Mx729Z39ujJVC0aM0hvv2c5b7n9Wj3Pu7QE65T4w=;
 b=JwFgB5xTviMr+h+Fi2KHf7kHGDKutUcP/4dEf/OxgMynn5dl/QkVashP
 vn50QRxdmvLwSbMEO/rjIJ15qTSR02HwjF8j1iU1zdIpSQ3j4ccS9/RvD
 JUEgRdkN0wPO+JW90gJZpdCB1MCVsxdvl4Dr0/OBryR9WmTOcJFUUL23B
 tAvnPPGdsOfU8o/e7yRkWHTKbiGd3IATnS6tO6ZHX8rPvpEwX5tSfiEqE
 MjaD/uqrvHIaarz/RsW4dy3jsJy2m8uUj2ai/3Imh/y5ZE/chxMhnmdOI
 N+JWszNE9F8utP0WNjxlQv6cG9z1uggbso4XYgSPLtHZbc/KH4g1Q58wM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368629250"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="368629250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917435432"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="917435432"
Received: from dhermamx-mobl1.amr.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:19:59 -0700
Message-ID: <46ca9378-e333-1a42-c8ca-0d3434e3a832@linux.intel.com>
Date: Tue, 12 Sep 2023 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230911211829.2049126-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230911211829.2049126-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Fix fence reservation accouting
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

Hi,

On 9/11/23 23:18, Matthew Brost wrote:
> Both execs and the preempt rebind worker can issue rebinds. Rebinds
> require a fence, per tile, inserted into dma-resv slots of the VM and
> BO (if external). The fence reservation accouting did not take into
> account the number of fences required for rebinds, fix this.
>
> v2: Rebase
>
> Reported-by: Christopher Snowhill <kode54@gmail.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/518
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_exec.c | 6 +++++-
>   drivers/gpu/drm/xe/xe_vm.c   | 7 ++++++-
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 890fadb0a93e..eaf826f1b2a0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -103,7 +103,11 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
>   	if (xe_vm_no_dma_fences(vm))
>   		return 0;
>   
> -	err = xe_vm_lock_dma_resv(vm, exec, 1, true);
> +	/*
> +	 * 1 fence for job from exec plus a fence for each tile from a possible
> +	 * rebind
> +	 */
> +	err = xe_vm_lock_dma_resv(vm, exec, 1 + vm->xe->info.tile_count, true);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a6a0f17fec1d..03ee6993e7c7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -515,8 +515,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>   	struct xe_vma *vma;
>   	int err;
>   
> +	/*
> +	 * 1 fence for each preempt fence plus a fence for each tile from a
> +	 * possible rebind
> +	 */
>   	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
> -				   vm->preempt.num_exec_queues);
> +				   vm->preempt.num_exec_queues +
> +				   vm->xe->info.tile_count);
>   	if (err)
>   		return err;
>   
