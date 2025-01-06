Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63743E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 19:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D4310E9E2;
	Mon,  6 Jan 2025 19:40:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78610E9E2;
 Mon,  6 Jan 2025 19:40:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47039A41D8B;
 Mon,  6 Jan 2025 19:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC4EC4CED2;
 Mon,  6 Jan 2025 19:40:00 +0000 (UTC)
Date: Mon, 6 Jan 2025 14:41:26 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Genes Lists <lists@sapience.com>
Cc: Andrea Amorosi <andrea.amorosi76@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 thomas.hellstrom@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20250106144126.20d7f599@gandalf.local.home>
In-Reply-To: <d5ef54d76188ec51d9e053fd097dc3f5bb6e6519.camel@sapience.com>
References: <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <73129e45-cf51-4e8d-95e8-49bc39ebc246@gmail.com>
 <d5ef54d76188ec51d9e053fd097dc3f5bb6e6519.camel@sapience.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 04 Jan 2025 15:09:10 -0500
Genes Lists <lists@sapience.com> wrote:

> On Sat, 2025-01-04 at 18:43 +0100, Andrea Amorosi wrote:
> > Hi to all,
> > 
> > I've just updated my archlinux to |6.12.8-arch1-1 and I still get the
> > same issue:|
> > 
> >   
> Right - 6.12.8 (and Arch build of same) does not have Steve Rostedt's
> patch.
> The patch is in mainline and I believe it will be in 6.12.9.

For completeness, the patch in question is this:

  https://lore.kernel.org/20241231000646.324fb5f7@gandalf.local.home

-- Steve


> 
> Since the warning logged is a false positive it is benign.
> 
> 

