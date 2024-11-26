Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CEFD65544
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 18:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8061710E998;
	Tue, 26 Nov 2024 18:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbLez1S1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCD710E998
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732645561; x=1764181561;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RNYuaAo6IQhY4HSHKcyrhSxpNjMgrV4l6t7l0IdbgiI=;
 b=TbLez1S1hCJeM7cH9iOujWfyulsRa9gBNV4F3lQ80OXJiGLN7sP/tXDi
 W/0/vNoiltxedJnizJYVPLUnFRwx3RZ6JTzhg8Ep+1lSE0AT2imxXno/D
 +ZVr/baQdPk/nDj1rcBKUR407b+8d24Ogm9i1dJa1xxzP7Gsl0wt2iaj4
 dfHwzA6MKZaGNJ+lYiL7Pnu0iN63Y5v4UOq09wWpA/9pRM8qjCEWbINJA
 YmeQLbnSt5bg5uO85QVTu/qQwx4ZPzCxnQhPFCnTCPU2YqqWbdYA7tM7p
 jr9VB/0DyaKwaX/6M0lhuWCa7YbaZXgb6LRDp34+nQ3SeVUef6LN3pzyF g==;
X-CSE-ConnectionGUID: mKuwFog+SiKbF6+3uvghFQ==
X-CSE-MsgGUID: /CMeWxX0QLCc3xN9bPgLwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43892274"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43892274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:26:00 -0800
X-CSE-ConnectionGUID: +/aDOK3sSBOrZ2J5MRAuPg==
X-CSE-MsgGUID: T9z4cZ6ZThOh7RxG2WIwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91312812"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.160.19])
 ([10.245.160.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:25:58 -0800
Message-ID: <66f90d3a-17fe-4837-a8c8-a97c04d3f754@linux.intel.com>
Date: Tue, 26 Nov 2024 19:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/migrate: fix pat index usage
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, stable@vger.kernel.org
References: <20241126181259.159713-3-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241126181259.159713-3-matthew.auld@intel.com>
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


On 11/26/2024 7:13 PM, Matthew Auld wrote:
> XE_CACHE_WB must be converted into the per-platform pat index for that
> particular caching mode, otherwise we are just encoding whatever happens
> to be the value of that enum.
>
> Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cfd31ae49cc1..48e205a40fd2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1350,6 +1350,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  	/* For sysmem PTE's, need to map them in our hole.. */
>  	if (!IS_DGFX(xe)) {
> +		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>  		u32 ptes, ofs;
>  
>  		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> @@ -1409,7 +1410,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  						pt_bo->update_index = current_update;
>  
>  					addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
> -									 XE_CACHE_WB, 0);
> +									 pat_index, 0);
>  					bb->cs[bb->len++] = lower_32_bits(addr);
>  					bb->cs[bb->len++] = upper_32_bits(addr);
>  				}
