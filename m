Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3180DC8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 18:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F7F10E054;
	Mon, 30 Jun 2025 18:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ozpNjsOB";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CDE10E054
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 18:21:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 623145C561E;
 Mon, 30 Jun 2025 18:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6084BC4CEE3;
 Mon, 30 Jun 2025 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751307693;
 bh=D7SvIQ7qLfmf890GvUDMQhyat5rR4m9URDnsk2eGFM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ozpNjsOBNIKuNYC69dz92zeAA3vVXStX5Vq5qo+PHmb6L1VoXpVXVkjtCtBeyePj3
 I75KQDUH2xC1bM7SIqh7vpU3N30dggu/r6b+80AH+o48/lGoymnDaSbJ7xvyCoAd2m
 ZWal0TC+MQ+/SZcZ5ZJRJomC+D5k2FgToUz3Esq3xzLe0jJytYY9vmHO7FKIWtbuTa
 cErJYvOY7SMYhJTC3IPMtSiUUgh4JUaPiAS+Ef/UpXg1mMrcrSNXMQ9Gy1jadjXyo+
 Undfw+1Z+jRRvumiO8QCBWp87qy5/u72/KTXYhx0GbKIhmdjtY4QnJ5Dqs+mCIKzRz
 FGuP6LUOoxhvA==
Date: Mon, 30 Jun 2025 20:21:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>, "Adatrao,
 Srinivasa" <srinivasa.adatrao@intel.com>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <crx77prygiqsi4zjwjtzy2shy4agcdtvj6wcg5qjmpzzysh4j2@7fipw7rhrpmw>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com> <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
 <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
 <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
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

Hi Andy,

On Mon, Jun 30, 2025 at 04:16:56PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 02:59:21PM +0300, Heikki Krogerus wrote:
> > On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > > > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > > > >  {
> > > > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > > > 
> > > > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > >  
> > > > > > > >  	dev->dev = device;
> > > > > > > >  	dev->irq = irq;
> > > > > > > > +	dev->flags = flags;
> > > > > > > 
> > > > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > > > 
> > > > > > in between, it is introduced a new one:
> > > > > > flags |= ACCESS_POLLING;
> > > > > > 
> > > > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > > > it let the assignment to the last, along with the group.
> > > > > 
> > > > > I still don't get. The cited code is complete equivalent.
> > > > 
> > > > This was requested by Jarkko.
> > > 
> > > Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> > > required?

I don't think it makes sense to add the extra flag later as it
would be a non relevant change, so that I'm fine with having it
here.

> > You need to ask why from Jarkko - I did not really question him on
> > this one. Unfortunately his on vacation at the moment.
> 
> Yeah :-(
> 
> > I can drop this, but then I'll have to drop also Jarkko's ACK.

Just for reference, Ack is not Reviewed. If Jarkko Acks, I assume
he is OK with the general idea, not specifically with the code. I
think that if you change a bit the code without altering the
result you can keep the Ack. Up to you.

> I can give mine if it helps. The code as far as I can see is 100% equivalent.
> 
> > I think we already agreed that this function, and probable the entire
> > file, need to be refactored a bit, so would you mind much if we just
> > went ahead with this as it is?
> > 
> > I'm asking that also because I don't have means or time to test this
> > anymore before I start my vacation.
> 
> I see, then we may ask Andi and Wolfram on this. I slightly prefer to have
> no additional churn added without a good reason.

To be honest I don't really mind. I think that if we add the
extra "flag" or we don't, the amount of code is the same.

If we decide not to add the extra "flag", then we need to move
the initialization of dev->flag above or shuffle something else
around.

In the meantime:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
