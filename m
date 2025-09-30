Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72597CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 11:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B8C10E2A8;
	Tue, 30 Sep 2025 11:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nd/tQQOk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C22510E2A8
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759231359; x=1790767359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zYkt69aYloWuR5pAmA1HTQzV+S5svI012zusCMHx9pA=;
 b=Nd/tQQOkv0PYZIsmI7k1XKtCDuQpCw1y7psL0TBQ7dI3JeOjfC7r3S4f
 gyAXTre6SY20S6ggKigMwzjJ/fpRxWszLBQ3C7T7piFkZI1JBE6rV7wV0
 uVqhVnZ+SAY09IC/+rqt81kgfCZZsPznzH0uD1TiGF0KVRxb4i4tHYb2g
 jDDSjEkLZKfGB1vIhfMJhdkQfKt3O1uqqGcOI2pcqRWA34ArpFvgP/shk
 5v2RMkUCJc5VM5nWpMAX2HAAp05PSdBQbjCEB+Giq62vKxCB5zBJcd/QQ
 HV2qE3S492HC3oHhYT5n2kfKTOFav6Xx0gdcPXe4rT4rQIUyuo1JZbl8K g==;
X-CSE-ConnectionGUID: s/+wZpzDQQWk0QG06x9wFw==
X-CSE-MsgGUID: Xt/+RrQ6R+mOVeM/y1UVKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61649129"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61649129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:22:38 -0700
X-CSE-ConnectionGUID: tN3PwUzdRty+n3WNWfsK2w==
X-CSE-MsgGUID: DId4wU6wSgqxnoizv4v2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178527968"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:22:37 -0700
Date: Tue, 30 Sep 2025 13:22:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, heikki.krogerus@linux.intel.com
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <aNu9eRb7dqnEjgaf@black.igk.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
 <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
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

On Tue, Sep 30, 2025 at 01:13:57PM +0200, Andi Shyti wrote:
> Hi Raag,
> 
> On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> > I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> > it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Awesome, thanks Andi.

Heikki, I can integrate your DISABLE_MSI changes which I'm assuming
will be in the same path here?

I know we're in the merge window but let me know how you'd want to
proceed.

Raag
