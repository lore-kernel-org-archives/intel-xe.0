Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23F5C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 16:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA1910E644;
	Wed, 10 Jan 2024 16:00:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4297C10E644
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 16:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C386DB81DD2;
 Wed, 10 Jan 2024 16:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E83C433C7;
 Wed, 10 Jan 2024 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704902423;
 bh=G4+lE+BH/CV70HZvdV/l6Cjg+ti6z2Et7y6eWdc6Sp4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=VaUc4q9KmQ4Fj16puvilnJ6EZau5dVe0KkxQkM7aFvVgZCewCYYdtOiNk5fQQTDVh
 4GkuxuLnOFxINDIinAVwzaKxQJEctI7R3B6R4+D8nnv+fU8/jvNfpcf0KiHYlZlghn
 e3aE7FP/X6BWvXK98UUp6E9nwMj5k+4u47zYwxXk3ReNrxumd4i/byGXcSR5CDR8FQ
 xOK2nvee1b0PWCpeJEQCNN5RM2TINk1RaRk/kTlakny8GsH05JIgh0lQCvMBJca576
 5cPqHruiw8aixCv62BBsVYalrTWUBOI/xhhZ3pFAYXS2SLzAd7AncbppUhjLzLHMBK
 U+tpDerlVpfDg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id A443CCE19C3; Wed, 10 Jan 2024 08:00:22 -0800 (PST)
Date: Wed, 10 Jan 2024 08:00:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [BUG] allmodconfig build error in next-20240108
Message-ID: <a391e9dd-bfa2-4b4c-93ca-52f2eebee72e@paulmck-laptop>
References: <20240109095757.1313b2d9@canb.auug.org.au>
 <341a4955-0cdd-48d0-bfbd-cc6f6f09df37@paulmck-laptop>
 <atbx7mspjbymkzgstk4l64qz3uky3wpmx4isrfg3ixgtvebdd2@cktpe4ejfk7k>
 <20240110081155.48bb0cbd@oak>
 <d61dfe52-9567-4f62-98f5-5c1e00cb4708@paulmck-laptop>
 <20240110095822.3ba3d979@canb.auug.org.au>
 <3d14049c-d44c-4b33-9933-0f96055b8a70@paulmck-laptop>
 <20240110160335.2bad7d54@oak>
 <3a10ef2b-acbe-4d80-805a-e947e15e5db3@paulmck-laptop>
 <6r2zjqbs2g3hkt3uhnglwpboalwck5ye34b6gxzmhe4gae77g7@3bzqt4s7i2qb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6r2zjqbs2g3hkt3uhnglwpboalwck5ye34b6gxzmhe4gae77g7@3bzqt4s7i2qb>
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
Reply-To: paulmck@kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 09:00:06AM -0600, Lucas De Marchi wrote:
> On Wed, Jan 10, 2024 at 02:26:54AM -0800, Paul E. McKenney wrote:
> > On Wed, Jan 10, 2024 at 04:03:51PM +1100, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > On Tue, 9 Jan 2024 19:46:27 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > > >
> > > > On Wed, Jan 10, 2024 at 09:58:22AM +1100, Stephen Rothwell wrote:
> > > > >
> > > > > Maybe that line "subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)"
> > > > > should just be removed as the setting of that option has been moved to the
> > > > > normal C flags in the top level Makefile (out of Makefile.extrawarn).
> > > >
> > > > If you meant like this, no joy.  :-(
> > > 
> > > Actually I meant the one in drivers/gpu/drm/xe/Makefile
> > 
> > Like this?  That does work as shown below, thank you!
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > drm/xe: Fix build bug for GCC 11
> > 
> > Building drivers/gpu/drm/xe/xe_gt_pagefault.c with GCC 11 results
> > in the following build errors:
> > 
> > ./include/linux/fortify-string.h:57:33: error: writing 16 bytes into a region of size 0 [-Werror=stringop-overflow=]
> >   57 | #define __underlying_memcpy     __builtin_memcpy
> >      |                                 ^
> > ./include/linux/fortify-string.h:644:9: note: in expansion of macro ‘__underlying_memcpy’
> >  644 |         __underlying_##op(p, q, __fortify_size);                        \
> >      |         ^~~~~~~~~~~~~
> > ./include/linux/fortify-string.h:689:26: note: in expansion of macro ‘__fortify_memcpy_chk’
> >  689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
> >      |                          ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/xe/xe_gt_pagefault.c:340:17: note: in expansion of macro ‘memcpy’
> >  340 |                 memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
> >      |                 ^~~~~~
> > In file included from drivers/gpu/drm/xe/xe_device_types.h:17,
> >                 from drivers/gpu/drm/xe/xe_vm_types.h:16,
> >                 from drivers/gpu/drm/xe/xe_bo.h:13,
> >                 from drivers/gpu/drm/xe/xe_gt_pagefault.c:16:
> > drivers/gpu/drm/xe/xe_gt_types.h:102:25: note: at offset [1144, 265324] into destination object ‘tile’ of size 8
> >  102 |         struct xe_tile *tile;
> >      |                         ^~~~
> > 
> > Fix these by removing -Wstringop-overflow from drm/xe builds.
> > 
> > Suggested-by: Stephen Rothwell <sfr@rothwell.id.au>
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> [ This particular warning is broken on GCC11. In future changes it will
>   be moved to the normal C flags in the top level Makefile (out of
>   Makefile.extrawarn), but accounting for the compiler support. Just
>   remove it out of xe's forced extra warnings for now ]
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> would you mind if I extend it to drivers/gpu/drm/i915/Makefile
> in the same commit or would you prefer a separate one?

Whatever works best for you works for me!

							Thanx, Paul

> Lucas De Marchi
> 
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 53bd2a8ba1ae..efcf0ab7a1a6 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -17,7 +17,6 @@ subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> > subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> > subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> > subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> > -subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> > subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> > # The following turn off the warnings enabled by -Wextra
> > ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
