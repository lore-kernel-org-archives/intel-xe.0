Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2520CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B4E10E18C;
	Tue,  7 Oct 2025 13:17:31 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E3210E18C;
 Tue,  7 Oct 2025 13:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Oct 2025 13:17:30 -0000
Message-ID: <175984305054.14049.11469901641933439944@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007130505.2694829-1-matthew.brost@intel.com>
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev8)
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
commit 6ee6f21994d3531d747f26267afff1056768c125
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Tue Oct 7 06:05:05 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3 drm-intel
f3b38878de4f drm/xe: Add NULL checks to scratch LRC allocation
742530f39f53 drm/xe: Save off position in ring in which a job was programmed
c06897cdb800 drm/xe/guc: Track pending-enable source in submission state
d3181cd7b6e3 drm/xe: Track LR jobs in DRM scheduler pending list
bd765e9145d6 drm/xe: Return first unsignaled job first pending job helper
784e8d9dd704 drm/xe: Don't change LRC ring head on job resubmission
-:18: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#18: 
 - Break unsignaled job handling to seperate patch (Auld)
                                    ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
a7909a5f77ce drm/xe: Make LRC W/A scratch buffer usage consistent
5565cbd8db29 drm/xe/vf: Add xe_gt_recovery_pending helper
786788b352d2 drm/xe/vf: Make VF recovery run on per-GT worker
73c31516ba81 drm/xe/vf: Abort H2G sends during VF post-migration recovery
b16523ee14a5 drm/xe/vf: Remove memory allocations from VF post migration recovery
b471cd6ca0a5 drm/xe: Move GGTT lock init to alloc
6caf991fe313 drm/xe/vf: Close multi-GT GGTT shift race
-:386: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#386: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 360 lines checked
b2428a427b41 drm/xe/vf: Teardown VF post migration worker on driver unload
930fd207fd01 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
166b10dc2f4a drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
d9ef4821bcea drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
fd8a9ada9055 drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
3f48c802698f drm/xe/vf: Flush and stop CTs in VF post migration recovery
e2ba98db24f1 drm/xe/vf: Reset TLB invalidations during VF post migration recovery
b45ac7ef438a drm/xe/vf: Kickstart after resfix in VF post migration recovery
5fb22bd22219 drm/xe: Add CTB_H2G_BUFFER_OFFSET define
03a18959cb96 drm/xe/vf: Start CTs before resfix VF post migration recovery
17eb679508ed drm/xe/vf: Abort VF post migration recovery on failure
519bd57ca235 drm/xe/vf: Replay GuC submission state on pause / unpause
14cc8e2c7c8c drm/xe: Move queue init before LRC creation
71fecfafd1ee drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
79ce843a3831 drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
492bac804fab drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
98b444ec920c drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
300736ede9fb drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
37377f243a2b drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
6ee6f21994d3 drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


