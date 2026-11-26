Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1C606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B69810E9DC;
	Thu, 26 Nov 2026 18:41:10 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F8E10E9DC;
 Thu, 26 Nov 2026 18:41:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Support_xe=5Flo?=
 =?utf-8?q?g=5F*_helpers_in_atomic_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 18:41:09 -0000
Message-ID: <179571846926.95098.13188868452484339822@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Support xe_log_* helpers in atomic context
URL   : https://patchwork.freedesktop.org/series/179761/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c70303a5ec0469141a0e2fe47876d89bac3f59e6
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Thu Nov 26 19:27:38 2026 +0530

    drm/xe/guc_ct: Use atomic logging under ct->fast_lock
    
    Several error paths in GuC CT can run while ct->fast_lock is held.
    Since the lock is a spinlock, these paths execute in atomic context.
    
    Replace xe_log_err() with xe_log_err_atomic() in these paths so CPER
    records are allocated with GFP_ATOMIC instead of GFP_KERNEL.
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 436eec0ef1b65f139fa2f3c42aea97c29da57c8c drm-intel
47b99bd46ff8 drm/xe/cper: Software CPER-Do not review
27b0cb61e0e2 drm/xe/log: Add xe_log_* logging helpers for atomic context
-:82: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'sev' - possible side-effects?
#82: FILE: drivers/gpu/drm/xe/xe_log.h:39:
+#define xe_log_emit_atomic(pdev, sev, sig, comp, loc, data, len, fmt, args...) do {	\
+	__xe_log_emit_printk_index(__xe_log_const_sev_to_level(sev), fmt);		\
+	__xe_log_emit_atomic((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+} while (0)

-:82: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fmt' - possible side-effects?
#82: FILE: drivers/gpu/drm/xe/xe_log.h:39:
+#define xe_log_emit_atomic(pdev, sev, sig, comp, loc, data, len, fmt, args...) do {	\
+	__xe_log_emit_printk_index(__xe_log_const_sev_to_level(sev), fmt);		\
+	__xe_log_emit_atomic((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+} while (0)

total: 0 errors, 0 warnings, 2 checks, 119 lines checked
5810bb052330 drm/xe/cper: Add gfp argument to xe_cper_emit()
90ab5816dd2e drm/xe/tests: Update log tests for atomic logging support
3da35ba384ff drm/xe/pagefault: Use xe_log_err_atomic() for queue full errors
c70303a5ec04 drm/xe/guc_ct: Use atomic logging under ct->fast_lock


