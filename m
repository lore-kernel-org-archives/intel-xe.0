Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1535EEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 10:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF06B10E366;
	Tue, 11 Jul 2023 10:42:25 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503610E366
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689072143; x=1720608143;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lKsm97UcYs9X5CYnVoYpZ5+usDUayC2R5MIE3TGtZAM=;
 b=FeIQYnFx+MLtzDXu+UTMhrREySectfEB3gO+3UlJU0x3o6IPzLpzXYud
 +2vHdSWMKkwHSOjwm6BHfTHS7lOtt13sS3VZ9nEGyHxlRZal06DWiVbaF
 dqT3Tu9HCBc9Tr3RmIoTGhW+cGZ4/KssVpcYReDccs88+7ROf3T0x82GS
 kBoErK4j7GxgizmTG4KbFumqwdLpJVOnfLR0D/b+LNuFV8jAxXLRZh1Zf
 kTiwNZWv93tv0Gk3DUOoYNUJTpodZESGaCyjUPp4YIWB9gnHLikwOk6mb
 fdLC0neXKCPIqfTljeWPhFrxSaGGKdcibZEJrHkGpa4rq8DWgb+xU1WSn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354448381"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="354448381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786560426"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="786560426"
Received: from sbodin-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.13])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:42:20 -0700
Date: Tue, 11 Jul 2023 12:42:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Message-ID: <ZK0yA62vI4OEVERK@ashyti-mobl2.lan>
References: <20230705084403.3922130-1-tejas.upadhyay@intel.com>
 <87y1jucv1g.wl-ashutosh.dixit@intel.com>
 <eb6aed9e-ef31-98d6-7bec-d2ac8042792c@linux.intel.com>
 <87wmzecqd6.wl-ashutosh.dixit@intel.com>
 <29fe7224-92e8-0f62-6801-b2588dbb1001@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29fe7224-92e8-0f62-6801-b2588dbb1001@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
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
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 05, 2023 at 06:37:46PM +0200, Nirmoy Das wrote:
> Hi Ashutosh,
> 
> On 7/5/2023 5:47 PM, Dixit, Ashutosh wrote:
> > On Wed, 05 Jul 2023 08:39:20 -0700, Nirmoy Das wrote:
> > > Hi Ashutosh,
> > > 
> > > On 7/5/2023 4:06 PM, Dixit, Ashutosh wrote:
> > > > On Wed, 05 Jul 2023 01:44:03 -0700, Tejas Upadhyay wrote:
> > > > > Currently return from xe_gt_sysfs_init() is ignored
> > > > > and also a failure in xe_gt_sysfs_init() isn't fatal
> > > > > so make it return void.
> > > > But why is the failure not fatal? I really don't understand the concept of
> > > > these non-fatal failures. Do we really want to say the device is up if
> > > > sysfs initialization has failed for some reason and people are unable to
> > > > see card freq's e.g.? This was done in i915 but do we really want to repeat
> > > > this for xe? IMO the simplest thing to do would be to fail the probe unless
> > > > ALL required/intended functionality is clearly up.
> > > 
> > > I agree with the concern but the situation is different with a graphics
> > > driver.
> > > 
> > > If we return error on probe, (if I am not wrong) a user will have no way to
> > > interact
> > > 
> > > with the system other than ssh. We should ignore non-fatal error and let
> > > the driver load
> > > 
> > > so a user can have something to work with(may be report a bug :) )
> > Hmm, good point. Agreed :)
> > 
> > This way though only display is critical and everything else non-critical?
> 
> Yes, that would be wrong, I am not saying that. We do return error during
> the probe at multiple locations,
> 
> I believe we can prioritize system usability by considering this specific
> error as non-critical. Although those sysfs files are important,

I have been one of the supporters of the non fatal failures in
sysfs for a usability reason. A big warning printed should be
more than enaough while the driver can still be up and running.

Besides, I believe that if sysfs fails, then most probably the
system has something wrong.

Andi
