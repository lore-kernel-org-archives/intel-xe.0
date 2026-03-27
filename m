Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6596B10F2871
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 22:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC3C10EF5E;
	Fri, 27 Mar 2026 22:06:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C58B10EEB0;
 Fri, 27 Mar 2026 22:06:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 22:06:31 -0000
Message-ID: <177464919109.407612.114947861714793867@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327203620.809353-1-raag.jadav@intel.com>
In-Reply-To: <20260327203620.809353-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev4)
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
commit 990a324ff3e47f6bb1ffba82dd6500e321344f85
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Sat Mar 28 02:06:20 2026 +0530

    drm/xe/pci: Introduce PCIe FLR
    
    With bare minimum pieces in place, we can finally introduce PCIe Function
    Level Reset (FLR) handling which re-initializes hardware state without the
    need for reloading the driver from userspace. All VRAM contents are lost
    along with hardware state and driver takes care of recreating the required
    kernel bos as part of re-initialization, but user still needs to recreate
    user bos and reload context after PCIe FLR.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch b8c1f8bc16b8aeff4f912cf2d7d0bf385d5ae026 drm-intel
ef5b81fb66d6 drm/xe/uc_fw: Allow re-initializing firmware
834aaa647500 drm/xe/guc_submit: Introduce xe_guc_submit_reinit()
410d3eafa568 drm/xe/gt: Introduce FLR helpers
a9b4a6f4c3a3 drm/xe/irq: Introduce xe_irq_disable()
2c8eccb5fa57 drm/xe: Introduce xe_device_assert_lmem_ready()
a1c900acbb54 drm/xe/bo_evict: Introduce xe_bo_restore_map()
3f31f395c41c drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
370a9fd8b1e1 drm/xe/migrate: Introduce xe_migrate_reinit()
990a324ff3e4 drm/xe/pci: Introduce PCIe FLR
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 173 lines checked


