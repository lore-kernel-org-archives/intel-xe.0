Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B268CCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 07:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C6410E269;
	Wed, 15 Oct 2025 07:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQGrs5RT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11A10E269
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 07:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760511859; x=1792047859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xJLx2M209O8pdl8uWAPi+K9KZQFaSqhjZWkfvwbQ/qc=;
 b=QQGrs5RT0U3Cvji8+r/7mGhPaN7EdyZYXzD01Sfn8Kjvhi63EBZ6IeNN
 V4JmkBdT9CEVBveixrZF78siUYe/vnODDPdxZ2EuaWVVR9SCZqdge7ue0
 Qdy3Fsg+cOwe5gvk+3cpBt28dpP+Q0iopnqYIhRQD6fMdn5fVgeUlYKy8
 ReKKQwRgM/rbkpbnmMHPtDh4GzM3WICQW3HiAJx4/cOEmjCdUneAofe1g
 WOsYZ5fE3AgcOtqqysquwRFFrvfGEkFs4v8+p9lIDGIP9YrrlVVEFr+Jb
 6ERpIqG+eu/jTKohZq/hDExJsIvAXim+eHJi0KILRep4ah2wh2lGmuewa A==;
X-CSE-ConnectionGUID: eSZ0Ggg/Tz2tgCUK3ypthA==
X-CSE-MsgGUID: po+OWgFtRJeHYREz7qs8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80311159"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="80311159"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:04:18 -0700
X-CSE-ConnectionGUID: ea2RXoePR2SWYcbhke9o5Q==
X-CSE-MsgGUID: iKP8L2jMSKuohAgfPx3fbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="187392548"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:04:17 -0700
Date: Wed, 15 Oct 2025 09:04:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Make xe_guc_submit_pause() available
 for non-VF cases
Message-ID: <aO9Hbfo06ZrVShss@black.igk.intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-2-raag.jadav@intel.com>
 <aO6Rzzh7YNzpVy/0@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO6Rzzh7YNzpVy/0@lstrano-desk.jf.intel.com>
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

On Tue, Oct 14, 2025 at 11:09:19AM -0700, Matthew Brost wrote:
> On Tue, Oct 14, 2025 at 01:00:35PM +0530, Raag Jadav wrote:
> > Drop xe_gt_assert() meant for VF migration and make xe_guc_submit_pause()
> > available for non-VF cases.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0ef67d3523a7..3cc428d45b4a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2170,8 +2170,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
> >  	struct xe_exec_queue *q;
> >  	unsigned long index;
> >  
> > -	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> > -
> 
> This function does a lot of things specific to VF recovery, it should
> not be called in runtime PM flows. Same goes for xe_guc_submit_unpause.

Can we branch them out inside pause/unpause()? Or is there a better
alternative?

Considering we'd still like to achieve the original pause/unpause()
behaviour here (stop/start submission on a scheduler without loosing
GuC state), do you suspect any side-effects?

Raag

> >  	mutex_lock(&guc->submission_state.lock);
> >  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> >  		/* Prevent redundant attempts to stop parallel queues */
> > -- 
> > 2.34.1
> > 
