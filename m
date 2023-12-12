Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F65C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 19:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24A110E054;
	Tue, 12 Dec 2023 19:07:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79B4010E054;
 Tue, 12 Dec 2023 19:07:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7609FAADED;
 Tue, 12 Dec 2023 19:07:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_compression_handli?=
 =?utf-8?q?ng_on_LNL=2E_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 12 Dec 2023 19:07:42 -0000
Message-ID: <170240806248.31294.4958401775625486921@emeril.freedesktop.org>
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

Series: Enable compression handling on LNL. (rev9)
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
commit 517c3a9532af9259a109db134bbc4dc30f93ba1a
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Dec 12 23:55:33 2023 +0530

    drm/xe/xe2: Support flat ccs
    
    Enable flat ccs for XE2_GFX_FEATURES.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 0b1815ab4b04bda8d9ee494052ac24f7d307132c drm-intel
582ef1edc drm/xe/xe2: Determine bios enablement for flat ccs on igfx
054770581 drm/xe/xe2: Modify main memory to ccs memory ratio.
917feb000 drm/xe/xe2: Allocate extra pages for ccs during bo create
ce023853f drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
0df969635 drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
130218c60 drm/xe/xe2: Update chunk size for each iteration of ccs copy
-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_xe' - possible side-effects?
#30: FILE: drivers/gpu/drm/xe/xe_migrate.c:70:
+#define MAX_MEM_TRANSFER_PER_PASS(_xe) ((!IS_DGFX(_xe) && GRAPHICS_VER(_xe) >= 20 && \
+					 xe_device_has_flat_ccs(_xe)) ? \
+					 MAX_CCS_LIMITED_TRANSFER : MAX_PREEMPTDISABLE_TRANSFER)

total: 0 errors, 0 warnings, 1 checks, 89 lines checked
58525c01e drm/xe/xe2: Update emit_pte to use compression enabled PAT index
e73e06e6d drm/xe/xe2: Handle flat ccs move for igfx.
8c5c57bd8 drm/xe/xe2: Modify xe_bo_test for system memory
517c3a953 drm/xe/xe2: Support flat ccs


