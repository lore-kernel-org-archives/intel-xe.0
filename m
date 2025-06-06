Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD882C5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 15:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA2710E38E;
	Fri,  6 Jun 2025 15:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNcOfSmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E4410E38E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749223775; x=1780759775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5H50Oumiex+kblI2l1xydB6nAtsXqXGIp30ZCU+Rwdk=;
 b=lNcOfSmWkacxdmVHZqaGFEwJwVwybgCm7MS0d3y6y/rdI5L77JPhl7ZU
 OyeInMzzla8ifRYozmKKnkR+IekacUFyH2F/to41C8ETUST4rKutv1GUC
 oQzApWbP0JQBprr0WTRUkymTsoFJwO5ETfuKtdRhVQFKQLRHHLT1/G/Dn
 t3uP4G2ZEvHuERumckQQ1aNRaes35tiRJont7q+SV4kFqFlEuIF0D+7TS
 Xh8WKGaT8RyfHTNw+n7bsfC7uviAaSL65VSzVOUuO4F324+nmSNnSMoGm
 ngG5o3ojOA8IXH8tdp4McMq2Lj+0OUI2Lamr3IcRlXHLXW0jZS+zvqhEH w==;
X-CSE-ConnectionGUID: MZHYQ3bjQDuob1ZoUFnpZg==
X-CSE-MsgGUID: vVaoR6Y0R8yYOitM3mw/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51454511"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51454511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:29:34 -0700
X-CSE-ConnectionGUID: Ejc93LrvTGW9pszRibxpLw==
X-CSE-MsgGUID: VUlKhYx6RiOKymvXqcsf+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="149691258"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:29:31 -0700
Date: Fri, 6 Jun 2025 18:29:28 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/pm: Wire up suspend/resume for I2C controller
Message-ID: <aEMJWGj-iwaFSzJx@black.fi.intel.com>
References: <20250602070818.701834-1-raag.jadav@intel.com>
 <aD2rsWvCNozyqqcM@kuha.fi.intel.com>
 <aD8z2oY6dPAUZupz@black.fi.intel.com>
 <sjqgy6d2lvsxvtmeu56r3rcwgkco22n3s6ct4vh2qbmpk5566r@caoxdrcf3nof>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sjqgy6d2lvsxvtmeu56r3rcwgkco22n3s6ct4vh2qbmpk5566r@caoxdrcf3nof>
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

On Fri, Jun 06, 2025 at 08:50:11AM -0500, Lucas De Marchi wrote:
> On Tue, Jun 03, 2025 at 08:41:46PM +0300, Raag Jadav wrote:
> > On Mon, Jun 02, 2025 at 04:48:33PM +0300, Heikki Krogerus wrote:
> > > On Mon, Jun 02, 2025 at 12:38:18PM +0530, Raag Jadav wrote:
> > > > Wire up suspend/resume handles for I2C controller to match its power
> > > > state with SGUnit.
> > > >
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >
> > > > This depends on I2C series by Heikki on [1].
> > > > [1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/
> > > 
> > > If it's okay to everybody, I'll include this to my series when I
> > > resend after the merge window is closed.
> > 
> > Let's give it a few days in case of any comments. If not, perhaps you can
> > include it.
> 
> It has to be included there as there's no way we can run CI otherwise.
> For proper CI run you can also send the dependent patch series as a
> squashed "FOR CI" first patch.

Sure. Now that it is reviewed, would be safe to include.

Raag
