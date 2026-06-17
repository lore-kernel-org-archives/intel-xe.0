Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E715DCD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFA210E9CE;
	Wed, 17 Jun 2026 11:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZQPZodf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FAE10E9CE;
 Wed, 17 Jun 2026 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781697471; x=1813233471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t1GrKbvIR05HFSeZZH4HCy8usY+1MD09U5YamK2wSb4=;
 b=UZQPZodfT7s6PQ+l5d/vYcDehZRkMNgZjK1uahiu1hTpHj5nnvZ4hY2G
 tS87LvcmpUy0RYlgD5OVXU7OAY6Bhlw2gSqKq2Xled9zETy9Ur1ipxXSh
 LEsLr360vx7sLFP5pJHk6tmHNUD69jxglyNpLhJBOtcjzfmyDVgkgmDL7
 4pNod4Pjm9qXJZf9VcUeGoA5kKfffg0VuXQpf4t/3J3alXkN30LV2Mt0a
 8xP/LlKC3FMIIyLSAvVUmkjAQn3/9x+ObY3cRIKiqq/AyH2PLWtPWvNhF
 0i2dh6WesuXPcODKWLFXN9cmi4i3GWS2e3FfBlsyJ1QBojsXxp+cUTpPY w==;
X-CSE-ConnectionGUID: x1mpcSPLSkOlphrx34HPdw==
X-CSE-MsgGUID: guWkPCz7Syuf37j4+ewPSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82388685"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82388685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:57:50 -0700
X-CSE-ConnectionGUID: 5rrDdqjySlmfpxq/dniaHQ==
X-CSE-MsgGUID: djK4hXv2ToS2K9oMzNFUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="245665267"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:57:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v2 01/11] drm/i915/vrr: add per-CRTC vrr/cmrr debugfs
 control
In-Reply-To: <20260616144233.832276-2-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260616144233.832276-2-mitulkumar.ajitkumar.golani@intel.com>
Date: Wed, 17 Jun 2026 14:57:45 +0300
Message-ID: <12bffed11c82910035b1e5469d2a10e3515d07ca@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 16 Jun 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Add a per-CRTC debugfs entry 'vrr/cmrr' and a debugfs file
> (numerator/denominator) that indicates user intended target
> refresh rate and video mode requirement.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  |   2 +
>  .../drm/i915/display/intel_display_types.h    |   5 +
>  drivers/gpu/drm/i915/display/intel_vrr.c      | 105 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
>  4 files changed, 114 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 08004c1ba03f..1ce6e73ec83c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -48,6 +48,7 @@
>  #include "intel_psr.h"
>  #include "intel_psr_regs.h"
>  #include "intel_vdsc.h"
> +#include "intel_vrr.h"
>  #include "intel_wm.h"
>  #include "intel_tc.h"
>  
> @@ -1393,6 +1394,7 @@ void intel_crtc_debugfs_add(struct intel_crtc *crtc)
>  	intel_drrs_crtc_debugfs_add(crtc);
>  	intel_fbc_crtc_debugfs_add(crtc);
>  	hsw_ips_crtc_debugfs_add(crtc);
> +	intel_vrr_crtc_debugfs_add(crtc);
>  
>  	debugfs_create_file("i915_current_bpc", 0444, root, crtc,
>  			    &i915_current_bpc_fops);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6cd102a3b610..897a1ffd7b79 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1545,6 +1545,11 @@ struct intel_crtc {
> +
> +	if (*numerator == 0)
> +		return -EINVAL;
> +
> +	if (*denominator != 1000 && *denominator != 1001)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_cmrr_show(struct seq_file *m, void *data)
> +{
> +	struct intel_crtc *crtc = m->private;
> +
> +	seq_printf(m, "%u/%u\n", crtc->cmrr.numerator, crtc->cmrr.denominator);
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_cmrr_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_vrr_cmrr_show, inode->i_private);
> +}
> +
> +static ssize_t intel_vrr_cmrr_write(struct file *file, const char __user *ubuf,
> +				    size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_crtc *crtc = m->private;
> +	u32 numerator, denominator;
> +	char kbuf[32];
> +	int ret;
> +
> +	if (len >= sizeof(kbuf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +
> +	kbuf[len] = '\0';
> +
> +	ret = cmrr_parse_ratio(kbuf, &numerator, &denominator);
> +	if (ret)
> +		return ret;
> +
> +	crtc->cmrr.numerator = numerator;
> +	crtc->cmrr.denominator = denominator;
> +
> +	return len;
> +}
> +
> +static const struct file_operations intel_vrr_cmrr_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_vrr_cmrr_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_vrr_cmrr_write,
> +};
> +
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +	struct dentry *vrr_dir;
> +
> +	if (!HAS_VRR(display))
> +		return;
> +
> +	vrr_dir = debugfs_create_dir("vrr", crtc->base.debugfs_entry);

Please give rationale for adding a directory.

Driver specific debugfs files should have a prefix. Using just "vrr"
blocks using it as a generic drm debugfs file. Please let's use "intel_"
going forward (instead of "i915_" that we've had before xe).

> +
> +	if (HAS_CMRR(display))
> +		debugfs_create_file("cmrr", 0600, vrr_dir, crtc,
> +				    &intel_vrr_cmrr_fops);
> +}
> +
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 55e9c429f579..19c7990be1b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
>  int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
>  int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
>  
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
> +
>  #endif /* __INTEL_VRR_H__ */

-- 
Jani Nikula, Intel
