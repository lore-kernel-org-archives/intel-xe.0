Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45009CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 06:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D9510E79C;
	Thu,  2 Oct 2025 06:45:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBBB10E79C;
 Thu,  2 Oct 2025 06:45:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 06:45:55 -0000
Message-ID: <175938755534.385854.2365607895255974968@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251002055402.1865880-1-matthew.brost@intel.com>
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev4)
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
commit 41e3a0eb75524db919db455fb5047d1225b057f4
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Oct 1 22:54:02 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5f87abb254011980c8332008cfff72d2cfab4952 drm-intel
623235e2e133 drm/xe: Add NULL checks to scratch LRC allocation
da97a3b426bb Revert "drm/xe/vf: Rebase exec queue parallel commands during migration recovery"
e3df2f24b222 Revert "drm/xe/vf: Post migration, repopulate ring area for pending request"
31fdc27a74ab Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
ae05362e7b90 drm/xe: Save off position in ring in which a job was programmed
0c0a507c01aa drm/xe/guc: Track pending-enable source in submission state
9ddd11bb25b3 drm/xe: Track LR jobs in DRM scheduler pending list
74f4a45c4c9e drm/xe: Don't change LRC ring head on job resubmission
6bc8efa9c015 drm/xe: Make LRC W/A scratch buffer usage consistent
8ae3c6507425 drm/xe/guc: Document GuC submission backend
d7d770d2bf86 drm/xe/vf: Add xe_gt_recovery_inprogress helper
0bb18f340077 drm/xe/vf: Make VF recovery run on per-GT worker
36d1c68ca5c0 drm/xe/vf: Abort H2G sends during VF post-migration recovery
d623e75acf95 drm/xe/vf: Remove memory allocations from VF post migration recovery
05563fc12579 drm/xe/vf: Close multi-GT GGTT shift race
-:489: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#489: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 463 lines checked
7e3c033eb30d drm/xe/vf: Teardown VF post migration worker on driver unload
8b6e3e0786f3 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
8f6a1861848f drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
013380659419 drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
e3d6206f1390 drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
fcd024d7b31c drm/xe/vf: Flush and stop CTs in VF post migration recovery
3aac689dd88f drm/xe/vf: Reset TLB invalidations during VF post migration recovery
af20893b143d drm/xe/vf: Kickstart after resfix in VF post migration recovery
d7a8959f55db drm/xe/vf: Start CTs before resfix VF post migration recovery
86afb801ba4b drm/xe/vf: Abort VF post migration recovery on failure
64e5ab26c042 drm/xe/vf: Replay GuC submission state on pause / unpause
efaeb06521d3 drm/xe: Move queue init before LRC creation
d8f3c39e9bdf drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
2f7188363c7a drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
db70bdda3e74 drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
7efc9efae500 drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
b31130252ecc drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
636718bc6c41 drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
41e3a0eb7552 drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


