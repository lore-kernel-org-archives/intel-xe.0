Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB43C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 08:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53E310E97A;
	Fri, 19 Jan 2024 08:41:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA42B10E97A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705653660; x=1737189660;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b93ddhqzzdlnne9Bng1VtsP6JDiR07+64TDP8O6yBcg=;
 b=TTe1XjRVNbwtKc6qd8fvDxZNwyRj8FS1yeEWo8HZQzg23wSNGCP9qoYy
 v+mR2wMO+d+BVY6R/HhLg2uOrJ2t0cERf3OBl2LVg1hGE5JR8A3ilHLA2
 hhzsBNcYyZthLjnDX802lZvc2G+R3YIII6z+4Xw+8kAWqMo5HNEJu9QnQ
 JtQG352rrzf1s5GB69WYGIzVuEb2oq2n/CfU0T2tLM9JcLX2nwci4vl0p
 VWu/uNvEg5vQ8nl6MeCMg/YV9Rm3CMN5C0BBHkPsG1cQbBkMhAHelzYqh
 0/RubfhE4gaZv8zHI3UxGI0gKPH4FqlX3EqDYACjRq2Fec4TmIDsDPAsI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7385461"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7385461"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="855266617"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="855266617"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.61])
 ([10.249.254.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:40:55 -0800
Message-ID: <ab409085-30a1-4b62-a3b0-735ddb0b7a7e@linux.intel.com>
Date: Fri, 19 Jan 2024 09:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/xe2: Use XE_CACHE_WB pat index
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240119041826.1670496-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240119041826.1670496-1-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/19/24 05:18, Himal Prasad Ghimiray wrote:
> The pat table entry associated with XE_CACHE_WB is coherent whereas
> XE_CACHE_NONE is non coherent. Migration expects the coherency
> with cpu therefore use the coherent entry XE_CACHE_WB for
> buffers not supporting compression. For read/write to flat ccs region
> the issue is not related to coherency with cpu. The hardware expects
> the pat index associated with GPUVA for indirect access to be
> compression enabled hence use XE_CACHE_NONE_COMPRESSION.
>
> v2
> - Fix the argument to emit_pte, pass the bool directly. (Thomas)
>
> v3
> - Rebase
> - Update commit message (Matt)
>
> v4
> - Add a Fixes: tag. (Thomas)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 65ef8dbad1db ("drm/xe/xe2: Update emit_pte to use compression enabled PAT index")
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 44725f978f3e..5de8ee4245c3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -481,7 +481,7 @@ static void emit_pte(struct xe_migrate *m,
>   	/* Indirect access needs compression enabled uncached PAT index */
>   	if (GRAPHICS_VERx100(xe) >= 2000)
>   		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
> -					  xe->pat.idx[XE_CACHE_NONE];
> +					  xe->pat.idx[XE_CACHE_WB];
>   	else
>   		pat_index = xe->pat.idx[XE_CACHE_WB];
>   
> @@ -769,14 +769,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
>   			xe_res_next(&src_it, src_L0);
>   		else
> -			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
> -				 src);
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
> +				 &src_it, src_L0, src);
>   
>   		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
>   			xe_res_next(&dst_it, src_L0);
>   		else
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
> -				 dst);
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
> +				 &dst_it, src_L0, dst);
>   
>   		if (copy_system_ccs)
>   			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> @@ -1018,8 +1018,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>   			xe_res_next(&src_it, clear_L0);
>   		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
> -				 dst);
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
> +				 &src_it, clear_L0, dst);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
