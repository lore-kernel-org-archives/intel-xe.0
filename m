Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1066EC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 23:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C225610E2D3;
	Mon,  8 Jan 2024 23:15:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F9F10E2D3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 23:15:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C22E6B81905;
 Mon,  8 Jan 2024 23:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E403C433C7;
 Mon,  8 Jan 2024 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704755724;
 bh=7KlcJVD8ZYiOIvP/KELAQLAx/l7D+V5cUHRCxDMgkEY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ZJ8foQrTyKniQDnjPPX687cBiNwV5nw4ShB8Muq+4lXuESkucboH5Vku4ScB+8cBy
 0MdQgDmKl6s/jmTBscx0oGEpwgJrZkC4II30SMotD52XMKx1wLFOMsteVm6ZYxwpXJ
 TARpO+7tmxHAQSgTg6uTiGx+XoUO3HItG4GfNusKRwyDCKp9naNZIiPR9arAR9ChcJ
 jc5AWwEXiwhyaKfj1WVjCeSpB7F6N4RrHodJoQUVGz/y+9QK9oTwKkn3EdUbUvMZA+
 A2cZVFcawaROBhQYKMrnwu4AkePCUb2gRcZQ8ruRHGNNvURJU9hqekMAa1KUnJGN2v
 3SsKrVZV57IJQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id B2278CE0C54; Mon,  8 Jan 2024 15:15:23 -0800 (PST)
Date: Mon, 8 Jan 2024 15:15:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUG] allmodconfig build error in next-20240108
Message-ID: <341a4955-0cdd-48d0-bfbd-cc6f6f09df37@paulmck-laptop>
References: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
 <20240109095757.1313b2d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109095757.1313b2d9@canb.auug.org.au>
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
Cc: lucas.dimarchi@intel.com, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 09:57:57AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Mon, 8 Jan 2024 13:33:36 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >
> > Recent -next trees get the following build error for allmodconfig builds:
> > 
> > ------------------------------------------------------------------------
> > 
> > drivers/gpu/drm/xe/xe_gt_pagefault.c: In function ‘xe_guc_pagefault_handler’:
> > ./include/linux/fortify-string.h:57:33: error: writing 16 bytes into a region of  size 0 [-Werror=stringop-overflow=]
> >    57 | #define __underlying_memcpy     __builtin_memcpy
> >       |                                 ^
> > ./include/linux/fortify-string.h:644:9: note: in expansion of macro ‘__underlying_memcpy’
> >   644 |         __underlying_##op(p, q, __fortify_size); \
> >       |         ^~~~~~~~~~~~~
> > ./include/linux/fortify-string.h:689:26: note: in expansion of macro ‘__fortify_memcpy_chk’
> >   689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s, \
> >       |                          ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/xe/xe_gt_pagefault.c:340:17: note: in expansion of macro ‘memcpy’
> >   340 |                 memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
> >       |                 ^~~~~~
> > In file included from drivers/gpu/drm/xe/xe_device_types.h:17,
> >                  from drivers/gpu/drm/xe/xe_vm_types.h:16,
> >                  from drivers/gpu/drm/xe/xe_bo.h:13,
> >                  from drivers/gpu/drm/xe/xe_gt_pagefault.c:16:
> > drivers/gpu/drm/xe/xe_gt_types.h:102:25: note: at offset [1144, 265324] into destination object ‘tile’ of size 8
> >   102 |         struct xe_tile *tile;
> >       |
> 
> Which architecture?  What compiler and version?  Anything special in your build
> setup?  I do x86_64 allmodconfig builds all day with gcc v13.2 and I don't see
> this failure.

Good point!

I am using gcc version 11.3.1 20230605 (Red Hat 11.4.1-2) on x86_64.
I see the same behavior on gcc version 8.5.0, which for all I know might
be too old.

							Thanx, Paul
