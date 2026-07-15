Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A67C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 10:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5BC10E16E;
	Wed, 15 Jul 2026 10:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRVLmt5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFAA10E16E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784109618; x=1815645618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v2/oeVbvWskqmg8+4PneDbKug9LAg3HtjSRz3sJ3AtU=;
 b=TRVLmt5bM7tyufyX1mTSroa6+MsSt8tLHfexxVi0JbH/6lzOFZPx/r34
 d16TXm1MwF6w12l79fJ17DTJf0et8MgeRNeSPisDcWYyStglzphL8LVBx
 b2tYDGhLSCHspulHPaSXCPTwaLAA+y9ZT/q/w5hATa6eCWmkDgqGj0Fd4
 u5tK/RDDZUTTBoL0RqCBqrgqj6z8Hp2YOz1M8KIyxROb+FGNFfxKRMWl1
 /f2oXn5dc2b2sgQjSGf8X6a2cLCxC8IPGtDPsLYBLnlAr624bP7trc9Si
 146xRkpdd94tdmq3tVOOXwPL2u1ux3FSc/X1UYYK/heOA8r2nw8C0cMe3 Q==;
X-CSE-ConnectionGUID: 48a0gDoNQYe9c5pTdPe5Pg==
X-CSE-MsgGUID: Ij8U0d31TAuNt6EZUMKPOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84939143"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84939143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 03:00:17 -0700
X-CSE-ConnectionGUID: pp9rFVKpTc2TN04+KzY72w==
X-CSE-MsgGUID: 6wOowi5XQW6aIG9oSLtwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="256784352"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP; 15 Jul 2026 03:00:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id B12D795; Wed, 15 Jul 2026 12:00:13 +0200 (CEST)
Date: Wed, 15 Jul 2026 13:00:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/xe/i2c: alerts and controller enabling
 modifications
Message-ID: <aldaLN5xc4GCC1_k@kuha>
References: <20260713155601.711389-1-heikki.krogerus@linux.intel.com>
 <alZbqH51wJjm_CVC@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZbqH51wJjm_CVC@intel.com>
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

Hi Rodrigo,

On Tue, Jul 14, 2026 at 11:54:16AM -0400, Rodrigo Vivi kirjoitti:
> On Mon, Jul 13, 2026 at 05:55:58PM +0200, Heikki Krogerus wrote:
> > Hi,
> > 
> > The hardware challenges that these patches address are so severe that I'm
> > marking both of them as fixes. In both cases the GPU may silently end up in
> > unresponsive state (or worse). The second patch has been refactored so that it
> > includes the direct AMC alert handling in Xe instead of the normal alert handler
> > registration. The subject lines were also changed to highlight the fact that
> > these are fixes. Ramesh helped me with the testing and with the implementation
> > for the AMC alert handling.
> > 
> > Changed since v2:
> > - Added Fixes tag to both patches.
> > - i2c-designware is no longer supplied with an interrupt so it will be in
> >   polling mode (ACCESS_POLLING will be enabled). The IRQ path in hardware can't
> >   handle the amount of interrupts the i2c controller generates. Only the
> >   interrupts from the SMBus Alert line are left enabled.
> > - The registration of the default smbus alert handler is dropped.
> > - The AMC alerts are handled directly in Xe. All the alerts will cause the
> >   device to be declared as wedged at least for now.
> > - Cleanups proposed by Raag.
> > 
> > v2: https://lore.kernel.org/lkml/20260625125939.429078-1-heikki.krogerus@linux.intel.com/
> > 
> > Changed since v1:
> > - Global header for the DesignWare I2C registers which meant a bit of
> >   patch refactoring.
> > - Selecting CONFIG_SMBUS in CONFIG_XE and handling smbus in xe_i2c.c instead of
> >   separate file.
> > - Storing the alert device to the client array and providing enum for the
> >   clients.
> > - Allowing other fields in the IC_ENABLE register to be updated except the
> >   Enable bit.
> > - Can't sleep in xe_i2c_disable() so using udelay().
> > 
> > v1: https://lore.kernel.org/lkml/20260622114759.3464047-1-heikki.krogerus@linux.intel.com/
> > 
> > This includes support for the SMBus alerts, and special handling for the
> > IC_ENABLE register.
> > 
> > Thanks,
> 
> 
> Please take a look to Shashiko review and let us know in case of false positives:
> https://sashiko.dev/#/patchset/20260713155601.711389-1-heikki.krogerus%40linux.intel.com

The high ones are false positive.

- The SMBus interrupts are not cleared the same way as the other
  interrupts.
- i2c-designware driver does not modify the timings unless it is
  supplied a clock device (struct clk).

The rest I'll check and fix as needed together with the modifications
proposed by Raag.

Thanks,

-- 
heikki
