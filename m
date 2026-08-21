Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895B9C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78310E2A1;
	Fri, 21 Aug 2026 11:31:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A411810E2A1;
 Fri, 21 Aug 2026 11:31:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_PCIe_FLR_=28?=
 =?utf-8?q?rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Aug 2026 11:31:28 -0000
Message-ID: <178731188866.72787.6827158376031095795@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260821112436.545405-1-raag.jadav@intel.com>
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
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

Series: Introduce Xe PCIe FLR (rev10)
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
commit fa662ae8def37b7fb92bff92362191e2368f17fe
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Aug 21 16:53:32 2026 +0530

    drm/xe/doc: Wire up PCI Error Handling
    
    Wire up PCI Error Handling documentation.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 7ae51381a25c66d497ec65fda2f1c329cb6f618f drm-intel
a3e78fa42941 drm/xe/uc_fw: Allow re-initializing firmware
f24bf74fdb5d drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
5540a759d6cb drm/xe/gt: Introduce FLR helpers
1e1698916a05 drm/xe/bo_evict: Introduce xe_bo_restore_map()
60e951528bb1 drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
567d8348ce3b drm/xe/migrate: Introduce xe_migrate_reinit()
cf4ce1d90d80 drm/xe/pm: Introduce xe_device_suspend/resume()
e75d4df53665 drm/xe: Introduce temporary device wedging
7123e16f42cd drm/xe/pci: Introduce PCIe Function Level Reset
fa662ae8def3 drm/xe/doc: Wire up PCI Error Handling
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


