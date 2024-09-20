Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7474CF9C51
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 15:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9908D10E102;
	Fri, 20 Sep 2024 15:24:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C418210E102;
 Fri, 20 Sep 2024 15:24:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Debug_g2h_timeout_issue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 15:24:30 -0000
Message-ID: <172684587079.1051346.14930324666648506125@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920142922.618649-1-badal.nilawar@intel.com>
In-Reply-To: <20240920142922.618649-1-badal.nilawar@intel.com>
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

Series: Debug g2h timeout issue
URL   : https://patchwork.freedesktop.org/series/138928/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1f449c5bb0089f814478b1ca0df39b6ba8c08e1f
Author: bnilawar <badal.nilawar@intel.com>
Date:   Fri Sep 20 19:59:22 2024 +0530

    Debug prints/logs to debug G2H timeout issue
    
    Debug print and GuC log in dmesg to debug possible G2H irq delay / miss
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 drm-intel
ecdc8858abfc drm/xe/guc: Remove spurious line feed in debug print
003909edcad7 drm/xe/devcoredump: Use drm_puts and already cached local variables
44c3f9657c67 drm/xe/devcoredump: Improve section headings and add tile info
5fe1639487aa drm/xe/devcoredump: Add ASCII85 dump helper function
2b4f6c2f7c9b drm/xe/guc: Copy GuC log prior to dumping
952b4885df88 drm/xe/guc: Use a two stage dump for GuC logs and add more info
0d54ba5d25e7 drm/print: Introduce drm_line_printer
9a24dddd60c9 drm/xe/guc: Dead CT helper
-:96: WARNING:MACRO_ARG_UNUSED: Argument 'ct' is not used in function-like macro
#96: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:62:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

-:96: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#96: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:62:
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)

total: 0 errors, 2 warnings, 0 checks, 557 lines checked
fd077f4d51d4 drm/xe/guc: Dump entire CTB on errors
54e982c83dc9 drm/xe/guc: Add GuC log to devcoredump captures
6ac89013cf7e drm/xe/guc: Add a helper function for dumping GuC log to dmesg
1f449c5bb008 Debug prints/logs to debug G2H timeout issue
-:45: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: bnilawar <badal.nilawar@intel.com>' != 'Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


