Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE58C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 12:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707CE10E1CA;
	Tue, 25 Aug 2026 12:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gchxL739";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05A410EA49
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787662157; x=1819198157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sS9JJcLVODSvVEcfkC9W8rhh4grWjQxJLK8BoVtZ7Ek=;
 b=gchxL739v2uyONo3JKbrOBmCWB5prBhqfVqQz2Tg+2Bie9Z7O4YU5D0C
 Pm+uV+XDMgBL2L5vYeR/9v368mekdDbJE/7u9RtqYof3ksu2aYFTofGJ1
 3fOvnT4D2JntgU3LEcuoDNzP+hMn+fcSzs5uz1ojndL/+ibvBRtw1RIKK
 4eEdWnEU0bNHR+rUyqX0ky2ue0+kSTv0JLW7QHCZJ/PTfZ6IbEv6QxFEl
 0lYjaGfYYgcUZgjMWUgNrjSh4YGfPMM+yK7kqmuD4HDzfTnbsyuKJT7GT
 ttKkA4RZ3FmN7t6+4W+hFK95eGSge1Najx4cSChhhF4c0BZ9BA2IG7WJA w==;
X-CSE-ConnectionGUID: Z+t6Ua7ZQweFXc5B8kbKvg==
X-CSE-MsgGUID: 9k/V2VD0S7mNyYjm49IoiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75662817"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="75662817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 05:49:16 -0700
X-CSE-ConnectionGUID: 0GCzM41dQv+eIJkS0w99Ig==
X-CSE-MsgGUID: DwethsK/TyCxcFARw9k13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265965424"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 05:49:14 -0700
Date: Tue, 25 Aug 2026 14:49:12 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 sk.anirban@intel.com
Subject: Re: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
Message-ID: <ao2PSHSTn1jDzkWR@black.igk.intel.com>
References: <20260821122114.567725-1-raag.jadav@intel.com>
 <4ad586b1-14c5-4cd4-98aa-056cb47265a8@intel.com>
 <ao1okNN6fR9mQ0cM@black.igk.intel.com>
 <0de98b7e-2c74-4af5-933d-2c14f367ba71@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0de98b7e-2c74-4af5-933d-2c14f367ba71@intel.com>
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

On Tue, Aug 25, 2026 at 12:53:35PM +0200, Laguna, Lukasz wrote:
> On 8/25/2026 12:04, Raag Jadav wrote:
> > On Tue, Aug 25, 2026 at 11:39:44AM +0200, Laguna, Lukasz wrote:
> > > On 8/21/2026 14:21, Raag Jadav wrote:
> > > > Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
> > > > cancellation") introduced distinguishable error codes for g2h failure
> > > > cases, but also blocked GuC CT for wedged device. This is problematic
> > > > in cases where we want to prevent user from accessing the device but
> > > > also keep GuC CT functioning on temporarily wedged device. First user
> > > > of such requirement is PCIe FLR handling where we require uC firmware
> > > > loading while the device is temporarily wedged.
> > > > 
> > > > Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_ct.c | 8 --------
> > > >    1 file changed, 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index 5c4733da385c..97e38147effd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -1062,11 +1062,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > > >    	xe_gt_assert(gt, g2h_len || !num_g2h);
> > > >    	lockdep_assert_held(&ct->lock);
> > > > -	if (xe_device_wedged(ct_to_xe(ct))) {
> > > > -		ret = -ENOTRECOVERABLE;
> > > > -		goto out;
> > > > -	}
> > > > -
> > > >    	if (unlikely(ct->ctbs.h2g.info.broken)) {
> > > >    		ret = -EPIPE;
> > > >    		goto out;
> > > > @@ -1813,9 +1808,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> > > >    	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
> > > >    	lockdep_assert_held(&ct->fast_lock);
> > > > -	if (xe_device_wedged(xe))
> > > > -		return -ENOTRECOVERABLE;
> > > > -
> > > >    	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> > > >    		return -ENODEV;
> > > There's also third instance in guc_ct_send_recv().
> > > 
> > > Shouldn't we distinguish between temporary and permanent wedge here rather
> > > than removing the checks entirely?
> > I thought of adding a xe_device_wedged_perm() but this would create
> > confusion with existing xe_device_wedged() regardling it's usage.
> > So perhaps we need a better name? Or a better idea? Open to suggestions.
> 
> What about xe_device_needs_recovery()?
> In this case, we should also change the ENOTRECOVERABLE to something else,
> maybe ENOLINK or ESHUTDOWN?

Or make it the other way around? Perhaps xe_device_not_recoverable()?

Raag

>> > > And it looks like it should be a part of the FLR series. This patch doesn't
> > > make sense without this series, and FLR series doesn't work without it.
> > > I'm also not sure if it deserves the fixes tag, it wasn't broken at the
> > > time.
> > Agree, will add it as part of FLR series once we have some conclusion.
> > 
> > Raag
