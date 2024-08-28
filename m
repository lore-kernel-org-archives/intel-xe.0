Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AEDC636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 18:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C8810E51E;
	Wed, 28 Aug 2024 18:19:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E94D10E51E;
 Wed, 28 Aug 2024 18:19:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_missing_run?=
 =?utf-8?q?time_reference_to_wedged_upon_gt=5Freset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 18:19:14 -0000
Message-ID: <172486915438.828586.9591502519084031745@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828173256.182364-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240828173256.182364-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Add missing runtime reference to wedged upon gt_reset
URL   : https://patchwork.freedesktop.org/series/137926/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5bc8fe6497f24354133e309b8c4ca53c6641cba4
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Aug 28 13:32:56 2024 -0400

    drm/xe: Add missing runtime reference to wedged upon gt_reset
    
    Fixes this missed case:
    
    xe 0000:00:02.0: [drm] Missing outer runtime PM protection
    WARNING: CPU: 99 PID: 1455 at drivers/gpu/drm/xe/xe_pm.c:564 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
    Call Trace:
    <TASK>
    ? show_regs+0x67/0x70
    ? __warn+0x94/0x1b0
    ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
    ? report_bug+0x1b7/0x1d0
    ? handle_bug+0x46/0x80
    ? exc_invalid_op+0x19/0x70
    ? asm_exc_invalid_op+0x1b/0x20
    ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
    xe_device_declare_wedged+0x91/0x280 [xe]
    gt_reset_worker+0xa2/0x250 [xe]
    
    Fixes: da4b21f402c6 ("drm/xe: Add missing runtime reference to wedged upon gt_reset")
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch d6e6b1a5eba2c443e6cf4fced0f553b30df7c951 drm-intel
5bc8fe6497f2 drm/xe: Add missing runtime reference to wedged upon gt_reset
-:23: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'da4b21f402c6', maybe rebased or not pulled?
#23: 
Fixes: da4b21f402c6 ("drm/xe: Add missing runtime reference to wedged upon gt_reset")

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


