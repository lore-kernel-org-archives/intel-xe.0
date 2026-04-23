Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F8F99368
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2314210F035;
	Thu, 23 Apr 2026 10:09:23 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F25310F046;
 Thu, 23 Apr 2026 10:09:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 10:09:22 -0000
Message-ID: <177693896205.1681.748122813975143349@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423100017.1051587-1-raag.jadav@intel.com>
In-Reply-To: <20260423100017.1051587-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev6)
URL   : https://patchwork.freedesktop.org/series/162055/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2f368e568876fa97bfa19f469b04c1101a97beb0
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Apr 23 15:30:17 2026 +0530

    drm/xe/pci: Introduce PCIe FLR
    
    With bare minimum pieces in place, we can finally introduce PCIe Function
    Level Reset (FLR) support which re-initializes hardware state without the
    need for reloading the driver from userspace. All VRAM contents are lost
    along with hardware state and driver takes care of recreating the required
    kernel bos as part of re-initialization, but user still needs to recreate
    user bos and reload context after PCIe FLR.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 95fbbe4877e1543975d0d0f18a7cc0074416be41 drm-intel
f47498c70a1a drm/xe/uc_fw: Allow re-initializing firmware
2ad2176d4b05 drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
f5366cfa6209 drm/xe/gt: Introduce FLR helpers
039a70cac294 drm/xe/bo_evict: Introduce xe_bo_restore_map()
52acedf63a26 drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
0869e34577b6 drm/xe/migrate: Introduce xe_migrate_reinit()
0f2fc0bd4dc9 drm/xe/pm: Introduce xe_device_suspend/resume()
2f368e568876 drm/xe/pci: Introduce PCIe FLR
-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

-:119: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe_' - possible side-effects?
#119: FILE: drivers/gpu/drm/xe/xe_pci_error.c:47:
+#define XE_FLR_SKIP(xe_, pdev_)		(!IS_DGFX(xe_) || IS_SRIOV_VF(xe_) || pci_num_vf(pdev_) || \
+					 xe_->info.probe_display)

total: 0 errors, 1 warnings, 1 checks, 144 lines checked


