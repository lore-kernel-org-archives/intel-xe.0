Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C74CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 10:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6F510E34F;
	Fri, 26 Sep 2025 10:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3q3kzpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311E610E34F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758883779; x=1790419779;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qt2HMe18ibZva/oKEFuOjpmYTH8Wm+1Lw2eUnbVrJxA=;
 b=H3q3kzpW5YnTDN3on0D7fHr+F6bqMdKcatNAmkbMnb7ZxdqHBsvzmeqh
 4jPMNgz1vISPmOkOG5lw+H1Yqa6wYwgeQyT5+Y3Tq2J0zJIx9wFUonHxZ
 S1oJc+0bP43exsDi6y+x7/MQKRi5xLmpTErpAJbpnqDoXMKZ74c4sMCjG
 Bb/CJhZ66k3WGjzhRykUwqfDtujBUS5YfBgZfPCVv5hSCLQlCPaIcb8X+
 lOAgIBJIMD6hkI940EVSLz7Uk2QvO1qKuQESA/yna7OE7UWXboyNZuuPU
 YNVIe5Rv1p6ToxJx46oKYJwkq3OtfGJ9rNYVXteElYvqM0dmO8N3xQhJi Q==;
X-CSE-ConnectionGUID: twhotxl8RTq/V7UOUWeoVQ==
X-CSE-MsgGUID: p2wz8rGVTGiE+8YhTgBYXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="48777854"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="48777854"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:49:39 -0700
X-CSE-ConnectionGUID: b3Nq6f4URmKtdKXQEc/yuw==
X-CSE-MsgGUID: 5ikQiWsiRX+PJwcUTd5Wcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177972051"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:49:37 -0700
Message-ID: <1b9403c0-9944-472e-9d7a-af1c2519d18e@intel.com>
Date: Fri, 26 Sep 2025 11:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Atomicize CCS copy command setup
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250926101814.2148970-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250926101814.2148970-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/09/2025 11:18, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 128-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 40 +++++++++++++++++++++++++--------
>   1 file changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e2fff2107f68..8c8685be3b44 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -644,18 +644,37 @@ static void emit_pte(struct xe_migrate *m,
>   	}
>   }
>   
> -#define EMIT_COPY_CCS_DW 5
> +/*
> + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may trigger
> + * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> + * write the sequence atomically.
> + */
> +static void _memcpy_vmovdqu(void *dst, const void *src)
> +{
> +	kernel_fpu_begin();
> +
> +	asm("vmovdqu (%0), %%ymm0\n"
> +	    "vmovups %%ymm0,   (%1)\n"
> +	    :: "r" (src), "r" (dst) : "memory");

I don't think this is portable? I assume this needs to be hidden for 
non-x86? Also ideally disable this path for non-VF stuff, since this is 
likely not free?

Also don't we have similar issues with emit_pte() if the GPU really can 
start executing before we have fully emitted all the bb programming?

Is it not possible to do the bb programming as a separate step, and then 
do the bb jump/ring programming only once ready or something?

> +
> +	kernel_fpu_end();
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>   			  u64 dst_ofs, bool dst_is_indirect,
>   			  u64 src_ofs, bool src_is_indirect,
>   			  u32 size)
>   {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>   	struct xe_device *xe = gt_to_xe(gt);
>   	u32 *cs = bb->cs + bb->len;
>   	u32 num_ccs_blks;
>   	u32 num_pages;
>   	u32 ccs_copy_size;
>   	u32 mocs;
> +	u32 i = 0;
>   
>   	if (GRAPHICS_VERx100(xe) >= 2000) {
>   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,14 +692,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>   	}
>   
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> +
> +	_memcpy_vmovdqu(cs, dw);
> +	cs += EMIT_COPY_CCS_DW;
>   
>   	bb->len = cs - bb->cs;
>   }

