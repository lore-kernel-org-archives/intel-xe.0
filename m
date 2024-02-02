Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0FDC4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401310E418;
	Fri,  2 Feb 2024 20:06:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449B10E2D1;
 Fri,  2 Feb 2024 20:06:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Update_to_GuC_70=2E19=2E2?=
 =?utf-8?q?_and_add_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 20:06:30 -0000
Message-ID: <170690439015.953329.1006280018882542479@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
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

Series: Update to GuC 70.19.2 and add LNL
URL   : https://patchwork.freedesktop.org/series/129483/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 345375af034602d0d65bb1586f9b99eac317d754
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Feb 2 12:00:17 2024 -0800

    drm/xe/guc: define PVC FW
    
    Add PVC GuC FW definition. This is patch is for CI-only and it is meant
    for the topic/core-for-CI branch.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1155
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 1dd92467500a5ead3e44bbdfe15e064dd79b65ef drm-intel
30219e3fe Revert "drm/xe/guc: define LNL FW"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e4cfe0cd981952f6ed3d5b92a0b7e3ae0b3ad2b4', maybe rebased or not pulled?
#6: 
This reverts commit e4cfe0cd981952f6ed3d5b92a0b7e3ae0b3ad2b4.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
3b9241d50 Revert "drm/xe/guc: define PVC FW"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6fed16fd875e413bcb9be8c90ea86260216361eb', maybe rebased or not pulled?
#6: 
This reverts commit 6fed16fd875e413bcb9be8c90ea86260216361eb.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
da0780b74 drm/xe/uc: Include patch version in expectations
-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:140:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
+	  a, b, c }

-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:140:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
+	  a, b, c }

-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:140:
+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
+	  a, b, c }

total: 0 errors, 0 warnings, 3 checks, 96 lines checked
3f4101565 drm/xe/guc: Update to GuC firmware 70.19.2
c200ce847 drm/xe/guc: Add support for LNL firmware
345375af0 drm/xe/guc: define PVC FW


