Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0D3C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 14:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24B10E470;
	Mon, 11 Dec 2023 14:25:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B33B810E474;
 Mon, 11 Dec 2023 14:25:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AF80BAADDA;
 Mon, 11 Dec 2023 14:25:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_compression_handli?=
 =?utf-8?q?ng_on_LNL=2E_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Mon, 11 Dec 2023 14:25:45 -0000
Message-ID: <170230474571.19581.8984462198772127607@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
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

Series: Enable compression handling on LNL. (rev8)
URL   : https://patchwork.freedesktop.org/series/126704/
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
commit 341c5bf48278e3d1e4236e5245cf96b3d638a6cc
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Dec 11 19:13:56 2023 +0530

    drm/xe/xe2: Support flat ccs
    
    Enable flat ccs for XE2_GFX_FEATURES.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 00175313322325f73095e61b6cbe550f47184408 drm-intel
dcc9e899f drm/xe/xe2: Determine bios enablement for flat ccs on igfx
-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/gpu/drm/xe/xe_device.c:425:
+		drm_dbg(&xe->drm,
+			 "Flat CCS has been disabled in bios, May lead to performance impact");

total: 0 errors, 0 warnings, 1 checks, 63 lines checked
9096f5185 drm/xe/xe2: Modify main memory to ccs memory ratio.
7694beb51 drm/xe/xe2: Allocate extra pages for ccs during bo create
-:18: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#18: 
 - Seperate out patch to modify main memory to ccs memory ratio.(Matt)
   ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
b6f3a55f6 drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
a3f26211a drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
c94fca4ef drm/xe/xe2: Update chunk size for each iteration of ccs copy
-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#29: FILE: drivers/gpu/drm/xe/xe_migrate.c:70:
+#define MAX_MEM_TRANSFER_PER_PASS(_xe) ((!IS_DGFX(_xe) && GRAPHICS_VER(_xe) >= 20 && \
+					 xe_device_has_flat_ccs(_xe)) ? \
+					 MAX_CCS_LIMITED_TRANSFER : MAX_PREEMPTDISABLE_TRANSFER)

total: 0 errors, 0 warnings, 1 checks, 89 lines checked
5a9640b02 drm/xe/xe2: Update emit_pte to use compression enabled PAT index
46d677226 drm/xe/xe2: Handle flat ccs move for igfx.
56e6ff259 drm/xe/xe2: Modify xe_bo_test for system memory
341c5bf48 drm/xe/xe2: Support flat ccs


