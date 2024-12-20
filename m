Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D6EE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 16:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910D710E051;
	Fri, 20 Dec 2024 16:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqjHHQwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651DF10E051
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734711569; x=1766247569;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=7C/QQcwSIl4lKPe3s5Xq3lg2CUwf0D6N445l6eJxeGo=;
 b=PqjHHQwr3N8ShFCb9+0qdGNhw0N10jCreJAWY32JCwPGv1cQIBRl0hNA
 PWzzR6l6T/1gvtWwl8oNG8BHfT0cK2B73Y8eyv+BbNWgxVHryUZwmFJrU
 UiL9Yhf5ZbNycUidQsf3B+mp3RyheKihTH/JpB+4SBbODCvg7bKMRrgpL
 Zj4vg35M2lL+wQSBPzpV/6wd83wG/U7ZItI+MefzWxzsNRCcr6uvg86ti
 S8KGv7j+8958ssFyMB/4OszzyA0bDO2Mt788De3KuXrafzKfjalKjdVZB
 s1+/i1WCjsl9Dnp/67NlTzy1EjwbosltGBpPQyD2HBVeQx14SqcgBiNAn A==;
X-CSE-ConnectionGUID: 3cUnmRGaSQGaSNMnbhbgPw==
X-CSE-MsgGUID: CQx0wxQRQai6Cr7CcU6zEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38947945"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38947945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:19:29 -0800
X-CSE-ConnectionGUID: UUIfMCqrSUWus+fGqVZTyg==
X-CSE-MsgGUID: CVwi7bNJTk27maTX9+l5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98383838"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:19:27 -0800
Date: Fri, 20 Dec 2024 18:20:06 +0200
From: Imre Deak <imre.deak@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/pm: Also avoid missing outer rpm warning on
 system suspend
Message-ID: <Z2WZNp0YZAehJfoL@ideak-desk.fi.intel.com>
References: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
 <Z2LdJSyhpJoSNQ-Q@ideak-desk.fi.intel.com>
 <Z2WFSGR0ejBA4yTp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2WFSGR0ejBA4yTp@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2024 at 09:55:04AM -0500, Rodrigo Vivi wrote:
> On Wed, Dec 18, 2024 at 04:33:09PM +0200, Imre Deak wrote:
> > On Tue, Dec 17, 2024 at 06:05:47PM -0500, Rodrigo Vivi wrote:
> > > We have some cases where display is releasing power domains at
> > > release_async_put_domains() where intel_runtime_pm_get_noresume()
> > > is called, but no outer protection. In Xe this will trigger our
> > > traditional warning.
> > 
> > I suppose by outer protection you mean an RPM reference that is
> > guaranteed to be held at the point (that is right before)
> > release_async_put_domains() calls intel_runtime_pm_get_noresume(). This
> > is guaranteed, i.e. such an RPM reference is held by definition (by the
> > power domain reference that is being put).
> 
> not actually.
> The outer rpm reference needs to be a reference on the outer bounds
> that ensures the device is awake. _noresume calls should only be used
> in inner places where you know there's something already ensuring
> that the device is awake but you don't want to take the risk of that
> reference being lost while you are in the middle of your sequence,
> so you call the 'noresume' as an extra thing to ensure that you can
> go to the end without device getting suspended because the other
> reference got dropped.

Yes, that is what I meant. In case of release_async_put_domains() it is
sure that the device is awake and hence there is no runtime resume
needed. The power domain reference being put holds a runtime PM
reference. So the "no outer protection" reasoning in the commit log is
not correct.

The reason for the WARN that this patch fixes is simply that
pm_runtime_get_if_in_use() used by xe to check for an outer RPM
reference fails if it is called either during runtime suspend/resume or
system suspend/resume. The existing code took this already into account
for the runtime suspend/resume case, but it didn't take it into account
for system suspend/resume. After this patch the outer protection check
will work the same way for both the runtime and system s/r case,
removing the WARN in the latter case.

> > Instead, the actual reason for triggering the warn - IIUC - is that
> > intel_runtime_pm_get_if_in_use() called from
> > xe_pm_runtime_get_noresume() (probably for the exact reason to check if
> > an outer RPM is held) fails if it is called while system suspending /
> > resuming. This is the same scenario as when
> > intel_runtime_pm_get_if_in_use() would fail if called during runtime
> > suspending / resuming and - worked around earlier I assume - by
> > suppressing the warning in this case using xe_pm_suspending_or_resuming().
> 
> The get_if_in_use is only the choice inside our _noresume so we can
> properly check if the device was really awake and warn that we have
> an unprotected case that we need to handle properly. If we were sure
> to have all the outer protections in place already, we could safely
> just use the _noresume option from the rpm directly.
>
> > So in this fix the above workaround to suppress the warning is just
> > extended to the system suspend/resume case.
> > 
> > > However, this case should be safe because it is triggered from the
> > > system suspend path, where we certainly won't be transitioning to rpm
> > > suspend.
> > > 
> > > This wouldn't happen if the display pm sequences, including
> > > all irq flow was in sync between i915 and xe. So, while we
> > > don't get there, let's not raise warnings when we are in this
> > > system suspend path.
> > 
> > I think the issue fixed in this patch is just a consequence of how the
> > outer RPM check works using xe_pm_suspending_or_resuming() and wouldn't
> > change even after the IRQ related issues are fixed.
> 
> If there's other cases where this release_async_put_domains is called
> out of the suspend path, this warning here is showing that we do
> need an extra runtime_pm_get right at the beginning of the workqueue.
> And this patch here would only be masking this warning in this case
> here, while leaving the release_async_put_domains unprotected.

Fixing the IRQ handling doesn't change how pm_runtime_get_if_in_use()
works and hence how its return value is ignored in the outer protection
check during runtime and system s/r.

> > > Suggested-by: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > With the above understanding:
> > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index a6761cb769b2..c6e57af0144c 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -7,6 +7,7 @@
> > >  
> > >  #include <linux/fault-inject.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/suspend.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > >  #include <drm/ttm/ttm_placement.h>
> > > @@ -607,7 +608,8 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
> > >  	struct device *dev = xe->drm.dev;
> > >  
> > >  	return dev->power.runtime_status == RPM_SUSPENDING ||
> > > -		dev->power.runtime_status == RPM_RESUMING;
> > > +		dev->power.runtime_status == RPM_RESUMING ||
> > > +		pm_suspend_target_state != PM_SUSPEND_ON;
> > >  #else
> > >  	return false;
> > >  #endif
> > > -- 
> > > 2.47.1
> > > 
