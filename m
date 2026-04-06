Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662A9F46C46
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFD10E139;
	Mon,  6 Apr 2026 14:18:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4CA10E139;
 Mon,  6 Apr 2026 14:18:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 14:18:17 -0000
Message-ID: <177548509762.433781.9709013563355124856@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406140722.154445-1-raag.jadav@intel.com>
In-Reply-To: <20260406140722.154445-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev5)
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
commit 063ef17ff77ec60bdd48b8748695c1f5cd998dc5
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Mon Apr 6 19:37:22 2026 +0530

    drm/xe/pci: Introduce PCIe FLR
    
    With bare minimum pieces in place, we can finally introduce PCIe Function
    Level Reset (FLR) handling which re-initializes hardware state without the
    need for reloading the driver from userspace. All VRAM contents are lost
    along with hardware state and driver takes care of recreating the required
    kernel bos as part of re-initialization, but user still needs to recreate
    user bos and reload context after PCIe FLR.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch d873f0156bd08a3031097d459e2d3604bfe1b1bf drm-intel
04ca0ee60b29 drm/xe/uc_fw: Allow re-initializing firmware
8f4aad032d03 drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
8d5f18958377 drm/xe/gt: Introduce FLR helpers
be351d09d0bd drm/xe/irq: Introduce xe_irq_disable()
c1917f1ab92f drm/xe: Introduce xe_device_assert_lmem_ready()
800388188578 drm/xe/bo_evict: Introduce xe_bo_restore_map()
b7cb79ed27b6 drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
6e66555fb0a5 drm/xe/migrate: Introduce xe_migrate_reinit()
063ef17ff77e drm/xe/pci: Introduce PCIe FLR
-:67: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#67: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 191 lines checked


