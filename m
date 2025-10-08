Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80005CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454AB10E89B;
	Wed,  8 Oct 2025 21:53:34 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEB010E88D;
 Wed,  8 Oct 2025 21:53:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 21:53:32 -0000
Message-ID: <175996041244.20465.2365751102473181913@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008214532.3442967-1-matthew.brost@intel.com>
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev10)
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
commit 4206cafc9ad7dfe58fa5b5bbb111cfe1ac9bbc9a
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Oct 8 14:45:32 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f929eafc95342ea5377f79705864d50dd325c79f drm-intel
b9b735b5306f drm/xe: Add NULL checks to scratch LRC allocation
f985f5a8507c drm/xe: Save off position in ring in which a job was programmed
4760638919eb drm/xe/guc: Track pending-enable source in submission state
fe0433fb189e drm/xe: Track LR jobs in DRM scheduler pending list
9202bcee9d1d drm/xe: Return first unsignaled job first pending job helper
fe5bd4161c4f drm/xe: Don't change LRC ring head on job resubmission
55d7ae60d8e5 drm/xe: Make LRC W/A scratch buffer usage consistent
61685a30450f drm/xe/vf: Add xe_gt_recovery_pending helper
cac2f98e41ce drm/xe/vf: Make VF recovery run on per-GT worker
ecdd2ba1a734 drm/xe/vf: Abort H2G sends during VF post-migration recovery
a22a0e2c6ca2 drm/xe/vf: Remove memory allocations from VF post migration recovery
ac000be344bc drm/xe: Move GGTT lock init to alloc
bff647cfe87a drm/xe/vf: Move LMEM config to tile layer
-:185: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#185: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 183 lines checked
71d307395a77 drm/xe/vf: Close multi-GT GGTT shift race
7a9664ebe9b6 drm/xe/vf: Teardown VF post migration worker on driver unload
17632df25b16 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
e2b733c2fbac drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
2d900c8963c8 drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
0e0892c83893 drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
d8d61cf589d6 drm/xe/vf: Flush and stop CTs in VF post migration recovery
699a3123b750 drm/xe/vf: Reset TLB invalidations during VF post migration recovery
4f5ddd38a49b drm/xe/vf: Kickstart after resfix in VF post migration recovery
750a032643c0 drm/xe: Add CTB_H2G_BUFFER_OFFSET define
33ed138979c6 drm/xe/vf: Start CTs before resfix VF post migration recovery
43558eb75d3d drm/xe/vf: Abort VF post migration recovery on failure
c62090922e11 drm/xe/vf: Replay GuC submission state on pause / unpause
f2c411369437 drm/xe: Move queue init before LRC creation
1cf8e94b7c1a drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
6740db2347dc drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
287a3d606b46 drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
cd6cc98cb755 drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
e8b0d2300297 drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
1af9e6739f70 drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
4206cafc9ad7 drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


