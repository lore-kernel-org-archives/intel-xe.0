Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CE1CE7B08
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 13:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9027010E23F;
	Fri, 14 Nov 2025 13:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0w57C0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC7810E23F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763125296; x=1794661296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1oGWew/XsOSCevldnzh7L3LVELd9lnQ6Qpo9Ol6zmBM=;
 b=e0w57C0qOnFvfDLHbn+Wng0LIRRP+EDkpdJlZI9rzs/Ufr9yRyNEdI7u
 znunv23+ZHOfi9SCcE60OBYVRdvHiWfIqh6aheKFxhrzKrzlnuyDVTFJA
 bYXCpARETvHdaYZerEB9x1BDxFHJIu9vcdMKJ8D4JxSX69jv8ntgpGsuc
 AcYTgX2bqxEOBDJZb5/9tSE+SFa0WxbrpmSDZSEFzH9YmHmiY7t0Je55x
 2wFVB0PFhgGGcrkQ7nudUTOG/l+pC97JC39xmYqjeX0x82BUhrAGQrNkf
 kBDNH690hJghKCl1c/MUuYz/VHmdBVWg0WNlOgW991gclS40SFn+uNjJj g==;
X-CSE-ConnectionGUID: BwrGGTIRQSGHzOd8vxXaxg==
X-CSE-MsgGUID: FkGvCFamTOiGKyIPm+A5CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65121396"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="65121396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:01:36 -0800
X-CSE-ConnectionGUID: u+Si/DFdSECqRRIU4JKZtQ==
X-CSE-MsgGUID: IN570sFCSLq6GkrizVuyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189618701"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.26])
 ([10.245.244.26])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:01:34 -0800
Message-ID: <7cf16582-f64e-47ce-83f4-958d821c40fa@intel.com>
Date: Fri, 14 Nov 2025 13:01:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Check for fence error on VRAM save/restore
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20251114122339.1791026-1-michal.winiarski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251114122339.1791026-1-michal.winiarski@intel.com>
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

On 14/11/2025 12:23, Michał Winiarski wrote:
> The code incorrectly assumes that the VRAM save/restore fence is valid.
> Fix it by checking for error.
> 
> Fixes: 49cf1b9b609fe ("drm/xe/pf: Handle VRAM migration data as part of PF control")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 6deb4835eb44f..037d48159dc87 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -572,6 +572,11 @@ static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
>   	fence = __pf_save_restore_vram(gt, vfid,
>   				       src_vram, src_vram_offset,
>   				       data->bo, 0, size, true);
> +	if (IS_ERR(fence)) {
> +		ret = PTR_ERR(fence);
> +		goto fail;
> +	}
> +
>   
>   	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
>   	dma_fence_put(fence);
> @@ -655,6 +660,11 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
>   
>   	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
>   				       data->bo, 0, data->hdr.size, false);
> +	if (IS_ERR(fence)) {
> +		ret = PTR_ERR(fence);
> +		goto err;
> +	}
> +
>   	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
>   	dma_fence_put(fence);
>   	if (!ret) {

