Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6CCF8FA78
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 14:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2A010E8A8;
	Tue, 21 Apr 2026 14:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Sa0gafdX";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E1210E1FD;
 Tue, 21 Apr 2026 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DLmLclcRfMzkW1jUxLXdbKibxhGKqa4xL3PsT8Bg+rk=; b=Sa0gafdXdvEy8kv9wV6FSByThH
 9ldRnp/6TBdGRNIEt3dwfRE8+SSConuD7hZe7Sh7s+0yAHJImrTvhr9bldmN0SHIWIFqf67q0ppGy
 oG7YNoK4A/6SS9OVxKGeSzAKEVT00xG8z7hbb3rKHtZLgZx0YagPGFSNHZWZo9NN0ZKpkkKml2VH8
 yIBIpOvufpjRTB1FhmNbDigizRM/yAq/hYllV0AAHRGxJn+k2z0nD7YNQsDJjptgCau2e3oR2cxdr
 HdEZR+SJiAQYpC6e53YfoNMIW+fZmoq+NAp+paGYj0N0nPJqALwAZdTaDj/JkNe4lfN2mT/AC+52s
 N/azwR5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wFCLW-0000000AHKv-34sD;
 Tue, 21 Apr 2026 14:45:02 +0000
Date: Tue, 21 Apr 2026 15:45:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz <jstultz@google.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 linux-kernel@vger.kernel.org,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, ravitejax.veesam@intel.com
Subject: Re: Regression on linux-next (next-20260324 )
Message-ID: <aeeNbseIzGwussm0@casper.infradead.org>
References: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
 <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
 <20260327164353.GM3739106@noisy.programming.kicks-ass.net>
 <df391df3-3a3b-4a65-b3c7-ffe3ab50ee83@intel.com>
 <20260330195037.GW2872@noisy.programming.kicks-ass.net>
 <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
 <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
 <20260421101521.GO3102624@noisy.programming.kicks-ass.net>
 <95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com>
 <20260421143752.GD1064669@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421143752.GD1064669@noisy.programming.kicks-ass.net>
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

On Tue, Apr 21, 2026 at 04:37:52PM +0200, Peter Zijlstra wrote:
> Argh, I see... yes. Perhaps something like the below though?

This is a documentation bug.  I thought it was supposed to add *after*
pos, not before.  So can we clear that up too?

@@ -198,7 +198,7 @@ static inline void __mutex_clear_flag(struct mutex *lock, unsigned long flag)
 }

 /*
- * Add @waiter to a given location in the lock wait_list and set the
+ * Add @waiter before a given location in the lock wait_list and set the
  * FLAG_WAITERS flag if it's the first waiter.
  */
 static void

