Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AB9C00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 10:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3992410E33F;
	Tue, 24 Oct 2023 10:40:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5E10E33F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698144017; x=1729680017;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=3MQyS7wijn8SeLPmKy5WQHpMBLYtekYZyKqyu8b9JCo=;
 b=lmpTL0JDUJ9Bey1aWtyUxXTPUxN9pAiMmlaK2KMI4Un4YW2K3MciC9uY
 caVBxjteSufvA1fXV+mLQrfdvsTuhywL44fmou8ybJDTHVWg4M2C1BHWD
 ftCrQ8QJzC4GkdJLNfCSdxugHUFYAgR5Pl8PaPv6EFLP1NT+yu9y50mdc
 s9Mdkoxjgc0evopSYdLyygpNDzISaLdbyCuWfBGRafwnlikOJwn7PcJnV
 W2n0pQAVB+44agFMAJ7Tewzde+briart8p2LM8jXV0/ilcjzQX07Ji1CP
 W2QrYiAwjhEgXFneQ4g04CbPTiUC8KECAF4TFZubODRaKRKWuAakWgs2u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5654325"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="5654325"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="828786863"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="828786863"
Received: from goepfrim-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.28])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:40:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Koby Elbaz <kelbaz@habana.ai>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231022155727.717251-1-kelbaz@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231022155727.717251-1-kelbaz@habana.ai>
Date: Tue, 24 Oct 2023 13:40:11 +0300
Message-ID: <8734y0b8xg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: add skip_pcode flag
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

On Sun, 22 Oct 2023, Koby Elbaz <kelbaz@habana.ai> wrote:
> Per device, set this flag to enable access to the PCODE uC or to skip it.
>
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> ---
> Changes in v2:
> - Added the flag 'skip_pcode' instead of 'has_pcode'

I don't know why change was made from positive to negative flag.

Generally it's better to use positive flags, because they just read
better. Negative flags often lead to double negatives in source, such as
!disable.

Please consider using a positive flag, even if it's not "has_something".

BR,
Jani.


>
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>  drivers/gpu/drm/xe/xe_pcode.c        | 9 +++++++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 44d622d4cc3a..29199671d9e8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -257,6 +257,8 @@ struct xe_device {
>  		u8 enable_display:1;
>  		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
>  		u8 bypass_mtcfg:1;
> +		/** @skip_pcode: skip access to PCODE uC */
> +		u8 skip_pcode:1;
>  		/** @supports_mmio_ext: supports MMIO extension/s */
>  		u8 supports_mmio_ext:1;
>  		/** @has_heci_gscfi: device has heci gscfi */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2fae45b9d88e..05b0aa9f2ab7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -61,6 +61,7 @@ struct xe_device_desc {
>  
>  	u8 has_llc:1;
>  	u8 bypass_mtcfg:1;
> +	u8 skip_pcode:1;
>  	u8 supports_mmio_ext:1;
>  };
>  
> @@ -578,6 +579,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> +	xe->info.skip_pcode = desc->skip_pcode;
>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 4a240acf7625..b324dc2a5deb 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -61,6 +61,9 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>  {
>  	int err;
>  
> +	if (gt_to_xe(gt)->info.skip_pcode)
> +		return 0;
> +
>  	lockdep_assert_held(&gt->pcode.lock);
>  
>  	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
> @@ -249,6 +252,9 @@ int xe_pcode_init(struct xe_gt *gt)
>  	int timeout_us = 180000000; /* 3 min */
>  	int ret;
>  
> +	if (gt_to_xe(gt)->info.skip_pcode)
> +		return 0;
> +
>  	if (!IS_DGFX(gt_to_xe(gt)))
>  		return 0;
>  
> @@ -280,6 +286,9 @@ int xe_pcode_probe(struct xe_gt *gt)
>  {
>  	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>  
> +	if (gt_to_xe(gt)->info.skip_pcode)
> +		return 0;
> +
>  	if (!IS_DGFX(gt_to_xe(gt)))
>  		return 0;

-- 
Jani Nikula, Intel
