Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6696BC7EE39
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 09:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBE510E3CB;
	Mon, 30 Jun 2025 09:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+hdU8Iz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C5010E3CB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751274315; x=1782810315;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DA+comW7g3INHg2unhepJAf49YMt+EGsqsUJ5M/3Yq0=;
 b=f+hdU8IzZjW0lyS0wWO3ZV4OkyL0Ph7xZFTfG5eSn9Zp8oYc8asVSaRU
 IhQgsQjG/njz7/0+e44q3DUoPUnP+pPffcDcnGrReVDNtKMYXEbUi3io4
 pbX3myguBQUWwjCuhBVqyLeRz3sCn8cC3EQePFFTQF8/1dJtnKbk5IYsz
 wvTUbtfgrMgfsFmwXq4jauJvUal6XYtfbnP80N0SSQJxCji9B58nf0GUo
 5M1dqqESNlGLUvxNN21XB1vDkTCDYI/8weeYgwE2hmwZAhBfxDDU/h8LK
 IUkaySa7G6QjfByz6/WK1S7Jc+foDq1CcFtGmgC+tA10/HqkpmxkbNmrf Q==;
X-CSE-ConnectionGUID: mTPcSQm+TPWORmDMbvi79A==
X-CSE-MsgGUID: ruiYLSWgSn2mGDBRTAh8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="56115831"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="56115831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 02:05:15 -0700
X-CSE-ConnectionGUID: eVAvJ7TaRXKIFkEDa2K7WA==
X-CSE-MsgGUID: buepeDDaSgCYLNMx0o6rOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153947820"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 02:05:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Soham Purkait <soham.purkait@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 karthik.poosa@intel.com, riana.tauro@intel.com, jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH v8 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
In-Reply-To: <20250627190041.238015-3-soham.purkait@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250627190041.238015-1-soham.purkait@intel.com>
 <20250627190041.238015-3-soham.purkait@intel.com>
Date: Mon, 30 Jun 2025 12:05:08 +0300
Message-ID: <8879e3469b8fd3c98040f7df5bc5889125ec9436@intel.com>
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

On Sat, 28 Jun 2025, Soham Purkait <soham.purkait@intel.com> wrote:
> Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
> ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
> residency counters.
>
> v1:
>  - Expose all G-State residency counter values under
>    dgfx_pkg_residencies. (Anshuman)
>  - Include runtime_get/put. (Riana)
> v2:
>  - Move "dgfx_pkg_residencies" from "gtidle". (Anshuman)
> v3:
>  - Include debugfs node "dgfx_pcie_link_residencies" for pcie link
>    residency counter values.  (Anshuman)
> v4:
>  - Include check for BMG for and add helper function for repetitive
>    code. (Riana)
>  - Use "drm_debugfs_create_files" to create debugfs. (Karthik)
> v5:
>  - Reorder commits to reflect the correct dependency hierarchy.  (Jonathan)
>  - Simplification of commit message and rectified register offset.(Karthik)
>  - Error handling and return before printing.                       (Riana)
> v6:
>  - Remove check for DGFX as BMG is discrete. (Karthik)
> v7:
>  - Add for loop and local struct to avoid repetition. (Riana)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 87 +++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..f086dba253a0 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>  
>  #include <drm/drm_debugfs.h>
>  
> +#include "regs/xe_pmt.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_vsec.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>  
>  DECLARE_FAULT_ATTR(gt_reset_failure);
>  
> +static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				   u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	if (ret != sizeof(residency)) {
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +		return;
> +	}
> +
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +}
> +
>  static struct xe_device *node_to_xe(struct drm_info_node *node)
>  {
>  	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,73 @@ static int sriov_info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +	struct {
> +		u32 offset;
> +		char *name;
> +	} residencies[] = {
> +		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
> +		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
> +		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
> +		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
> +		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"},
> +		{0, NULL}
> +	};

Drive-by comment, that's now unnecessarily mutable, and as const could
be placed in rodata.

BR,
Jani.

> +
> +	for (int i = 0; residencies[i].name; i++)
> +		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	struct {
> +		u32 offset;
> +		char *name;
> +	} residencies[] = {
> +		{BMG_PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
> +		{BMG_PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
> +		{BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"},
> +		{0, NULL}
> +	};
> +
> +	for (int i = 0; residencies[i].name; i++)
> +		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"info", info, 0},
>  	{ .name = "sriov_info", .show = sriov_info, },
>  };
>  
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
> +};
> +
>  static int forcewake_open(struct inode *inode, struct file *file)
>  {
>  	struct xe_device *xe = inode->i_private;
> @@ -240,6 +322,11 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>  
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>  	debugfs_create_file("forcewake_all", 0400, root, xe,
>  			    &forcewake_all_fops);

-- 
Jani Nikula, Intel
