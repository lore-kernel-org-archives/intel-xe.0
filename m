Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452B0C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 09:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90E1136EA;
	Fri,  8 Mar 2024 09:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjmtCf/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8871136EA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709889118; x=1741425118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d92dLXPRb0jyRw9njqlWw3v6gC7trTwI7QJ+nf3xkWg=;
 b=ZjmtCf/jhHuKX8p8mEO3TpfecVXKkUjD4sO4TZxqkJUUKjA+e/LwEgBY
 ALv4SBZQKW4D6Hd7vgaN5nTuh934rB0Znfi8o3hA/l4nZI83GFQPGYdZS
 kggfUzG8nzPIt+w9h3n9lw2/7tnBbPJSBIt1RxB68ZCXDwMfdUDt0U+hH
 I64yibi8bLLc+QIRlr9wFHZ6jA5uyVrXJPVYAm2rjyn2ICm+PguPe85F/
 I8ck6XROxzXGGmXyfsJHLwhBd1+InWphIuKvTmFuAcLf3o6nUJvHvLJIi
 iVYIVR5KArxcaqDHtoOEIkpqJF8TBTxkdbkuAqSc4Y2uWzMJPHqVnm54x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15247534"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15247534"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 01:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10421093"
Received: from unknown (HELO intel.com) ([10.247.118.107])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 01:11:55 -0800
Date: Fri, 8 Mar 2024 10:11:48 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Remove redundant num_engine check
Message-ID: <ZerWVPgVq4sZ-gmH@ashyti-mobl2.lan>
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
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

Hi Tejas,

On Fri, Mar 08, 2024 at 12:33:08PM +0530, Tejas Upadhyay wrote:
> In __xe_gt_apply_ccs_mode num_engines will never be 0
> as it is already checked by parent function.
> 
> Fixes: 0d97ecce16bd ("drm/xe: Enable Fixed CCS mode setting")

I don't think you need the Fixes tag here.

With that removed:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

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
> +	xe_assert(xe, num_engines <= num_slices);
>  	xe_assert(xe, !(num_slices % num_engines));
>  
>  	/*
> -- 
> 2.25.1
