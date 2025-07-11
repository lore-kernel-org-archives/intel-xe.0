Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09478C8303C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 08:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1E10E269;
	Fri, 11 Jul 2025 08:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fA2Xuh++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FBA10E269
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752223606; x=1783759606;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P2jQuUk6cfXY7OPPkv/YDFtcAgq8+WCje1+1lvQk27A=;
 b=fA2Xuh++TnKaPEhwbhJktg4D81i3JgszH4Vk4TbWLWtuK+YrRlUjEXhT
 2a5BcxRTd3rsQ7XDKoXuPAUytZ1dntOSxO/4F4gohkS244bOGdSWvJWXv
 dDhQOjA2yuBLsf2ulRuq+C/OTt5RAF+Qx3QNoXItFEGkW7eYhKNarsNsU
 JfMCOzWrKhM9L7rA9oh1OAusBUXvZ+TExQdAcmQSVlwo011Z6+ctQpa9+
 OtlsADu4s1k0N6S6I30GLRu54a6Od47SUu5PPN7Dl0b6ss5/IAsFmIAjI
 niaT/JCIbNjKLKXgLFlagO+V1ASB+c1z/I3MPE4Uy34nLSDbcdOVquP5v A==;
X-CSE-ConnectionGUID: 6R0qJlT6TiiJvgiUw7IMPA==
X-CSE-MsgGUID: 5BNmlHbJTOe1ZQFez3ViuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54604708"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54604708"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:46:46 -0700
X-CSE-ConnectionGUID: jC6Nk6GcQ/G0yUGipnwEGw==
X-CSE-MsgGUID: CEiQIXOiTB6N6tzBkp3JyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="162009324"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.21])
 ([10.245.245.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:46:45 -0700
Message-ID: <b6a333c4-c0ce-42ea-9201-20264e0c5987@intel.com>
Date: Fri, 11 Jul 2025 09:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Fix alignment check
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
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

On 10/07/2025 22:34, Lucas De Marchi wrote:
> The check would fail if the address is unaligned, but not when
> accounting the offset. Instead of `buf | offset` it should have
> been `buf + offset`. To make it more readable and also drop the
> uintptr_t, just use the IS_ALIGNED() macro.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4e2bdf70eb70b..18b53a4e267d3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1817,8 +1817,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   	xe_bo_assert_held(bo);
>   
>   	/* Use bounce buffer for small access and unaligned access */
> -	if (len & XE_CACHELINE_MASK ||
> -	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
> +        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> +            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
>   		int buf_offset = 0;
>   
>   		/*
> 
> 
> 

