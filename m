Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2FEC55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A57810EEBA;
	Thu, 30 Jul 2026 11:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/2OhGnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894F310EEB7
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409635; x=1816945635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/o/SerpQauclJcfqXGbAFVcRHiTES4S4YrbmywNJjDQ=;
 b=R/2OhGnWQIE3DtSLvDC9iZ2eIebDdzqVZ5aB3bxd8wYO5ovdJDcCkWit
 Y75g5y6y5nMN6WnmlVDq5l1e1iBEWptWu7mMvhokomVJ3vpws624E6TLf
 xvE+B2JVOsmuk/nMIIorTCt89w2sWNJh7wrHsUUv5CLjh0ve5npygQded
 ubW8BPe2HcaRT0/HmSU3FQuoivBJHscqKavt943kvhwO4pty+nv+IdG1i
 cklTAJM6jv0ILZ91kX03oN9SQ9INXnP3OoMcWUEjx3zy80/vsihoEhaCu
 mKct6gBei8aEQfn0A7EF8YiHf6BY8KaHUtiFLS600WlLQoCojyi7b/83g w==;
X-CSE-ConnectionGUID: WLhuiivdTYiINF5KL49e1w==
X-CSE-MsgGUID: K8Vqz5kkQPuBZyAQJu/VHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103563821"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="103563821"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:07:13 -0700
X-CSE-ConnectionGUID: JY0UaRYwRYmdduBRbuko5Q==
X-CSE-MsgGUID: gBlLHJBnRWGMrUoThehMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260337059"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP; 30 Jul 2026 04:07:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
 id AD50599; Thu, 30 Jul 2026 13:07:09 +0200 (CEST)
Date: Thu, 30 Jul 2026 13:07:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 3/3] drm/xe/i2c: Keep the i2c controller always enabled
Message-ID: <20260730110709.GE20844@black.igk.intel.com>
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
 <20260722133554.2079612-4-heikki.krogerus@linux.intel.com>
 <amodgov-jMqxPiwV@black.igk.intel.com>
 <amsvj5ARbbGDiWp-@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amsvj5ARbbGDiWp-@black.igk.intel.com>
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

On Thu, Jul 30, 2026 at 01:03:43PM +0200, Heikki Krogerus wrote:
> On Wed, Jul 29, 2026 at 05:34:26PM +0200, Raag Jadav wrote:
> > On Wed, Jul 22, 2026 at 03:35:54PM +0200, Heikki Krogerus wrote:
> > > Some platforms make an assumption that the i2c controller's
> > > enabled state indicates also the power state of the
> > > controller. This can create a problem when the controller is
> > > in disabled state, because the hardware may assume
> > > incorrectly that it is then also in low-power state.
> > > 
> > > To fix this, the controller is kept enabled by taking over
> > > the IC_ENABLE register. The controller has to be disabled
> > > when the configuration is updated and when the target
> > > address or the slave address are assigned, so disabling it
> > > when IC_CON, IC_TAR or IC_SAR registers are programmed, and
> > > then re-enabling it again.
> > > 
> > > Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > I'll rely on Andy and Mika's disposition on this one.
> 
> Mika should be back from vacation.

Looks reasonable, no objections from me :)
