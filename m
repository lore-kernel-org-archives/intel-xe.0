Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE578C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 17:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65010E1BE;
	Mon,  5 Aug 2024 17:49:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A22210E1BE;
 Mon,  5 Aug 2024 17:49:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Update_to_GuC_v70=2E29=2E?=
 =?utf-8?q?2_as_minimum_for_Xe_=28support_LNL=2C_BMG=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 17:49:48 -0000
Message-ID: <172288018856.541079.9319667007718332726@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
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

Series: Update to GuC v70.29.2 as minimum for Xe (support LNL, BMG) (rev2)
URL   : https://patchwork.freedesktop.org/series/136857/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9e645341d3008ce246879af606f45d0e5d21d698
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a756296b1a9ac0b4aff1fce2c03c21aa247f28cc
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Fri Aug 2 15:21:29 2024 -0700

    drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC
    
    Add pre-release support for PVC.
    
    UAPI version 1.13.4.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 9e05740a01c348338498296b934a7652efff6aef drm-intel
cbcb56308ea1 Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
2ee60ce89934 drm/xe/guc: Bump minimum required GuC version to v70.29.2
-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ver' - possible side-effects?
#41: FILE: drivers/gpu/drm/xe/xe_guc.h:20:
+#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)

-:42: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#42: FILE: drivers/gpu/drm/xe/xe_guc.h:21:
+#define GUC_SUBMIT_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])

-:43: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#43: FILE: drivers/gpu/drm/xe/xe_guc.h:22:
+#define GUC_FIRMWARE_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])

total: 0 errors, 2 warnings, 1 checks, 61 lines checked
0171b831d335 drm/xe/guc: Define GuC version v70.29.2 for BMG
a756296b1a9a drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC
-:22: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#22: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	           		             ^

-:22: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#22: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	           		                ^

total: 0 errors, 0 warnings, 2 checks, 7 lines checked


