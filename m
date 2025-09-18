Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B97CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 08:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9C710E5D9;
	Thu, 18 Sep 2025 08:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+lcQhQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE1F10E5D9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758183245; x=1789719245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+IYcmc7mUHcfYKBck95eJ/gmjDmTIIUj5Bl+tkD6STw=;
 b=T+lcQhQ6jJNn1LlhegTA+Njne3/7tEMSLVntkENlQ5wcyHMU3HN3Y8gK
 e3xkk62CW5TL5ouRwtyh6MJ+BRVpNV9K6Dvu53veQ0rT0B3AlNl9/fsgg
 bBwBxUcEMbQCFvXiKxmiO3L5DZ2qOgjdTbp4pfR2j4KRIJOVXVtWP9ppl
 To661PdbhaNBEecnmCZK3k+O2riVCZBPKwgBnwyiOijf9Uo5znMh+UFig
 k2WUd4oDJ2PEM9yw7GQ3viUGSZAdk4qDD/e2zxq5b4/OA5SOJefoW1AjL
 BHAroObarzcN1q5PhSqBH43prczCWdaS8gVNFwHQKkuvpJRfgR+f/yFKE A==;
X-CSE-ConnectionGUID: 9ZUY4eSBSPCpJYwmz/f5xg==
X-CSE-MsgGUID: hF5lDQG7TrOhxCR0w6SR7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60571001"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60571001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 01:14:04 -0700
X-CSE-ConnectionGUID: aY4kTZTQQ+GdW3FFfXhgRw==
X-CSE-MsgGUID: N2HM+DLITBm5kPBpy3QqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175872019"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 01:14:03 -0700
Date: Thu, 18 Sep 2025 10:14:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sysfs: Simplify sysfs registration
Message-ID: <aMu_SAKsM2ytBdm-@black.igk.intel.com>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
 <20250916170029.3313-3-michal.wajdeczko@intel.com>
 <aMpS02yLhBs5igpM@black.igk.intel.com>
 <be9d95e9-e02c-452f-a547-f0d3a1ae050e@intel.com>
 <aMqS_SRH3f6PAdM2@black.igk.intel.com>
 <wfzmbfx3mnre7lvzquhpxxbcks37orlqpfdeam4awzpa6d5kx6@wwnysmofevfx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wfzmbfx3mnre7lvzquhpxxbcks37orlqpfdeam4awzpa6d5kx6@wwnysmofevfx>
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

On Wed, Sep 17, 2025 at 02:38:14PM -0500, Lucas De Marchi wrote:
> On Wed, Sep 17, 2025 at 12:52:45PM +0200, Raag Jadav wrote:
> > On Wed, Sep 17, 2025 at 12:24:24PM +0200, Michal Wajdeczko wrote:
> > > On 9/17/2025 8:18 AM, Raag Jadav wrote:
> > > > On Tue, Sep 16, 2025 at 07:00:29PM +0200, Michal Wajdeczko wrote:
> > > > > Instead of manually maintaining each sysfs file define and use
> > > > > attribute groups and register them using device managed function.

Nit: Although this gets the point across, is there a punctuation missing here
or am I reading it wrong?

> > > > > Then use is_visible() to filter-out unsupported attributes.

...

> > > > >  	xe_pm_runtime_put(xe);
> > > >
> > > > The device is already in D0 while probing so runtime PM is probably
> > > > not needed here.
> > > 
> > > true, but this is how it was initially coded and I didn't want to change it now
> > > 
> > > we can either drop it completely or replace with
> > > 
> > > 	xe_pm_runtime_get_noresume(xe);
> > > 	xe_pm_runtime_put(xe);
> > > 
> > > do you want this to be done as part of this series or it can be done later as follow-up?
> > 
> > Since there's no functional impact, I don't see any harm in dropping
> > it as part of refactoring here. But whatever the maintainers think is
> > best.
> 
> Let's keep those changes separate so we avoid bundling multiple changes
> in one patch. One small patch on top to do that doesn't hurt. Please
> send it when you can.

Sure, thanks.

Raag
