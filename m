Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF05C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FE510E0FD;
	Thu, 13 Feb 2025 19:35:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77210EBAE;
 Thu, 13 Feb 2025 19:35:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C01/13=5D_drm/xe=3A_Add_callback_support_for_driver_remove?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 19:35:03 -0000
Message-ID: <173947530323.1756964.5889606543923138931@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213192909.996148-1-lucas.demarchi@intel.com>
In-Reply-To: <20250213192909.996148-1-lucas.demarchi@intel.com>
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

Series: series starting with [CI,01/13] drm/xe: Add callback support for driver remove
URL   : https://patchwork.freedesktop.org/series/144821/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 744788353081b4ed675126f519babb781e249e68
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Feb 13 11:29:09 2025 -0800

    drm/xe/hwmon: Stop ignoring errors on probe
    
    Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
    different from failing the initialization. Handle the errors
    appropriately.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4570ecc1f49b000dbba61bb05e22ef5db89382b7 drm-intel
2d12e15a1227 drm/xe: Add callback support for driver remove
-:38: WARNING:FUNCTION_ARGUMENTS: function definition argument 'void *' should also have an identifier name
#38: FILE: drivers/gpu/drm/xe/xe_device.c:70:
+	void (*action)(void *);

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
c38d58c4f767 drm/xe: Fix xe_display_fini() calls
187a48603b01 drm/xe: Fix error handling in xe_irq_install()
05d5f48bcc89 drm/xe: Fix xe_tile_init_noalloc() error propagation
1ac7fe2906fe drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
b6ef870935aa drm/xe: Remove leftover pxp comment
9d636bf64302 drm/xe: Cleanup unwind of gt initialization
a74c1d6564fa drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
dd702e1a5c61 drm/xe/oa: Move fini to xe_oa
5c078c906477 drm/xe: Move drm_dev_unplug() out of display function
f29a2d7cbfa1 drm/xe/oa: Handle errors in xe_oa_register()
6740ae37e45c drm/xe/pmu: Fail probe if xe_pmu_register() fails
744788353081 drm/xe/hwmon: Stop ignoring errors on probe


