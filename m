Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC51C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 23:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B371A10E339;
	Wed, 31 Jul 2024 23:39:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F010E31E;
 Wed, 31 Jul 2024 23:39:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Pick_GuC_fr?=
 =?utf-8?q?om_CI_folder_for_LNL=2C_BMG=2C_PVC_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 23:39:27 -0000
Message-ID: <172246916741.469659.10903209959284244513@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730184309.2939144-1-julia.filipchuk@intel.com>
In-Reply-To: <20240730184309.2939144-1-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC (rev3)
URL   : https://patchwork.freedesktop.org/series/136692/
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
commit 00e3976fd946ce1ec9062a5e431c69023a8030e0
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Wed Jul 31 16:33:26 2024 -0700

    drm/xe/guc: Pick GuC v70.29.2 from CI folder
    
    This is to test the new GuC release before overwriting the existing one.
    
    PVC version is for CI only.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 6d89c6866adbcecfc3ca559d1bdef8be50805055 drm-intel
00e3976fd946 drm/xe/guc: Pick GuC v70.29.2 from CI folder
-:31: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#31: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 2))	\
 	                  	               ^

-:31: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#31: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 2))	\
 	                  	                  ^

-:32: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#32: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:109:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 2))	\
 	                 	               ^

-:32: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#32: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:109:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 2))	\
 	                 	                  ^

-:33: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#33: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:110:
+	fw_def(METEORLAKE,	major_ver(intel-ci/i915,	guc,	mtl,	70, 29, 2))	\
 	                  	               ^

-:33: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#33: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:110:
+	fw_def(METEORLAKE,	major_ver(intel-ci/i915,	guc,	mtl,	70, 29, 2))	\
 	                  	                  ^

-:34: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#34: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:111:
+	fw_def(PVC,		mmp_ver(intel-ci/xe,	guc,	pvc,	70, 29, 2))	\
 	           		             ^

-:34: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#34: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:111:
+	fw_def(PVC,		mmp_ver(intel-ci/xe,	guc,	pvc,	70, 29, 2))	\
 	           		                ^

-:35: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(DG2,		major_ver(intel-ci/i915,	guc,	dg2,	70, 29, 2))	\
 	           		               ^

-:35: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#35: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:112:
+	fw_def(DG2,		major_ver(intel-ci/i915,	guc,	dg2,	70, 29, 2))	\
 	           		                  ^

-:36: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#36: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:113:
+	fw_def(DG1,		major_ver(intel-ci/i915,	guc,	dg1,	70, 29, 2))	\
 	           		               ^

-:36: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#36: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:113:
+	fw_def(DG1,		major_ver(intel-ci/i915,	guc,	dg1,	70, 29, 2))	\
 	           		                  ^

-:37: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#37: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:114:
+	fw_def(ALDERLAKE_N,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
 	                   	               ^

-:37: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#37: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:114:
+	fw_def(ALDERLAKE_N,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
 	                   	                  ^

-:38: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#38: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:115:
+	fw_def(ALDERLAKE_P,	major_ver(intel-ci/i915,	guc,	adlp,	70, 29, 2))	\
 	                   	               ^

-:38: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#38: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:115:
+	fw_def(ALDERLAKE_P,	major_ver(intel-ci/i915,	guc,	adlp,	70, 29, 2))	\
 	                   	                  ^

-:39: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#39: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:116:
+	fw_def(ALDERLAKE_S,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
 	                   	               ^

-:39: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#39: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:116:
+	fw_def(ALDERLAKE_S,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
 	                   	                  ^

-:40: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#40: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:117:
+	fw_def(ROCKETLAKE,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
 	                  	               ^

-:40: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#40: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:117:
+	fw_def(ROCKETLAKE,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))	\
 	                  	                  ^

-:41: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#41: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:118:
+	fw_def(TIGERLAKE,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))
 	                 	               ^

-:41: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#41: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:118:
+	fw_def(TIGERLAKE,	major_ver(intel-ci/i915,	guc,	tgl,	70, 29, 2))
 	                 	                  ^

total: 0 errors, 0 warnings, 22 checks, 28 lines checked


