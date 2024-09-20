Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A4CCF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 22:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809B310E002;
	Fri, 20 Sep 2024 22:35:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BAF10E002;
 Fri, 20 Sep 2024 22:35:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_worker_basis?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 22:35:02 -0000
Message-ID: <172687170294.1052286.7545988146252219928@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920222926.846985-1-tomasz.lis@intel.com>
In-Reply-To: <20240920222926.846985-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery worker basis
URL   : https://patchwork.freedesktop.org/series/138935/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0254b7b8013a737605c0b11d97e60a2ca2bd2a25
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Sat Sep 21 00:29:26 2024 +0200

    drm/xe/vf: Defer fixups if migrated twice fast
    
    If another VF migration happened during post-migration recovery,
    then the current worker should be finished to allow the next
    one start swiftly and cleanly.
    
    Check for defer in two places: before fixups, and before
    sending RESFIX_DONE.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch caa511d74cfe1960912443997a75a3e4abc67dbb drm-intel
8e2bd615ae9e drm/xe/vf: React to MIGRATED interrupt
-:141: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#141: 
new file mode 100644

-:196: WARNING:MEMORY_BARRIER: memory barrier without comment
#196: FILE: drivers/gpu/drm/xe/xe_sriov_vf.c:51:
+	smp_mb();

-:220: WARNING:MEMORY_BARRIER: memory barrier without comment
#220: FILE: drivers/gpu/drm/xe/xe_sriov_vf.c:75:
+	smp_mb__after_atomic();

total: 0 errors, 3 warnings, 0 checks, 181 lines checked
2b5e1048a020 drm/xe/vf: Send RESFIX_DONE message at end of VF restore
daf267332301 drm/xe/vf: Start post-migration fixups with GuC MMIO handshake
0254b7b8013a drm/xe/vf: Defer fixups if migrated twice fast


