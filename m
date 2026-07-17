Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EEEC44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 08:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAB810E428;
	Fri, 17 Jul 2026 08:28:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949BA10E428;
 Fri, 17 Jul 2026 08:28:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/debugfs=3A_Add_kno?=
 =?utf-8?q?b_to_wedge_on_first_page_fault_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jul 2026 08:28:03 -0000
Message-ID: <178427688360.200519.13821126928760518725@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717082243.337548-1-arvind.yadav@intel.com>
In-Reply-To: <20260717082243.337548-1-arvind.yadav@intel.com>
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

Series: drm/xe/debugfs: Add knob to wedge on first page fault (rev2)
URL   : https://patchwork.freedesktop.org/series/170526/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7aec9d88014e095ebfae3411420d354327a015af
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Fri Jul 17 13:52:43 2026 +0530

    drm/xe/debugfs: Add knob to wedge on first page fault
    
    Add a debugfs knob to wedge the device on the first GPU page fault.
    
    This is intended for debug where preserving the faulting HW
    state is more useful than servicing the fault. When enabled,
    the first page fault is printed and the device is declared wedged
    without servicing or acknowledging the fault.
    
      echo 1 > /sys/kernel/debug/dri/<card>/wedge_on_first_pagefault
    
    v2:
      - Move first-pagefault debug state under xe->wedged. (Matt)
      - Queue the wedge operation on the GT ordered workqueue. (Matt)
      - Drop xe_pagefault_save_to_vm() from the debug path. (Matt)
      - Cancel pending first-pagefault wedge work in pagefault fini.
      - Re-arm pf_wedge_triggered before enabling wedge_on_first_pagefault.
        (Sashiko)
      - Use release/acquire ordering between debugfs enable and PF worker.
        (Sashiko)
      - Do not clear the latch on disable. (Sashiko)
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 22852552aa1b7198931842ddf824af4dd09e2814 drm-intel
7aec9d88014e drm/xe/debugfs: Add knob to wedge on first page fault
-:95: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#95: FILE: drivers/gpu/drm/xe/xe_debugfs.c:714:
+		debugfs_create_file("wedge_on_first_pagefault", 0600, root, xe,
+				     &wedge_on_first_pagefault_fops);

-:168: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#168: FILE: drivers/gpu/drm/xe/xe_pagefault.c:327:
+				xe_gt_err(pf.gt,
+					"wedge_on_first_pagefault: freezing HW after first fault\n");

total: 0 errors, 0 warnings, 2 checks, 146 lines checked


