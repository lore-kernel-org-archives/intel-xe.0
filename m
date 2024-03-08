Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D69C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 09:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DFA10F649;
	Fri,  8 Mar 2024 09:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQGQxC/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D88010FEAD
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709891757; x=1741427757;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KoFFVo6RCy9Trw9HSQsN2Ekm08pWu9IBDjrk5S7M3LU=;
 b=eQGQxC/C+vJISYkg3XYM/Hndkjh6CSiQEHD78O/TPHj0hX4UtAkf1cWF
 6BP5wPhKG5SgWw3to90sZQtNgfaXrq0+PkjOcA4LL2hOOy+uyRWXvj5Ge
 ltUbvtu3e5mtl3HMBJBX2xwj5C5FoXseWTXjFypY+mAbcqC7ih8HM/kHP
 Lv1oqplyzC3dW3HOspt7rU02T+dT0JFeswYRZoRrSXAgcq0ZuPXZNPZtk
 +RgyYul7I84oXTM1TQmCrm6efek8LrgU5MkHHReldNQyTMjTycIBJdHGE
 s8ew5jVVurRO3qq4ojeCnyja9U19657sha4ztLEl+oCAOtYOCIkICK9oq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="16037784"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="16037784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 01:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15117545"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 08 Mar 2024 01:55:54 -0800
Received: from [10.249.140.229] (unknown [10.249.140.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B6A9434950;
 Fri,  8 Mar 2024 09:55:52 +0000 (GMT)
Message-ID: <ca8373be-d0a8-402d-8e4a-09637c1e3217@intel.com>
Date: Fri, 8 Mar 2024 10:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gt: Remove redundant num_engine check
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
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



On 08.03.2024 08:03, Tejas Upadhyay wrote:
> In __xe_gt_apply_ccs_mode num_engines will never be 0
> as it is already checked by parent function.

and that's why we are using xe_assert() instead of explicit checks, so
you can't say it's redundant

note that the purpose of xe_assert() inside one function is to enforce
the SLA for the caller who should be responsible for doing actual
runtime checks

> 
> Fixes: 0d97ecce16bd ("drm/xe: Enable Fixed CCS mode setting")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 529fc286cd06..2bbd7b203cc2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -22,7 +22,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  
>  	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>  
> -	xe_assert(xe, num_engines && num_engines <= num_slices);

btw, instead of dropping num_engines condition completely this should be
rather split into two separate xe_asserts():

	xe_assert(xe, num_engines);
	xe_assert(xe, num_engines <= num_slices);

> +	xe_assert(xe, num_engines <= num_slices);
>  	xe_assert(xe, !(num_slices % num_engines));
>  
>  	/*
