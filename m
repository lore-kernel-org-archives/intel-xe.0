Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A452EE7E644
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 15:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B8410E11D;
	Tue, 26 Sep 2023 15:18:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78CCA10E104;
 Tue, 26 Sep 2023 15:18:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7654AAADD5;
 Tue, 26 Sep 2023 15:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Tue, 26 Sep 2023 15:18:47 -0000
Message-ID: <169574152748.20978.16628439056538215342@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_some_performance_and_frequency_sysfs_nodes_=28rev2=29?=
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

Series: Add some performance and frequency sysfs nodes (rev2)
URL   : https://patchwork.freedesktop.org/series/123164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5eb1ad8399db48773da80f2455351c312af92de7
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Tue Sep 26 20:11:20 2023 +0530

    drm/xe: Add base performance and vram frequency sysfs attributes
    
    This patch adds base performace attributes as well as vram frequency
    attributes.
    
    v2: Create a separate performance directory for attributes.
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
398dbf902 drm/xe: Add a couple of pcode helpers
5eb1ad839 drm/xe: Add base performance and vram frequency sysfs attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-:69: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#69: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:38:
+	err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
+				PCODE_MBOX_DOMAIN_CHIPLET,

-:108: CHECK:LINE_SPACING: Please don't use multiple blank lines
#108: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:77:
+
+

-:118: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#118: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:87:
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_P0,

-:139: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#139: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:108:
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_PN,

-:168: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#168: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:137:
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_P0,

-:189: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#189: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:158:
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_PN,

-:243: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#243: FILE: drivers/gpu/drm/xe/xe_gt_freq_sysfs.c:212:
+
+	}

total: 0 errors, 1 warnings, 7 checks, 281 lines checked


