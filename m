Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80401C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 21:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82610E059;
	Thu,  1 Aug 2024 21:20:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9D510E059;
 Thu,  1 Aug 2024 21:20:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Release_GuC_v70=2E29=2E2_?=
 =?utf-8?q?for_LNL=2C_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 21:20:44 -0000
Message-ID: <172254724437.489274.17486346767351477023@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801204010.3042850-1-julia.filipchuk@intel.com>
In-Reply-To: <20240801204010.3042850-1-julia.filipchuk@intel.com>
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

Series: Release GuC v70.29.2 for LNL, BMG
URL   : https://patchwork.freedesktop.org/series/136815/
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
commit 1751c87e3fe533c68ce3bd52bcc50031032029c6
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Thu Aug 1 13:40:10 2024 -0700

    drm/xe/guc: Pick for-ci GuC firmware for PVC
    
    UAPI version 1.10.2.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 drm-intel
10b1ffaced09 Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:24: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
1b146fd38df1 drm/xe/guc: Release GuC v70.29.2 for LNL, BMG
-:81: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#81: FILE: drivers/gpu/drm/xe/xe_uc_fw.h:19:
+#define MAKE_VER_STRUCT(ver) MAKE_VER((ver).major, (ver).minor, (ver).patch)

total: 0 errors, 0 warnings, 1 checks, 55 lines checked
1751c87e3fe5 drm/xe/guc: Pick for-ci GuC firmware for PVC
-:18: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#18: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	           		             ^

-:18: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#18: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	           		                ^

total: 0 errors, 0 warnings, 2 checks, 7 lines checked


