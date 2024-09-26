Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA0ECDE03D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 22:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2720810E323;
	Thu, 26 Sep 2024 22:26:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C26610E323;
 Thu, 26 Sep 2024 22:26:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_worker_basis_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 22:26:42 -0000
Message-ID: <172738960250.1109168.8914058278397789005@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926222004.2462345-1-tomasz.lis@intel.com>
In-Reply-To: <20240926222004.2462345-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery worker basis (rev3)
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
commit da92b506149df3a8d1ad45cc0a074ef9afcb0e91
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Fri Sep 27 00:20:04 2024 +0200

    drm/xe/vf: Defer fixups if migrated twice fast
    
    If another VF migration happened during post-migration recovery,
    then the current worker should be finished to allow the next
    one start swiftly and cleanly.
    
    Check for defer in two places: before fixups, and before
    sending RESFIX_DONE.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 6bd25f52157328ac4b7b09a3946281957afe3bfd drm-intel
40f0c9197c33 drm/xe/vf: React to MIGRATED interrupt
-:83: WARNING:MEMORY_BARRIER: memory barrier without comment
#83: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:710:
+	smp_mb__after_atomic();

-:191: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#191: 
new file mode 100644

-:266: WARNING:MEMORY_BARRIER: memory barrier without comment
#266: FILE: drivers/gpu/drm/xe/xe_sriov_vf.c:71:
+	smp_mb();

total: 0 errors, 3 warnings, 0 checks, 212 lines checked
4318bdd8c061 drm/xe/vf: Send RESFIX_DONE message at end of VF restore
315a8f8d8d80 drm/xe/vf: Start post-migration fixups with provisinoning query
da92b506149d drm/xe/vf: Defer fixups if migrated twice fast


