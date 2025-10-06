Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D7ECAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4073710E41C;
	Mon,  6 Oct 2025 11:17:45 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229AA10E41C;
 Mon,  6 Oct 2025 11:17:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 11:17:44 -0000
Message-ID: <175974946413.8032.14021662605485851665@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006111038.2234860-1-matthew.brost@intel.com>
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev6)
URL   : https://patchwork.freedesktop.org/series/154627/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d4759addc85b126761f61f0746bb213790160f66
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Oct 6 04:10:38 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d drm-intel
f5b70b7cfec4 drm/xe: Add NULL checks to scratch LRC allocation
ca675112c21d drm/xe: Save off position in ring in which a job was programmed
7da6cff179f4 drm/xe/guc: Track pending-enable source in submission state
2dea60eaffe1 drm/xe: Track LR jobs in DRM scheduler pending list
c87ce9b15930 drm/xe: Don't change LRC ring head on job resubmission
c889686e214a drm/xe: Make LRC W/A scratch buffer usage consistent
e875983f0656 drm/xe/vf: Add xe_gt_recovery_pending helper
f747fdc90f0c drm/xe/vf: Make VF recovery run on per-GT worker
acfa39e8a04b drm/xe/vf: Abort H2G sends during VF post-migration recovery
bccb34ccd708 drm/xe/vf: Remove memory allocations from VF post migration recovery
b460e9174a76 drm/xe/vf: Close multi-GT GGTT shift race
-:69: WARNING:REPEATED_WORD: Possible repeated word: 'only'
#69: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:452:
+	 * We only only take the GGTT lock when potentially shifting GGTTs to

-:429: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#429: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 403 lines checked
6672f397cc28 drm/xe/vf: Teardown VF post migration worker on driver unload
171a7854b8f3 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
f48a6c5608a5 drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
5f42e32f0716 drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
1b9dd2c745db drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
2363bebb60f9 drm/xe/vf: Flush and stop CTs in VF post migration recovery
f0780f442fbc drm/xe/vf: Reset TLB invalidations during VF post migration recovery
59a35e08d952 drm/xe/vf: Kickstart after resfix in VF post migration recovery
344aa31a9eef drm/xe/vf: Start CTs before resfix VF post migration recovery
b7d04e9d3b33 drm/xe/vf: Abort VF post migration recovery on failure
c2675b6f6e64 drm/xe/vf: Replay GuC submission state on pause / unpause
c6fd88c2c92a drm/xe: Move queue init before LRC creation
ccb66a9ede9b drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
941f15925a5a drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
ffb772d5eb6f drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
9b1a2a5586c9 drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
a2bd04823ccb drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
1204307420e2 drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
d4759addc85b drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


