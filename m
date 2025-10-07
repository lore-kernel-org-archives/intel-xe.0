Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333D6CCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0910E11C;
	Tue,  7 Oct 2025 11:38:43 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDAA10E11C;
 Tue,  7 Oct 2025 11:38:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Oct 2025 11:38:42 -0000
Message-ID: <175983712270.13625.14136411891952825738@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007112641.2669655-1-matthew.brost@intel.com>
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev7)
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
commit 7f43f3154fa850f537259aed90fe659886cba1e6
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Tue Oct 7 04:26:41 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3 drm-intel
ad5e565c847d drm/xe: Add NULL checks to scratch LRC allocation
2eee22403419 drm/xe: Save off position in ring in which a job was programmed
23a89e33ff7c drm/xe/guc: Track pending-enable source in submission state
69b72b9bb9c9 drm/xe: Track LR jobs in DRM scheduler pending list
d467289121f7 drm/xe: Don't change LRC ring head on job resubmission
5d88b7ec4364 drm/xe: Make LRC W/A scratch buffer usage consistent
24b4125ae49a drm/xe/vf: Add xe_gt_recovery_pending helper
e8ed2450cdab drm/xe/vf: Make VF recovery run on per-GT worker
191d0398e3c4 drm/xe/vf: Abort H2G sends during VF post-migration recovery
00334e072062 drm/xe/vf: Remove memory allocations from VF post migration recovery
18e25efe5d4d drm/xe: Move GGTT lock init to alloc
8909467b26fd drm/xe/vf: Close multi-GT GGTT shift race
-:386: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#386: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 360 lines checked
e703e326ab92 drm/xe/vf: Teardown VF post migration worker on driver unload
e7770e030eb8 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
4b3cbd5c4fe9 drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
5dfdd72e628f drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
819fe863429e drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
676f87041307 drm/xe/vf: Flush and stop CTs in VF post migration recovery
620c3312f517 drm/xe/vf: Reset TLB invalidations during VF post migration recovery
2069d46739a6 drm/xe/vf: Kickstart after resfix in VF post migration recovery
5935fc0ce146 drm/xe: Add CTB_H2G_BUFFER_OFFSET define
2b7cfe489f0e drm/xe/vf: Start CTs before resfix VF post migration recovery
f798c70e80da drm/xe/vf: Abort VF post migration recovery on failure
ce303be6e365 drm/xe/vf: Replay GuC submission state on pause / unpause
2d897bee15bb drm/xe: Move queue init before LRC creation
13440122b4ce drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
1ddcb7f60af8 drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
646fa227bd06 drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
ae1dc667bbf3 drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
ba68fdf809e9 drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
c88006fdec53 drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
7f43f3154fa8 drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


