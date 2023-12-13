Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D5C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 01:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE71210E031;
	Wed, 13 Dec 2023 01:52:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9ECAB10E031;
 Wed, 13 Dec 2023 01:52:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9AE23AADDA;
 Wed, 13 Dec 2023 01:52:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_compression_handli?=
 =?utf-8?q?ng_on_LNL=2E_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 13 Dec 2023 01:52:39 -0000
Message-ID: <170243235963.10260.6978450843619095289@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
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

Series: Enable compression handling on LNL. (rev10)
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
commit ffa1c41c5a740ba08b1a85f424a7a7d93dc336d8
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Dec 12 23:55:33 2023 +0530

    drm/xe/xe2: Support flat ccs
    
    Enable flat ccs for XE2_GFX_FEATURES.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch b7e6b29e607e7c75765d77d4ae315dec580d1ccc drm-intel
d01ad5627 drm/xe/xe2: Determine bios enablement for flat ccs on igfx
6ea9cbdfe drm/xe/xe2: Modify main memory to ccs memory ratio.
3a8fea6b8 drm/xe/xe2: Allocate extra pages for ccs during bo create
842cd9b7c drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
06e1ba62e drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
193a77c48 drm/xe/xe2: Update chunk size for each iteration of ccs copy
-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#30: FILE: drivers/gpu/drm/xe/xe_migrate.c:70:
+#define MAX_MEM_TRANSFER_PER_PASS(_xe) ((!IS_DGFX(_xe) && GRAPHICS_VER(_xe) >= 20 && \
+					 xe_device_has_flat_ccs(_xe)) ? \
+					 MAX_CCS_LIMITED_TRANSFER : MAX_PREEMPTDISABLE_TRANSFER)

total: 0 errors, 0 warnings, 1 checks, 89 lines checked
18383e7e5 drm/xe/xe2: Update emit_pte to use compression enabled PAT index
c646af165 drm/xe/xe2: Handle flat ccs move for igfx.
ddd6d6b13 drm/xe/xe2: Modify xe_bo_test for system memory
ffa1c41c5 drm/xe/xe2: Support flat ccs


