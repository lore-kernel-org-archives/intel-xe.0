Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B478DC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EC210E1CC;
	Wed, 26 Jun 2024 21:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxrVqqUg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F134610E1CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719437474; x=1750973474;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0WqHUTXR5V+uLcoj7pXiD+OVrJq4RVbcjq9sE6/NLCQ=;
 b=PxrVqqUg0KggeVoSVac47abarEWCaPvLQo8h2CRSq7Egb6/chOFhON6i
 DpdLc9en26fv+0mqxrFqf2gx9nnRbDf3KTgp5AiRKDQW6juS8QKBRv3ns
 nLBcOeq2HBXwgoL65WR/t1C0xvzgVmFEoRCrgCBLERFzVZdWl9nReY26Q
 sft4rHZ2xraUp6kBg7myrC/wLSKY16RuuOiEoo9r6t4J0HNWOTysi5e0C
 7l5nbKSEDaHpgcbJi/1beyyBsv/5j8NsqyU/bUF3NdePH0MPnx/Sjk4zK
 d77xJ9/aU62PJtsYSoVF1lAP3YrA6dcccZRBoET0gv0gZQ4lxEJqNK9hv Q==;
X-CSE-ConnectionGUID: GCAmX0eQQMKEisPfyytkfQ==
X-CSE-MsgGUID: L0lqpKyVRaKaw6eqHG032A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20420787"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="20420787"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:31:13 -0700
X-CSE-ConnectionGUID: sF2h2AphSeCZ4r4ezU9dsA==
X-CSE-MsgGUID: LJOQ+SquRhquaQA2D1b4iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44790000"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 26 Jun 2024 14:31:12 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 84C2D2FC4B;
 Wed, 26 Jun 2024 22:31:10 +0100 (IST)
Message-ID: <bc86de52-01a2-478d-917e-60bdb04860e2@intel.com>
Date: Wed, 26 Jun 2024 23:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mocs: Check that MOCS table.ops is assigned
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20240626211256.1620889-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240626211256.1620889-2-matthew.d.roper@intel.com>
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



On 26.06.2024 23:12, Matt Roper wrote:
> When MOCS debugfs dumping was added in commit 9fbd0adbcbe8
> ("drm/xe/mocs: Add debugfs node to dump mocs"), a sanity check was added
> to xe_mocs_dump() to ensure table.ops->dump is not a NULL pointer.  The
> more common programmer mistake when adding MOCS enablement for new
> platforms is to simply forget to assign anything to table.ops
> altogether.  Extend the check to also cover a NULL table.ops and add a
> WARN() so that CI will help us catch these mistakes when new platforms
> are enabled in the future.

but for the programming mistakes, shouldn't we use xe_assert() instead?

and in get_mocs_settings() there is already:

	xe_assert(xe, !info->ops || info->ops->dump);

maybe it just needs to be updated?

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index de3f2d3f1b04..d43900d351f1 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -779,7 +779,7 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	flags = get_mocs_settings(xe, &table);
>  
> -	if (!table.ops->dump)
> +	if (xe_gt_WARN_ON(gt, !table.ops || !table.ops->dump))
>  		return;
>  
>  	xe_pm_runtime_get_noresume(xe);
