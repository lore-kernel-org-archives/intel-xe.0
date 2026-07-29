Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE9C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0E710ECA1;
	Wed, 29 Jul 2026 15:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m08ILuHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DAE10ECA1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785339061; x=1816875061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UQYh//v/OZZ8x9qRtEKztvsAkHsJ2fm3i4llQjIYcms=;
 b=m08ILuHw7B/e64b7eA601VpWPWyGw87a18l0LFPz5xhIejBKDunY5kK5
 IlYN1WOfA9yDEInPot9iKefEATOs3UvFxlR4faxOcVVy0Nv2nPEME0gDw
 SJsWJL2ii2Tm6eRbdlqYiS9wdxiKNRjIk+VwHICFrTmWBOTwtKc95Y7zU
 uvo4ej4REyavIgSWi2aQAPvpCFiH/sI2adPBNDbMYJB2qpkzcikdP6ctD
 7g5OGgJEqyX1BZP4Qju9jzwE9yp4Ni8d7j/Cy/0ZCkoRCg4qs88og6HOm
 wUansQCphs4HSx6ABBj7r8n87FBdEd6CtuLHgJEg8qe86iBD7mLvThYs5 g==;
X-CSE-ConnectionGUID: NYGRljp/QrOROsDZoFtOWg==
X-CSE-MsgGUID: IwhxjIE8Tc6NF+k2OoFS8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89626998"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89626998"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:31:01 -0700
X-CSE-ConnectionGUID: OsT/OjzXQTyZMW9blDWJDg==
X-CSE-MsgGUID: ykCgXDpVSZeLCaP4tSi9EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258798455"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:30:59 -0700
Date: Wed, 29 Jul 2026 17:30:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
Message-ID: <amocr6YvYCux0ylv@black.igk.intel.com>
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
 <20260722133554.2079612-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722133554.2079612-3-heikki.krogerus@linux.intel.com>
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

On Wed, Jul 22, 2026 at 03:35:53PM +0200, Heikki Krogerus wrote:
> The platforms that support the interrupt from the I2C
> adapter can not handle the amount of interrupts the adapter
> generates because of the way the IRQ is routed in the
> hardware. The I2C controller driver has to be kept in
> polling mode because of that.
> 
> The AMC MCU can still generate critical alerts that have to
> be handled. The interrupt from SMBus Alert is left enabled
> and handled separately in the Xe. The alerts from the AMC
> will cause the device to be declared wedged for now.
> 
> Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ramesh Babu B <ramesh.babu.b@intel.com>
> Signed-off-by: Ramesh Babu B <ramesh.babu.b@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Assuming no further changes came up during validation

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
