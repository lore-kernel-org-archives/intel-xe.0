Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D337D1CA0E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2214A10E157;
	Tue,  5 Nov 2024 00:35:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8535E10E157;
 Tue,  5 Nov 2024 00:35:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_worker_basis_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 00:35:29 -0000
Message-ID: <173076692954.1409781.1313063700635024455@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104213449.1455694-1-tomasz.lis@intel.com>
In-Reply-To: <20241104213449.1455694-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery worker basis (rev6)
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
commit a997fe7c0825dce6263a6b062b46aa0016c2afa0
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Mon Nov 4 22:34:49 2024 +0100

    drm/xe/vf: Defer fixups if migrated twice fast
    
    If another VF migration happened during post-migration recovery,
    then the current worker should be finished to allow the next
    one start swiftly and cleanly.
    
    Check for defer in two places: before fixups, and before
    sending RESFIX_DONE.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch a4532bcf5eea0cfdb56fbdc3195a2d15d193727b drm-intel
c44631de768a drm/xe/vf: React to MIGRATED interrupt
-:215: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#215: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 225 lines checked
6d583c765699 drm/xe/vf: Document SRIOV VF restore flow
dda2900c77fe drm/xe/vf: Send RESFIX_DONE message at end of VF restore
0bdc7eaf916f drm/xe/vf: Start post-migration fixups with provisinoning query
a997fe7c0825 drm/xe/vf: Defer fixups if migrated twice fast


