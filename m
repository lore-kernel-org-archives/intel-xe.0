Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A3C5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 08:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C630C10E708;
	Mon, 10 Aug 2026 08:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeYgPsqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557210E708
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786350248; x=1817886248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yecm5Pn/SYUDaqs0J181mIZ9F3jtvO0zLQgM2AejaWU=;
 b=PeYgPsqiTt8kqcnZO8SQ/iiFp/nZp13XQ9ciW8gXJzN6jKGJ41rQOIG2
 gRHCTL2JOOIXszkwYV5y4oJqM9Aep1jofUl8WRwfLfP6SUslQiOf1zI4C
 ZiXrQomE9TSaSqUEvG47TWkS1TJvdV+zXjaqP6nLPYhZqziG+aW1Mswgf
 8btjzxnkboGRlezab6smaz+QepKH75t/z2LbDDE7CHGLbdyjW3+3lxEdd
 7QtYWo4O8jCgXMBtohN1OSsuk08j1QDNWSSbXoXKUX9egMpFT99fs5Q2E
 fWsej4BPAju4ScL7jHyQEd8/zj85LQSAqcgJXYILqNaRcYRp9ebRsSA+4 A==;
X-CSE-ConnectionGUID: qNKUcii5QsGSffAF1Pc1PQ==
X-CSE-MsgGUID: tnwV5L7LQuWHdVvNFoQ5vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97206177"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="97206177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 01:24:07 -0700
X-CSE-ConnectionGUID: 26I+uWa8QZ+UPiIbg+5hpA==
X-CSE-MsgGUID: s9+3uc2QSDSamFvDin4+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="256762990"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2026 01:24:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id D77F399; Mon, 10 Aug 2026 10:24:03 +0200 (CEST)
Date: Mon, 10 Aug 2026 10:24:03 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 2/3] drm/xe/i2c: Fix the interrupt handling
Message-ID: <anmKoxMONVxf5FoK@black.igk.intel.com>
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
 <20260722133554.2079612-3-heikki.krogerus@linux.intel.com>
 <anlbyVOUkafs0UHE@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anlbyVOUkafs0UHE@black.igk.intel.com>
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

On Mon, Aug 10, 2026 at 07:04:09AM +0200, Raag Jadav wrote:
> On Wed, Jul 22, 2026 at 03:35:53PM +0200, Heikki Krogerus wrote:
> > The platforms that support the interrupt from the I2C
> > adapter can not handle the amount of interrupts the adapter
> > generates because of the way the IRQ is routed in the
> > hardware. The I2C controller driver has to be kept in
> > polling mode because of that.
> > 
> > The AMC MCU can still generate critical alerts that have to
> > be handled. The interrupt from SMBus Alert is left enabled
> > and handled separately in the Xe. The alerts from the AMC
> > will cause the device to be declared wedged for now.
> 
> ...
> 
> > +	alert_reason = response.value;
> > +	dev_dbg(&client->dev, "Alert reason: %d\n", alert_reason);
> 
> This came up in one of the internal reports. We have quite a few call
> sites for wedging and it can happen due to various reasons from driver
> POV. We really need to identify the source from logs when it happens,
> so can we atleast have this one as dev_info()?
> 
> All the reasons are rare enough to not spam the logs and it shouldn't be
> a problem IMO.

Okay by me.

> I'm okay with doing it as a follow up if the series is already merged.

I don't think this has been taken anywhere yet. I'll send v7.

-- 
heikki
