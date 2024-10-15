Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595A1D1D87B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E58810E5A9;
	Tue, 15 Oct 2024 15:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqLPmJhF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CA710E5A9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006108; x=1760542108;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U2TyZdzC0oyMMiBXBDbbwNj4INTd/ZAOKo+wVhEpIBs=;
 b=aqLPmJhFFF8CLsWBhVkUGBRTnK8sGvyO7RAbG9vioxRBwSIYVe+tV3o6
 E32O16NApN+pNd2ced4Lng403tHDzS/HWgQTqbWUeHkeepPnML1NFxZcl
 5duP0HEk62HPQ1yHP+0ctehFXidk2/04MsZfbPRtm2emt6+GN7LPD+BAu
 8vux+vHwdcWD5+RJyb+OQPb1beYl0YJHhF98B5xfL7dHSDuSeiK5jbHA8
 UYlLuprEqaWPL/AASZ3iAOsFmJf55ViboF5z5BmBSZS/FTha3r9/IHzv4
 SjScUgb3MIwRgbRp+Sx0lNPNRCTe0BdpQoJpRGZeqRRjYxwjush9MCyhy w==;
X-CSE-ConnectionGUID: R4/qFjS0RBKj8kMSJs2QUQ==
X-CSE-MsgGUID: 6Fh952cMQqqnsVs+N5uQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28363094"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28363094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:28:27 -0700
X-CSE-ConnectionGUID: Q2+ebecjSCatLq5lLkeK3w==
X-CSE-MsgGUID: 1xHLGckhRZO30zZrOEB/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78286291"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:28:25 -0700
Message-ID: <dace76e2-3203-42ab-bd06-dd9925b1f7ca@linux.intel.com>
Date: Tue, 15 Oct 2024 17:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/26] drm/xe/pat: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-20-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-20-himal.prasad.ghimiray@intel.com>
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> - don't use xe_assert() to report HW errors (Michal)
>
> v5
> - return unsigned int from xe_force_wake_get()
> - remove redundant warns
>
> v7
> - Fix commit message
> - Remove redundant header
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 65 +++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index b16473818173..30fdbdb9341e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -182,11 +182,12 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>  static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -198,9 +199,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  static const struct xe_pat_ops xelp_pat_ops = {
> @@ -211,11 +210,12 @@ static const struct xe_pat_ops xelp_pat_ops = {
>  static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -229,9 +229,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  static const struct xe_pat_ops xehp_pat_ops = {
> @@ -242,11 +240,12 @@ static const struct xe_pat_ops xehp_pat_ops = {
>  static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -258,9 +257,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  static const struct xe_pat_ops xehpc_pat_ops = {
> @@ -271,11 +268,12 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>  static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -292,9 +290,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  /*
> @@ -330,12 +326,13 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>  static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
>  	u32 pat;
> +	int i;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>  
>  	drm_printf(p, "PAT table:\n");
>  
> @@ -374,9 +371,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		   REG_FIELD_GET(XE2_COH_MODE, pat),
>  		   pat);
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  static const struct xe_pat_ops xe2_pat_ops = {
