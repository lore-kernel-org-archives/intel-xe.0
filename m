Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0BFC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 18:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBD110E574;
	Tue, 30 Jul 2024 18:49:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C1810E574;
 Tue, 30 Jul 2024 18:49:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Pick_GuC_fr?=
 =?utf-8?q?om_CI_folder_for_LNL=2C_BMG=2C_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jul 2024 18:49:13 -0000
Message-ID: <172236535386.446235.1792852537017075938@2413ebb6fbb6>
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

Series: drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC
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
commit e5a850a4f9c18d76172b1fbcf1018b1515082340
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Tue Jul 30 11:43:08 2024 -0700

    drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC
    
    This is to test the new GuC release before overwriting the existing one.
    This patch will be merged to staging with clean CI.
    
    PVC version is for CI only.
    LNL, BMG will be staged for upstream.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch acd846e309e206a4dbc83e4b857b6604aa0741af drm-intel
e5a850a4f9c1 drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC
-:23: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#23: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:111:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	           		             ^

-:23: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#23: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:111:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	           		                ^

total: 0 errors, 0 warnings, 2 checks, 8 lines checked


