Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE40E9B249
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FDE10E540;
	Tue, 24 Feb 2026 10:36:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1483410E539;
 Tue, 24 Feb 2026 10:36:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Feb 2026 10:36:48 -0000
Message-ID: <177192940806.280848.9481513717572282204@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224102618.3105171-1-raag.jadav@intel.com>
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR
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
commit 3ddc633b33f55560dcb001d3068c006f9340a497
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Feb 24 15:55:19 2026 +0530

    drm/xe/pci: Introduce PCIe FLR
    
    With all the pieces in place, we can finally introduce PCIe FLR handling
    which reloads hardware state without the need for reloading the driver
    from userspace. Memory contents are also wiped along with hardware state,
    so user still needs to recreate buffers and reload context after FLR.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 60bf88f4f1d327a74aec8abb0caacddb6341324d drm-intel
f498cd7a762a drm/xe/uc_fw: Allow reloading firmware
5e7a7c424851 drm/xe/uc: Introduce FLR helpers
7298b9434037 drm/xe/irq: Introduce FLR helper
dda8a4595f8b drm/xe: Introduce xe_device_assert_lmem_ready()
cd5d1e1b2e26 drm/xe/bo_evict: Introduce xe_bo_restore_map()
3ddc633b33f5 drm/xe/pci: Introduce PCIe FLR
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 169 lines checked


