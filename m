Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47112CFC277
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0296C10E598;
	Tue, 15 Oct 2024 15:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoW0euJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C8310E598
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729004976; x=1760540976;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1FFwmykFIwfWxgcslXKq+L1PKrmztIZ2cZ77u9gt5tg=;
 b=GoW0euJWs/hczG+1dcxCsmEny9j0AWyouMsPfLOWkjeeaPd8eRxPtE6p
 qO7rakbhix15puhOoGKvj9HLKf1toMmvmRRX9Q69kmO6oOwgs03r0j6Bs
 K04M3Ey+dWzn17e4iPcF268+9AalmiqXleWn+UWV5xM3/PqBHgeoaWEvI
 wFkUeKsr3Bdl0dwV+z+fiyp08dxjXHS1VzYda54gnC/c4x9yV6fa1amww
 fRY3UrJqYNc/JkgtzzJvT7Z18VKleKPnc55ux9nv0efpkARtzni9sLA6f
 Ym9tn80I/TG77FLc5KnQmwDXtzOQaIHfA8Z44mu9n21j4jG3fpDbANpIH A==;
X-CSE-ConnectionGUID: EDQ/krojRaGKuWvlvWfOdg==
X-CSE-MsgGUID: p0Mj3vl1TSaWEYGrE7CA+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45880720"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45880720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:09:22 -0700
X-CSE-ConnectionGUID: VhIikgp5S+6JbFoA1O6fhQ==
X-CSE-MsgGUID: 8W7F7z3dTvCQWFAnrVvYWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108702606"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:09:20 -0700
Message-ID: <0b7ddf1c-98d0-4ef2-9510-53f1d1788cbd@linux.intel.com>
Date: Tue, 15 Oct 2024 17:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/26] drm/xe/mocs: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-14-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-14-himal.prasad.ghimiray@intel.com>
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
> - don't use xe_assert() to report HW errors (Michal)
>
> v5
> - return unsigned int from xe_force_wake_get()
> - Remove redundant warn
>
> v7
> - Fix commit message
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <Nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 231d0e86ed83..54d199b5cfb2 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -774,25 +774,21 @@ void xe_mocs_init(struct xe_gt *gt)
>  
>  void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	struct xe_mocs_info table;
> -	unsigned int flags;
> -	u32 ret;
>  	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_mocs_info table;
> +	unsigned int fw_ref, flags;
>  
>  	flags = get_mocs_settings(xe, &table);
>  
>  	xe_pm_runtime_get_noresume(xe);
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -
> -	if (ret)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>  		goto err_fw;
>  
>  	table.ops->dump(&table, flags, gt, p);
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  err_fw:
> -	xe_assert(xe, !ret);
>  	xe_pm_runtime_put(xe);
>  }
>  
