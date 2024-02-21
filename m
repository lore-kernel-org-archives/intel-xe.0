Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B47BC48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82A8891A3;
	Wed, 21 Feb 2024 17:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CX+bildh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1A0891A3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708538325; x=1740074325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+D3Q8ajVJLQza18WC8pRCBDjvPt7fuePcyJdcmp+weE=;
 b=CX+bildh04QDyDsv+bLn60My38f/QZ1eBmCDvnJPRFJHcTM8ccbc+Sh6
 QhSU77yNrte4N4iYATpTvSJtlF57iyS8AESi8KtcHJBluoe4osRaBxEGk
 XKmSIMBnTIDgGFDrkxRoQu6c3DAlMwFlWtik5IuYg19u4vmfjdbwxhrWQ
 w+R5QTkrZzQsPzUSNnIuuisIEBT5K+0fVGZQkCiP7OeusnpWxOkFmPBF9
 3DpZzJcQdn+uF3LzumDWB++qM5uooCT6dXaHiX0T8UrTZlDTfCSQGkevb
 syl6GEdBZIsnsO4MTaidQI8tzvXbclI1/2Gu6jxCz3pJ7jpMP2slVvbrn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2588696"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2588696"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827386724"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="827386724"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 21 Feb 2024 09:58:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 19:58:40 +0200
Date: Wed, 21 Feb 2024 19:58:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix cast on trace variable again
Message-ID: <ZdY50NpgbAy0Gya_@intel.com>
References: <20240220205607.1873084-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220205607.1873084-1-lucas.demarchi@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Feb 20, 2024 at 12:56:07PM -0800, Lucas De Marchi wrote:
> Same fix as commit 8d038f49c1f3 ("drm/xe: Fix cast on trace variable")
> that has been inadvertently reverted by a later commit.
> 
> Fixes: a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 0cce98a6b14b..e43c3bde3202 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -32,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>  			     ),
>  
>  		    TP_fast_assign(
> -			   __entry->fence = (u64)fence;
> +			   __entry->fence = (unsigned long)fence;

What's the point of these weird gymnastics?
Ie. why isn't __entry->fence just a pointer?

>  			   __entry->seqno = fence->seqno;
>  			   ),
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
