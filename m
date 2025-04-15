Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF6BC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 10:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021710E6FA;
	Tue, 15 Apr 2025 10:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWGZK2QR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9810E6FA
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744713174; x=1776249174;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NhLnFlUTICwsWEPiZpBfavSb6eBL9GL7sMIetE6CiG0=;
 b=VWGZK2QRO3gSHURlGzX5Qkcto0T4oqyyiBFyu/kI2+DT0YC+ivMUM3vw
 fXVr7NKPZ0QNZckLe1n5vvwACfoDQVAPBzJ0eGIZWwKg9ZY+nkgBlpcUc
 Mwz5sgN+S//bFkHMbDp6OqAday0oDYcIBCAQErJWbhyjWquJKC2E3V0IG
 fDmf1PT9InMkLAtn/43LbARxdITSZc5i+PhtXJWK1GhM2qVTBKHw0fhZy
 MHqbVTBtJHujJ+FAJW4bGt/BKa2uQFhJFApb/7K0hE0tZS9OzshaNZnxT
 87JRUxP7kD+4pZ1jgO1iifVT9WdBA6CL9Al53SpgzKzM3RX4lU2z9zY6h A==;
X-CSE-ConnectionGUID: cyNHFcZQRRyLm6+8NQI9+Q==
X-CSE-MsgGUID: oMquO0l5QHWqjeGGSjUKSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46345258"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46345258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:32:51 -0700
X-CSE-ConnectionGUID: 1s9bxFuASLWJnhTzXMzlWA==
X-CSE-MsgGUID: ZZC/SG39QVOgugWX/yK/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134937851"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 15 Apr 2025 03:32:49 -0700
Received: from [10.245.83.107] (unknown [10.245.83.107])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9584033E91;
 Tue, 15 Apr 2025 11:32:48 +0100 (IST)
Message-ID: <1b9c70d4-de69-4585-ad85-f61e72b72b55@intel.com>
Date: Tue, 15 Apr 2025 12:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250328102357.2391877-1-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250328102357.2391877-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 28.03.2025 11:23, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Currently, LMEM provisioning is fully dependent on LMTT, and we are
> unable to make useful LMEM provisioning without LMTT.
> Let's don't allow LMEM provisioning if LMTT is not available on the
> device.

maybe shorter:

"The LMEM provisioning is applicable only on platforms with LMTT.

> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 8 +++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 10be109bf357..265e58c55c6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1513,7 +1513,9 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  	int err;
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> -	if (vfid)
> +	if (!xe_device_has_lmtt(gt_to_xe(gt)))
> +		err = -EROFS;

do we need this? if there is no lmtt then we shouldn't use/expose lmem
configuration in the first place

maybe xe_gt_assert will be sufficient?

> +	else if (vfid)
>  		err = pf_provision_vf_lmem(gt, vfid, size);
>  	else
>  		err = pf_set_spare_lmem(gt, size);
> @@ -1621,7 +1623,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  	xe_gt_assert(gt, num_vfs);
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>  
> -	if (!IS_DGFX(gt_to_xe(gt)))
> +	if (!xe_device_has_lmtt(gt_to_xe(gt)))
>  		return 0;
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> @@ -2155,7 +2157,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	valid_all = valid_all && valid_ggtt;
>  	valid_any = valid_any || (valid_ggtt && is_primary);
>  
> -	if (IS_DGFX(xe)) {
> +	if (xe_device_has_lmtt(xe)) {
>  		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);
>  
>  		valid_any = valid_any || (valid_lmem && is_primary);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index b2521dd6ec42..5f41381df860 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -286,7 +286,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>  	if (!xe_gt_is_media_type(gt)) {
>  		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>  					   0644, parent, parent, &ggtt_fops);
> -		if (IS_DGFX(gt_to_xe(gt)))
> +		if (xe_device_has_lmtt(gt_to_xe(gt)))
>  			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
>  						   0644, parent, parent, &lmem_fops);
>  	}

btw, this needs to be rebased and take into account the pf_lmem_info
attributes introduced recently


