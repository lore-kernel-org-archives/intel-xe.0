Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2BEE7D24B
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 08:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA4510E35F;
	Tue, 26 Sep 2023 08:01:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755D310E35F
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695715304; x=1727251304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hDrvO4O6nBCax60r4UIvVE14Ri387i/qAG4EclqGXxc=;
 b=K4pxC26cIqt6MQzTGu7l9jtAEEDHzBTyCwhTv9nplownAisV1HnDbEDU
 U/6NHr6nKOFXx6mhZ6kQy8rn+7pFhXQD/dmKlyu+iTByNK3CkH2BfwusF
 ZoKPGym7a6mnkjQFVGr/m6Z3e5BnUT38Sa3E5HLnMaC8K60fS0KULeLqT
 JWjP1Rf+Yk7ZPIaa7BoIY1tr2o7Te5ErNjvIRBA5v0pl2ZhX1H3hn/DVB
 X+C/fNPcrIQkxjLaxiJgHvZB6S5A2GDgmgLBl6jFRpjVxkCJb3XiyXD7C
 l37dObCt9+vT3bpxA1cRXq5wYd4guKPRxy1WbciZz+Pku0Ps5SygtYghU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="448008713"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="448008713"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872408428"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="872408428"
Received: from jliew-mobl.gar.corp.intel.com (HELO intel.com) ([10.213.158.52])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:01:36 -0700
Date: Tue, 26 Sep 2023 10:01:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Message-ID: <ZRKP2UIGUWTXnZN6@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-6-badal.nilawar@intel.com>
 <ZRF1f2OsC1pr5hFd@ashyti-mobl2.lan>
 <e5801f36-2f9a-6d24-7af2-1e7174f2e0b4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5801f36-2f9a-6d24-7af2-1e7174f2e0b4@intel.com>
Subject: Re: [Intel-xe] [PATCH v6 5/5] drm/xe/hwmon: Expose
 power1_max_interval
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
Cc: linux-hwmon@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

> > > +	/* val in hw units */
> > > +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> > > +	/* Convert to 1.x * power(2,y) */
> > > +	if (!val) {
> > > +		/* Avoid ilog2(0) */
> > > +		y = 0;
> > > +		x = 0;
> > > +	} else {
> > > +		y = ilog2(val);
> > > +		/* x = (val - (1 << y)) >> (y - 2); */
> > 
> > this is some spurious development comment, can you please remove
> > it?
> 
> This is kept intentionally to help to understand the calculations.

then this is confusing... Can you please expand the concept?
As it is it's not understandable and I would expect someone
sending a patch with title:

 [PATCH] drm/xe/hwmon: Remove spurious comment

Because it just looks forgotten from previous development.

> > > +		x = (val - (1ul << y)) << x_w >> y;
> > > +	}
> > > +
> > > +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> > > +
> > > +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> > > +
> > > +	mutex_lock(&hwmon->hwmon_lock);
> > > +
> > > +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
> > > +			     PKG_PWR_LIM_1_TIME, rxy);
> > > +
> > > +	mutex_unlock(&hwmon->hwmon_lock);
> > 
> > why are we locking here?
> 
> Since it is rmw operation we are using lock here.

OK... so what you are trying to protect here is the

  read -> update -> write

and it makes sense. The problem is that if this is a generic
rule, which means that everyone who will do a rmw operation has
to take the lock, why not take the lock directly in
xe_hwmon_process_reg()?

But also this can be a bit confusing, because a function is
either locked or unlocked and purists might complain.

A suggestion would be to do something like:

   static int xe_hwmon_process_reg(..., enum xe_hwmon_reg_operation operation)
   {
   	...
   }

   static int xe_hwmon_reg_read(...);
   {
   	return xe_hwmon_process_reg(..., REG_READ);
   }

   static int xe_hwmon_reg_write(...);
   {
   	return xe_hwmon_process_reg(..., REG_WRITE);
   }

   static int xe_hwmon_reg_rmw(...);
   {
	int ret;
   	
	/*
	 * Optional: you can check that the lock is not taken
	 * to shout loud if potential deadlocks arise.
	 */

	/*
	 * We want to protect the register update with the
	 * lock blah blah blah... explanatory comment.
	 */
	mutex_lock(&hwmon->hwmon_lock);
	ret = xe_hwmon_process_reg(..., REG_RMW);
	mutex_unlock(&hwmon->hwmon_lock);

	return ret;
   }

What do you think? It looks much clearer to me.

Andi
