Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FA8CE7AAB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 11:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881E210E23B;
	Fri, 14 Nov 2025 11:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2fZZYBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C9410E23B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763118321; x=1794654321;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qf8yGgYY9s2z6d2Qr3KqB5F0cjeLHFLW3HQshnNHkh0=;
 b=V2fZZYBDwlc92jg7hm2PkveesXiGx2pLL9OlBJLbCXS82of5E7tF1HpU
 VMllgcrtXUOkr0seB6qOReK3ZzCBJOwhjJwuVTe2pZ69gSBTgX69yl1Gf
 kr4p++3oQleCH2YmD2YcCN6XwUBluwDLVyZhEgiLIO27re6eLKFumzn6y
 qLP22HBkiBHZsi0v74HRK90t2cB+qMjmEVLyo65jr4ZmCwoCT6srTiEc/
 iZ0cB6p/puStyu60eXpmocJFbP1g3s0QhPV9lcmwU+glxEyUEyzHyZPcW
 XokkEGUNmuN2eDX19exXtjnqOOBYCh3mMKdSAexfOepQIbKz7MiQWu48w g==;
X-CSE-ConnectionGUID: 2W/9pcwORBiir1kW+1NoPQ==
X-CSE-MsgGUID: 4u8UFuwRSPilJ/KmuxVLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64418008"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="64418008"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 03:05:21 -0800
X-CSE-ConnectionGUID: 9bxz2E0bR26Hzuj8eDtySA==
X-CSE-MsgGUID: ujFlZjs/RU+Ru+OTOcqnnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189585615"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.26])
 ([10.245.244.26])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 03:05:19 -0800
Message-ID: <1a15457f-4197-4955-aa25-0629f795ca83@intel.com>
Date: Fri, 14 Nov 2025 11:05:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Drop the VF VRAM BO reference on successful
 restore
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
References: <20251114100713.1776073-1-michal.winiarski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251114100713.1776073-1-michal.winiarski@intel.com>
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

On 14/11/2025 10:07, Michał Winiarski wrote:
> The reference is only dropped on error. Fix it by adding the missing
> xe_bo_put().

It also looks like pf_restore_vf_vram_mig_data() incorrectly assumes the 
fence can never be an err ptr?

> 
> Fixes: 49cf1b9b609fe ("drm/xe/pf: Handle VRAM migration data as part of PF control")
> Reported-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 78f7b842fc624..6deb4835eb44f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -662,6 +662,8 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
>   		goto err;
>   	}
>   
> +	xe_bo_put(vram);
> +
>   	return 0;
>   err:
>   	xe_bo_put(vram);

