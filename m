Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6AE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 20:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F1510E028;
	Thu, 19 Dec 2024 20:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3KC8FlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B9310E028
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734641602; x=1766177602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=95DKwrrD/B5sv+05p2wZ+mI+nA+tsxkqZSRd4hK0gyM=;
 b=P3KC8FlCN9xjoUmPzTBnNnX6d5FXmo9apkFhTDHSZXUQcOPv3zZ80ksc
 0GbTsx74CiL/Gxradh2rBV5Sukhg5LpsCMJByFI/bo4oRRwPO6x8IaD6E
 e6hnI7tUtikxVK2YpAGvQZpuTwcVP0SAU4jg3N3N/cxZ5coHUQSjHfp3f
 hUMUYlovdPzwpvVVe+NY3x5cHO2MDBxO8jSdCpSCJ5fJaH3NEuIW/+ylG
 TTodvIMxlxTmuD+G7RXElcnfYRjoUfo/Xt8GMsEwe7HoGVVEqgGNIojFu
 cM8qx9MbL5neAnZn1Jv18Hf+Z6VYBgN9UyZWMCnrBdsWa853aQNIZROF+ A==;
X-CSE-ConnectionGUID: 7SZwD00BRDeCdIxMA4mcnQ==
X-CSE-MsgGUID: JpnIdk3KSd6DUpId08zvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34498241"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34498241"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:53:22 -0800
X-CSE-ConnectionGUID: 7bPBUQUSSrW5R93NA9PWYw==
X-CSE-MsgGUID: aVM1BlH2Q0GXG8uiDQo7xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103314807"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:53:18 -0800
Date: Thu, 19 Dec 2024 22:53:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-xe@lists.freedesktop.org, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com
Subject: Re: [PATCH v6 2/7] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <Z2SHu_JgmAPZcmeB@black.fi.intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
 <03e289da2ba0426649774b2a68569003c2aa0945.1734427624.git.harish.chegondi@intel.com>
 <854j322gl8.wl-ashutosh.dixit@intel.com>
 <Z2NR9oP6zdD41RGe@intel.com>
 <85ttaz1vub.wl-ashutosh.dixit@intel.com>
 <Z2SCKvfqjruxRnQp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2SCKvfqjruxRnQp@intel.com>
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

On Thu, Dec 19, 2024 at 12:29:30PM -0800, Harish Chegondi wrote:
> On Thu, Dec 19, 2024 at 08:27:56AM -0800, Dixit, Ashutosh wrote:
> > On Wed, 18 Dec 2024 14:51:34 -0800, Harish Chegondi wrote:
> > >
> > > On Tue, Dec 17, 2024 at 12:35:15PM -0800, Dixit, Ashutosh wrote:
> > > > On Tue, 17 Dec 2024 01:46:52 -0800, Harish Chegondi wrote:
> > > > >
> > > >
> > > > Hi Harish,
> > > >
> > > > Only reviewing the uapi once again.
> > > >
> > > > > A user space consumer for this feature is Mesa.
> > > > >
> > > > > Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> > > >
> > > > Mesa PR should be in the cover letter, not in the patch itself. And we'll
> > > > need to eventually show that the Mesa PR is consuming all aspects of the
> > > > uapi being introduced.
> > > Okay, will fix in the next patch series. Mesa PR still need some uAPI
> > > changes I made in this patch series.
> > > >
> > > > >
> > > > > v6: Change the input sampling rate to GPU cycles instead of
> > > > >     GPU cycles multiplier.
> > > >
> > > > Note that if your series is v6 each patch in the series is not necessarily
> > > > v6. A patch can be v2 e.g. So you should capture the version and changelog
> > > > of each patch separately.
> > > Makes sense. But how would the reviewers know if a patch v2 in a series
> > > v6 has been updated?
> > 
> > They can check, say in v7 if the patch has gone from v2 to v3. And anyway
> > reviewers need to be aware of what is going on. There should be no
> > significant changes to the patch after a R-b, otherwise typically the patch
> > will change and it versions increment.
> > 
> > With what you are doing, the patch will go from v6 to v7 even if there are
> > no changes to the patch.
> When I do a git format-patch, I specify the --subject-prefix="PATCH version".
> Since this is a patch series, all the patches in the series will be
> assigned the new version even though I don't change some of the patches
> in the series. Is there a way I can specify the version for individual patches?

https://kernelnewbies.org/FirstKernelPatch -> "Versioning patchsets"

Raag
