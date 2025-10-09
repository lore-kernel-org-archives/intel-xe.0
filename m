Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A5DCCA471
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 06:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6EA10E917;
	Thu,  9 Oct 2025 06:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3R2Nf3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5010E915
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 06:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759990363; x=1791526363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8CB3AQn5mO2w7kuGFF/dsPAEiKu/Irxewa9Mj17wuq4=;
 b=U3R2Nf3W7QdqpUWAa3E/4AXmRnKp9h0gNSxhdCYn0joAeK+6D+AYUSX6
 PrRn+SkzGv842oNyaF4/rD50PFHc/XhLQuBlTPwrKcV2wLi9OrlEokexf
 XgE8PqBKDTkqRSM139hkbJeQUs7+VPp3ROJe9bqlSWZ96P9oM/2HJrlG6
 2UH6XAXI3laQkDwt+44X1hqvulAICygGXFP8jOS8v9u+D4V4nbkvz5S8e
 qLHNZsValLTKbSROqhilc7vsxSxrfJZFNd6ecwFJVCB7tK3RVPP72F9zy
 QWQhuM6qwdpL46YJrG2ypOHUDYAfm5zdDgbZdwoiht5C1UgTcBdAZWACv w==;
X-CSE-ConnectionGUID: KoWSKUNPT1KqYiBn5NHC9w==
X-CSE-MsgGUID: mo/IvSXQSA+Avw08Ni2ZtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73538358"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="73538358"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:12:43 -0700
X-CSE-ConnectionGUID: ISU4v+2WTKulGCWEQl0YbQ==
X-CSE-MsgGUID: D+xOWF30RD+qSRyEQqkgfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="217719107"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:12:42 -0700
Date: Thu, 9 Oct 2025 08:12:38 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <aOdSVoKhHIClGgKK@black.igk.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
 <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
 <aNu9eRb7dqnEjgaf@black.igk.intel.com>
 <aOYaSh5rlCElWurt@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYaSh5rlCElWurt@kuha.fi.intel.com>
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

On Wed, Oct 08, 2025 at 11:01:14AM +0300, Heikki Krogerus wrote:
> On Tue, Sep 30, 2025 at 01:22:33PM +0200, Raag Jadav wrote:
> > On Tue, Sep 30, 2025 at 01:13:57PM +0200, Andi Shyti wrote:
> > > Hi Raag,
> > > 
> > > On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> > > > I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> > > > it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > 
> > Awesome, thanks Andi.
> > 
> > Heikki, I can integrate your DISABLE_MSI changes which I'm assuming
> > will be in the same path here?
> 
> Yes, that would be awesome!
> 
> > I know we're in the merge window but let me know how you'd want to
> > proceed.
> 
> I think it would make sense to just take care of that DISABLE_MSI (bit
> 29) in this patch. There's not point in adding a separate patch for
> it. So if you can take care of it, that would be great!
> 
> P.S.
> 
> Espoo site closure is still keeping me busy, so I will be extra slow
> with responses for while longer. I will be completely unreachable next
> week (WW42).

I already miss black :(

Raag
