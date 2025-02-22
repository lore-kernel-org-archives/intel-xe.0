Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF4FC021B3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6640B10E0E9;
	Sat, 22 Feb 2025 00:17:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3B10E0E9;
 Sat, 22 Feb 2025 00:17:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cleanup_error_handling_on?=
 =?utf-8?q?_probe=2C_batch_2_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 22 Feb 2025 00:17:16 -0000
Message-ID: <174018343608.612643.4368471709307295948@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Series: Cleanup error handling on probe, batch 2 (rev2)
URL   : https://patchwork.freedesktop.org/series/144906/
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
commit b0fd8b529e03ccd1d3babfef41513b0218fb96f5
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Feb 21 16:10:51 2025 -0800

    drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
    
    xe_ttm_sys_mgr_init() already cleans up after itself, just return error
    if that failed.
    
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f2a2bd676bde0942c9dfe5c55d54eec298260f88 drm-intel
7cc0bf5dc3d1 drivers: base: devres: Allow to release group on device release
-:65: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
04a88cb97456 drivers: base: devres: Fix find_group() documentation
b274b54cfc73 drivers: base: component: Add debug message for unbind
9c1c9bb48089 drm/xe: Stop setting drvdata to NULL
59c9b47166b8 drm/xe: Switch from xe to devm actions
7a56e112aea4 drm/xe: Drop remove callback support
adf111e37038 drm/xe/display: Drop xe_display_driver_remove()
1c21ebfaeadd drm/xe: Move survivability entirely to xe_pci
2f3474e33633 drm/xe: Stop ignoring errors from xe_heci_gsc_init()
66d2d37b27ac drm/xe: Rename update_device_info() after sriov
b0fd8b529e03 drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()


