Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFEFC8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 18:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390D810E117;
	Mon, 30 Jun 2025 18:06:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729C10E117;
 Mon, 30 Jun 2025 18:06:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_Add_legac?=
 =?utf-8?q?y_IP_descriptors_to_param_generators?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 18:06:54 -0000
Message-ID: <175130681494.121655.13746550799681927657@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250627181110.1436-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250627181110.1436-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/tests: Add legacy IP descriptors to param generators
URL   : https://patchwork.freedesktop.org/series/150895/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4cdd93965f40f27e14c1d285eb96d48394b4baa2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jun 27 20:11:10 2025 +0200

    drm/xe/tests: Add legacy IP descriptors to param generators
    
    Recently introduced kunit parameter generators where based on
    the existing arrays which have only GDMID-bsaed IP and didn't
    take into account legacy IP definitions from pre-GMDID era.
    
    Add test only arrays with legacy IPs (as those will not change)
    and extend param generators to start iterating over them.
    
     [ ] =================== xe_pci (2 subtests) ====================
     [ ] ==================== check_graphics_ip  ====================
     [ ] [PASSED] 12.00 Xe_LP
     [ ] [PASSED] 12.10 Xe_LP+
     [ ] [PASSED] 12.55 Xe_HPG
     [ ] [PASSED] 12.60 Xe_HPC
     [ ] [PASSED] 12.70 Xe_LPG
     [ ] [PASSED] 12.71 Xe_LPG
     [ ] [PASSED] 12.74 Xe_LPG+
     [ ] [PASSED] 20.01 Xe2_HPG
     [ ] [PASSED] 20.02 Xe2_HPG
     [ ] [PASSED] 20.04 Xe2_LPG
     [ ] [PASSED] 30.00 Xe3_LPG
     [ ] [PASSED] 30.01 Xe3_LPG
     [ ] [PASSED] 30.03 Xe3_LPG
     [ ] ================ [PASSED] check_graphics_ip ================
     [ ] ===================== check_media_ip  ======================
     [ ] [PASSED] 12.00 Xe_M
     [ ] [PASSED] 12.55 Xe_HPM
     [ ] [PASSED] 13.00 Xe_LPM+
     [ ] [PASSED] 13.01 Xe2_HPM
     [ ] [PASSED] 20.00 Xe2_LPM
     [ ] [PASSED] 30.00 Xe3_LPM
     [ ] [PASSED] 30.02 Xe3_LPM
     [ ] ================= [PASSED] check_media_ip ==================
     [ ] ===================== [PASSED] xe_pci ======================
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch f286b243950bff50335f38f30ee72e82cb33c60f drm-intel
4cdd93965f40 drm/xe/tests: Add legacy IP descriptors to param generators
-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'arr' - possible side-effects?
#52: FILE: drivers/gpu/drm/xe/tests/xe_pci.c:15:
+#define IS_ARRAY_ROW(arr, row) ((typeof(&(arr)[0]))(row) - (arr) < ARRAY_SIZE(arr))

total: 0 errors, 0 warnings, 1 checks, 57 lines checked


