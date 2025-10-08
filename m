Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B3ECCD185
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 08:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B1310E19C;
	Wed,  8 Oct 2025 08:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6/T5lqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B7310E19C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759910482; x=1791446482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KWFhPNUybRQ4w59lq0OUVs+PBcV5/BMV3WW8r2I4EUk=;
 b=b6/T5lqCgIwNrg+0acCqvatebBSIcVYv8fRGQ4CJ0qKLUeOUVY5mjqAY
 uShfmsyt6YsOADd3XdEoj9tACxEOr48/IBbMLsbvx1xXTjV+uB01HQ0Un
 ugg2t5EHULd42obul2P2AUkS/MHFJockOfHCm6D33lMOAysOOJtcbX/rT
 dxUV8R4ZipjsLLN9f+szUYPWYU37rL1de2tGqXdTjTqy6MbBwaoa32jti
 SqPt1SmngV+KzBEBSStjKLS630TNIb0Ed1sR5C50h3dD9nX0gIb/YyOa9
 eHEdvyb23PkkrYq+Ou3jN+yP8Z09wUrRXVzWWHTN4B0SZyUsZZJzF48Ls w==;
X-CSE-ConnectionGUID: y79jIAj+Rr2YiLpfMUlHdQ==
X-CSE-MsgGUID: /McF9qCQTVOlEGEC6UjBiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62195418"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="62195418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:01:21 -0700
X-CSE-ConnectionGUID: a3dayUy+R+mItPdKfz25lw==
X-CSE-MsgGUID: Fxa4DnamRlGudjY1quKn8w==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.169])
 by fmviesa003.fm.intel.com with SMTP; 08 Oct 2025 01:01:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 08 Oct 2025 11:01:14 +0300
Date: Wed, 8 Oct 2025 11:01:14 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <aOYaSh5rlCElWurt@kuha.fi.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
 <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
 <aNu9eRb7dqnEjgaf@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNu9eRb7dqnEjgaf@black.igk.intel.com>
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

Hi,

On Tue, Sep 30, 2025 at 01:22:33PM +0200, Raag Jadav wrote:
> On Tue, Sep 30, 2025 at 01:13:57PM +0200, Andi Shyti wrote:
> > Hi Raag,
> > 
> > On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> > > I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> > > it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Awesome, thanks Andi.
> 
> Heikki, I can integrate your DISABLE_MSI changes which I'm assuming
> will be in the same path here?

Yes, that would be awesome!

> I know we're in the merge window but let me know how you'd want to
> proceed.

I think it would make sense to just take care of that DISABLE_MSI (bit
29) in this patch. There's not point in adding a separate patch for
it. So if you can take care of it, that would be great!

P.S.

Espoo site closure is still keeping me busy, so I will be extra slow
with responses for while longer. I will be completely unreachable next
week (WW42).

-- 
heikki
