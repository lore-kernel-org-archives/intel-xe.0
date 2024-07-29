Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC13C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531710E48F;
	Mon, 29 Jul 2024 23:24:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972C10E48F;
 Mon, 29 Jul 2024 23:24:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Improve_qua?=
 =?utf-8?q?lity_and_robustness_of_GuC_log_dumping_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 23:24:39 -0000
Message-ID: <172229547955.426351.7769497906722370749@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc: Improve quality and robustness of GuC log dumping (rev3)
URL   : https://patchwork.freedesktop.org/series/134695/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c4f042c17142d421e356c426ffe42dbbb5091c68
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon Jul 29 16:17:52 2024 -0700

    drm/xe/guc: Add GuC log to devcoredump captures
    
    Add an ption to include the GuC log in devcoredump captures. Note that
    this is currently optional and disabled by default. The reason being
    that useful GuC logs are large, very large when converted to an ASCII
    hex dump! And as they are not always necessary/useful for debugging a
    hang, it is not desirable to force all core dump captures to be huge.
    
    NB: The intent is to add support for buffer compression to the core
    dumps. Then the log can be included as standard without being too
    onerous. At that point the module parameter override can be removed.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch b6f9528c7fffc2f65c8e4969d35d9346fd503c9b drm-intel
f6aafc0507aa drm/xe/guc: Remove spurious line feed in debug print
cbea7ff6ee73 drm/xe/guc: Copy GuC log prior to dumping
d35aab618869 drm/xe/guc: Use a two stage dump for GuC logs and add more info
41966fd2d992 drm/print: Introduce drm_line_printer
2b5935332be5 drm/xe/guc: Add a helper function for dumping GuC log to dmesg
86f48346785d drm/xe/guc: Dead CT helper
-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ct' - possible side-effects?
#68: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:55:
+#define CT_DEAD(ct, ctb, reason_code)								\
+	do {											\
+		struct guc_ctb *_ctb = (ctb);							\
+		if (_ctb)									\
+			_ctb->info.broken = true;						\
+		if (!(ct)->dead.reported) {							\
+			struct xe_guc *guc = ct_to_guc(ct);					\
+			spin_lock_irq(&ct->dead.lock);						\
+			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code;			\
+			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);	\
+			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);	\
+			spin_unlock_irq(&ct->dead.lock);					\
+			queue_work(system_unbound_wq, &(ct)->dead.worker);			\
+		}										\
+	} while (0)

-:84: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#84: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:71:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

-:84: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#84: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:71:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

total: 0 errors, 2 warnings, 1 checks, 470 lines checked
6e10fe05cf16 drm/xe/guc: Dump entire CTB on errors
c4f042c17142 drm/xe/guc: Add GuC log to devcoredump captures
-:113: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#113: FILE: drivers/gpu/drm/xe/xe_module.c:40:
+module_param_named_unsafe(enable_guc_log_in_coredump, xe_modparam.enable_guc_log_in_coredump, bool, 0600);

total: 0 errors, 1 warnings, 0 checks, 89 lines checked


