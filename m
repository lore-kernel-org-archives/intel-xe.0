Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E7C27C75
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 10:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D556E10E1B0;
	Wed, 12 Jun 2024 10:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GarGfval";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C3610E83A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718187330; x=1749723330;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z6qM9sIYiFnF03+j6mr6J9MbZ5hm8gKni1y0uXR4NiY=;
 b=GarGfvalDdAsrxGcev7EZP1RAtDBFX3Sq/nQXz27kAQSZs9e2y4h8w2r
 iu9eDcDLNY5i6etIIph3sf9dtVVTePEmSDjU9mblWyOKKZI3ynn+vDaMy
 yWMdnpjKzRkjfWsqzWDmbO4K/uhR/EKhvNTCPTuLKmBAgqSdJSYSHBwjW
 bmuZw+b8k55dn4jTqTx0c4BQGceCwPytdeatg6NbWcZTRaLKwiVjURG7L
 9hMUO/m6fEW8ykmpShyqKswiE78YDupbYQuSb/pFuqfMN05SYNHgHVr7M
 bGHf5Z3mFs2CN82/ycfazPhxgjxl5zV7IyLYTTeunH/82/oL+tiHxnWlN g==;
X-CSE-ConnectionGUID: QsSwWPxoQDGoWJlXFrqDzQ==
X-CSE-MsgGUID: F1aT0sVETr2KAByKGlcmEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14783965"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14783965"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:15:19 -0700
X-CSE-ConnectionGUID: 8UvS1815SfulHI68KuZuzQ==
X-CSE-MsgGUID: y7+UYhJlTlunpSu7O9tidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="44682800"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.192])
 ([10.94.248.192])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:15:17 -0700
Message-ID: <b8cc4a30-c336-479f-a8fa-40c7b82d6751@linux.intel.com>
Date: Wed, 12 Jun 2024 12:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/vf: Ignore force-wake requests if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-6-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240611163537.1944-6-michal.wajdeczko@intel.com>
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


On 6/11/2024 6:35 PM, Michal Wajdeczko wrote:
> The control and ack force-wake registers are not accessible for
> the VF drivers. To avoid changing existing code logic that tracks
> woken domains, simply ignore all attempts to access control or ack
> registers if we are running as a VF driver.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 468aabd72d6b..5db6926120c3 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
>   #include "xe_mmio.h"
> +#include "xe_sriov.h"
>   
>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>   
> @@ -96,6 +97,9 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   
>   static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
>   {
> +	if (IS_SRIOV(gt_to_xe(gt)))
> +		return;
> +
>   	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
>   }
>   
> @@ -104,6 +108,9 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>   	u32 value;
>   	int ret;
>   
> +	if (IS_SRIOV(gt_to_xe(gt)))
> +		return 0;
> +
>   	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
>   			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>   			     &value, true);
