Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2976C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 08:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5625310E32B;
	Wed,  1 Jul 2026 08:42:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F31410E32B;
 Wed,  1 Jul 2026 08:42:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 08:42:30 -0000
Message-ID: <178289535031.135912.3496765974855900510@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701083051.450259-1-raag.jadav@intel.com>
In-Reply-To: <20260701083051.450259-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev9)
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
commit df0a1942e02e08fbeccc57aa217c274313cb1e7b
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Wed Jul 1 13:59:34 2026 +0530

    drm/xe/doc: Wire up PCI Error Handling
    
    Wire up PCI Error Handling documentation.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3 drm-intel
a3afad54e632 drm/xe/uc_fw: Allow re-initializing firmware
baf854f60f64 drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
2fa51fad7ca1 drm/xe/gt: Introduce FLR helpers
0fe4d481971b drm/xe/bo_evict: Introduce xe_bo_restore_map()
4b89deb601ac drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
d77f554e01eb drm/xe/migrate: Introduce xe_migrate_reinit()
17a333b838ba drm/xe/pm: Introduce xe_device_suspend/resume()
1b0ebe7e35d5 drm/xe: Improve wedged state management
b88099ec9164 drm/xe/pci: Introduce PCIe FLR
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 160 lines checked
df0a1942e02e drm/xe/doc: Wire up PCI Error Handling
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


