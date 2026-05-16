Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBFDCD4F25
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 09:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7C110E18D;
	Sat, 16 May 2026 09:41:10 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9948C10E18D;
 Sat, 16 May 2026 09:41:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 May 2026 09:41:08 -0000
Message-ID: <177892446862.76852.2730837636896792583@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260516093131.27442-1-raag.jadav@intel.com>
In-Reply-To: <20260516093131.27442-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev7)
URL   : https://patchwork.freedesktop.org/series/162055/
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
commit 32abf9cdba5b75fd5868066214e8dc29b445fdc4
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Sat May 16 15:01:31 2026 +0530

    drm/xe/pci: Introduce PCIe FLR
    
    With bare minimum pieces in place, we can finally introduce PCIe Function
    Level Reset (FLR) support which re-initializes hardware state without the
    need for reloading the driver from userspace. All VRAM contents are lost
    along with hardware state and driver takes care of recreating the required
    kernel bos as part of re-initialization, but user still needs to recreate
    user bos and reload context after PCIe FLR.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch d47455904378e2bd24294dae67bfc7e442f58c40 drm-intel
f0afc703fd60 drm/xe/uc_fw: Allow re-initializing firmware
7e83a1f76904 drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
54fb327aa03e drm/xe/gt: Introduce FLR helpers
ae80d7d05c3c drm/xe/bo_evict: Introduce xe_bo_restore_map()
75beccdb9e28 drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
b14b58bc33d8 drm/xe/migrate: Introduce xe_migrate_reinit()
b5904dd1b3d3 drm/xe/pm: Introduce xe_device_suspend/resume()
32abf9cdba5b drm/xe/pci: Introduce PCIe FLR
-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 152 lines checked


