Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B53A1125857
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 17:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195EF10E088;
	Wed, 11 Mar 2026 17:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVdCB+9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A7510E088
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773248817; x=1804784817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q2G4qOwMbGrxcu1z75cOleAftU3mTeKhBsiqQjVGRqQ=;
 b=fVdCB+9tbNjQ0xqutsXf5hiFvIH2RM6fXppL/yi/J6ZnyoyVnnkBAb0H
 GKLWXTfikCr/WMpXIFwRQdP98G/YjakQh3K7KZsKm+Py1D/u1nSwm8Zcm
 NHLFeZNP4RptA49+mAzI8kHpN5HEmEcMA1etn1lfhIerWw06LFRxjcYB+
 DK+O9mb4ZIeoyhYvJYdNpx1K1cdJ+7DaRq93aEzE7I2OP+K+S9YzLyEPr
 QOvsy92DE2x7v9kc92E552bJzyyoyAD9VQGpiNAYpyozEClwSWWgTbKHg
 eZ8D5YWnD5qeTxtewDc/Ni6KQGEI1oSEW4kWdlgjGIMiYuVR0k62Au6sh w==;
X-CSE-ConnectionGUID: bcW6cK5dSb6lOJZeTxuV8Q==
X-CSE-MsgGUID: twek6QdsSw6EUJUtnMHIvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73518909"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="73518909"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:06:55 -0700
X-CSE-ConnectionGUID: bWucIU35ROqbAXg9/tOZPA==
X-CSE-MsgGUID: H8CIXHWPSCKSUApBbbPM1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219672083"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.238])
 ([10.245.244.238])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:06:53 -0700
Message-ID: <deacdeab-051a-419b-ad95-24e70d9531e3@intel.com>
Date: Wed, 11 Mar 2026 17:06:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix missing runtime PM reference in ccs_mode_store
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260311165242.2355683-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260311165242.2355683-2-sanjay.kumar.yadav@intel.com>
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

On 11/03/2026 16:52, Sanjay Yadav wrote:
> ccs_mode_store() calls xe_gt_reset() which internally invokes
> xe_pm_runtime_get_noresume(). That function requires the caller
> to already hold an outer runtime PM reference and warns if none
> is held:
> 
>    [46.891177] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
>    [46.891178] WARNING: drivers/gpu/drm/xe/xe_pm.c:885 at
>    xe_pm_runtime_get_noresume+0x8b/0xc0
> 
> Fix this by wrapping xe_gt_reset() with xe_pm_runtime_get/put().
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7593
> Fixes: 480b358e7d8e ("drm/xe: Do not wake device during a GT reset")
> Cc: <stable@vger.kernel.org> # v6.19+
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Assuming CI is happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index b35be36b0eaa..f3b834a09a6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sysfs.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_pf.h"
>   
> @@ -163,7 +164,9 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>   	gt->ccs_mode = num_engines;
>   	xe_gt_record_user_engines(gt);
> +	xe_pm_runtime_get(xe);
>   	xe_gt_reset(gt);
> +	xe_pm_runtime_put(xe);
>   
>   	/* We may end PF lockdown once CCS mode is default again */
>   	if (gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))

