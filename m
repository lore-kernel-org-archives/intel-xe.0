Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37E710F284C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 16:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFA910E3CD;
	Fri, 27 Mar 2026 16:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="jXxDSHrw";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E36A10E3CC;
 Fri, 27 Mar 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Ny4qw8taYrs1T0pcr+uXSnjLdjR00AR+PeEIDL77s/I=; b=jXxDSHrwoSVwO2frkqg+oAxykM
 LMwaBjCrPEJVPOEJh498r7cvaE2BOuRIM35DROUK81z/5fCYqODlwDcPk4316VGS1J9eTDIaILlLm
 dfHL2/IsFNSjciPAH19rkol4JBcWMoirFSh1mEUJK7YyCmepYXweOKgAoTYMdnMA7ll5Y2GvXEmlD
 SIOXnp5Mnr+FkxL3uXofbkpM7FV5M+qi93ukBOcSS9Ssgt4nTLHdr5uHXp6QnDOD3s8ETBTqvQGTG
 E4NxEtUjOk132ddHAja06GOsq9Ckprb7ut+5DMk0lDie+/iFm58oqZKt3NPt9K5Xmertb+TBFVxfT
 EGguMyWw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1w6A5O-000000025cw-1d9U; Fri, 27 Mar 2026 16:31:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 868F0301185; Fri, 27 Mar 2026 17:31:00 +0100 (CET)
Date: Fri, 27 Mar 2026 17:31:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: willy@infradead.org, linux-kernel@vger.kernel.org,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, ravitejax.veesam@intel.com
Subject: Re: Regression on linux-next (next-20260324 )
Message-ID: <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
References: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
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

On Fri, Mar 27, 2026 at 07:09:26PM +0530, Borah, Chaitanya Kumar wrote:
> Hello Matthew,
> 
> Hope you are doing well. I am Chaitanya from the linux graphics team in
> Intel.
> 
> This mail is regarding a regression we are seeing in our CI runs[1] on
> linux-next repository.
> 
> Since the version next-20260324 [2], we are seeing the following regression
> 
> `````````````````````````````````````````````````````````````````````````````````
> <5>[  157.361977] [IGT] Inactivity timeout exceeded. Killing the current
> test with SIGQUIT.
> <6>[  157.362097] sysrq: HELP : loglevel(0-9) reboot(b) crash(c)
> show-all-locks(d) terminate-all-tasks(e) memory-full-oom-kill(f)
> kill-all-tasks(i) thaw-filesystems(j) sak(k)
> show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n)
> poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s)
> show-task-states(t) unmount(u) force-fb(v) show-blocked-tasks(w)
> dump-ftrace-buffer(z) replay-kernel-logs(R)
> <6>[  157.399543] sysrq: Show State
> <6>[  157.403061] task:systemd         state:S stack:0     pid:1 tgid:1
> ppid:0      task_flags:0x400100 flags:0x00080000
> <6>[  157.403067] Call Trace:
> <6>[  157.403069]  <TASK>
> <6>[  157.403072]  __schedule+0x5d7/0x1ef0
> <6>[  157.403078]  ? lock_acquire+0xc4/0x300
> <6>[  157.403084]  ? schedule+0x10e/0x180
> <6>[  157.403087]  ? lock_release+0xcd/0x2b0
> <6>[  157.403092]  schedule+0x3a/0x180
> <6>[  157.403094]  schedule_hrtimeout_range_clock+0x112/0x120
> <6>[  157.403097]  ? do_epoll_wait+0x3e4/0x5b0
> <6>[  157.403102]  ? lock_release+0xcd/0x2b0
> <6>[  157.403104]  ? _raw_spin_unlock_irq+0x27/0x70
> <6>[  157.403106]  ? do_epoll_wait+0x3e4/0x5b0
> <6>[  157.403110]  schedule_hrtimeout_range+0x13/0x30
> `````````````````````````````````````````````````````````````````````````````````
> Details log can be found in [3].
> 
> After bisecting the tree, the following patch [4] seems to be the first
> "bad" commit
> 
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
> commit 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe
> Author: Matthew Wilcox (Oracle) willy@infradead.org
> Date:   Thu Mar 5 19:55:43 2026 +0000
> 
>     locking/mutex: Remove the list_head from struct mutex
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
> 
> We could not revert the patch because of merge conflict but resetting to the
> parent of the commit seems to fix the issue.
> 
> Could you please check why the patch causes this regression and provide a
> fix if necessary?

Does this help?

---
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -40,10 +40,10 @@ __ww_waiter_last(struct mutex *lock)
 	__must_hold(&lock->wait_lock)
 {
 	struct mutex_waiter *w = lock->first_waiter;
+	if (!w)
+		return NULL;
 
-	if (w)
-		w = list_prev_entry(w, list);
-	return w;
+	return __ww_waiter_prev(lock, w);
 }
 
 static inline void
