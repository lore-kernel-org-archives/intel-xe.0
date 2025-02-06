Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF87FC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 19:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF3010E30C;
	Thu,  6 Feb 2025 19:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY0jiiSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDF610E30C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738870159; x=1770406159;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z8I4BzK2xUa6Svy6MPbfhWFkJlTmGfs1ANMS2TEz6k4=;
 b=UY0jiiSqh/+7I4HfrpmgLeqBFPb3MfNAe/hYf9gfJHAbI6GYrnqD2H8a
 ZfWuETe2iThBQBBRAk6mVactr3Q94MkvIRaGJJde5GjkuFsK6qMUs68N5
 edadaYzgVDSXJNECLsX/YIMvIqQq51DvFpIatR7NvxbtSfkYZWQeYvgks
 8syjjraNFAWuOhd3I1oT4UNIy6lPJNXnPb3KCR4HefiADN4YSudEnuL9m
 euKbHvYJTGE4U0s747SjmT9uxKQHYCdBAJqUf+D7K7oaW00/k4p1irzFc
 a1oRPkgihhdXbYzsd5CdSa4CfAvv8Q7EOeMimC8L8X/bY8tvCDgaTclp/ g==;
X-CSE-ConnectionGUID: CyqD0IP3QA2YYXsmGlOTow==
X-CSE-MsgGUID: /fiWYCs7TAGS+rNBn15FoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50117673"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="50117673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:29:19 -0800
X-CSE-ConnectionGUID: 7H4BP8pXQ4WcxE7N10W29g==
X-CSE-MsgGUID: CA+V/RVbRPG1g9cczhl+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111079563"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 06 Feb 2025 11:29:16 -0800
Received: from [10.245.96.215] (unknown [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 44E8C32CB1;
 Thu,  6 Feb 2025 19:29:14 +0000 (GMT)
Message-ID: <8c88768b-a503-447d-ab76-d01b5612026a@intel.com>
Date: Thu, 6 Feb 2025 20:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/xe/pf: Enable per-function engine activity
 stats
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com, soham.purkait@intel.com
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-9-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250206104358.3436519-9-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 06.02.2025 11:43, Riana Tauro wrote:
> Enable per-function engine activity stats when
> sriov_numvfs are set and disable when sriov_numvfs
> are set to 0.

instead referring to magic 'sriov_numvfs' attribute name just say

... when VFs are enabled / disabled

> 
> Also restart engine stats when VF's are reprovisioned

shouldn't engine_activity take care of this on GT-reset on it's own?
it shouldn't be tied to PF config/provisioning code

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c          | 25 +++++++++++++++++++++
>  3 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b1d994d65589..25855dcb6e42 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -23,6 +23,7 @@
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_db_mgr.h"
> +#include "xe_guc_engine_activity.h"
>  #include "xe_guc_fwif.h"
>  #include "xe_guc_id_mgr.h"
>  #include "xe_guc_klv_helpers.h"
> @@ -1972,6 +1973,21 @@ static void pf_reset_config_thresholds(struct xe_gt *gt, struct xe_gt_sriov_conf
>  #undef reset_threshold_config
>  }
>  
> +/**
> + * xe_gt_sriov_pf_engine_stats - Enable/Disable engine stats for PF and VFs
> + * @gt: the &xe_gt
> + * @num_vfs: number of VFs to enable
> + * @enable: enable/disable
> + *
> + * Enable or disable engine stats for PF and VF
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable)

wrong place
this is not a config/provisioning related code

> +{
> +	return xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
> +}
> +
>  static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> @@ -2362,8 +2378,10 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>   */
>  void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>  {
> -	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> -	unsigned int fail = 0, skip = 0;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	u16 num_vfs = pci_num_vf(to_pci_dev(xe->drm.dev));
> +	unsigned int fail = 0, skip = 0, ret = 0;
>  
>  	for (n = 1; n <= total_vfs; n++) {
>  		if (xe_gt_sriov_pf_config_is_empty(gt, n))
> @@ -2372,6 +2390,10 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>  			fail++;
>  	}
>  
> +	ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, true);
> +	if (ret)
> +		xe_gt_sriov_dbg(gt, "Failed to enable engine stats for PF and VF's %d\n",
> +				ret);
>  	if (fail)
>  		xe_gt_sriov_notice(gt, "Failed to push %u of %u VF%s configurations\n",
>  				   fail, total_vfs - skip, str_plural(total_vfs));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index f894e9d4abba..a5585b178e6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -62,6 +62,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  				  const void *buf, size_t size);
>  
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable);
>  
>  void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index aaceee748287..612e64efb43c 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -62,6 +62,21 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>  }
>  
> +static int pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret = 0;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, enable);

can't you directly call xe_guc_engine_activity_function_stats() here?

> +		if (ret)
> +			return ret;

should we give up on the first failure? maybe just track first error?

> +	}
> +
> +	return ret;

it will be always 0 here

but if we just track errors instead of early exit then we could print
message here:

xe_sriov_info(xe, "Failed to %s function activity stats (%pe)\n",
		str_enable_disable(enable), ERR_PTR(first_error));

> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -94,6 +109,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  
>  	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>  		      num_vfs, total_vfs, str_plural(total_vfs));
> +
> +	err = pf_engine_activity_stats(xe, num_vfs, true);
> +	if (err < 0)
> +		xe_sriov_warn(xe, "Failed to enable function activity stats\n");
> +
>  	return num_vfs;
>  
>  failed:
> @@ -110,6 +130,7 @@ static int pf_disable_vfs(struct xe_device *xe)
>  	struct device *dev = xe->drm.dev;
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	u16 num_vfs = pci_num_vf(pdev);
> +	int err;
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> @@ -117,6 +138,10 @@ static int pf_disable_vfs(struct xe_device *xe)
>  	if (!num_vfs)
>  		return 0;
>  
> +	err = pf_engine_activity_stats(xe, num_vfs, false);
> +	if (err < 0)
> +		xe_sriov_warn(xe, "Failed to disable function activity stats\n");
> +
>  	pci_disable_sriov(pdev);
>  
>  	pf_reset_vfs(xe, num_vfs);

