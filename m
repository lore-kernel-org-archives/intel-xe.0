Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6920FC3DA64
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 00:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C3510E955;
	Fri,  2 Aug 2024 00:46:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D7D10E955;
 Fri,  2 Aug 2024 00:46:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Enable_w/a_?=
 =?utf-8?q?14022293748_and_22019794406_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Aug 2024 00:46:08 -0000
Message-ID: <172255956860.489836.8680577653834144685@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240802004017.3057708-1-julia.filipchuk@intel.com>
In-Reply-To: <20240802004017.3057708-1-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Enable w/a 14022293748 and 22019794406 (rev4)
URL   : https://patchwork.freedesktop.org/series/136307/
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
commit 13bcc37564a29a2ad74cbb819771780bc250dcbc
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Thu Aug 1 17:40:17 2024 -0700

    drm/xe/guc: Enable w/a 14022293748 and 22019794406
    
    Enable workarounds for HW bug where render engine reset fails. Check
    firmware version supports the workarounds.
    
    v2: Enable KLV correctly for either workaround (Lucas)
    v4: Add check for minimum supported GuC firmware version. Enable w/a for
    hw version 20.01 too. (Daniele)
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 drm-intel
282a16d6c38a NOT_UPSTREAM/CIdrm/xe/guc: Release GuC v70.29.2
-:57: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#57: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(PVC,		mmp_ver(intel-ci/xe,	guc,	pvc,	70, 29, 2))	\
 	           		             ^

-:57: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#57: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(PVC,		mmp_ver(intel-ci/xe,	guc,	pvc,	70, 29, 2))	\
 	           		                ^

-:99: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#99: FILE: drivers/gpu/drm/xe/xe_uc_fw.h:19:
+#define MAKE_VER_STRUCT(ver) MAKE_VER((ver).major, (ver).minor, (ver).patch)

total: 0 errors, 0 warnings, 3 checks, 74 lines checked
13bcc37564a2 drm/xe/guc: Enable w/a 14022293748 and 22019794406
-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:377:
+	if (fw_ver >= MAKE_VER(70, 29, 0) &&
+		(XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406)))

total: 0 errors, 0 warnings, 1 checks, 50 lines checked


