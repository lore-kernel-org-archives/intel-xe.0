Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52530CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1067F10E3B2;
	Mon, 29 Sep 2025 08:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLyVO3R3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACA310E3B2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759133587; x=1790669587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tRaAc/OSqSnY1GNTNrVgUPvio+D4ACElS+VfoYg+Sl4=;
 b=cLyVO3R39fKrl9T6ZQfjnDl04QwjXaw7vsgJwSJXd4HY3OZmVeaAVYXx
 eMYRUr9kFMooWfhDacKqygiYYo/Dj/axe+UclYp4THYmstzNWq5i3t9kr
 pdIUBOd4wJSX7nWrimwNIpxrnImYDv/gjOwfmwpOZJ1OXUphhCVD1fqor
 LdJpWPksjGLD7qyWjDu5vp2CBEjsfDxW1+1MfGYx63E886F6WaZodKRHF
 +trarRXe2MoodUsjLojvj1lE89pzVyr2iMJQ+dnauG9Ai/kQk6WIMWtiE
 wPGWiqmNaKsPIpRQJywIQ8inqkXMPsCbbnE0/qXfTH3fqXQ8oRpEnkrgC w==;
X-CSE-ConnectionGUID: tll9190jR4mFwXkQuDh6YA==
X-CSE-MsgGUID: 6+k6v9MJR+OZzOIu1ODGGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72050415"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72050415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:13:07 -0700
X-CSE-ConnectionGUID: Sm9xbUWHTpaKYU7QvWYTzQ==
X-CSE-MsgGUID: LTDf7AjaQlqtQ9ix2R5h9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177770868"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:13:06 -0700
Date: Mon, 29 Sep 2025 11:13:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 02/36] drm/xe/vf: Lock querying GGTT config during
 driver init
Message-ID: <aNo_jwo80N-3WEDv@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929025542.1486303-3-matthew.brost@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Sun, Sep 28, 2025 at 07:55:08PM -0700, Matthew Brost wrote:
> From: Tomasz Lis <tomasz.lis@intel.com>
> 
> Protect access to GGTT config as this is non-static information.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>  3 files changed, 84 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..016c867e5e2b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->ggtt_size && config->ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>  				size / SZ_1K, config->ggtt_size / SZ_1K);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	config->ggtt_shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
> +	err = config->ggtt_size ? 0 : -ENODATA;
>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->lmem_size && config->lmem_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>  				size / SZ_1M, config->lmem_size / SZ_1M);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>  
>  	config->lmem_size = size;
> +	err = config->lmem_size ? 0 : -ENODATA;
>  
> -	return config->lmem_size ? 0 : -ENODATA;
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static int vf_get_submission_cfg(struct xe_gt *gt)
> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	err = config->num_ctxs ? 0 : -ENODATA;
> +
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)
> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   */
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u16 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>  
> -	return gt->sriov.vf.self_config.num_ctxs;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->num_ctxs);
> +	val = config->num_ctxs;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>  
> -	return gt->sriov.vf.self_config.lmem_size;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->lmem_size);
> +	val = config->lmem_size;
> +	up_read(&config->lock);

Why is someone mutating this sort of information at runtime?
Sounds pretty crazy to me.

-- 
Ville Syrjälä
Intel
