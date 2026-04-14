Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531F6F9D0CD
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130F389654;
	Tue, 14 Apr 2026 14:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9QKGd53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7889654
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776175868; x=1807711868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7KqMldEvS0qanUhr9VGoEG9TI6wsbYzO8x/fhN3ATzo=;
 b=O9QKGd53ycgyH69uvslK6e5gh/EjiGe/1xuV9ZThNa71DVevjO9vbls4
 ChtqYrJcBi1cXL7AeVYlQL+Un8nLumWcHljJRbIzFAJbiLWWalk82aAX8
 mqpyRMsFjtBvjRTY2g6kXpX95A9bobV+xmAHrM9tfOsFnlg9XdupPRUI4
 nHOPaEPZOeDgHvuc0vEq/XqkhPWiglHHVjcdsppfhOwJJfvYDPGIWmgjt
 bJpBafS14JxyYvxttHEjtcWFf0sqErRTFlV4/RLv5f9tMPW488WR6qHpA
 uZuV2gMR3KJ7Kdjm8OH4bVt1eUiKtDHF2o3wFIndVAaWwqkpnCMApq+Pf w==;
X-CSE-ConnectionGUID: zjva5hetTDWLA1R2rg+BeQ==
X-CSE-MsgGUID: GNzq9EAvRDCmwfeMl+ZaVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76165368"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76165368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:11:08 -0700
X-CSE-ConnectionGUID: 9h2IYehERvSogxiLd4ftQw==
X-CSE-MsgGUID: KpRq42I5RtCcKsbEoHe7Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225388113"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:11:07 -0700
Date: Tue, 14 Apr 2026 16:11:03 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH] drm/xe/xe_survivability: Fix runtime survivability error
 handling
Message-ID: <ad5K96woeG-_19SY@black.igk.intel.com>
References: <20260414124426.566929-2-mallesh.koujalagi@intel.com>
 <ad5H-nLmkCbze65f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5H-nLmkCbze65f@intel.com>
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

On Tue, Apr 14, 2026 at 09:58:18AM -0400, Rodrigo Vivi wrote:
> On Tue, Apr 14, 2026 at 06:14:27PM +0530, Mallesh Koujalagi wrote:
> > When enabling survivability mode at runtime, the code tries to create
> > a sysfs entry. If that step fails, the error is only logged, but the
> > function still reports success. This makes it look like survivability
> > mode was enabled even though part of it failed.
> > 
> > Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
> > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_survivability_mode.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index db64cac39c94..c2dfc7ea7b83 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -413,8 +413,10 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
> >  	populate_survivability_info(xe);
> >  
> >  	ret = create_survivability_sysfs(pdev);
> > -	if (ret)
> > +	if (ret) {
> >  		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
> > +		return ret;
> 
> Perhaps this is intentional?
> But if so, this function needs to be changed to void and
> the extra msg removed from csc_hw_error_work()
> 
> Riana, Raag?

I've done[1] it already, but perhaps a separate fix is also harmless.

[1] https://lore.kernel.org/intel-xe/20260402174229.1062874-4-raag.jadav@intel.com/

Raag

> >  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
> >  	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> > -- 
> > 2.34.1
> > 
