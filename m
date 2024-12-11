Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD38E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 09:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88D10E037;
	Wed, 11 Dec 2024 09:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By/kCOJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F75410E037
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733909475; x=1765445475;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lNi/VDxMxrF3Y32rILhAMh5UY56dlmOZzuAf+hZxbQs=;
 b=By/kCOJotkkDjGxqAXXKKAtumAY3WQhrzlgsF9DseqO4KQpagEwUbx6E
 P4OnQpm0VYp6CB6bt4FNtZW16UT1Cy+OGeARQ6S54VVuIvVkRFJzM/1Rv
 rMRzR7SwFPOXaxH+SNYXtIr2vOVdE2+7cEqlIxsnHaUK/xqusl80LISR8
 /ryGaQ+fF48+RytHHI2bys+1RQgQCUgP+NYesEpD8aGVm3TV55XlDdYZw
 YqizlDgHy955Hl6Iw7kGvkAQspd8lkte2i0uvbXsMntRm8ufdWCxCvzUS
 AUtr/s8UU2s9rWxSg/ztH+ZcoA/vuHd+RoFqusL4UH2X/HxJ6wqs/jxVo g==;
X-CSE-ConnectionGUID: zsM4mpy+QxS4Yhn2eiteEg==
X-CSE-MsgGUID: ui30Q4j1TNGySNJjY1h0mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37116132"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="37116132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:31:14 -0800
X-CSE-ConnectionGUID: 2mhF95S3QHaGigmmzXw1gA==
X-CSE-MsgGUID: rBFOoKKPRU64iIAJ1JGJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95599330"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.44])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:31:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, intel-xe@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 1/1] drm/i915/dsc: Expose dsc sink max slice count via
 debugfs
In-Reply-To: <20241210164252.2118155-2-swati2.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241210164252.2118155-1-swati2.sharma@intel.com>
 <20241210164252.2118155-2-swati2.sharma@intel.com>
Date: Wed, 11 Dec 2024 11:31:09 +0200
Message-ID: <87y10my3aa.fsf@intel.com>
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

On Tue, 10 Dec 2024, Swati Sharma <swati2.sharma@intel.com> wrote:
> Expose dsc sink max slice count via i915_dsc_fec_support debugfs.
> This debugfs entry is required in cases, where sink doesn't support
> minimum of 8 slices in case of ultrajoiner and minimum of 4 slices
> in case of big joiner.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3eb7565cd83c..4823d27cafb5 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1013,6 +1013,12 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
>  								      DP_DSC_YCbCr444)));
>  		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
>  			   drm_dp_dsc_sink_bpp_incr(connector->dp.dsc_dpcd));
> +		if (intel_dp_is_edp(intel_dp))
> +			seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
> +				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), true));
> +		else
> +			seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
> +				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), false));

Maybe just use intel_dp_is_edp() as the parameter to
drm_dp_dsc_sink_max_slice_count() instead of duplicating the whole
statement?

BR,
Jani.


>  		seq_printf(m, "Force_DSC_Enable: %s\n",
>  			   str_yes_no(intel_dp->force_dsc_en));
>  		if (!intel_dp_is_edp(intel_dp))

-- 
Jani Nikula, Intel
