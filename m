Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C77C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 15:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E8C10E141;
	Wed, 15 Jul 2026 15:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwhvXuEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F8110E141
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784127604; x=1815663604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JiXROtKbxqQGZb8SthpIP65GDaAPPh7cLSX8uJOkRsg=;
 b=lwhvXuEymKWAR/SOXJss0DpSGtFHWhUo1FqQwWoUVabzq7ednnlOsZMc
 dPrZEPOWGmXw0RN2VWUH+ToHgMtmRNmhRzralgnXeBF4krQwokx/L71Ha
 WigBaz+dr9XwABEtvBfPvvgw7oV6Ckm86DDSV07pPAiei0zPCefnaa01B
 VkHm/DZ+NFj2xF64aM1DOnBoIjADQdGCnGxleUYsV51/+g4CuZgtxWi/U
 Av8zXFkxYQHGAyGfIbGUbFvmnRWHBg3Figc1GSOzfihSoPLFNA/c9W14R
 d1YQp0tZSqEB9DGRLwo9UWmawE5yQQMQDcn9wRsRsiBrydmJAjovXwvaC Q==;
X-CSE-ConnectionGUID: 3p+xRAC0RjaHYKg3MUbvYQ==
X-CSE-MsgGUID: czo5QSIYQC2q5Wgwrnks7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110314472"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="110314472"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 08:00:03 -0700
X-CSE-ConnectionGUID: dmB0BYZpQcG2Uvu1+b/B0Q==
X-CSE-MsgGUID: wHMEosIsQnO3xw/BilGxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="260022398"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2026 08:00:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 43CAE95; Wed, 15 Jul 2026 16:59:59 +0200 (CEST)
Date: Wed, 15 Jul 2026 17:59:57 +0300
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
Subject: Re: [PATCH v4 2/3] drm/xe/i2c: Fix the interrupt handling
Message-ID: <alegbWVPz6oI_yMA@kuha>
References: <20260713155601.711389-1-heikki.krogerus@linux.intel.com>
 <20260713155601.711389-3-heikki.krogerus@linux.intel.com>
 <alcoDtq2aul-tA_h@black.igk.intel.com> <aldYjL2pxA7QxoLN@kuha>
 <ald1HG6KzjWb9CUK@black.igk.intel.com> <aleEReNBnQMy3-1E@kuha>
 <aleSjGxhStAiqLk6@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aleSjGxhStAiqLk6@kuha>
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

> Hi Raag,
> 
> > > > > > -	/* Forward interrupt to I2C adapter */
> > > > > > -	generic_handle_irq_safe(xe->i2c->adapter_irq);
> > > > > > +	xe_i2c_handle_smbus_alert(xe->i2c);
> > > > > 
> > > > > [1] Can we move the below re-assert code to wq now? Or do you suspect any
> > > > > side-effects?
> > > > 
> > > > I think that you know this better than I do. But at this point
> > > > interrupt is cleared, so why should we wait for the wq?
> > > 
> > > When does AMC clear the alert signal? Is it when you query from the wq?
> > > If the answer is yes, there's a possibility we might end up with an
> > > interrupt storm here.
> > > 
> > > > To play it safe, can we change this as a followup if necessary?
> > > 
> > > Sure, I'll leave it to you.
> > 
> > I'll move it to the wq. There are no side-effects.
> 
> Can you check does this work:

Nevermind. I'll send the next version.

Thanks,

-- 
heikki
