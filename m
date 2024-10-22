Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0364D1CDDC
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 11:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65510E314;
	Tue, 22 Oct 2024 11:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fx+JCgdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543F910E314
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729594903; x=1761130903;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hsz742iN596WH2xQuT5v822kfguVjWjtXlJNM9Tm70A=;
 b=Fx+JCgdpjCDKYv5gFl1ZnrxYIGKwmMvlCDXkTz3p5MOAtGWAcEBmQNro
 JuajuB/WgiPxN0nvPv229D2ppq09D11lPfJ/qrBqRXFB0aEWNpHtVT1Ho
 0IWyLT43FIbYkma8owCU3lim78RhRqsEiGe9e2q/7iBmQi1I8iL32LjPc
 jxsikoJFTAIvTq9Qg/KU9sVRURl4I4Q/PnpdC8nRZrM31SKWn0Vmlmuxh
 aKN6uN7xK1EJMuC19JEj773Qy4adwIPK0bzkeXTyY1ZxbFIAEOMKeY2IE
 0p3LdikIH1OsLtdr+OwuluD8vVIB8lamDBhcXVNO5cUvinjqYuDkPsN/s A==;
X-CSE-ConnectionGUID: ZtjZh9KjThWfGIePr9j7SA==
X-CSE-MsgGUID: kTyHW6RaQOCnvv+yp6U8hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39741627"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="39741627"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 04:01:43 -0700
X-CSE-ConnectionGUID: hV5awYgDTYKrYuny+bcVBg==
X-CSE-MsgGUID: HcPwrDI6SnqF4fmx7ZsGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84918116"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.100.141])
 ([10.245.100.141])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 04:01:42 -0700
Message-ID: <a8e41cc6-e54a-48b1-968b-64bd0245f662@linux.intel.com>
Date: Tue, 22 Oct 2024 13:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Show VFs LMEM provisioning summary over debugfs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20241021201506.1771-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241021201506.1771-1-michal.wajdeczko@intel.com>
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



On 10/21/2024 10:15 PM, Michal Wajdeczko wrote:
> While we can already view individual VF LMEM provisioning using
> lmem_quota debugfs attribute, we want to have unified way to show
> summary across all VFs, like we do for GGTT or GuC doorbells/IDs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 35 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |  1 +
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  5 +++
>   3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index a863e50b756e..062a0c2fd2cd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2376,6 +2376,41 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +/**
> + * xe_gt_sriov_pf_config_print_lmem - Print LMEM configurations.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Print LMEM allocations across all VFs.
> + * VFs without LMEM allocation are skipped.
> + *
> + * This function can only be called on PF.
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_print_lmem(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> +	const struct xe_gt_sriov_config *config;
> +	char buf[10];
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		config = &gt->sriov.pf.vfs[n].config;
> +		if (!config->lmem_obj)
> +			continue;
> +
> +		string_get_size(config->lmem_obj->size, 1, STRING_UNITS_2,
> +				buf, sizeof(buf));
> +		drm_printf(p, "VF%u:\t%zu\t(%s)\n",
> +			   n, config->lmem_obj->size, buf);
> +	}
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	return 0;
> +}
> +
>   /**
>    * xe_gt_sriov_pf_config_print_available_ggtt - Print available GGTT ranges.
>    * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index b74ec38baa18..0c55aa40a1a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -65,6 +65,7 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
>   int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
>   int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
>   int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_sriov_pf_config_print_lmem(struct xe_gt *gt, struct drm_printer *p);
>   
>   int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p);
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 91fc42e386d8..05df4ab3514b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -81,6 +81,11 @@ static const struct drm_info_list pf_info[] = {
>   		.show = xe_gt_debugfs_simple_show,
>   		.data = xe_gt_sriov_pf_config_print_dbs,
>   	},
> +	{
> +		"lmem_provisioned",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_lmem,
> +	},

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   	{
>   		"runtime_registers",
>   		.show = xe_gt_debugfs_simple_show,

