Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F848CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 12:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E83710E477;
	Mon, 25 Aug 2025 12:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caJb/8y/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2C10E477
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756126460; x=1787662460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0iKmqkdCGMviSLBTJgP8vTbJIfUWI4P4Jo+FqMYDM/w=;
 b=caJb/8y/cm0hpzVbQgf4q+XVad6EOZ6H6S345+8XrWpeTMgGn6mwmD4D
 vQTHKl+az/xZQmjPwFezWqH3nbiXvhKHObAafvYuYDQEN2h/fiayNzTGn
 XrUsICB9gq4Ok4EWqMEzdB/HAQYkhiEM1K4gaEdDG1jF2ti5wAfvavv1P
 VXcelELCkb5Wz9MRzSRca4z6D3ABx+9Bdvc3FRiTcDZqS0wHY7uFI0HdY
 GeLXjpgNoa4baRLT0gKqzTY7E4d8R89p8zaFhzpPtLgIPrSa0y6DT7Yxv
 iL+g8sdT3zEDPePLU0oZ6xYameMXD46R+9JlRgB+WTyBNyHGEdMjUc1sh A==;
X-CSE-ConnectionGUID: z3M17afPQpW73dF/4ITQGQ==
X-CSE-MsgGUID: SCUfqMSDQfWGEy5XPnsEag==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69769202"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="69769202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 05:54:20 -0700
X-CSE-ConnectionGUID: WITe7OzaTIyEfzGHhqT5LQ==
X-CSE-MsgGUID: 8uDl28weRw2zuxXtX2IcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="170113978"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 05:54:18 -0700
Date: Mon, 25 Aug 2025 14:54:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v2] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aKxc91H1vW4_TIKP@black.igk.intel.com>
References: <20250825112025.1766637-1-raag.jadav@intel.com>
 <2cf0bc62-489e-4447-b3ea-a5716b2c3f57@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf0bc62-489e-4447-b3ea-a5716b2c3f57@intel.com>
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

On Mon, Aug 25, 2025 at 01:52:59PM +0200, Michal Wajdeczko wrote:
> On 8/25/2025 1:20 PM, Raag Jadav wrote:
> > If power state is retained between suspend/resume cycle, we don't have
> > to perform full gt re-initialization. Introduce runtime helpers for gt
> > which greatly reduce suspend/resume delay.

...

> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index a3397f04abcc..9004af061af3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -943,6 +943,31 @@ int xe_gt_suspend(struct xe_gt *gt)
> >  	return err;
> >  }
> >  
> 
> please add kernel-doc for all new public functions

I had planned a separate file-wide patch so that the rest of the helpers
don't feel left out.

> > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > +{
> > +	unsigned int fw_ref;
> > +	int err = -ETIMEDOUT;
> 
> this is only used in err_msg, maybe just hardcode it there
> or use something else than %pe ?
> 
> note that if fw_get fails then there should be already big:
> 
> xe_gt_WARN(..."Forcewake domain%s %#x failed to acknowledge awake request
> 
> so this log with -ETIMEDOUT seems redundant

Failed attempt at stealing gt_suspend/resume code :D
Makes sense.

> > +	xe_gt_dbg(gt, "runtime suspending\n");
> > +
> > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> > +		goto err_msg;
> > +
> > +	xe_uc_runtime_suspend(&gt->uc);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	xe_gt_dbg(gt, "runtime suspended\n");
> > +
> > +	return 0;
> > +
> > +err_msg:
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(err));
> > +
> > +	return err;
> > +}

...

> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 3f4e6a46ff16..f769245f91ae 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -465,7 +465,15 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> >  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> >  }
> >  
> > -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +void xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +{
> > +	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> > +
> > +	if (ct_needs_safe_mode(ct))
> > +		ct_enter_safe_mode(ct);
> > +}
> > +
> 
> add kernel-doc
> 
> and maybe we should expose
> 
> 	xe_guc_ct_runtime_suspend
> 	xe_guc_ct_runtime_resume
> 
> to make it clear when it should called and all logic related to
> CT will be kept in the ct.c code

With that we'll be down 4 level of abstraction just calling each other
without much really happening underneath other than ct_enable/disable,
but sure if it makes more sense.

Raag
