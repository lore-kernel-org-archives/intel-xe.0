Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF12BFF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 12:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F76710E3CB;
	Wed, 29 Apr 2026 12:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCahRZOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720310E3D3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777465531; x=1809001531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oSED1Y2HAST7KJs8ADiEXDFxNzN9pPQQ0q1ls8wLM0Y=;
 b=XCahRZOVUjC6aUlyQR20H9Os9Cn4tfXlBb8jNPppJG9OPl9JgvS+d3pH
 dOpT8eUadbFd+I1RVgNyGav50r/9N1dJclapa0+pPMwXdHQUQwGUJpzWO
 CELaRQpyvYDADSOo+Xz9l5I1XZn7aBOxn4TSMTD/b9SRwNz7sNJsxcOrH
 cxDvDW8NFnITp3wJ7F7+jHEwg5+JfB/CoW8Se9iJuj5icXTfS8sCO2gdY
 MS5Vji0CtnPMtBF/lEYTsTpJbtsyAVVGlBECPYpE7AV/wEj+XEN/YvLL2
 kgpSl+0UXAkfBJq4QLtaxRqE9ItC1F+VJiBmP5gXd6+fTORNPraHKQ/o5 w==;
X-CSE-ConnectionGUID: aiZQbMoWRz+yZYWvorxGUA==
X-CSE-MsgGUID: fBY/8KWkSnGgALHHdAJtZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78101599"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78101599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 05:25:31 -0700
X-CSE-ConnectionGUID: r8OCfiOmRNWCM7Wt8rapwA==
X-CSE-MsgGUID: E2GwQT5yR/GcPGSwwaBiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234257205"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 05:25:30 -0700
Date: Wed, 29 Apr 2026 14:25:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v2 3/3] drm/xe/gt: Drop redundant forcewake
Message-ID: <afH4tolqlEqO05B_@black.igk.intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
 <20260427092928.1181893-4-raag.jadav@intel.com>
 <ae_fG5yyH5jyXztd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae_fG5yyH5jyXztd@intel.com>
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

On Mon, Apr 27, 2026 at 06:11:39PM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 27, 2026 at 02:59:28PM +0530, Raag Jadav wrote:
> > xe_gt_suspend_prepare() doesn't perform any MMIO operation that requires
> > forcewake in it's code path. Drop it.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> it makes sense... for a moment I thought that the gsc work would require it,
> but it has its own forcewake if needed...
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>$

b4 usually ignores the tags with artifacts, but I'm not familiar with dim
and I hope it's not a problem.

Raag

> > ---
> > v2: Expand commit message (Rodrigo)
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 3c031175f737..e5065f46c748 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -1027,7 +1027,6 @@ void xe_gt_reset_async(struct xe_gt *gt)
> >  
> >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> >  {
> > -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >  	xe_uc_suspend_prepare(&gt->uc);
> >  }
> >  
> > -- 
> > 2.43.0
> > 
