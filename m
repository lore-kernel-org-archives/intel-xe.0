Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9016AC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 10:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ED910E834;
	Wed,  9 Apr 2025 10:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfF0Z+lH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688B410E834
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744194571; x=1775730571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=id98RS0KJSbmY3mbAxMqORltcXacoLrGxvIBXUz48V0=;
 b=IfF0Z+lHbOjvXPOJ480Muxk0N+6Yq+4NfEYRrxgvfzis8NrrFcVwrN+B
 p9aK3ewBd3AnuxMLsPrLo56yo5VTWf7OzCqCgNb7b3BLu2qtwA5JBi7Dv
 GPthr3rJxrn26/OAUL7DwVL4cn9EqCCV3wz8T0WfLjL2ad0KxfW2J/zZo
 eddCUTH6yQcOo3zQwu5td3Xwx0S23aQi6xSHhLGmqvrQwxuivORYU7dCa
 rOrYreggKpEAxjhKunGuhkXbrDcoPG82ifTE3rMBm6ApTXkpbM85qa6WI
 6fod1PrVIWjpL3OiiEuT+OqGIxm5Odo4ttvbKf92cC7vf6u61XOrXdaL7 w==;
X-CSE-ConnectionGUID: RLAQlyGDTFaXTFi/h5g96w==
X-CSE-MsgGUID: 4uw6qWfcRD2QblvXFCtHWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49506367"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="49506367"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 03:29:31 -0700
X-CSE-ConnectionGUID: b9zAsUD/TJqUC2Hv7wu+YA==
X-CSE-MsgGUID: gaG2kGzBQ16NDpN6jTJsYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128456221"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.116.143])
 ([10.245.116.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 03:29:30 -0700
Message-ID: <79f1dc52-8342-4e49-86e6-b89a9d3e7442@linux.intel.com>
Date: Wed, 9 Apr 2025 12:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Don't expose privileged GT debugfs
 files if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250403142635.1821-4-michal.wajdeczko@intel.com>
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



On 4/3/2025 4:26 PM, Michal Wajdeczko wrote:
> Some of the debugfs files require access to the registers that are
> not accessible to the VFs. Don't expose those files on VF drivers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
>      add hint for developers where to add new files (Lucas)
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 2d63a69cbfa3..a88076e9cc7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -299,20 +299,20 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> -static const struct drm_info_list debugfs_list[] = {
> -	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> +/*
> + * only for GT debugfs files which can be safely used on the VF as well:
> + * - without access to the GT privileged registers
> + * - without access to the PF specific data
> + */
> +static const struct drm_info_list vf_safe_debugfs_list[] = {
>   	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
>   	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
>   	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> -	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> -	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>   	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
> -	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> -	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
>   	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
>   	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
>   	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> @@ -322,6 +322,15 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>   };
>   
> +/* everything else should be added here */
> +static const struct drm_info_list pf_only_debugfs_list[] = {
> +	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> +	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> +	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> +	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> +};
> +
>   void xe_gt_debugfs_register(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -345,10 +354,15 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   	 */
>   	root->d_inode->i_private = gt;
>   
> -	drm_debugfs_create_files(debugfs_list,
> -				 ARRAY_SIZE(debugfs_list),
> +	drm_debugfs_create_files(vf_safe_debugfs_list,
> +				 ARRAY_SIZE(vf_safe_debugfs_list),
>   				 root, minor);
>   
> +	if (!IS_SRIOV_VF(xe))
> +		drm_debugfs_create_files(pf_only_debugfs_list,
> +					 ARRAY_SIZE(pf_only_debugfs_list),
> +					 root, minor);
> +
>   	xe_uc_debugfs_register(&gt->uc, root);
>   
>   	if (IS_SRIOV_PF(xe))

LGTM,
I tested this patch together with 
https://patchwork.freedesktop.org/patch/640267/?series=145667&rev=1 (a 
fix for guc_info on VF) using 
igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries,
I did not encounter any issues on the VF.

Some maintenance issue is with xe_debugfs@gt (moved to 
igt@intel_sysfs_debugfs@xe-gt) which explicitly lists some of expected 
debugfs nodes. @Matthew  Do we need to keep xe_debugfs@gt test and 
replicate the explicit file list logic or 
igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries (reads all exposed 
debugfs entries) is sufficient ?

Tested-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

