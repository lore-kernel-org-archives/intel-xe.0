Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D148F89242
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 10:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1990510EBFF;
	Tue, 21 Apr 2026 10:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="qCsat0lf";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9F10E077;
 Tue, 21 Apr 2026 10:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6VTyml2rkKvGCCL9WLwv3vpWAHAsWbCWLHCbHrD18+g=; b=qCsat0lf1XhVGkE5QQ6l59pOot
 Ejone6Ia4Db3lpd2f3ADrQTPvYgbgLETSMUksTcHWBPwo20BOinQdoI4z/aEoUsk/e/kxal66lb3j
 r6oaaTgSnigsAxutTGV42vRL2qH5K9rwfYN93jv8Eq16duIbkKQ/w0Enc3w4vCkdiyl7PGLQhiBxu
 WjcQm+ZHV+Lr+upDsW5Z8QwMdbgNR16LCI93g5k9p/ErhCDohoR7XjPKxWq3326BUmPz9KqJQXlhz
 rNAeGk27C7+GZ1qmr/txCD29uoh+DeQ8o7seCRS6nHmDMzRzTXtiwvnOW7WiXJlrY/I0uIqQwrN6B
 x3bS91FA==;
Received: from
 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1wF88X-00000009wD9-40WF; Tue, 21 Apr 2026 10:15:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 50674300708; Tue, 21 Apr 2026 12:15:21 +0200 (CEST)
Date: Tue, 21 Apr 2026 12:15:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 willy@infradead.org, linux-kernel@vger.kernel.org,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, ravitejax.veesam@intel.com,
 K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: Regression on linux-next (next-20260324 )
Message-ID: <20260421101521.GO3102624@noisy.programming.kicks-ass.net>
References: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
 <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
 <20260327164353.GM3739106@noisy.programming.kicks-ass.net>
 <df391df3-3a3b-4a65-b3c7-ffe3ab50ee83@intel.com>
 <20260330195037.GW2872@noisy.programming.kicks-ass.net>
 <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
 <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
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

On Mon, Apr 20, 2026 at 11:45:12PM -0700, John Stultz wrote:

> So I tripped over this in my own testing today preping proxy patches,
> bisecting it down to the same problematic commit 25500ba7e77c
> ("locking/mutex: Remove the list_head from struct mutex").
> 
> Inteed it does seem related to ww_mutexes, as I can pretty easily
> reproduce it with defconfig + CONFIG_WW_MUTEX_SELFTEST=y  using
> qemu-system-x86
> 
> Where the test will basically hang on bootup.

*groan* indeed. This of course means no CI is running this thing :-(

Anyway, yay for deterministic reproducer. Let me go prod at this.
