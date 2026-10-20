Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2F606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mry74HoK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5201510F403;
	Tue, 20 Oct 2026 09:09:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9822510E7A0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792487366; x=1824023366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oehxqpceAYXZrnCZ53SqQxQWN5HZ3QdPEsadGJSfxoI=;
 b=mry74HoKuKCrDnGoWjWARqsbldx9ghLtYHzhP/r7ZZjY+sVwiCR2Pklv
 g7/PcH4XL5VkTyt9pusz3elF79/zWTBV4nvbVVl8g8t6woCtOAvunp2lj
 h0baO4yWVSfFA9h+CB+z8lzgoxJjG4sotgnaw6KuF6kH04C2kjAMCACtA
 0zjsys+XA2X5Mjrwaxi6qELovePPhTvtXS2vzfNBxb4fqcHO4tpfJicoU
 qdATGaHHV1qf2YUW/Rpk/6tNMVS/+vXp9HlzHHw96j2J9Nt/iCURGbw1P
 aclCySeY3JiCJOmm82n41M3Pqt0ddoB9yIJKMRuXQ9jOXwaUZchOqf7cy Q==;
X-CSE-ConnectionGUID: NFSRe+0iR4KNa9yhUEuxNw==
X-CSE-MsgGUID: OiAvMOSbRpyt5/Vw62tnTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1196684"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1196684"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:09:26 -0700
X-CSE-ConnectionGUID: NaVQffgYRw2Fg8OzBy+GHA==
X-CSE-MsgGUID: pUWT8V4TT4ap1IqGnpA+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2729386"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa003.jf.intel.com with ESMTP; 20 Oct 2026 02:09:24 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [FOR CI] printk: Avoid WARN when console_irqwork_blocked is set
 concurrently
Date: Tue, 20 Oct 2026 09:09:22 +0000
Message-ID: <20261020090922.4033196-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vprintk_emit() evaluates @console_irqwork_blocked once, when determining
its flush type. console_suspend_all() can set the flag on another CPU in
the meantime, so a printk() that selected offloading reaches
nbcon_kthreads_wake() with the flag now set and trips WARN_ON_ONCE():

  WARNING: kernel/printk/nbcon.c:1325 at nbcon_kthreads_wake+0xa4/0xb0
  vprintk_emit+0x39b/0x470
  __drm_dev_dbg+0x7d/0xb0
  intel_tc_port_reset_mode+0x115/0x3e0 [i915]
  intel_tc_port_disconnect_phy_work+0x60/0x80 [i915]

Re-sampling the flush type later does not help either, since atomic and
legacy direct flushing run in between. Check the flag where irq_work is
actually queued instead, and mark the racing accesses.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 kernel/printk/internal.h |  6 +++---
 kernel/printk/nbcon.c    | 12 +++++++++---
 kernel/printk/printk.c   | 32 ++++++++++++++++++--------------
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe..c2a5e428b0dc 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -198,7 +198,7 @@ static inline void printk_get_console_flush_type(struct console_flush_type *ft)
 	switch (nbcon_get_default_prio()) {
 	case NBCON_PRIO_NORMAL:
 		if (have_nbcon_console && !have_boot_console) {
-			if (printk_kthreads_running && !console_irqwork_blocked)
+			if (printk_kthreads_running && !READ_ONCE(console_irqwork_blocked))
 				ft->nbcon_offload = true;
 			else
 				ft->nbcon_atomic = true;
@@ -208,7 +208,7 @@ static inline void printk_get_console_flush_type(struct console_flush_type *ft)
 		if (have_legacy_console || have_boot_console) {
 			if (!is_printk_legacy_deferred())
 				ft->legacy_direct = true;
-			else if (!console_irqwork_blocked)
+			else if (!READ_ONCE(console_irqwork_blocked))
 				ft->legacy_offload = true;
 		}
 		break;
@@ -221,7 +221,7 @@ static inline void printk_get_console_flush_type(struct console_flush_type *ft)
 		if (have_legacy_console || have_boot_console) {
 			if (!is_printk_legacy_deferred())
 				ft->legacy_direct = true;
-			else if (!console_irqwork_blocked)
+			else if (!READ_ONCE(console_irqwork_blocked))
 				ft->legacy_offload = true;
 		}
 		break;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 5f8afaca8866..ff8fd9df9a95 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1319,10 +1319,16 @@ void nbcon_kthreads_wake(void)
 		return;
 
 	/*
-	 * It is not allowed to call this function when console irq_work
-	 * is blocked.
+	 * @console_irqwork_blocked can be set by console_suspend_all() at any
+	 * time, i.e. also after the caller has determined its flush type. It
+	 * must therefore be checked here, immediately before queueing the
+	 * irq_work, and this situation must not warn.
+	 *
+	 * Records stored in that small window are not lost. They are flushed
+	 * by the next NBCON_PRIO_NORMAL printk() (which uses atomic flushing
+	 * once the flag is set) or at the latest by console_resume_all().
 	 */
-	if (WARN_ON_ONCE(console_irqwork_blocked))
+	if (READ_ONCE(console_irqwork_blocked))
 		return;
 
 	cookie = console_srcu_read_lock();
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index bc3b9f6e404b..c3485bf35101 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -464,7 +464,13 @@ bool have_boot_console;
 /* See printk_legacy_allow_panic_sync() for details. */
 bool legacy_allow_panic_sync;
 
-/* Avoid using irq_work when suspending. */
+/*
+ * Avoid using irq_work when suspending.
+ *
+ * This flag can be set by console_suspend_all() while other CPUs are in the
+ * middle of a printk() call. All accesses are therefore marked and the flag
+ * must be (re)checked directly before queueing irq_work.
+ */
 bool console_irqwork_blocked;
 
 #ifdef CONFIG_PRINTK
@@ -2446,7 +2452,7 @@ asmlinkage int vprintk_emit(int facility, int level,
 	/* If called from the scheduler, we can not call up(). */
 	if (level == LOGLEVEL_SCHED) {
 		level = LOGLEVEL_DEFAULT;
-		ft.legacy_offload |= ft.legacy_direct && !console_irqwork_blocked;
+		ft.legacy_offload |= ft.legacy_direct && !READ_ONCE(console_irqwork_blocked);
 		ft.legacy_direct = false;
 	}
 
@@ -2482,7 +2488,7 @@ asmlinkage int vprintk_emit(int facility, int level,
 
 	if (ft.legacy_offload)
 		defer_console_output();
-	else if (!console_irqwork_blocked)
+	else if (!READ_ONCE(console_irqwork_blocked))
 		wake_up_klogd();
 
 	return printed_len;
@@ -2796,7 +2802,7 @@ void console_suspend_all(void)
 	 * any klogd waiters are not triggered.
 	 */
 	pr_flush(1000, true);
-	console_irqwork_blocked = true;
+	WRITE_ONCE(console_irqwork_blocked, true);
 
 	if (!console_suspend_enabled)
 		return;
@@ -2825,7 +2831,7 @@ void console_resume_all(void)
 	 * printing and any klogd waiters need to be triggered in case there
 	 * is now a console backlog.
 	 */
-	console_irqwork_blocked = false;
+	WRITE_ONCE(console_irqwork_blocked, false);
 
 	if (console_suspend_enabled) {
 		console_list_lock();
@@ -4624,13 +4630,6 @@ static void __wake_up_klogd(int val)
 	if (!printk_percpu_data_ready())
 		return;
 
-	/*
-	 * It is not allowed to call this function when console irq_work
-	 * is blocked.
-	 */
-	if (WARN_ON_ONCE(console_irqwork_blocked))
-		return;
-
 	preempt_disable();
 	/*
 	 * Guarantee any new records can be seen by tasks preparing to wait
@@ -4642,9 +4641,14 @@ static void __wake_up_klogd(int val)
 	 * the waiter but before it has checked the wait condition.
 	 *
 	 * This pairs with devkmsg_read:A and syslog_print:A.
+	 *
+	 * @console_irqwork_blocked is checked here, immediately before
+	 * queueing the irq_work, because console_suspend_all() can set it
+	 * after the caller has determined its flush type.
 	 */
-	if (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
-	    (val & PRINTK_PENDING_OUTPUT)) {
+	if (!READ_ONCE(console_irqwork_blocked) &&
+	    (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
+	     (val & PRINTK_PENDING_OUTPUT))) {
 		this_cpu_or(printk_pending, val);
 		irq_work_queue(this_cpu_ptr(&wake_up_klogd_work));
 	}
-- 
2.43.0

