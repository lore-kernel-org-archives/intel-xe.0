Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B94CC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7EC10E26E;
	Tue, 28 Jul 2026 15:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZoE/eWSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F7E10E26E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785253855; x=1816789855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6z5XRukXfm8FKEfmwqTb+byabOdIJDVmwC4BbmIGDQA=;
 b=ZoE/eWSS/LthmuDiWJlG2qRXUcfcMvM5d0zB4u8y883DoOUEPiRtQ7Xn
 2sFfTwt2FdeH9W5PZDpsznoo6i6h0mH42CjjzMG5OIbWAH3cif8chJFSF
 eq5XAQcBp6BNt2mHdeVurQyDqVhmfAbhCdG3ZdrbELGRPLitVDc01vwAX
 buF2BpvPRUSXp3EQuUaUjQmWqoSFAb50lpUamkyAa7Pu2JFBKpwuQHOWp
 PlWu0KkcSXrXDHlYLzNyJItrIrMFZqJiIhbUm3aZE3O6zHErco9pDAG/n
 KlzuOUwkD/2iD3sSI0Il5X/eU1EltGGKDJgu7HTZdGNue34ZgbBFtepsy g==;
X-CSE-ConnectionGUID: TElqLWBRSFiFmGiCzvVsIw==
X-CSE-MsgGUID: 1tmkNUA9TNW6uoZZHXWcAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85695965"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85695965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:50:55 -0700
X-CSE-ConnectionGUID: 7wxUxp9ETQq1dRglBa6EqA==
X-CSE-MsgGUID: k3QUJyhOQeeQ6EKKEtFOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="255816658"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP; 28 Jul 2026 08:50:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 28AFC99; Tue, 28 Jul 2026 17:50:51 +0200 (CEST)
Date: Tue, 28 Jul 2026 17:50:51 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 0/3] drm/xe/i2c: alerts and controller enabling
 modifications
Message-ID: <amjP22-2VVk0QgyH@black.igk.intel.com>
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
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

On Wed, Jul 22, 2026 at 03:35:51PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> Changed since v5:
> - Leaving the interrupt de-asserting to the firmware.
> - Re-asserting the interrupt before declaring the device wedged.
> - Preventing the SMBus Alert from being masked.
> 
> v5: https://lore.kernel.org/lkml/20260715153153.1243751-1-heikki.krogerus@linux.intel.com/
> v4: https://lore.kernel.org/lkml/20260713155601.711389-1-heikki.krogerus@linux.intel.com/
> v2: https://lore.kernel.org/lkml/20260625125939.429078-1-heikki.krogerus@linux.intel.com/
> v1: https://lore.kernel.org/lkml/20260622114759.3464047-1-heikki.krogerus@linux.intel.com/
> 
> Heikki Krogerus (3):
>   i2c: designware: Global register definitions
>   drm/xe/i2c: Fix the interrupt handling
>   drm/xe/i2c: Keep the i2c controller always enabled
> 
>  MAINTAINERS                                |   1 +
>  drivers/gpu/drm/xe/Makefile                |   4 +-
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h      |   2 +
>  drivers/gpu/drm/xe/xe_amc.c                | 187 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_amc.h                |  25 +++
>  drivers/gpu/drm/xe/xe_i2c.c                | 165 +++++++++---------
>  drivers/gpu/drm/xe/xe_i2c.h                |  14 +-
>  drivers/i2c/busses/i2c-designware-common.c |   2 +
>  drivers/i2c/busses/i2c-designware-core.h   |  85 +---------
>  drivers/i2c/busses/i2c-designware-master.c |   2 +
>  drivers/i2c/busses/i2c-designware-slave.c  |   2 +
>  include/linux/designware_i2c.h             | 107 ++++++++++++
>  12 files changed, 431 insertions(+), 165 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_amc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_amc.h
>  create mode 100644 include/linux/designware_i2c.h

One more fix is needed for this series. Raag noticed that the i2c
driver accesses the registers after the drm device is declared wedget.
The i2c adapter is suspended after the device is declared wedged, and
the driver's suspend callback then accesses the registers.

Thanks,

-- 
heikki
