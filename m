Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB0DD58CBE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 04:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9628D10E3BB;
	Mon, 23 Mar 2026 04:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lURKIogM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C35A10E3BB
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 04:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774239177; x=1805775177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ai+cCTR7710yenMNLeFieiIekNAouG1ULyDPdCH3AvA=;
 b=lURKIogMkYSVkn7fOuEzrxC28xQQN1z3RrMKXWTFEBr94zIU35alBZVc
 6dvgmA2g3gbuX7JC7+gyYcnBOe78cossV33Pa1J3Oez/FQUQqjrDtqw7c
 cOV95CFGEIekhLVPmz1o93nzJp9D3KAqj23dtpst8TXBBGxGq6MJB1Hio
 2QGWt3/kOcvya89NVS+04hyTgUJXfft3cdya6JpyyIH0qiNfJQm8lCTCh
 Qs7/Btu4Z1+k0ljWr+Ue4p5JfJRIj78Tf/4XH5CkmF/wntmuZLc0uGute
 tnSlATQgUhdWk+Q9xOO0FcGWRoKu+337f5bap0UkHSSdQUB/1tF7wq7Rl g==;
X-CSE-ConnectionGUID: 5/Ea/IUrQ5isHRfGfkdXDw==
X-CSE-MsgGUID: 57rYhitMTx2IKKqBncyCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="77844148"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="77844148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 21:12:56 -0700
X-CSE-ConnectionGUID: 3NVfk7lhTkemzZmCo/crGw==
X-CSE-MsgGUID: Qu3sRLd/RVu09/jYX9uq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228622943"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 21:12:55 -0700
Date: Mon, 23 Mar 2026 05:12:52 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v1] drm/xe: Fix confusion with locals on context creation
Message-ID: <acC9xK1n_2Pgl_Wh@black.igk.intel.com>
References: <20260320145733.1337682-1-tomasz.lis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320145733.1337682-1-tomasz.lis@intel.com>
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

On Fri, Mar 20, 2026 at 03:57:33PM +0100, Tomasz Lis wrote:
> After setting a local variable, check that local value rather that
> checking destination at which the value will be stored later.
> 
> This fixes the obvious mistake in error path; without it,
> allocation fail would lead to NULL dereference during context
> creation.
> 
> Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Already fixed[1], but not sure if it's landed yet.

[1] https://lore.kernel.org/intel-xe/20260305184519.155060-1-shuicheng.lin@intel.com/

Raag

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c5cfd8f75a94..77cd57788837 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1607,8 +1607,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
>  	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags, false);
> -	if (IS_ERR(lrc->bo))
> -		return PTR_ERR(lrc->bo);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	lrc->bo = bo;
>  
> -- 
> 2.25.1
> 
