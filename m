Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838E8C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6C910E437;
	Mon, 11 Dec 2023 13:37:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C72110E437;
 Mon, 11 Dec 2023 13:37:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 085D6AADD5;
 Mon, 11 Dec 2023 13:37:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_*Enable_compression_handl?=
 =?utf-8?q?ing_on_LNL=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Mon, 11 Dec 2023 13:37:27 -0000
Message-ID: <170230184703.19579.9551132139816170373@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
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

Series: *Enable compression handling on LNL.
URL   : https://patchwork.freedesktop.org/series/127631/
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
commit 9b1df23bccdafe6b04e3be92208201c01a9f4ff3
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Dec 11 19:11:23 2023 +0530

    drm/xe/xe2: Support flat ccs
    
    Enable flat ccs for XE2_GFX_FEATURES.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 00175313322325f73095e61b6cbe550f47184408 drm-intel
14473e908 drm/xe/xe2: Determine bios enablement for flat ccs on igfx
-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/gpu/drm/xe/xe_device.c:425:
+		drm_dbg(&xe->drm,
+			 "Flat CCS has been disabled in bios, May lead to performance impact");

total: 0 errors, 0 warnings, 1 checks, 63 lines checked
4695deefb drm/xe/xe2: Modify main memory to ccs memory ratio.
87deb5867 drm/xe/xe2: Allocate extra pages for ccs during bo create
-:18: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#18: 
 - Seperate out patch to modify main memory to ccs memory ratio.(Matt)
   ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
4e5db9e25 drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
f27593644 drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
a05af7298 drm/xe/xe2: Update chunk size for each iteration of ccs copy
-:29: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#29: FILE: drivers/gpu/drm/xe/xe_migrate.c:70:
+#define MAX_MEM_TRANSFER_PER_PASS(_xe) ((!IS_DGFX(_xe) && GRAPHICS_VER(_xe) >= 20 && \
+					 xe_device_has_flat_ccs(_xe)) ? \
+					 MAX_CCS_LIMITED_TRANSFER : MAX_PREEMPTDISABLE_TRANSFER)

total: 0 errors, 0 warnings, 1 checks, 89 lines checked
000e69fa6 drm/xe/xe2: Update emit_pte to use compression enabled PAT index
c86082578 drm/xe/xe2: Handle flat ccs move for igfx.
18352a30e drm/xe/xe2: Modify xe_bo_test for system memory
9b1df23bc drm/xe/xe2: Support flat ccs


