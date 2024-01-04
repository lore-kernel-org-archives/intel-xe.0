Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721DCC3DA6E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 02:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A91710E2D9;
	Thu,  4 Jan 2024 02:27:09 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A689510E2E2;
 Thu,  4 Jan 2024 02:27:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/debugfs=3A_Add_sup?=
 =?utf-8?q?port_for_gt_synchronous_force_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Date: Thu, 04 Jan 2024 02:27:08 -0000
Message-ID: <170433522868.1406.18330496377240260775@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231231144733.568481-1-karthik.poosa@intel.com>
In-Reply-To: <20231231144733.568481-1-karthik.poosa@intel.com>
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

Series: drm/xe/debugfs: Add support for gt synchronous force reset
URL   : https://patchwork.freedesktop.org/series/128088/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 577f84a1952bf4e6fa358c8241a71f12b2e9c973
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Sun Dec 31 20:17:33 2023 +0530

    drm/xe/debugfs: Add support for gt synchronous force reset
    
    This support added as igt test freq_reset_multiple fails sporadically
    in case xe_guc_pc is not started.
    A completion is added in force_reset for this.
    Writing non-zero to force_reset debugfs entry does synchronous reset.
    
    v2:
    - Changed wait for completion to interruptible (Anshuman).
    - Moved timeout to xe_gt.h (Anshuman).
    - Created a debugfs for updating timeout (Rodrigo).
    
    v3:
    - Update force_reset debugfs with write support.
      value 0 -> async reset, non-zero -> sync reset (Matthew Brost).
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
577f84a19 drm/xe/debugfs: Add support for gt synchronous force reset
-:62: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#62: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:68:
+		ret = wait_for_completion_interruptible_timeout(&gt->reset.done,
+							msecs_to_jiffies(gt->reset.timeout_ms));

-:81: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#81: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:87:
+	size = min(sizeof(arg_str)-1, len);
 	                          ^

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:304:
+	gt->reset.fr_dentry = debugfs_create_file("force_reset", 0600, root, xe,
+			    &force_reset_fops);

-:139: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#139: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:310:
+	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
+					&gt->reset.timeout_ms);

total: 0 errors, 0 warnings, 4 checks, 135 lines checked


