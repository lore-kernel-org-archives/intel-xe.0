Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3048C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 09:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6669410E07F;
	Mon, 14 Apr 2025 09:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idrTUSjq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94C10E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744622017; x=1776158017;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kMbnqBvMtil4VTffItRuRngYeGARqEu6NLe5EbTLzIs=;
 b=idrTUSjqEm47Mx8umCkT+JWgpxbdglNg49XfM6+3WQfJLs3DQHv71tci
 tUcyBf1caKO5xH4bfko1bXtrvLXklXwgD8aGKKFIde71g11A7mf7rJRmS
 YkbVhrVGUYZQlmnljSvPd0JN5XVEyLm6IHPBUpddaC409xq9sJeEJayKL
 aZVLf2gsWs53dvgU25zK5D7cKA+WvkF1f+VYkULn1eNITtnifnGCpXHR8
 luzUf7SDuTbwfxsJbuI35bUrpT9KZ93PRDNz5ty/CG8zx4SB4QjONwtxP
 jK315l2r4en1NqQSrEKXlw2NM8BFJW6eKZQnahsd9clV+4kjEpJ/PmDHd w==;
X-CSE-ConnectionGUID: h9C1+fFRRXuGefNOCCBpOQ==
X-CSE-MsgGUID: 9n4CNhfKR0ynLwbDz53uaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56727385"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="56727385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 02:13:36 -0700
X-CSE-ConnectionGUID: myFqoco/Sv6mhJiTsnpUGA==
X-CSE-MsgGUID: RjoOfU23R26ier37W8Omfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="130091105"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.165])
 ([10.245.80.165])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 02:13:35 -0700
Message-ID: <8b12a377-b4f3-4184-82ad-96885d384e2a@linux.intel.com>
Date: Mon, 14 Apr 2025 11:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Don't show GGTT/LMEM debugfs files under media
 GT
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250411193030.1865-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250411193030.1865-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 4/11/2025 9:30 PM, Michal Wajdeczko wrote:
> Most of the PF's debugfs files (and their implementations) are
> based on the GT hierarchy even if files are related to GGTT or
> LMEM data, that are related to the tile.
> 
> While we could reach the tile data from any GT, to avoid potential
> misuse, some functions allow to be used on the primary GT only,
> and may use asserts to enforce that.
> 
> In our case, the following assert could be seen when reading the
> /sys/kernel/debug/dri/0000:00:02.0/gt1/pf/ggtt_available
> 
>   [ ] xe 0000:00:02.0: [drm] Assertion `!xe_gt_is_media_type(gt)` failed!
>   [ ] WARNING: CPU: 4 PID: 10609 at drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:379 pf_get_spare_ggtt+0x256/0x4e0 [xe]
>   [ ] RIP: 0010:pf_get_spare_ggtt+0x256/0x4e0 [xe]
>   [ ] Call Trace:
>   [ ]  <TASK>
>   [ ]  xe_gt_sriov_pf_config_print_available_ggtt+0xb7/0x480 [xe]
>   [ ]  ? __memcg_slab_post_alloc_hook+0x12f/0x3f0
>   [ ]  xe_gt_debugfs_simple_show+0x7b/0xb0 [xe]
>   [ ]  ? __pfx___drm_printfn_seq_file+0x10/0x10
>   [ ]  ? __pfx___drm_puts_seq_file+0x10/0x10
>   [ ]  seq_read_iter+0x139/0x4e0
>   [ ]  seq_read+0x11d/0x160
>   [ ]  full_proxy_read+0x6b/0xb0
>   [ ]  vfs_read+0xfa/0x390
> 
> Fix that by moving GGTT/LMEM debugfs attributes to separate lists
> and register them only when applicable (on primary GT, on DGFX).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 66 +++++++++++++++------
>   1 file changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index b2521dd6ec42..0fe47f41b63c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -51,26 +51,17 @@ static unsigned int extract_vfid(struct dentry *d)
>    *      /sys/kernel/debug/dri/0/
>    *      ├── gt0
>    *      │   ├── pf
> - *      │   │   ├── ggtt_available
> - *      │   │   ├── ggtt_provisioned
>    *      │   │   ├── contexts_provisioned
>    *      │   │   ├── doorbells_provisioned
>    *      │   │   ├── runtime_registers
>    *      │   │   ├── negotiated_versions
>    *      │   │   ├── adverse_events
> + *      ├── gt1
> + *      │   ├── pf
> + *      │   │   ├── ...
>    */
>   
>   static const struct drm_info_list pf_info[] = {
> -	{
> -		"ggtt_available",
> -		.show = xe_gt_debugfs_simple_show,
> -		.data = xe_gt_sriov_pf_config_print_available_ggtt,
> -	},
> -	{
> -		"ggtt_provisioned",
> -		.show = xe_gt_debugfs_simple_show,
> -		.data = xe_gt_sriov_pf_config_print_ggtt,
> -	},
>   	{
>   		"contexts_provisioned",
>   		.show = xe_gt_debugfs_simple_show,
> @@ -81,11 +72,6 @@ static const struct drm_info_list pf_info[] = {
>   		.show = xe_gt_debugfs_simple_show,
>   		.data = xe_gt_sriov_pf_config_print_dbs,
>   	},
> -	{
> -		"lmem_provisioned",
> -		.show = xe_gt_debugfs_simple_show,
> -		.data = xe_gt_sriov_pf_config_print_lmem,
> -	},
>   	{
>   		"runtime_registers",
>   		.show = xe_gt_debugfs_simple_show,
> @@ -103,6 +89,42 @@ static const struct drm_info_list pf_info[] = {
>   	},
>   };
>   
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── ggtt_available
> + *      │   │   ├── ggtt_provisioned
> + */
> +
> +static const struct drm_info_list pf_ggtt_info[] = {
> +	{
> +		"ggtt_available",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_available_ggtt,
> +	},
> +	{
> +		"ggtt_provisioned",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_ggtt,
> +	},
> +};
> +
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── lmem_provisioned
> + */
> +
> +static const struct drm_info_list pf_lmem_info[] = {
> +	{
> +		"lmem_provisioned",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_lmem,
> +	},
> +};
> +
>   /*
>    *      /sys/kernel/debug/dri/0/
>    *      ├── gt0
> @@ -532,6 +554,16 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>   	pfdentry->d_inode->i_private = gt;
>   
>   	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
> +	if (!xe_gt_is_media_type(gt)) {
> +		drm_debugfs_create_files(pf_ggtt_info,
> +					 ARRAY_SIZE(pf_ggtt_info),
> +					 pfdentry, minor);
> +		if (IS_DGFX(gt_to_xe(gt)))
> +			drm_debugfs_create_files(pf_lmem_info,
> +						 ARRAY_SIZE(pf_lmem_info),
> +						 pfdentry, minor);
> +	}
> +
>   	pf_add_policy_attrs(gt, pfdentry);
>   	pf_add_config_attrs(gt, pfdentry, PFID);
>   
LGTM,
Tested with igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.

Tested-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

