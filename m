Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93612C61CE2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 10:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E1110E182;
	Tue, 25 Aug 2026 10:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFnPtoZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9175210E182
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787652246; x=1819188246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GmLbeIE8e6x/NPGGWpKuf0rvS+MOC9YNQq6fpv+BlNQ=;
 b=TFnPtoZN35QGL/6+MAv0W5KOxJq5D0/eRWf/1ImBky0CeQ9Jj/l78BGD
 j0vCcm+pCHvDCmYaoKX0xw+EPElJEFToXt5xWDzGnFM1+odD2U3zX8Mce
 2RlBWJneTHuunq0L/rIk6tidC65juv6VvuPYj2DWxFwwf6cITH/T0OwJu
 lbkNs1zHq5o8FfH9WTHLtjhY/Ffs5Zw9Wg4XfNeCAlwhecFEZFIMWLVBL
 Fiy8prFl4YKC3JQ5BouE/nRY52QH5XXMOHvqECDGTYrA5+WZ3V+DuV3Z7
 tV7jiZq7KreHAMLNcke0yNPZq+3aUh2YF9C5HLhJA5/vsu6ZJJC2Xbc0R w==;
X-CSE-ConnectionGUID: xz03caRoQnG03r+JxiUkLw==
X-CSE-MsgGUID: UjabCBcHQ2iR98JKx18CkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87062916"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87062916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 03:04:04 -0700
X-CSE-ConnectionGUID: RxmN1+d0SaaoWfGk52NGog==
X-CSE-MsgGUID: yEvagUpRRx2YThLXtobWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="264624721"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 03:04:02 -0700
Date: Tue, 25 Aug 2026 12:04:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 sk.anirban@intel.com
Subject: Re: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
Message-ID: <ao1okNN6fR9mQ0cM@black.igk.intel.com>
References: <20260821122114.567725-1-raag.jadav@intel.com>
 <4ad586b1-14c5-4cd4-98aa-056cb47265a8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad586b1-14c5-4cd4-98aa-056cb47265a8@intel.com>
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

On Tue, Aug 25, 2026 at 11:39:44AM +0200, Laguna, Lukasz wrote:
> On 8/21/2026 14:21, Raag Jadav wrote:
> > Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
> > cancellation") introduced distinguishable error codes for g2h failure
> > cases, but also blocked GuC CT for wedged device. This is problematic
> > in cases where we want to prevent user from accessing the device but
> > also keep GuC CT functioning on temporarily wedged device. First user
> > of such requirement is PCIe FLR handling where we require uC firmware
> > loading while the device is temporarily wedged.
> > 
> > Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 5c4733da385c..97e38147effd 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1062,11 +1062,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >   	xe_gt_assert(gt, g2h_len || !num_g2h);
> >   	lockdep_assert_held(&ct->lock);
> > -	if (xe_device_wedged(ct_to_xe(ct))) {
> > -		ret = -ENOTRECOVERABLE;
> > -		goto out;
> > -	}
> > -
> >   	if (unlikely(ct->ctbs.h2g.info.broken)) {
> >   		ret = -EPIPE;
> >   		goto out;
> > @@ -1813,9 +1808,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >   	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
> >   	lockdep_assert_held(&ct->fast_lock);
> > -	if (xe_device_wedged(xe))
> > -		return -ENOTRECOVERABLE;
> > -
> >   	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> >   		return -ENODEV;
> 
> There's also third instance in guc_ct_send_recv().
> 
> Shouldn't we distinguish between temporary and permanent wedge here rather
> than removing the checks entirely?

I thought of adding a xe_device_wedged_perm() but this would create
confusion with existing xe_device_wedged() regardling it's usage.
So perhaps we need a better name? Or a better idea? Open to suggestions.

> And it looks like it should be a part of the FLR series. This patch doesn't
> make sense without this series, and FLR series doesn't work without it.
> I'm also not sure if it deserves the fixes tag, it wasn't broken at the
> time.

Agree, will add it as part of FLR series once we have some conclusion.

Raag
