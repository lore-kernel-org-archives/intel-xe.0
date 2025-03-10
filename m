Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E049C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D6B10E495;
	Mon, 10 Mar 2025 17:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTxNqAn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9205510E495
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741627605; x=1773163605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PhaYTFzvtD22RFa3m87/pWE7QxWn2JBjmoyQoSx4m2o=;
 b=KTxNqAn39kNQutkMOr2lWDp4Biuk9j7eoYxfDLPJUp555s2JHeBCXPYd
 Nbk1JwTV2mKXxiLKV8l4fAjLNcDsCqGBvXvn2ogKs5f4ysJ/0EhYE5TZX
 G39FRiKo5oRGb61jTMahxgkXDNqGRrocqvSS40nLBl1dGSSssSdW1mEwZ
 swAav/ncZrIj2cSx4amrWjVINeZDpOUVM3AvtmtNOSXmFwLbY+lRV3XCh
 f76ZEVPR0OmkhICWE4HomtBuymZRO9jz7d9wWRmC8HVU1iM6rxCXEB+p2
 +1PYsAzmwSXJcjfgOGpqAdyuhA9nQAT4Oo+Cv15YfgDhG1CORSH1HPQFn w==;
X-CSE-ConnectionGUID: L+qnpQRZQs68qvpD5K97Vw==
X-CSE-MsgGUID: 5AKtkX46QRO8faR3r+ToIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42486509"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42486509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:26:45 -0700
X-CSE-ConnectionGUID: TUdRFzcCToy/PIzr5b0QaA==
X-CSE-MsgGUID: OWDsAiEYSrGQd32mXDiUiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120946569"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:26:42 -0700
Date: Mon, 10 Mar 2025 19:26:38 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z88gzsRUTJc-gSqc@black.fi.intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com> <Z8xsYAhf96iptwm2@black.fi.intel.com>
 <Z88a17Fr2f-8cuad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z88a17Fr2f-8cuad@intel.com>
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

On Mon, Mar 10, 2025 at 01:01:11PM -0400, Rodrigo Vivi wrote:
> On Sat, Mar 08, 2025 at 06:12:16PM +0200, Raag Jadav wrote:
> > On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> > > On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:
> > 
> > ...
> > 
> > > > @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
> > > >  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> > > >  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> > > >  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> > > > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> > > 
> > > here as well... I believe we should not expose the fan files if !has_fan_control
> > 
> > I'm not sure if I'm following here. We'll still to define channel attributes
> > to be able to let hwmon expose them at runtime based on has_fan_control flag.
> > 
> > One way I could think of is to do a manual sysfs_create_file(), but at that
> > point it defeats the purpose of having hwmon.
> 
> Well, there might be a way. I don't believe we are the only hwmon users with this
> case.
> 
> Ashutosh, Karthik, thoughts on this?
> 
> Have you guys seen around hwmon a way to avoid creating an entry based on the
> platform? Like, in this case, avoid fan interfaces to appear at all on a platform
> that doesn't support fan control?

Isn't that the whole point of ->is_visible(), and isn't that what we're already
doing here?

Raag
