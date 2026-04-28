Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A52FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 12:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68CD10ECE6;
	Tue, 28 Apr 2026 12:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B9rrVY5+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1401710ECE6
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 12:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2986A61119;
 Tue, 28 Apr 2026 12:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC5CC2BCAF;
 Tue, 28 Apr 2026 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777381035;
 bh=fS2RvXf+WjsMVkaheciMwEnE3zqMxno/QCbgKi9UTVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9rrVY5+Own0VQhNBuo2b2UZbZCgKMxCSSZVhWHsGYvM9dnka0iDAUXBPn4ggnarT
 rZtg7qqZtlTMtwzmgKB1r/HYkSHecBTg8gJ9kpTrmmf+kanTFKk7CT6iWzh/QxYuQl
 lkBcvRVkJSPvbOhgmNUylJKUJ2Z9tSzrHEYmdP2gzoO4/DUku9dndYCPhbra6FND54
 RGkjdbA3gheW+sBVmaqiTEwfNcybrq0SSdyLybd4MYsiingGAd9F3GmNMy7KwHBPHv
 jIBrOg9BXmNSIeeBOroA+E3Dq6KAfRfQs0KLkYwb0uqxdpvuFMURG2TdM9gRgs7l2D
 UnxpLftE4+4lQ==
Date: Tue, 28 Apr 2026 14:57:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>, 
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, 
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, 
 mallesh.koujalagi@intel.com, andi.shyti@intel.com, rodrigo.vivi@intel.com, 
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <afCuTKxpGWoeJSC2@zenone.zhora.eu>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-3-soham.purkait@intel.com>
 <f9b1624f-543a-45dd-ad02-6a656999a1e3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9b1624f-543a-45dd-ad02-6a656999a1e3@intel.com>
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

Hi Riana,

> > +/**
> > + * xe_ras_init - Initialize Xe RAS
> > + * @xe: xe device instance
> > + *
> > + * Initialize Xe RAS
> > + */
> > +void xe_ras_init(struct xe_device *xe)
> > +{
> > +	int ret;
> > +
> > +	if (!xe->info.has_sysctrl)
> > +		return;
> > +
> > +	ret = gpu_health_indicator_sysfs_init(xe);
> > +	if (ret)
> > +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
> 
> Should we fail probe here?

No. If the driver is still working why should we fail probe on
purpose?

Andi
