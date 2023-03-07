Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F646C6FD1B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 16:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FF910E0E1;
	Tue,  7 Mar 2023 16:17:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F9A10E0E1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678205835; x=1709741835;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f/HI7wOOEBFE/mayrBhfm48p9H/D15ntkU02DIKPWXQ=;
 b=j5sQl14ZXFOK1lF3BgKjXrxETgnz6dHz2KnOguKWGzMDsRZmjKGoUJ5v
 PrsjXCi4X+EhPN+QxS9CibXpop8dt81ujG/Fv6GUWPdfFueNQC8otp10E
 Wq8d9PzzjSVUpJWHK09uuCqozxzCAH8dCSS+q30NlgT/vlcxNG6aqjUWi
 2NgtSPaZN7T7p5TDyuZNEO0oOMGpfbfDMzcDNJj+Ylld9lw6EVTIPfMpf
 BYA/M3rnizCjYzrKrpkQ57Q+xB7GPp/q2FqC7ZtmTtzDYgRHnE9Og68Dd
 7L/tW32wfHrRXNawyxcqlNpfLsyDhpDpzxcAMzXRYf7CnujNfMmSYEEY+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315549246"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="315549246"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676608334"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="676608334"
Received: from szymansk-mobl1.ger.corp.intel.com (HELO [10.249.43.98])
 ([10.249.43.98])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:17:13 -0800
Message-ID: <ac35f9fd-5be8-c388-e780-7286a1e2f218@linux.intel.com>
Date: Tue, 7 Mar 2023 17:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-03-07 09:09, Balasubramani Vivekanandan wrote:
> Link copy engines doesn't support the XY_FAST_COLOR instruction.
> Currently this instruction is used only at one place to clear a ttm
> resource while migrating a BO.
> A new device_info member is created to know if a platform has link copy
> engine. If it supports, then instead of using XY_FAST_COLOR instruction,
> MEM_SET is used which is available both in main and link copy engines.
>
> BSpec: 68433
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
>   drivers/gpu/drm/xe/xe_device_types.h      |  2 +
>   drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_pci.c               |  4 ++
>   4 files changed, 60 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 288576035ce3..df9ed4fbf2bf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_GPU_COMMANDS_H_
>   #define _XE_GPU_COMMANDS_H_
>   
> +#include "regs/xe_reg_defs.h"
> +
>   #define INSTR_CLIENT_SHIFT      29
>   #define   INSTR_MI_CLIENT       0x0
>   #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> @@ -56,6 +58,13 @@
>   #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
>   #define   BLT_DEPTH_32			(3<<24)
>   
> +#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> +#define   PVC_MEM_SET_CMD_LEN_DW	7
> +#define   PVC_MS_MATRIX			REG_BIT(17)
> +/* Bspec lists field as [6:0], but index alone is from [6:1] */
> +#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> +#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> +
>   #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>   #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
>   #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 199bd37fce9a..a73c5e1d7503 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -95,6 +95,8 @@ struct xe_device {
>   		bool has_4tile;
>   		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>   		bool has_range_tlb_invalidation;
> +		/** @has_link_copy_engines: Whether the platform has link copy engines */
> +		bool has_link_copy_engine;
>   		/** @enable_display: display enabled */
>   		bool enable_display;
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index bc69ec17d5ad..59fd588a1faf 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -750,32 +750,57 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   		      u32 size, u32 pitch, u32 value, bool is_vram)
>   {
>   	u32 *cs = bb->cs + bb->len;
> -	u32 len = XY_FAST_COLOR_BLT_DW;
> +	u32 len;
>   	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> +	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (GRAPHICS_VERx100(gt->xe) < 1250)
> -		len = 11;
> -
> -	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> -		(len - 2);
> -	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> -		(pitch - 1);
> -	*cs++ = 0;
> -	*cs++ = (size / pitch) << 16 | pitch / 4;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs);
> -	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> -	*cs++ = value;
> -	*cs++ = 0;
> -	*cs++ = 0;
> -	*cs++ = 0;
> -
> -	if (len > 11) {
> -		*cs++ = 0;
> +	if (xe->info.has_link_copy_engine) {
> +		/* MEM_SET command supports setting only 8-bit value.
> +		 * This function is currently used only to clear the address
> +		 * range.  So the value agrument is not really used. Need to
> +		 * have a better handling when there is a need to actually set
> +		 * a value. Print a warning if a value bigger than 8-bit is
> +		 * passed
> +		 */
> +		XE_WARN_ON(value > U8_MAX);

I would change it to if (value); 0xffffffff would likely work for 
example, but is bigger than U8_MAX.

~Maarten

> +
> +		len = PVC_MEM_SET_CMD_LEN_DW;
> +
> +		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
> +				(PVC_MEM_SET_CMD_LEN_DW - 2);
> +		*cs++ = pitch - 1;
> +		*cs++ = (size / pitch) - 1;
> +		*cs++ = pitch - 1;
> +		*cs++ = lower_32_bits(src_ofs);
> +		*cs++ = upper_32_bits(src_ofs);
> +		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
> +				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> +	} else {
> +		len = XY_FAST_COLOR_BLT_DW;
> +		if (GRAPHICS_VERx100(gt->xe) < 1250)
> +			len = 11;
> +
> +		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> +			(len - 2);
> +		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> +			(pitch - 1);
>   		*cs++ = 0;
> +		*cs++ = (size / pitch) << 16 | pitch / 4;
> +		*cs++ = lower_32_bits(src_ofs);
> +		*cs++ = upper_32_bits(src_ofs);
> +		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> +		*cs++ = value;
>   		*cs++ = 0;
>   		*cs++ = 0;
>   		*cs++ = 0;
> +
> +		if (len > 11) {
> +			*cs++ = 0;
> +			*cs++ = 0;
> +			*cs++ = 0;
> +			*cs++ = 0;
> +			*cs++ = 0;
> +		}
>   	}
>   
>   	XE_BUG_ON(cs - bb->cs != len + bb->len);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c4d9fd2e7b2b..e555f13395ab 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -72,6 +72,8 @@ struct xe_device_desc {
>   	bool has_4tile;
>   	bool has_range_tlb_invalidation;
>   	bool has_asid;
> +
> +	bool has_link_copy_engine;
>   };
>   
>   __diag_push();
> @@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
>   	.vm_max_level = 4,
>   	.supports_usm = true,
>   	.has_asid = true,
> +	.has_link_copy_engine = true,
>   };
>   
>   #define MTL_MEDIA_ENGINES \
> @@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>   	xe->info.has_4tile = desc->has_4tile;
>   	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> +	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
>   
>   	spd = subplatform_get(xe, desc);
>   	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
