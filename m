Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78832C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C41B10E37B;
	Fri, 14 Feb 2025 21:51:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7926010E37B;
 Fri, 14 Feb 2025 21:51:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cleanup_error_handling_on?=
 =?utf-8?q?_probe=2C_batch_2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 21:51:56 -0000
Message-ID: <173956991649.2175553.2592342494225401055@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

Series: Cleanup error handling on probe, batch 2
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
commit 4aadb1aa900306289fdc01bec27dc1c7747378f2
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Feb 14 13:23:13 2025 -0800

    drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
    
    xe_ttm_sys_mgr_init() already cleans up after itself, just return error
    if that failed.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch cbd747025a1ef985e1ebfa040aa0da4a5d77aacd drm-intel
1e31f7ffb493 FOR-CI-ONLY: devres
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
See https://lore.kernel.org/all/20250212200542.515493-1-lucas.demarchi@intel.com/

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
fafdeabb3e9e drm/xe: Stop setting drvdata to NULL
b1867ea495fe drm/xe: Switch from xe to devm actions
4fd9ffe2a12f drm/xe: Drop remove callback support
a313d431c964 drm/xe/display: Drop xe_display_driver_remove()
e6b430094130 drm/xe: Move survivability entirely to xe_pci
f076aa443f30 drm/xe: Stop ignoring errors from xe_heci_gsc_init()
260cac63499f drm/xe: Rename update_device_info() after sriov
4aadb1aa9003 drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()


