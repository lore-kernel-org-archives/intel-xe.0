Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFBDC27C55
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBFA10E24B;
	Tue, 11 Jun 2024 01:25:49 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891B410E24B;
 Tue, 11 Jun 2024 01:25:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Improve_qua?=
 =?utf-8?q?lity_and_robustness_of_GuC_log_dumping_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 01:25:47 -0000
Message-ID: <171806914755.66124.12994681209192753330@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve quality and robustness of GuC log dumping (rev2)
URL   : https://patchwork.freedesktop.org/series/134695/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55275527a8e3c90264b21af86d1d5b7ee88c4766
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon Jun 10 18:20:28 2024 -0700

    drm/xe/guc: Dump entire CTB on errors
    
    The dump of the CT buffers was only showing the unprocessed data which
    is not generally useful for saying why a hang occurred - because it
    was probably caused by the commands that were just processed. So save
    and dump the entire buffer but in a more compact dump format. Also
    zero fill it on allocation to avoid confusion over uninitialised data
    in the dump.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch bf9d891af55d3785eb9438efb053c991bf2b4b10 drm-intel
e8032ca02755 drm/xe/guc: Remove spurious line feed in debug print
17086d55b750 drm/xe/guc: Copy GuC log prior to dumping
19dded41b069 drm/xe/guc: Use a two stage dump for GuC logs and add more info
7607b9210892 drm/print: Introduce drm_line_printer
50ff41f41283 drm/xe/guc: Add a helper function for dumping GuC log to dmesg
b06f69de1641 drm/xe/guc: Dead CT helper
-:62: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ct' - possible side-effects?
#62: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:56:
+#define CT_DEAD(ct, hxg, reason_code) \
+	do { \
+		struct guc_ctb *_hxg = (hxg); \
+		if (_hxg) \
+			_hxg->info.broken = true; \
+		if (!(ct)->dead.reported) { \
+			struct xe_guc *guc = ct_to_guc(ct); \
+			spin_lock_irq(&ct->dead.lock); \
+			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code; \
+			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true); \
+			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true); \
+			spin_unlock_irq(&ct->dead.lock); \
+			queue_work(system_unbound_wq, &(ct)->dead.worker); \
+		} \
+	} while (0)

-:78: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#78: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:72:
+#define CT_DEAD(ct, hxg, reason) \
+	do { \
+		struct guc_ctb *_hxg = (hxg); \
+		if (_hxg) \
+			_hxg->info.broken = true; \
+	} while (0)

-:78: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#78: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:72:
+#define CT_DEAD(ct, hxg, reason) \
+	do { \
+		struct guc_ctb *_hxg = (hxg); \
+		if (_hxg) \
+			_hxg->info.broken = true; \
+	} while (0)

total: 0 errors, 2 warnings, 1 checks, 460 lines checked
55275527a8e3 drm/xe/guc: Dump entire CTB on errors


