Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E507EB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 10:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF8410E099;
	Tue,  4 Jul 2023 10:09:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 46D4C10E099;
 Tue,  4 Jul 2023 10:09:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 432B1A0078;
 Tue,  4 Jul 2023 10:09:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Date: Tue, 04 Jul 2023 10:09:38 -0000
Message-ID: <168846537827.28592.9133134264456066581@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DE?=
 =?utf-8?q?PT_2=2E4_test_run_for_drm-xe?=
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: DEPT 2.4 test run for drm-xe
URL   : https://patchwork.freedesktop.org/series/120168/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec83616727744a0b866eb774d9b39181b1e28b00
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Tue Jul 4 12:51:29 2023 +0300

    HAX: dept: Increase DEPT_MAX_WAIT_HIST / DEPT_MAX_ECXT_HELD to track more
    
    Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
+ /mt/dim checkpatch 103e5d7aa1ba8469687574c926f40c630252ede4 drm-intel
23326d980 llist: Move llist_{head, node} definition to types.h
d3c7c8210 dept: Implement Dept(Dependency Tracker)
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:90: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#90: 
new file mode 100644

-:584: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#584: FILE: include/linux/dept.h:490:
+extern void dept_on(void);

-:585: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#585: FILE: include/linux/dept.h:491:
+extern void dept_off(void);

-:586: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#586: FILE: include/linux/dept.h:492:
+extern void dept_init(void);

-:587: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#587: FILE: include/linux/dept.h:493:
+extern void dept_task_init(struct task_struct *t);

-:588: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#588: FILE: include/linux/dept.h:494:
+extern void dept_task_exit(struct task_struct *t);

-:589: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#589: FILE: include/linux/dept.h:495:
+extern void dept_free_range(void *start, unsigned int sz);

-:590: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#590: FILE: include/linux/dept.h:496:
+extern void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);

-:591: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#591: FILE: include/linux/dept.h:497:
+extern void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);

-:592: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#592: FILE: include/linux/dept.h:498:
+extern void dept_map_copy(struct dept_map *to, struct dept_map *from);

-:594: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#594: FILE: include/linux/dept.h:500:
+extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l);

-:594: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#594: FILE: include/linux/dept.h:500:
+extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l);

-:595: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#595: FILE: include/linux/dept.h:501:
+extern void dept_stage_wait(struct dept_map *m, struct dept_key *k, unsigned long ip, const char *w_fn);

-:595: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#595: FILE: include/linux/dept.h:501:
+extern void dept_stage_wait(struct dept_map *m, struct dept_key *k, unsigned long ip, const char *w_fn);

-:596: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#596: FILE: include/linux/dept.h:502:
+extern void dept_request_event_wait_commit(void);

-:597: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#597: FILE: include/linux/dept.h:503:
+extern void dept_clean_stage(void);

-:598: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#598: FILE: include/linux/dept.h:504:
+extern void dept_stage_event(struct task_struct *t, unsigned long ip);

-:599: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#599: FILE: include/linux/dept.h:505:
+extern void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *c_fn, const char *e_fn, int sub_l);

-:599: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#599: FILE: include/linux/dept.h:505:
+extern void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *c_fn, const char *e_fn, int sub_l);

-:600: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#600: FILE: include/linux/dept.h:506:
+extern bool dept_ecxt_holding(struct dept_map *m, unsigned long e_f);

-:601: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#601: FILE: include/linux/dept.h:507:
+extern void dept_request_event(struct dept_map *m);

-:602: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#602: FILE: include/linux/dept.h:508:
+extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn);

-:603: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#603: FILE: include/linux/dept.h:509:
+extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long ip);

-:604: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#604: FILE: include/linux/dept.h:510:
+extern void dept_sched_enter(void);

-:605: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#605: FILE: include/linux/dept.h:511:
+extern void dept_sched_exit(void);

-:615: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#615: FILE: include/linux/dept.h:521:
+extern void dept_key_init(struct dept_key *k);

-:616: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#616: FILE: include/linux/dept.h:522:
+extern void dept_key_destroy(struct dept_key *k);

-:617: WARNING:LONG_LINE: line length of 200 exceeds 100 columns
#617: FILE: include/linux/dept.h:523:
+extern void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f, struct dept_key *new_k, unsigned long new_e_f, unsigned long new_ip, const char *new_c_fn, const char *new_e_fn, int new_sub_l);

-:617: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#617: FILE: include/linux/dept.h:523:
+extern void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f, struct dept_key *new_k, unsigned long new_e_f, unsigned long new_ip, const char *new_c_fn, const char *new_e_fn, int new_sub_l);

-:619: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#619: FILE: include/linux/dept.h:525:
+extern void dept_softirq_enter(void);

-:620: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#620: FILE: include/linux/dept.h:526:
+extern void dept_hardirq_enter(void);

-:621: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#621: FILE: include/linux/dept.h:527:
+extern void dept_softirqs_on_ip(unsigned long ip);

-:622: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#622: FILE: include/linux/dept.h:528:
+extern void dept_hardirqs_on(void);

-:623: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#623: FILE: include/linux/dept.h:529:
+extern void dept_hardirqs_on_ip(unsigned long ip);

-:624: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#624: FILE: include/linux/dept.h:530:
+extern void dept_softirqs_off_ip(unsigned long ip);

-:625: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#625: FILE: include/linux/dept.h:531:
+extern void dept_hardirqs_off(void);

-:626: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#626: FILE: include/linux/dept.h:532:
+extern void dept_hardirqs_off_ip(unsigned long ip);

-:645: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#645: FILE: include/linux/dept.h:551:
+#define dept_wait(m, w_f, ip, w_fn, sl)			do { (void)(w_fn); } while (0)

-:653: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#653: FILE: include/linux/dept.h:559:
+#define dept_event(m, e_f, ip, e_fn)			do { (void)(e_fn); } while (0)

-:658: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#658: FILE: include/linux/dept.h:564:
+#define dept_key_init(k)				do { (void)(k); } while (0)

-:659: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#659: FILE: include/linux/dept.h:565:
+#define dept_key_destroy(k)				do { (void)(k); } while (0)

-:660: WARNING:LONG_LINE: line length of 138 exceeds 100 columns
#660: FILE: include/linux/dept.h:566:
+#define dept_map_ecxt_modify(m, e_f, n_k, n_e_f, n_ip, n_c_fn, n_e_fn, n_sl) do { (void)(n_k); (void)(n_c_fn); (void)(n_e_fn); } while (0)

-:808: WARNING:TYPO_SPELLING: 'muliple' may be misspelled - perhaps 'multiple'?
#808: FILE: kernel/dependency/dept.c:21:
+ *    2) Allow muliple reports.
                ^^^^^^^

-:1058: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#1058: FILE: kernel/dependency/dept.c:271:
+#define OBJECT(id, nr)							\
+static struct dept_##id spool_##id[nr];					\
+static DEFINE_PER_CPU(struct llist_head, lpool_##id);

-:1185: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1185: FILE: kernel/dependency/dept.c:398:
+}
+#include "dept_object.h"

-:1197: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1197: FILE: kernel/dependency/dept.c:410:
+}
+SET_CONSTRUCTOR(dep, initialize_dep);

-:1222: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1222: FILE: kernel/dependency/dept.c:435:
+}
+SET_CONSTRUCTOR(class, initialize_class);

-:1238: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1238: FILE: kernel/dependency/dept.c:451:
+}
+SET_CONSTRUCTOR(ecxt, initialize_ecxt);

-:1252: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1252: FILE: kernel/dependency/dept.c:465:
+}
+SET_CONSTRUCTOR(wait, initialize_wait);

-:1258: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1258: FILE: kernel/dependency/dept.c:471:
+}
+SET_CONSTRUCTOR(stack, initialize_stack);

-:1260: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#1260: FILE: kernel/dependency/dept.c:473:
+#define OBJECT(id, nr) \
+static void (*ctor_##id)(struct dept_##id *a);

-:1277: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1277: FILE: kernel/dependency/dept.c:490:
+}
+SET_DESTRUCTOR(dep, destroy_dep);

-:1293: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1293: FILE: kernel/dependency/dept.c:506:
+}
+SET_DESTRUCTOR(ecxt, destroy_ecxt);

-:1307: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1307: FILE: kernel/dependency/dept.c:520:
+}
+SET_DESTRUCTOR(wait, destroy_wait);

-:1309: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#1309: FILE: kernel/dependency/dept.c:522:
+#define OBJECT(id, nr) \
+static void (*dtor_##id)(struct dept_##id *a);

-:1358: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'bits' - possible side-effects?
#1358: FILE: kernel/dependency/dept.c:571:
+#define HASH(id, bits)							\
+static struct hlist_head table_##id[1 << (bits)];			\
+									\
+static inline struct hlist_head *head_##id(struct dept_##id *a)		\
+{									\
+	return table_##id + hash_long(key_##id(a), bits);		\
+}									\
+									\
+static inline struct dept_##id *hash_lookup_##id(struct dept_##id *a)	\
+{									\
+	struct dept_##id *b;						\
+									\
+	hlist_for_each_entry_rcu(b, head_##id(a), hash_node)		\
+		if (cmp_##id(a, b))					\
+			return b;					\
+	return NULL;							\
+}									\
+									\
+static inline void hash_add_##id(struct dept_##id *a)			\
+{									\
+	get_##id(a);							\
+	hlist_add_head_rcu(&a->hash_node, head_##id(a));		\
+}									\
+									\
+static inline void hash_del_##id(struct dept_##id *a)			\
+{									\
+	hlist_del_rcu(&a->hash_node);					\
+	put_##id(a);							\
+}

-:1387: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1387: FILE: kernel/dependency/dept.c:600:
+}
+#include "dept_hash.h"

-:1491: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1491: FILE: kernel/dependency/dept.c:704:
+		pr_warn("[W] %s(%s:%d) in %s context:\n",
+		       w_fn, tc_n, tc->sub_id, irq_str(irq));

-:2448: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "wh->wait"
#2448: FILE: kernel/dependency/dept.c:1661:
+	return wh->wait != NULL && before(wg, wh->wgen);

-:3108: WARNING:TYPO_SPELLING: 'diabled' may be misspelled - perhaps 'disabled'?
#3108: FILE: kernel/dependency/dept.c:2321:
+	 * Keep the map diabled until the next sleep.
 	                ^^^^^^^

-:3324: WARNING:TYPO_SPELLING: 'Ingore' may be misspelled - perhaps 'Ignore'?
#3324: FILE: kernel/dependency/dept.c:2537:
+	 * XXX: Couldn't handle re-enterance cases. Ingore it for now.
 	                                            ^^^^^^

-:3729: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#3729: FILE: kernel/dependency/dept.c:2942:
+	for (last = first; last->next; last = last->next);

-:3769: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#3769: FILE: kernel/dependency/dept.c:2982:
+#define HASH(id, bits) BUILD_BUG_ON(1 << (bits) <= 0);

-:3772: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#3772: FILE: kernel/dependency/dept.c:2985:
+#define OBJECT(id, nr) mem_total += sizeof(struct dept_##id) * nr;

-:3772: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'nr' may be better as '(nr)' to avoid precedence issues
#3772: FILE: kernel/dependency/dept.c:2985:
+#define OBJECT(id, nr) mem_total += sizeof(struct dept_##id) * nr;

-:3772: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#3772: FILE: kernel/dependency/dept.c:2985:
+#define OBJECT(id, nr) mem_total += sizeof(struct dept_##id) * nr;

-:3775: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#3775: FILE: kernel/dependency/dept.c:2988:
+#define HASH(id, bits) mem_total += sizeof(struct hlist_head) * (1 << (bits));

-:3775: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#3775: FILE: kernel/dependency/dept.c:2988:
+#define HASH(id, bits) mem_total += sizeof(struct hlist_head) * (1 << (bits));

-:3784: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'nr' may be better as '(nr)' to avoid precedence issues
#3784: FILE: kernel/dependency/dept.c:2997:
+#define OBJECT(id, nr)							\
+	pr_info("... memory used by %s: %zu KB\n",			\
+	       #id, B2KB(sizeof(struct dept_##id) * nr));

-:3784: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#3784: FILE: kernel/dependency/dept.c:2997:
+#define OBJECT(id, nr)							\
+	pr_info("... memory used by %s: %zu KB\n",			\
+	       #id, B2KB(sizeof(struct dept_##id) * nr));

-:3789: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#3789: FILE: kernel/dependency/dept.c:3002:
+#define HASH(id, bits)							\
+	pr_info("... hash list head used by %s: %zu KB\n",		\
+	       #id, B2KB(sizeof(struct hlist_head) * (1 << (bits))));

total: 3 errors, 21 warnings, 47 checks, 3800 lines checked
556d7361e dept: Add single event dependency tracker APIs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#67: FILE: include/linux/dept_sdt.h:25:
+#define sdt_wait(m)							\
+	do {								\
+		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+	} while (0)

-:96: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#96: FILE: include/linux/dept_sdt.h:54:
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)

total: 0 errors, 2 warnings, 1 checks, 62 lines checked
298d79bcd dept: Add lock dependency tracker APIs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#39: FILE: include/linux/dept_ldt.h:23:
+#define ldt_lock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
+		}							\
+	} while (0)

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'sl' - possible side-effects?
#39: FILE: include/linux/dept_ldt.h:23:
+#define ldt_lock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
+		}							\
+	} while (0)

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#39: FILE: include/linux/dept_ldt.h:23:
+#define ldt_lock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "trylock", "unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_L, i, "lock", sl);		\
+			dept_ecxt_enter(m, LDT_EVT_L, i, "lock", "unlock", sl);\
+		}							\
+	} while (0)

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#51: FILE: include/linux/dept_ldt.h:35:
+#define ldt_rlock(m, sl, t, n, i, q)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
+		else {							\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
+		}							\
+	} while (0)

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'sl' - possible side-effects?
#51: FILE: include/linux/dept_ldt.h:35:
+#define ldt_rlock(m, sl, t, n, i, q)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
+		else {							\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
+		}							\
+	} while (0)

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#51: FILE: include/linux/dept_ldt.h:35:
+#define ldt_rlock(m, sl, t, n, i, q)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_trylock", "read_unlock", sl);\
+		else {							\
+			dept_wait(m, q ? LDT_EVT_RW : LDT_EVT_W, i, "read_lock", sl);\
+			dept_ecxt_enter(m, LDT_EVT_R, i, "read_lock", "read_unlock", sl);\
+		}							\
+	} while (0)

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#63: FILE: include/linux/dept_ldt.h:47:
+#define ldt_wlock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
+		}							\
+	} while (0)

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'sl' - possible side-effects?
#63: FILE: include/linux/dept_ldt.h:47:
+#define ldt_wlock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
+		}							\
+	} while (0)

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#63: FILE: include/linux/dept_ldt.h:47:
+#define ldt_wlock(m, sl, t, n, i)					\
+	do {								\
+		if (n)							\
+			dept_ecxt_enter_nokeep(m);			\
+		else if (t)						\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_trylock", "write_unlock", sl);\
+		else {							\
+			dept_wait(m, LDT_EVT_RW, i, "write_lock", sl);	\
+			dept_ecxt_enter(m, LDT_EVT_W, i, "write_lock", "write_unlock", sl);\
+		}							\
+	} while (0)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#77: FILE: include/linux/dept_ldt.h:61:
+#define ldt_downgrade(m, i)						\
+	do {								\
+		if (dept_ecxt_holding(m, LDT_EVT_W))			\
+			dept_map_ecxt_modify(m, LDT_EVT_W, NULL, LDT_EVT_R, i, "downgrade", "read_unlock", -1);\
+	} while (0)

-:80: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#80: FILE: include/linux/dept_ldt.h:64:
+			dept_map_ecxt_modify(m, LDT_EVT_W, NULL, LDT_EVT_R, i, "downgrade", "read_unlock", -1);\

-:83: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#83: FILE: include/linux/dept_ldt.h:67:
+#define ldt_set_class(m, n, k, sl, i)	dept_map_ecxt_modify(m, LDT_EVT_ALL, k, 0UL, i, "lock_set_class", "(any)unlock", sl)

-:85: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#85: FILE: include/linux/dept_ldt.h:69:
+#define ldt_init(m, k, su, n)		do { (void)(k); } while (0)

total: 0 errors, 4 warnings, 10 checks, 77 lines checked
3780e7533 dept: Tie to Lockdep and IRQ tracing
-:136: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#136: FILE: include/linux/lockdep.h:547:
+#define spin_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:136: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#136: FILE: include/linux/lockdep.h:547:
+#define spin_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:136: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#136: FILE: include/linux/lockdep.h:547:
+#define spin_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:136: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#136: FILE: include/linux/lockdep.h:547:
+#define spin_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#141: FILE: include/linux/lockdep.h:552:
+#define spin_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#141: FILE: include/linux/lockdep.h:552:
+#define spin_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#141: FILE: include/linux/lockdep.h:552:
+#define spin_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#141: FILE: include/linux/lockdep.h:552:
+#define spin_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#141: FILE: include/linux/lockdep.h:552:
+#define spin_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:146: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#146: FILE: include/linux/lockdep.h:557:
+#define spin_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:146: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#146: FILE: include/linux/lockdep.h:557:
+#define spin_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#151: FILE: include/linux/lockdep.h:562:
+#define rwlock_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#151: FILE: include/linux/lockdep.h:562:
+#define rwlock_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#151: FILE: include/linux/lockdep.h:562:
+#define rwlock_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#151: FILE: include/linux/lockdep.h:562:
+#define rwlock_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:179: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#179: FILE: include/linux/lockdep.h:575:
+#define rwlock_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:179: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#179: FILE: include/linux/lockdep.h:575:
+#define rwlock_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:184: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#184: FILE: include/linux/lockdep.h:580:
+#define seqcount_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:184: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#184: FILE: include/linux/lockdep.h:580:
+#define seqcount_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:184: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#184: FILE: include/linux/lockdep.h:580:
+#define seqcount_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:184: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#184: FILE: include/linux/lockdep.h:580:
+#define seqcount_acquire(l, s, t, i)					\
+do {									\
+	ldt_wlock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#189: FILE: include/linux/lockdep.h:585:
+#define seqcount_acquire_read(l, s, t, i)				\
+do {									\
+	ldt_rlock(&(l)->dmap, s, t, NULL, i, false);			\
+	lock_acquire_shared_recursive(l, s, t, NULL, i);		\
+} while (0)

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#189: FILE: include/linux/lockdep.h:585:
+#define seqcount_acquire_read(l, s, t, i)				\
+do {									\
+	ldt_rlock(&(l)->dmap, s, t, NULL, i, false);			\
+	lock_acquire_shared_recursive(l, s, t, NULL, i);		\
+} while (0)

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#189: FILE: include/linux/lockdep.h:585:
+#define seqcount_acquire_read(l, s, t, i)				\
+do {									\
+	ldt_rlock(&(l)->dmap, s, t, NULL, i, false);			\
+	lock_acquire_shared_recursive(l, s, t, NULL, i);		\
+} while (0)

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#189: FILE: include/linux/lockdep.h:585:
+#define seqcount_acquire_read(l, s, t, i)				\
+do {									\
+	ldt_rlock(&(l)->dmap, s, t, NULL, i, false);			\
+	lock_acquire_shared_recursive(l, s, t, NULL, i);		\
+} while (0)

-:194: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#194: FILE: include/linux/lockdep.h:590:
+#define seqcount_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:194: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#194: FILE: include/linux/lockdep.h:590:
+#define seqcount_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:199: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#199: FILE: include/linux/lockdep.h:595:
+#define mutex_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:199: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#199: FILE: include/linux/lockdep.h:595:
+#define mutex_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:199: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#199: FILE: include/linux/lockdep.h:595:
+#define mutex_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:199: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#199: FILE: include/linux/lockdep.h:595:
+#define mutex_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#204: FILE: include/linux/lockdep.h:600:
+#define mutex_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#204: FILE: include/linux/lockdep.h:600:
+#define mutex_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#204: FILE: include/linux/lockdep.h:600:
+#define mutex_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#204: FILE: include/linux/lockdep.h:600:
+#define mutex_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#204: FILE: include/linux/lockdep.h:600:
+#define mutex_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:209: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#209: FILE: include/linux/lockdep.h:605:
+#define mutex_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:209: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#209: FILE: include/linux/lockdep.h:605:
+#define mutex_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:214: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#214: FILE: include/linux/lockdep.h:610:
+#define rwsem_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:214: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#214: FILE: include/linux/lockdep.h:610:
+#define rwsem_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:214: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#214: FILE: include/linux/lockdep.h:610:
+#define rwsem_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:214: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#214: FILE: include/linux/lockdep.h:610:
+#define rwsem_acquire(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+} while (0)

-:219: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#219: FILE: include/linux/lockdep.h:615:
+#define rwsem_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:219: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#219: FILE: include/linux/lockdep.h:615:
+#define rwsem_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:219: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#219: FILE: include/linux/lockdep.h:615:
+#define rwsem_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:219: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#219: FILE: include/linux/lockdep.h:615:
+#define rwsem_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:219: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#219: FILE: include/linux/lockdep.h:615:
+#define rwsem_acquire_nest(l, s, t, n, i)				\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, n, i);				\
+	lock_acquire_exclusive(l, s, t, n, i);				\
+} while (0)

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#224: FILE: include/linux/lockdep.h:620:
+#define rwsem_acquire_read(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_shared(l, s, t, NULL, i);				\
+} while (0)

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 's' - possible side-effects?
#224: FILE: include/linux/lockdep.h:620:
+#define rwsem_acquire_read(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_shared(l, s, t, NULL, i);				\
+} while (0)

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#224: FILE: include/linux/lockdep.h:620:
+#define rwsem_acquire_read(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_shared(l, s, t, NULL, i);				\
+} while (0)

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#224: FILE: include/linux/lockdep.h:620:
+#define rwsem_acquire_read(l, s, t, i)					\
+do {									\
+	ldt_lock(&(l)->dmap, s, t, NULL, i);				\
+	lock_acquire_shared(l, s, t, NULL, i);				\
+} while (0)

-:229: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#229: FILE: include/linux/lockdep.h:625:
+#define rwsem_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:229: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#229: FILE: include/linux/lockdep.h:625:
+#define rwsem_release(l, i)						\
+do {									\
+	ldt_unlock(&(l)->dmap, i);					\
+	lock_release(l, i);						\
+} while (0)

-:286: WARNING:LONG_LINE: line length of 127 exceeds 100 columns
#286: FILE: include/linux/percpu-rwsem.h:24:
+#define __PERCPU_RWSEM_DEP_MAP_INIT(lockname)	.dep_map = { .name = #lockname, .dmap = DEPT_MAP_INITIALIZER(lockname, NULL) },

-:374: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#374: FILE: include/linux/srcu.h:38:
+#define __SRCU_DEP_MAP_INIT(srcu_name)	.dep_map = { .name = #srcu_name, .dmap = DEPT_MAP_INITIALIZER(srcu_name, NULL) },

-:387: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#387: FILE: kernel/dependency/dept.c:248:
+extern struct lock_class_key __lockdep_no_validate__;

-:439: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#439: FILE: kernel/locking/lockdep.c:4501:
 {
+

total: 0 errors, 3 warnings, 54 checks, 378 lines checked
fc7f85f87 dept: Add proc knobs to show stats and dependency graph
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#112: 
new file mode 100644

-:225: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#225: FILE: kernel/dependency/dept_proc.c:77:
+#define OBJECT(id, nr)							\
+	r = atomic_read(&dept_pool[OBJECT_##id].obj_nr);		\
+	if (r < 0)							\
+		r = 0;							\
+	seq_printf(m, "%s\t%d/%d(%d%%)\n", #id, r, nr, (r * 100) / (nr));

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'nr' - possible side-effects?
#225: FILE: kernel/dependency/dept_proc.c:77:
+#define OBJECT(id, nr)							\
+	r = atomic_read(&dept_pool[OBJECT_##id].obj_nr);		\
+	if (r < 0)							\
+		r = 0;							\
+	seq_printf(m, "%s\t%d/%d(%d%%)\n", #id, r, nr, (r * 100) / (nr));

-:225: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#225: FILE: kernel/dependency/dept_proc.c:77:
+#define OBJECT(id, nr)							\
+	r = atomic_read(&dept_pool[OBJECT_##id].obj_nr);		\
+	if (r < 0)							\
+		r = 0;							\
+	seq_printf(m, "%s\t%d/%d(%d%%)\n", #id, r, nr, (r * 100) / (nr));

-:238: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#238: FILE: kernel/dependency/dept_proc.c:90:
+	proc_create_seq("dept_deps", S_IRUSR, NULL, &dept_deps_ops);

-:239: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#239: FILE: kernel/dependency/dept_proc.c:91:
+	proc_create_single("dept_stats", S_IRUSR, NULL, dept_stats_show);

-:243: WARNING:USE_DEVICE_INITCALL: please use device_initcall() or more appropriate function instead of __initcall() (see include/linux/init.h)
#243: FILE: kernel/dependency/dept_proc.c:95:
+__initcall(dept_proc_init);

total: 1 errors, 5 warnings, 1 checks, 203 lines checked
553ef9bff dept: Apply sdt_might_sleep_{start, end}() to wait_for_completion()/complete()
-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#32: FILE: include/linux/completion.h:33:
+#define init_completion(x)				\
+do {							\
+	sdt_map_init(&(x)->dmap);			\
+	__init_completion(x);				\
+} while (0)

total: 0 errors, 0 warnings, 1 checks, 58 lines checked
f785682a3 dept: Apply sdt_might_sleep_{start, end}() to PG_{locked, writeback} wait
-:29: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#29: FILE: mm/filemap.c:1224:
+static struct dept_map __maybe_unused PG_writeback_map = DEPT_MAP_INITIALIZER(PG_writeback_map, NULL);

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
2c5f31d5a dept: Apply sdt_might_sleep_{start, end}() to swait
20f9ef025 dept: Apply sdt_might_sleep_{start, end}() to waitqueue wait
c10fcf9d2 dept: Apply sdt_might_sleep_{start, end}() to hashed-waitqueue wait
5e6972bbb dept: Distinguish each syscall context from another
-:169: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#169: FILE: include/linux/dept.h:517:
+extern void dept_kernel_enter(void);

total: 0 errors, 0 warnings, 1 checks, 335 lines checked
2f6fa1c02 dept: Distinguish each work from another
-:23: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#23: FILE: include/linux/dept.h:518:
+extern void dept_work_enter(void);

total: 0 errors, 0 warnings, 1 checks, 45 lines checked
51de354ff dept: Add a mechanism to refill the internal memory pools on running out
4f34ed5d8 locking/lockdep, cpu/hotplus: Use a weaker annotation in AP thread
ba789b00a dept: Apply sdt_might_sleep_{start, end}() to dma fence wait
40fc14d31 dept: Track timeout waits separately with a new Kconfig
-:60: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#60: FILE: include/linux/dept.h:523:
+extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l, long timeout);

-:60: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#60: FILE: include/linux/dept.h:523:
+extern void dept_wait(struct dept_map *m, unsigned long w_f, unsigned long ip, const char *w_fn, int sub_l, long timeout);

-:61: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#61: FILE: include/linux/dept.h:524:
+extern void dept_stage_wait(struct dept_map *m, struct dept_key *k, unsigned long ip, const char *w_fn, long timeout);

-:61: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#61: FILE: include/linux/dept.h:524:
+extern void dept_stage_wait(struct dept_map *m, struct dept_key *k, unsigned long ip, const char *w_fn, long timeout);

-:71: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#71: FILE: include/linux/dept.h:576:
+#define dept_wait(m, w_f, ip, w_fn, sl, t)		do { (void)(w_fn); } while (0)

-:116: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#116: FILE: include/linux/dept_sdt.h:25:
+#define sdt_wait_timeout(m, t)						\
 	do {								\
 		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0, t);		\
 	} while (0)

total: 0 errors, 3 warnings, 3 checks, 295 lines checked
497bc2bc4 dept: Apply timeout consideration to wait_for_completion()/complete()
a0c502207 dept: Apply timeout consideration to swait
032bccb89 dept: Apply timeout consideration to waitqueue wait
38445caed dept: Apply timeout consideration to hashed-waitqueue wait
f19ba4a62 dept: Apply timeout consideration to dma fence wait
c71e3bee1 dept: Record the latest one out of consecutive waits of the same class
8e6ec9e96 dept: Make Dept able to work with an external wgen
-:30: WARNING:SPACING: missing space after struct definition
#30: FILE: include/linux/dept.h:493:
+struct dept_ext_wgen{

-:41: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#41: FILE: include/linux/dept.h:528:
+extern void dept_ext_wgen_init(struct dept_ext_wgen *ewg);

-:51: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#51: FILE: include/linux/dept.h:538:
+extern void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg);

-:52: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#52: FILE: include/linux/dept.h:539:
+extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn, struct dept_ext_wgen *ewg);

-:52: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#52: FILE: include/linux/dept.h:539:
+extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn, struct dept_ext_wgen *ewg);

-:79: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#79: FILE: include/linux/dept.h:594:
+#define dept_event(m, e_f, ip, e_fn, wg)		do { (void)(e_fn); } while (0)

total: 0 errors, 3 warnings, 3 checks, 174 lines checked
806253f8f dept: Track the potential waits of PG_{locked, writeback}
-:20: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#20: 
   https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/

-:248: WARNING:EXPORT_SYMBOL: EXPORT_SYMBOL(foo); should immediately follow its function/variable
#248: FILE: mm/filemap.c:1227:
+EXPORT_SYMBOL(PG_locked_map);

-:249: WARNING:EXPORT_SYMBOL: EXPORT_SYMBOL(foo); should immediately follow its function/variable
#249: FILE: mm/filemap.c:1228:
+EXPORT_SYMBOL(PG_writeback_map);

total: 0 errors, 3 warnings, 0 checks, 240 lines checked
6683bd312 HAX: dept: Enable Dept by default
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
ec8361672 HAX: dept: Increase DEPT_MAX_WAIT_HIST / DEPT_MAX_ECXT_HELD to track more
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 10 lines checked


