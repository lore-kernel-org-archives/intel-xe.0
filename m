Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E84CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 17:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0010E79F;
	Mon, 22 Jun 2026 17:20:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6110E79F;
 Mon, 22 Jun 2026 17:20:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 17:20:45 -0000
Message-ID: <178214884577.102379.7975163366010496435@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622131458.144873-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20260622131458.144873-8-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method (rev9)
URL   : https://patchwork.freedesktop.org/series/163428/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 403a6fca2ddf190e48f02cc2d4d55e5c003140a7
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Mon Jun 22 18:45:05 2026 +0530

    drm/xe/ras: Use fault-inject to trigger punit error handler
    
    Use fault-inject framework to trigger punit_error_handler()
    for testing.
    
    Usage:
      echo 100 > .../inject_punit_error/probability
      echo 1   > .../inject_punit_error/times
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 6583dd200482a34bb17e5dc54551f91f53b79798 drm-intel
446f28f6ecf4 Introduce Xe Uncorrectable Error Handling
-:250: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#250: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1200 lines checked
cbba9802fc7f drm: Add DRM_WEDGE_RECOVERY_COLD_RESET recovery method
b624e8063aee drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
5f4cb93d94ce drm/xe: Handle PUNIT errors by requesting cold-reset recovery
15486edae6dc drm/xe: Suppress Surprise Link Down on device
403a6fca2ddf drm/xe/ras: Use fault-inject to trigger punit error handler


