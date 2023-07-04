Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B43EB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD1710E2C2;
	Tue,  4 Jul 2023 09:53:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F65510E2C2
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464415; x=1720000415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnVgHsr/88PXG5f6g+jKIexMk585xQXVz3BgAhmEFPs=;
 b=Ucz90m71odvn2PhNywBO7z5ORuU52GIhYwOxvhAS3WLAdWqCOa8Tu7GD
 RAOYdjbQ3DRHLe6QJu06Hs9hA1Uf0Fs+5Y1E5nG6ngFrDxXKU4qv7WcEP
 EnmCkbBwOkiPz/IIj+LO6O9Vg1ITIC62qxQMEvUfsmIpxRWfKuRgJi7H2
 +Yh1Ex/6MffFV1Yel/LC8+wzgJwZyj9w2kMaDPJw+uabqoq4BqneVfUrX
 sujyKn1391DtYR0JMXKA5NaSXnW78YNQeKj1uTbkLPkD2yS7pW7o8YcCs
 vK7+2FZz3f/1mj1JpRdShqIvyleAQ7JxtP7HfbGTQvL4uKzKn+TuE3Ukh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123350"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123350"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696099138"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696099138"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:32 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:19 +0300
Message-Id: <20230704095129.269872-18-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 17/27] dept: Track timeout waits separately with a
 new Kconfig
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
Cc: max.byungchul.park@gmail.com, byungchul@sk.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Byungchul Park <byungchul@sk.com>

Waits with valid timeouts don't actually cause deadlocks. However, Dept
has been reporting the cases as well because it's worth informing the
circular dependency for some cases where, for example, timeout is used
to avoid a deadlock but not meant to be expired.

However, yes, there are also a lot of, even more, cases where timeout
is used for its clear purpose and meant to be expired.

Let Dept report these as an information rather than shouting DEADLOCK.
Plus, introduced CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT Kconfig to make it
optional so that any reports involving waits with timeouts can be turned
on/off depending on the purpose.

Signed-off-by: Byungchul Park <byungchul@sk.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/dept.h     | 15 ++++++---
 include/linux/dept_ldt.h |  6 ++--
 include/linux/dept_sdt.h | 12 +++++---
 kernel/dependency/dept.c | 66 ++++++++++++++++++++++++++++++++++------
 lib/Kconfig.debug        | 10 ++++++
 5 files changed, 89 insertions(+), 20 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 583e8fe2dd7b..0aa8d90558a9 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -270,6 +270,11 @@ struct dept_wait {
 			 * whether this wait is for commit in scheduler
 			 */
 			bool		sched_sleep;
+
+			/*
+			 * whether a timeout is set
+			 */
+			bool				timeout;
 		};
 	};
 };
@@ -458,6 +463,7 @@ struct dept_task {
 	bool				stage_sched_map;
 	const char			*stage_w_fn;
 	unsigned long			stage_ip;
+	bool				stage_timeout;
 
 	/*
 	 * the number of missing ecxts
@@ -496,6 +502,7 @@ struct dept_task {
 	.stage_sched_map = false,				\
 	.stage_w_fn = NULL,					\
 	.stage_ip = 0UL,					\
+	.stage_timeout = false,					\
 	.missing_ecxt = 0,					\
 	.hardirqs_enabled = false,				\
 	.softirqs_enabled = false,				\
@@ -513,8 +520,8 @@ extern void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u, con
 extern void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
 extern void dept_map_copy(struct dept_map *to, struct dept_map *from);
 
-extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l);
-extern void dept_stage_wait(struct dept_map *m, struct dept_key *k, unsigned long ip, const char *w_fn);
+extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l, long timeout);
+extern void dept_stage_wait(struct dept_map *m, struct dept_key *k, unsigned long ip, const char *w_fn, long timeout);
 extern void dept_request_event_wait_commit(void);
 extern void dept_clean_stage(void);
 extern void dept_stage_event(struct task_struct *t, unsigned long ip);
@@ -566,8 +573,8 @@ struct dept_task { };
 #define dept_map_reinit(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
 #define dept_map_copy(t, f)				do { } while (0)
 
-#define dept_wait(m, w_f, ip, w_fn, sl)			do { (void)(w_fn); } while (0)
-#define dept_stage_wait(m, k, ip, w_fn)			do { (void)(k); (void)(w_fn); } while (0)
+#define dept_wait(m, w_f, ip, w_fn, sl, t)		do { (void)(w_fn); } while (0)
+#define dept_stage_wait(m, k, ip, w_fn, t)		do { (void)(k); (void)(w_fn); } while (0)
 #define dept_request_event_wait_commit()		do { } while (0)
 #define dept_clean_stage()				do { } while (0)
 #define dept_stage_event(t, ip)				do { } while (0)
diff --git a/include/linux/dept_ldt.h b/include/linux/dept_ldt.h
index 062613e89fc3..8adf298dfcb8 100644
--- a/include/linux/dept_ldt.h
+++ b/include/linux/dept_ldt.h
@@ -27,7 +27,7 @@
 		else if (t)						\
 			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
 		else {							\
-			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl, false);	\
 			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
 		}							\
 	} while (0)
@@ -39,7 +39,7 @@
 		else if (t)						\
 			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
 		else {							\
-			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl, false);\
 			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
 		}							\
 	} while (0)
@@ -51,7 +51,7 @@
 		else if (t)						\
 			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
 		else {							\
-			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl, false);\
 			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
 		}							\
 	} while (0)
diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
index 12a793b90c7e..21fce525f031 100644
--- a/include/linux/dept_sdt.h
+++ b/include/linux/dept_sdt.h
@@ -22,11 +22,12 @@
 
 #define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
 
-#define sdt_wait(m)							\
+#define sdt_wait_timeout(m, t)						\
 	do {								\
 		dept_request_event(m);					\
-		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0, t);		\
 	} while (0)
+#define sdt_wait(m) sdt_wait_timeout(m, -1L)
 
 /*
  * sdt_might_sleep() and its family will be committed in __schedule()
@@ -37,12 +38,13 @@
 /*
  * Use the code location as the class key if an explicit map is not used.
  */
-#define sdt_might_sleep_start(m)					\
+#define sdt_might_sleep_start_timeout(m, t)				\
 	do {								\
 		struct dept_map *__m = m;				\
 		static struct dept_key __key;				\
-		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__);\
+		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
 	} while (0)
+#define sdt_might_sleep_start(m) sdt_might_sleep_start_timeout(m, -1L)
 
 #define sdt_might_sleep_end()		dept_clean_stage()
 
@@ -52,7 +54,9 @@
 #else /* !CONFIG_DEPT */
 #define sdt_map_init(m)			do { } while (0)
 #define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait_timeout(m, t)		do { } while (0)
 #define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start_timeout(m, t) do { } while (0)
 #define sdt_might_sleep_start(m)	do { } while (0)
 #define sdt_might_sleep_end()		do { } while (0)
 #define sdt_ecxt_enter(m)		do { } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 8454f0a14d67..52537c099b68 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -740,6 +740,8 @@ static void print_diagram(struct dept_dep *d)
 	if (!irqf) {
 		print_spc(spc, "[S] %s(%s:%d)\n", c_fn, fc_n, fc->sub_id);
 		print_spc(spc, "[W] %s(%s:%d)\n", w_fn, tc_n, tc->sub_id);
+		if (w->timeout)
+			print_spc(spc, "--------------- >8 timeout ---------------\n");
 		print_spc(spc, "[E] %s(%s:%d)\n", e_fn, fc_n, fc->sub_id);
 	}
 }
@@ -793,6 +795,24 @@ static void print_dep(struct dept_dep *d)
 
 static void save_current_stack(int skip);
 
+static bool is_timeout_wait_circle(struct dept_class *c)
+{
+	struct dept_class *fc = c->bfs_parent;
+	struct dept_class *tc = c;
+
+	do {
+		struct dept_dep *d = lookup_dep(fc, tc);
+
+		if (d->wait->timeout)
+			return true;
+
+		tc = fc;
+		fc = fc->bfs_parent;
+	} while (tc != c);
+
+	return false;
+}
+
 /*
  * Print all classes in a circle.
  */
@@ -815,10 +835,14 @@ static void print_circle(struct dept_class *c)
 	pr_warn("summary\n");
 	pr_warn("---------------------------------------------------\n");
 
-	if (fc == tc)
+	if (is_timeout_wait_circle(c)) {
+		pr_warn("NOT A DEADLOCK BUT A CIRCULAR DEPENDENCY\n");
+		pr_warn("CHECK IF THE TIMEOUT IS INTENDED\n\n");
+	} else if (fc == tc) {
 		pr_warn("*** AA DEADLOCK ***\n\n");
-	else
+	} else {
 		pr_warn("*** DEADLOCK ***\n\n");
+	}
 
 	i = 0;
 	do {
@@ -1564,7 +1588,8 @@ static void add_dep(struct dept_ecxt *e, struct dept_wait *w)
 static atomic_t wgen = ATOMIC_INIT(1);
 
 static void add_wait(struct dept_class *c, unsigned long ip,
-		     const char *w_fn, int sub_l, bool sched_sleep)
+		     const char *w_fn, int sub_l, bool sched_sleep,
+		     bool timeout)
 {
 	struct dept_task *dt = dept_task();
 	struct dept_wait *w;
@@ -1584,6 +1609,7 @@ static void add_wait(struct dept_class *c, unsigned long ip,
 	w->wait_fn = w_fn;
 	w->wait_stack = get_current_stack();
 	w->sched_sleep = sched_sleep;
+	w->timeout = timeout;
 
 	cxt = cur_cxt();
 	if (cxt == DEPT_CXT_HIRQ || cxt == DEPT_CXT_SIRQ)
@@ -2338,7 +2364,7 @@ static struct dept_class *check_new_class(struct dept_key *local,
  */
 static void __dept_wait(struct dept_map *m, unsigned long w_f,
 			unsigned long ip, const char *w_fn, int sub_l,
-			bool sched_sleep, bool sched_map)
+			bool sched_sleep, bool sched_map, bool timeout)
 {
 	int e;
 
@@ -2361,7 +2387,7 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
 		if (!c)
 			continue;
 
-		add_wait(c, ip, w_fn, sub_l, sched_sleep);
+		add_wait(c, ip, w_fn, sub_l, sched_sleep, timeout);
 	}
 }
 
@@ -2403,14 +2429,23 @@ static void __dept_event(struct dept_map *m, unsigned long e_f,
 }
 
 void dept_wait(struct dept_map *m, unsigned long w_f,
-	       unsigned long ip, const char *w_fn, int sub_l)
+	       unsigned long ip, const char *w_fn, int sub_l,
+	       long timeoutval)
 {
 	struct dept_task *dt = dept_task();
 	unsigned long flags;
+	bool timeout;
 
 	if (unlikely(!dept_working()))
 		return;
 
+	timeout = timeoutval > 0 && timeoutval < MAX_SCHEDULE_TIMEOUT;
+
+#if !defined(CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT)
+	if (timeout)
+		return;
+#endif
+
 	if (dt->recursive)
 		return;
 
@@ -2419,21 +2454,30 @@ void dept_wait(struct dept_map *m, unsigned long w_f,
 
 	flags = dept_enter();
 
-	__dept_wait(m, w_f, ip, w_fn, sub_l, false, false);
+	__dept_wait(m, w_f, ip, w_fn, sub_l, false, false, timeout);
 
 	dept_exit(flags);
 }
 EXPORT_SYMBOL_GPL(dept_wait);
 
 void dept_stage_wait(struct dept_map *m, struct dept_key *k,
-		     unsigned long ip, const char *w_fn)
+		     unsigned long ip, const char *w_fn,
+		     long timeoutval)
 {
 	struct dept_task *dt = dept_task();
 	unsigned long flags;
+	bool timeout;
 
 	if (unlikely(!dept_working()))
 		return;
 
+	timeout = timeoutval > 0 && timeoutval < MAX_SCHEDULE_TIMEOUT;
+
+#if !defined(CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT)
+	if (timeout)
+		return;
+#endif
+
 	if (m && m->nocheck)
 		return;
 
@@ -2481,6 +2525,7 @@ void dept_stage_wait(struct dept_map *m, struct dept_key *k,
 
 	dt->stage_w_fn = w_fn;
 	dt->stage_ip = ip;
+	dt->stage_timeout = timeout;
 unlock:
 	arch_spin_unlock(&stage_spin);
 
@@ -2506,6 +2551,7 @@ void dept_clean_stage(void)
 	dt->stage_sched_map = false;
 	dt->stage_w_fn = NULL;
 	dt->stage_ip = 0UL;
+	dt->stage_timeout = false;
 	arch_spin_unlock(&stage_spin);
 
 	dept_exit_recursive(flags);
@@ -2523,6 +2569,7 @@ void dept_request_event_wait_commit(void)
 	unsigned long ip;
 	const char *w_fn;
 	bool sched_map;
+	bool timeout;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2545,6 +2592,7 @@ void dept_request_event_wait_commit(void)
 	w_fn = dt->stage_w_fn;
 	ip = dt->stage_ip;
 	sched_map = dt->stage_sched_map;
+	timeout = dt->stage_timeout;
 
 	/*
 	 * Avoid zero wgen.
@@ -2552,7 +2600,7 @@ void dept_request_event_wait_commit(void)
 	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
 	WRITE_ONCE(dt->stage_m.wgen, wg);
 
-	__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map);
+	__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map, timeout);
 exit:
 	dept_exit(flags);
 }
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index aa62caa4dc14..f78b3d721a2b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1234,6 +1234,16 @@ config DEPT
 	  noting, to mitigate the impact by the false positives, multi
 	  reporting has been supported.
 
+config DEPT_AGGRESSIVE_TIMEOUT_WAIT
+	bool "Aggressively track even timeout waits"
+	depends on DEPT
+	default n
+	help
+	  Timeout wait doesn't contribute to a deadlock. However,
+	  informing a circular dependency might be helpful for cases
+	  that timeout is used to avoid a deadlock. Say N if you'd like
+	  to avoid verbose reports.
+
 config LOCK_DEBUGGING_SUPPORT
 	bool
 	depends on TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT
-- 
2.40.0

