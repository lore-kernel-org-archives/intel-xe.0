Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82B6109B46D
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 14:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA4810E9B0;
	Tue, 31 Mar 2026 14:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6RdVxlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B2110E9B0
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774966261; x=1806502261;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CfVo0FlYdZPuyV+Ze4bzo2E4ViSzCLQDEFCB2iGoQ8k=;
 b=H6RdVxlhPeHTIcj8DPZBjTglbYBweKhaLKMh8eON3Qb0d1gMia1aCWd6
 Ykg7Ws0V+G3klWxVkUplgwxlhhCKh/cj3wWrjKr+LbVmXFXgie197K3+P
 PxEb7TSWjUXk9B0oFs1e/Q0MWXFpqOZIOj2Q0hokNkGPDjV72JKY6q4sM
 f3sySIaNLfOUNqdEI13K8bjA5xBURDhSuhGwP9sxu0/4ESnUN3oNXhe4m
 tG/0ejurdqVfCp5rhrdlnzkGmaL7FtqcdmICxU0K/Viw+dvydMOIJtB+r
 4unelbT+Y2Hr30n2Z8OzAqn+0a4mJWB6brswfxiAATmgwWGTuDq1sq2c8 g==;
X-CSE-ConnectionGUID: YBvc/f27R8iFlYX4Paat6w==
X-CSE-MsgGUID: Ytwudo51TSKDJoZt4u4MYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75875477"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75875477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:11:01 -0700
X-CSE-ConnectionGUID: JdBxsAgcRSqLloRAfGkKZQ==
X-CSE-MsgGUID: MjwVK8yPR0q7S3LUJzRhzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="249590289"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.19])
 ([10.245.244.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:11:00 -0700
Message-ID: <7e23b76c-2c39-40f6-abd0-cd50de5f6240@intel.com>
Date: Tue, 31 Mar 2026 15:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe_pat: Print PAT_ATS during register dump
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260331134330.2535519-2-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260331134330.2535519-2-zbigniew.kempczynski@intel.com>
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

On 31/03/2026 14:43, Zbigniew Kempczyński wrote:
> For Xe2 and beyond we miss printing PAT_ATS register.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Nit: commit title drm/xe/pat:

> ---
>   drivers/gpu/drm/xe/xe_pat.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 356f53bdb83c..75aaae7b003d 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -531,6 +531,14 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   	drm_printf(p, "Page Table Access:\n");
>   	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>   
> +	if (xe_gt_is_media_type(gt))
> +		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_ATS));
> +	else
> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_ATS));
> +
> +	drm_printf(p, "PCIe ATS/PASID:\n");
> +	xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>   	return 0;
>   }
>   

