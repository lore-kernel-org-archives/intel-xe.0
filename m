Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D12C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 13:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B64710E974;
	Fri, 26 Jul 2024 13:04:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6AE10E974;
 Fri, 26 Jul 2024 13:04:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Take_ref_to_VM_?=
 =?utf-8?q?in_delayed_snapshot_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 13:04:56 -0000
Message-ID: <172199909610.386020.17806886880255483618@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726130023.2083137-1-matthew.brost@intel.com>
In-Reply-To: <20240726130023.2083137-1-matthew.brost@intel.com>
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

Series: drm/xe: Take ref to VM in delayed snapshot (rev2)
URL   : https://patchwork.freedesktop.org/series/136541/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 00784efe718f4b570f7d89263570c67c8ff80ed6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 26 06:00:23 2024 -0700

    drm/xe: Take ref to VM in delayed snapshot
    
    Kernel BO's don't take a ref to the VM, we need to the VM for the
    delayed snapshot, so take a ref to the VM in delayed snapshot.
    
    v2:
     - Check for lrc_bo before taking a VM ref (CI)
     - Check lrc_bo->vm before taking / dropping a VM ref (CI)
     - Drop VM in xe_lrc_snapshot_free
    
    47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
    Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch edd84625d093bb52bfb1c0c6feb12cff308d81b7 drm-intel
00784efe718f drm/xe: Take ref to VM in delayed snapshot
-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")'
#14: 
47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")

total: 1 errors, 0 warnings, 0 checks, 46 lines checked


