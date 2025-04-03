Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC97C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D6A10E004;
	Thu,  3 Apr 2025 10:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7sNdT4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DA810E004
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743677808; x=1775213808;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Uisi5bTeBiCwaDkJqsUa4US1VO0FSkK/Z//dmQ7RBNM=;
 b=I7sNdT4TbrMO0OVFyBR+txOJGjThKFa9Tpbv9pRDqsTmYsQUUQE/+h47
 F2u3T9fShDSL4MfwdbmLilJqUtdjgT2qEy4dxwkTbmtPOP0BQL2JAuR4B
 Xx8ly8W0ElmZkUeMt+gb5U6NdMK3iJwgiI9wPauJgDbXSCVvKwQAKpLDY
 a0PChw0XhwkluRzFeAfbPDJL5NUbrsHFKt5tzExgW1FkjyC+iLFNi3VVY
 cBwEK7bmQrZgzxaDUjdse6MTZvWBJHQpw751jPYd6SqN2k+7dt+CpeCVd
 lGuKd7p6RHDuNmAumanqbju7KZarF+2L7GKKsDWyDF9XTUwKT4r1MKJ2Y w==;
X-CSE-ConnectionGUID: o6vrXoKcTFSwemOxv0WTGQ==
X-CSE-MsgGUID: OFWGewsHTi2EYNq4mkzIcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56444806"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56444806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:56:48 -0700
X-CSE-ConnectionGUID: w9wdn2nDSRqUI4yTbZiVNw==
X-CSE-MsgGUID: 43sSeQttReuZlUfn4sdCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131691886"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2025 03:56:47 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5684632CA9;
 Thu,  3 Apr 2025 11:56:45 +0100 (IST)
Message-ID: <3db59050-da84-4d82-8d09-b610397eda91@intel.com>
Date: Thu, 3 Apr 2025 12:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't support changing GuC reset policy
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
 <20250403094141.25941-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403094141.25941-2-lukasz.laguna@intel.com>
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



On 03.04.2025 11:41, Lukasz Laguna wrote:
> VF can't change GuC reset policy. Ensure the driver does not attempt to
> do so by adding an assertion.

none of xe_guc_ads() functions are applicable for the VFs by definition,
since GuC ADS is purely a PF/native responsibility

why do we want to assert just one of these function?

it should either fail (due to use of the privileged H2G action) or crash
(due to use of previously uninitialized structures)

I'm not sure that we want to annotate/pollute all privileged parts of
the driver with !IS_SRIOV_VF asserts

> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index bee4e0cfe7b8..2ea07d28728e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -990,6 +990,8 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	struct xe_bo *bo;
>  	int ret = 0;
>  
> +	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
> +
>  	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>  	if (!policies)
>  		return -ENOMEM;

