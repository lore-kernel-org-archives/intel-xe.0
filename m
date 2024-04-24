Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35215C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 20:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039F1113D95;
	Wed, 24 Apr 2024 20:40:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE23113D96;
 Wed, 24 Apr 2024 20:40:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Pre-release?=
 =?utf-8?q?_GuC_firmware_v70=2E24=2E0_for_LNL/BMG/PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 20:40:49 -0000
Message-ID: <171399124964.1632086.14358236920451866382@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC
URL   : https://patchwork.freedesktop.org/series/132867/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3ca3c78b09e30f04523cd2bcc264e4a1a739f0b7
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Apr 24 13:32:54 2024 -0700

    drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC
    
    Update to the latest (pre-release) GuC version for LNL and PVC. Also
    add pre-release support for BMG.
    
    UAPI version 1.10.2.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch ad654139fd5a7773f0310b5f745c105cdba520e8 drm-intel
3ca3c78b09e3 drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC
-:22: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#22: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:107:
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
 	                  	               ^

-:22: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#22: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:107:
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
 	                  	                  ^

-:23: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#23: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
 	                 	               ^

-:23: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#23: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
 	                 	                  ^

-:26: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:110:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	           		             ^

-:26: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:110:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	           		                ^

total: 0 errors, 0 warnings, 6 checks, 12 lines checked


