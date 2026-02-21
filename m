Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BA0C61CE0
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 05:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBC989D99;
	Sat, 21 Feb 2026 05:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FGeGjp6V";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CF189D99;
 Sat, 21 Feb 2026 05:44:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E94760053;
 Sat, 21 Feb 2026 05:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879CFC4CEF7;
 Sat, 21 Feb 2026 05:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1771652683;
 bh=L0S8drGWjFk6KEnAO+uGBlVcUrNdz/CeGlNCcbnoA1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FGeGjp6VPnsHmAVNPUV0tpR0QUOyFc7QdjEVCNB//xXzNBNvujs8fGBLOtelRkCB5
 gB2WbjBctG8Bt3MLYA63wkar1KgTdB0GrLfFV1ptUwqI1Vas+6QaDrGmIgvPTH02jN
 9rWLVLv+iVq4cJmRote93aYm9RjEGH/odHKNzk5I=
Date: Sat, 21 Feb 2026 06:44:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Message-ID: <2026022156-citizen-shredding-5d6d@gregkh>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1771594440.99434@nvidia.com>
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

On Fri, Feb 20, 2026 at 08:55:52AM -0500, Joel Fernandes wrote:
> > On Feb 20, 2026, at 5:17 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > ﻿On Fri Feb 20, 2026 at 7:06 AM CET, Greg KH wrote:
> >>> On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
> >>> Use subsys_initcall() instead of module_init() (which compiles to
> >>> device_initcall() for built-ins) for buddy, so its initialization code
> >>> always runs before any (built-in) drivers.
> >>> This happened to work correctly so far due to the order of linking in
> >>> the Makefiles, but this should not be relied upon.
> >> 
> >> Same here, Makefile order can always be relied on.
> > 
> > I want to point out that Koen's original patch fixed the Makefile order:
> > 
> > diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> > index 5cd54d06e262..b4e5e338efa2 100644
> > --- a/drivers/gpu/Makefile
> > +++ b/drivers/gpu/Makefile
> > @@ -2,8 +2,9 @@
> > # drm/tegra depends on host1x, so if both drivers are built-in care must be
> > # taken to initialize them in the correct order. Link order is the only way
> > # to ensure this currently.
> > +# Similarly, buddy must come first since it is used by other drivers.
> > +obj-$(CONFIG_GPU_BUDDY)    += buddy.o
> > obj-y            += host1x/ drm/ vga/ tests/
> > obj-$(CONFIG_IMX_IPUV3_CORE)    += ipu-v3/
> > obj-$(CONFIG_TRACE_GPU_MEM)        += trace/
> > obj-$(CONFIG_NOVA_CORE)        += nova-core/
> > -obj-$(CONFIG_GPU_BUDDY)        += buddy.o
> > 
> > He was then suggested to not rely on this and rather use subsys_initcall().
> 
> I take the blame for the suggestion; however, I am not yet convinced it is a bad
> idea. 
> > 
> > When I then came across the new patch using subsys_initcall() I made it worse; I
> > badly confused this with something else and gave a wrong advise -- sorry Koen!
> > 
> > (Of course, since this is all within the same subsystem, without any external
> > ordering contraints, Makefile order is sufficient.)
> 
> If we are still going to do the link ordering by reordering in the Makefile,
> may I ask what is the drawback of doing the alternative - that is, not
> relying on that (and its associated potential for breakage)?
> 
> Even if Makefile ordering can be relied on, why do we want to rely on it if
> there is an alternative? Also module_init() compiles to device_initcall() for
> built-ins and this is shared infra.
> 
> We use this technique in other code paths too, no? See
> drivers/i2c/i2c-core-base.c:
> 
>   /* We must initialize early, because some subsystems register i2c drivers
>    * in subsys_initcall() code, but are linked (and initialized) before i2c.
>    */
>   postcore_initcall(i2c_init);
> 
> If there is a drawback I am all ears but otherwise I would prefer the new
> patch tbh. 

The "problem" is that the init levels are very "coarse", and the link
order is very specific.  You can play with init levels a lot, but what
happens if another driver also sets to the same init level, or an
earlier one to try to solve something that way?

So it can be a loosing battle for many things, choose the best and
simplest solution, but always remember, Makefile order matters, which is
what I was wanting to correct here.

thanks,

greg k-h
