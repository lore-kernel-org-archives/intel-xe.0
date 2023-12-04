Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB095C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 10:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D810E339;
	Mon,  4 Dec 2023 10:45:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A84F10E345
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701686711; x=1733222711;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=d2J32J3bplqLHKIDr+T9nefRfhS99h+2Yolr70W6org=;
 b=eWMR7/toA90RiFhb3z4kkpFitR1ToB8fs02vyhuWpwk0fsLF22IWUgPl
 FsWKx5IYAT1lDD21c8DQaV9J9jG9TqejJl6Xy9bFxHtV9g/SjsSVMIIWS
 9xCtDKVqHCVAVm374x3HfN3EMKkN2sAYvKhvcfz+mq8WD6Kkj14gFkMnD
 pLFBiilpTPMe+zUXsRyKNe01DEKVPj1RhHugKWe9dZivCRTyduehxhIv5
 X7JsFS4p/ckEuixhKwHG8FOjScS97S6GHYJjnTnowR9zdwbhMIslDNRNg
 EzTJCRdLXdn2KOb1gRbskd9QfhLtUXVv3hZRdSzjNJIZqk0THNkuP8M0+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378749027"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="378749027"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:45:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="914377380"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="914377380"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.100])
 ([10.249.254.100])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:45:07 -0800
Message-ID: <375b42ac-78c9-697d-8fe4-92d46d3032dd@linux.intel.com>
Date: Mon, 4 Dec 2023 11:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-3-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231116194047.214330-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Use a flags field instead of
 bools for VMA create
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


On 11/16/23 20:40, Matthew Brost wrote:
> Use a flags field instead of severval bools for VMA create as it is
> easier to read and less bug prone.
>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Hmm.

If you feel that this was not really an improvement feel free to 
disregard. Anyway,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 58 ++++++++++++++++++++------------------
>   1 file changed, 30 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cd8c2332a22e..13c8a9c6117c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -858,17 +858,21 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   	return fence;
>   }
>   
> +#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
> +#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
> +
>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   				    struct xe_bo *bo,
>   				    u64 bo_offset_or_userptr,
>   				    u64 start, u64 end,
> -				    bool read_only,
> -				    bool is_null,
> -				    u8 tile_mask)
> +				    u8 tile_mask,
> +				    unsigned int flags)
>   {
>   	struct xe_vma *vma;
>   	struct xe_tile *tile;
>   	u8 id;
> +	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
> +	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>   
>   	xe_assert(vm->xe, start < end);
>   	xe_assert(vm->xe, end < vm->size);
> @@ -2263,7 +2267,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   }
>   
>   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u8 tile_mask, bool read_only, bool is_null)
> +			      u8 tile_mask, unsigned int flags)
>   {
>   	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>   	struct xe_vma *vma;
> @@ -2278,8 +2282,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   	}
>   	vma = xe_vma_create(vm, bo, op->gem.offset,
>   			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, read_only, is_null,
> -			    tile_mask);
> +			    op->va.range - 1, tile_mask, flags);
>   	if (bo)
>   		xe_bo_unlock(bo);
>   
> @@ -2405,7 +2408,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   
>   	drm_gpuva_for_each_op(__op, ops) {
>   		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma;
>   		bool first = list_empty(ops_list);
> +		unsigned int flags = 0;
>   
>   		INIT_LIST_HEAD(&op->link);
>   		list_add_tail(&op->link, ops_list);
> @@ -2421,11 +2426,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   		switch (op->base.op) {
>   		case DRM_GPUVA_OP_MAP:
>   		{
> -			struct xe_vma *vma;
> +			flags |= op->map.read_only ?
> +				VMA_CREATE_FLAG_READ_ONLY : 0;
> +			flags |= op->map.is_null ?
> +				VMA_CREATE_FLAG_IS_NULL : 0;
>   
>   			vma = new_vma(vm, &op->base.map,
> -				      op->tile_mask, op->map.read_only,
> -				      op->map.is_null);
> +				      op->tile_mask, flags);
>   			if (IS_ERR(vma))
>   				return PTR_ERR(vma);
>   
> @@ -2441,17 +2448,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   			op->remap.range = xe_vma_size(old);
>   
>   			if (op->base.remap.prev) {
> -				struct xe_vma *vma;
> -				bool read_only =
> -					op->base.remap.unmap->va->flags &
> -					XE_VMA_READ_ONLY;
> -				bool is_null =
> -					op->base.remap.unmap->va->flags &
> -					DRM_GPUVA_SPARSE;
> +				flags |= op->base.remap.unmap->va->flags &
> +					XE_VMA_READ_ONLY ?
> +					VMA_CREATE_FLAG_READ_ONLY : 0;
> +				flags |= op->base.remap.unmap->va->flags &
> +					DRM_GPUVA_SPARSE ?
> +					VMA_CREATE_FLAG_IS_NULL : 0;
>   
>   				vma = new_vma(vm, op->base.remap.prev,
> -					      op->tile_mask, read_only,
> -					      is_null);
> +					      op->tile_mask, flags);
>   				if (IS_ERR(vma))
>   					return PTR_ERR(vma);
>   
> @@ -2474,18 +2479,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   			}
>   
>   			if (op->base.remap.next) {
> -				struct xe_vma *vma;
> -				bool read_only =
> -					op->base.remap.unmap->va->flags &
> -					XE_VMA_READ_ONLY;
> -
> -				bool is_null =
> -					op->base.remap.unmap->va->flags &
> -					DRM_GPUVA_SPARSE;
> +				flags |= op->base.remap.unmap->va->flags &
> +					XE_VMA_READ_ONLY ?
> +					VMA_CREATE_FLAG_READ_ONLY : 0;
> +				flags |= op->base.remap.unmap->va->flags &
> +					DRM_GPUVA_SPARSE ?
> +					VMA_CREATE_FLAG_IS_NULL : 0;
>   
>   				vma = new_vma(vm, op->base.remap.next,
> -					      op->tile_mask, read_only,
> -					      is_null);
> +					      op->tile_mask, flags);
>   				if (IS_ERR(vma))
>   					return PTR_ERR(vma);
>   
