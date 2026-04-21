Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDF3F8FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408DD10ECEC;
	Tue, 21 Apr 2026 15:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="cgnXEr9A";
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8989A10ECF8;
 Tue, 21 Apr 2026 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fi7RqWewM5Hc3+FiMOKBokozqsq7O+/mqRZWnxWizYo=; b=cgnXEr9AkaWMzS2awjYYo3juNf
 lw6234B2THW135IC0nvnz0Yw1peoWCjiKvSiWK8Dz+bX5KJHH9Fg02ZbfvCbePqXdNm2Kdhl9JVAF
 80TFfihMsM0mBq72zs9KfLA0jSiagQ4cIqGS5paX9RAPFM9hMRdbyp1lTPLCVGpUqgUSb1x5aHI/+
 Mu7jCCm5Crk5boEwStebEOvur7VF/x6w6VlD/++LJzu1wxVUiXmyT14un6/72rW7f9ZW+B39iWzGx
 yNHIZuNItF55rpgBHX+SVou4uA8ffmatirtnLEmeaSUHopsjqUO2R+RSA7Qulpep6aQpyuxWUZkPK
 GmdROzFA==;
Received: from
 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1wFCd1-00000009z9t-3ELn; Tue, 21 Apr 2026 15:03:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4ECCD300708; Tue, 21 Apr 2026 17:03:07 +0200 (CEST)
Date: Tue, 21 Apr 2026 17:03:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz <jstultz@google.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 linux-kernel@vger.kernel.org,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, ravitejax.veesam@intel.com
Subject: Re: Regression on linux-next (next-20260324 )
Message-ID: <20260421150307.GE1064669@noisy.programming.kicks-ass.net>
References: <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
 <20260327164353.GM3739106@noisy.programming.kicks-ass.net>
 <df391df3-3a3b-4a65-b3c7-ffe3ab50ee83@intel.com>
 <20260330195037.GW2872@noisy.programming.kicks-ass.net>
 <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
 <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
 <20260421101521.GO3102624@noisy.programming.kicks-ass.net>
 <95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com>
 <20260421143752.GD1064669@noisy.programming.kicks-ass.net>
 <aeeNbseIzGwussm0@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeeNbseIzGwussm0@casper.infradead.org>
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

On Tue, Apr 21, 2026 at 03:45:02PM +0100, Matthew Wilcox wrote:
> On Tue, Apr 21, 2026 at 04:37:52PM +0200, Peter Zijlstra wrote:
> > Argh, I see... yes. Perhaps something like the below though?
> 
> This is a documentation bug.  I thought it was supposed to add *after*
> pos, not before.  So can we clear that up too?

Sure, that comment is indeed less than clear. The comment in
__ww_mutex_add_waiter() is better.

> 
> @@ -198,7 +198,7 @@ static inline void __mutex_clear_flag(struct mutex *lock, unsigned long flag)
>  }
> 
>  /*
> - * Add @waiter to a given location in the lock wait_list and set the
> + * Add @waiter before a given location in the lock wait_list and set the
>   * FLAG_WAITERS flag if it's the first waiter.
>   */
>  static void
> 
