Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B34C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B3F10E8BA;
	Wed, 12 Feb 2025 14:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j7ZzOff1";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AD410E073;
 Wed, 12 Feb 2025 06:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 60B82A40FA2;
 Wed, 12 Feb 2025 06:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE399C4CEDF;
 Wed, 12 Feb 2025 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739342717;
 bh=jMyY6moOg33KisoHwuVcPY0vNKL5D7f+8jifNlWXB0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j7ZzOff1EfR3DoQfTLuAgxPMFnEHAk08XdGxqyjuxSSZGBfQd4mo9lw8PGf7BtiW1
 m8QyvYY/jgnpvho4aNGo/X/F+ImUN1iZlE4Tq/uSTs4endNSPippCDL4M9c+Uonssi
 ZrSH4jJ6zk5UDXmCo4fbWvabJqHMUsDq0ePVj0NoWe0prU1509vz/WgLw1YyrXNfwV
 AR01tIXXwI8H722Cw7W8yv6m0OJw3Zum/8vbJmOKApXPnGEKzPxrDjLoZcKKiqdPS4
 QtjAcbkaJrpUBI7pREM/fY/0/QE9b8Mi9VmPKl9gGCfh7r3tvZCRV8q/goj+m4/IZd
 uWP4ipTfFLrbQ==
Date: Wed, 12 Feb 2025 08:45:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: Regression on linux-next (next-20250205)
Message-ID: <Z6xDcBnw9KB5IqMl@kernel.org>
References: <SJ1PR11MB6129A45FFE75371036820909B9F22@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <Z6sBX-tPotgS2ARh@kernel.org>
 <DM4PR11MB61417F2A11D08FE2DD7826CCB9FD2@DM4PR11MB6141.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB61417F2A11D08FE2DD7826CCB9FD2@DM4PR11MB6141.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:09:49 +0000
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

On Tue, Feb 11, 2025 at 12:30:01PM +0000, Borah, Chaitanya Kumar wrote:
> Hello Mike,
> 
> > -----Original Message-----
> > From: Mike Rapoport <rppt@kernel.org>
> > Sent: Tuesday, February 11, 2025 1:21 PM
> > To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Saarinen,
> > Jani <jani.saarinen@intel.com>; Kurmi, Suresh Kumar
> > <suresh.kumar.kurmi@intel.com>; x86@kernel.org; De Marchi, Lucas
> > <lucas.demarchi@intel.com>
> > Subject: Re: Regression on linux-next (next-20250205)
> > 
> > Hello Chaitanya,
> > 
> > On Mon, Feb 10, 2025 at 06:52:35AM +0000, Borah, Chaitanya Kumar
> > wrote:
> > > Hello Mike,
> > >
> > > Hope you are doing well. I am Chaitanya from the linux graphics team in
> > Intel.
> > >
> > > This mail is regarding a regression we are seeing in our CI runs[1] on linux-
> > next repository.
> > >
> > > Since the version next-20250205 [2], we are seeing the following
> > > regression
> > >
> > > ``````````````````````````````````````````````````````````````````````
> > > ``````````` <4>[  314.781734] kmemleak: Found object by alias at
> > > 0xffffffffa0595000 <4>[  314.781738] CPU: 11 UID: 0 PID: 6042 Comm:
> > > i915_selftest Tainted: G     U
> > > 6.14.0-rc1-next-20250205-next-20250205-ged88b8b82c53+ #1 <4>[
> > > 314.781741] Tainted: [U]=USER <4>[  314.781741] Hardware name: ASUS
> > > System Product Name/PRIME Z790-P WIFI, BIOS 0812 02/24/2023
> > <4>[  314.781742] Call Trace:
> > > <4>[  314.781743]  <TASK>
> > > <4>[  314.781744]  dump_stack_lvl+0x91/0xf0 <4>[  314.781749]
> > > dump_stack+0x10/0x20 <4>[  314.781751]  __lookup_object+0x90/0xa0
> > <4>[
> > > 314.781755]  __find_and_get_object+0x6c/0x190 <4>[  314.781758]
> > > paint_ptr+0x1b/0xa0 <4>[  314.781759]  kmemleak_not_leak+0x33/0x70
> > > <4>[  314.781762]  load_module+0xa20/0x2d10
> > > ``````````````````````````````````````````````````````````````````````
> > > ```````````
> > > Details log can be found in [3].
> > 
> > Does this fix it for you?
> > 
> > 
> > diff --git a/kernel/module/main.c b/kernel/module/main.c index
> > 4a02503836d7..a598888e7072 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -1260,7 +1260,8 @@ static int module_memory_alloc(struct module
> > *mod, enum mod_mem_type type)
> >  	 * *do* eventually get freed, but let's just keep things simple
> >  	 * and avoid *any* false positives.
> >  	 */
> > -	kmemleak_not_leak(ptr);
> > +	if (!mod->mem[type].is_rox)
> > +		kmemleak_not_leak(ptr);
> > 
> >  	memset(ptr, 0, size);
> >  	mod->mem[type].base = ptr;
> > 
> > 
> 
> Thank you for your reply.
> 
> Unfortunately, the change makes it worse. Our local system seems to be in continuous reboot.

Are there any logs available?
 
> Regards
> 
> Chaitanya
> 
> > > [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
> > > [2]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/co
> > > mmit/?h=next-20250205 [3]
> > > https://intel-gfx-ci.01.org/tree/linux-next/next-20250205/bat-rpls-4/d
> > > mesg0.txt [4]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/co
> > > mmit/?h=next-
> > 20250205&id=64f6a4e10c05ed527f0f24b7954964255e0d3535
> > >
> > > Regards
> > > Chaitanya
> > 
> > --
> > Sincerely yours,
> > Mike.

-- 
Sincerely yours,
Mike.
