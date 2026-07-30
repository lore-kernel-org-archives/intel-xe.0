Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF69C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E8810EE95;
	Thu, 30 Jul 2026 11:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHOUfCx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7916610E661
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409428; x=1816945428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vR3KOP2wNni1PSsIaEaFJckIWBDQP1BYlMo4rQ2E4NA=;
 b=NHOUfCx4NHSOU6afwgQH7o6gdMN37ybfWzw7Q1pBkkcj4uHZ5SQ4KJPN
 gE4Ks2LZjpa0vCOrl/e20ziSYGcy2LBvCo3EzTpSo3dvZx0vdLq175Fq2
 e2PWS427EAgY6QKF0ZGG2F7ej1vHin/cx4oPKR6Ja3M9LEbDuBSZ0KDoo
 +OSCgJQGiXDdYC/N51FLARPpmOsuMdpcwhkEF3x/8a9fHy+/oU0EBe23a
 mTR5ZRGpk1erYqTaeH7enA3h9RApVlMbWwuWStYQXETe0S9g8VZ2MxfrC
 U9MzE9+JDqTpLAEGxzirQj61ujZqwnuzj0ZgJ48DsokHvibOkCw/1ctcI g==;
X-CSE-ConnectionGUID: GhCPmld+QSC4a6/IhHb+mg==
X-CSE-MsgGUID: 7ht6d5oiTlSXgv2p/kNIoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182102"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182102"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:03:48 -0700
X-CSE-ConnectionGUID: lnFdRTJDQ8+JwW2klVOUzg==
X-CSE-MsgGUID: 0/0RwJK1TSax64VhvQt5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="256933272"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2026 04:03:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 5AF4999; Thu, 30 Jul 2026 13:03:43 +0200 (CEST)
Date: Thu, 30 Jul 2026 13:03:43 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 3/3] drm/xe/i2c: Keep the i2c controller always enabled
Message-ID: <amsvj5ARbbGDiWp-@black.igk.intel.com>
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
 <20260722133554.2079612-4-heikki.krogerus@linux.intel.com>
 <amodgov-jMqxPiwV@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amodgov-jMqxPiwV@black.igk.intel.com>
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

On Wed, Jul 29, 2026 at 05:34:26PM +0200, Raag Jadav wrote:
> On Wed, Jul 22, 2026 at 03:35:54PM +0200, Heikki Krogerus wrote:
> > Some platforms make an assumption that the i2c controller's
> > enabled state indicates also the power state of the
> > controller. This can create a problem when the controller is
> > in disabled state, because the hardware may assume
> > incorrectly that it is then also in low-power state.
> > 
> > To fix this, the controller is kept enabled by taking over
> > the IC_ENABLE register. The controller has to be disabled
> > when the configuration is updated and when the target
> > address or the slave address are assigned, so disabling it
> > when IC_CON, IC_TAR or IC_SAR registers are programmed, and
> > then re-enabling it again.
> > 
> > Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> I'll rely on Andy and Mika's disposition on this one.

Mika should be back from vacation.

-- 
heikki
