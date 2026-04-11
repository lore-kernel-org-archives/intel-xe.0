Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809EDF45A19
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 07:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2352E10E1A9;
	Sat, 11 Apr 2026 07:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak3zZaZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D1810E1A9
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775894324; x=1807430324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IOVmUUiejX8TSx2QZ1MtRaix0T/bkK2x+MaiplzKhIg=;
 b=ak3zZaZ5mCWcikC98UzVHKOZIhDDNI0AuaXDpVrIjf6ykaLvMPV2SXKa
 N8Gw09DDFhhnZ/rUQTe1f2FyPtjGyXeoT5LFNDGoFrXq6NmvfHqyj7fIv
 PTVkhEESU+iFdBtGkbhaKrgplTeSfT1gjE/aBS1hvCskAa2M0HCWD/W58
 bH9ilwou9tsypVwCsDR0MlbSZpSJ3d/80yp0VBo9vH0lmhMpCZXvusQrq
 cB/LXpuLbjncZgod8CEVYNX/8tjfUqcswnWK7ft9Or7yGLMhCzU95RcVN
 bihrOLF4F1XE+rhZDqU4yV1Qj+rspRfEf89EM8Kwc8REyCcqArknOkWId Q==;
X-CSE-ConnectionGUID: cOYtDh11T8GI3gNrFt99fw==
X-CSE-MsgGUID: qhwHho5QTpCXmhMpWcHepQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87602791"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="87602791"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 00:58:43 -0700
X-CSE-ConnectionGUID: QpAf9kgzQFi6udVbeBtTSg==
X-CSE-MsgGUID: 10E9qubqTWGlQyL8B+Q3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="234291365"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 00:58:43 -0700
Date: Sat, 11 Apr 2026 09:58:39 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
Message-ID: <adn_L4KnqJEYUSvH@black.igk.intel.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-3-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407225913.3397059-3-shuicheng.lin@intel.com>
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

On Tue, Apr 07, 2026 at 10:59:13PM +0000, Shuicheng Lin wrote:
> - Fix long line in cleanup_node_param() signature.
> - Drop unnecessary const on pass-by-value enum parameters.
> - Simplify xe_drm_ras_init() by removing redundant local variable
>   and redundant error path.
> 
> No functional change.

So why is this change needed?

Raag

> Cc: Riana Tauro <riana.tauro@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 802e4bcb731c..9cddad2be549 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -68,7 +68,7 @@ static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *x
>  }
>  
>  static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
> -			      const enum drm_xe_ras_error_severity severity)
> +			      enum drm_xe_ras_error_severity severity)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_drm_ras *ras = &xe->ras;
> @@ -109,7 +109,8 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>  	return ret;
>  }
>  
> -static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
> +static void cleanup_node_param(struct xe_drm_ras *ras,
> +			       enum drm_xe_ras_error_severity severity)
>  {
>  	struct drm_ras_node *node = &ras->node[severity];
>  
> @@ -174,15 +175,13 @@ static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
>  int xe_drm_ras_init(struct xe_device *xe)
>  {
>  	struct xe_drm_ras *ras = &xe->ras;
> -	struct drm_ras_node *node;
>  	int err;
>  
> -	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
> -	if (!node)
> +	ras->node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX,
> +				 sizeof(*ras->node), GFP_KERNEL);
> +	if (!ras->node)
>  		return -ENOMEM;
>  
> -	ras->node = node;
> -
>  	err = register_nodes(xe);
>  	if (err) {
>  		drm_err(&xe->drm, "Failed to register DRM RAS nodes (%pe)\n", ERR_PTR(err));
> @@ -190,10 +189,8 @@ int xe_drm_ras_init(struct xe_device *xe)
>  	}
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_drm_ras_unregister_nodes, xe);
> -	if (err) {
> +	if (err)
>  		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS (%pe)\n", ERR_PTR(err));
> -		return err;
> -	}
>  
> -	return 0;
> +	return err;
>  }
> -- 
> 2.43.0
> 
