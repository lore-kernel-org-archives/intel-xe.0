Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33EAC83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 11:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90F710E216;
	Mon, 30 Jun 2025 11:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGZMiKQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3753210E216
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751284768; x=1782820768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PSmMpH9CH+p3L8SXyMXOWEil3/qqIcHitztY6zSNvkQ=;
 b=LGZMiKQcfTqDzvcPLuIhz6JjNENaB1oqm4rZD6OMQbJ7KTnOVFgbdr7F
 nV0EPeuJZEE+4xOzs1z5M33QEkKsfFMJkd1jv6vRSvLP51DBXlOzXjvUK
 j+0DAIU0tRUgyhtj37sM5wwv179QmStMvD9AOSGULMbGELF8KuUPjR4AM
 qVGwSX5U+1cJyTLS05rJSWmBDyomJxUiktUcipwYy45B5Q/Fah/mo6aJx
 Hbk81Rz4RGk0jjaNbiEh7XDDWlwjJfL0xjQDOxfF+9dALnC2DSwk7+jx2
 aDr83E0cVyFQUIb/KxOzrk41SQ6Vyp6IQLpcox/pjLs8c/kD/qpvOiz71 Q==;
X-CSE-ConnectionGUID: Zk8wfXSYSlm43hvkX4SB7w==
X-CSE-MsgGUID: yaN5RUldTweeY+ROnCKM9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52737863"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="52737863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 04:59:27 -0700
X-CSE-ConnectionGUID: CcwZZ7rATIKhWRjrylVmew==
X-CSE-MsgGUID: 7abXUxSOQ1iqzD67eoF71w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="157989007"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa004.jf.intel.com with SMTP; 30 Jun 2025 04:59:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 30 Jun 2025 14:59:21 +0300
Date: Mon, 30 Jun 2025 14:59:21 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com> <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGJg0FZK__xYGP7C@smile.fi.intel.com>
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

On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > 
> > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > >  
> > > > > >  	dev->dev = device;
> > > > > >  	dev->irq = irq;
> > > > > > +	dev->flags = flags;
> > > > > 
> > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > 
> > > > in between, it is introduced a new one:
> > > > flags |= ACCESS_POLLING;
> > > > 
> > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > it let the assignment to the last, along with the group.
> > > 
> > > I still don't get. The cited code is complete equivalent.
> > 
> > This was requested by Jarkko.
> 
> Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> required?

You need to ask why from Jarkko - I did not really question him on
this one. Unfortunately his on vacation at the moment. I can drop
this, but then I'll have to drop also Jarkko's ACK.

I think we already agreed that this function, and probable the entire
file, need to be refactored a bit, so would you mind much if we just
went ahead with this as it is?

I'm asking that also because I don't have means or time to test this
anymore before I start my vacation.

thanks,

-- 
heikki
