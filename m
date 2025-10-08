Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6E1CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4610E894;
	Wed,  8 Oct 2025 18:28:17 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A44D10E88E;
 Wed,  8 Oct 2025 18:28:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 18:28:16 -0000
Message-ID: <175994809642.19604.7071786774807784256@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008180500.3261209-1-matthew.brost@intel.com>
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev9)
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
commit 87aafbe28147830f0fe5f746b672f57bc898786d
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Oct 8 11:05:00 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f929eafc95342ea5377f79705864d50dd325c79f drm-intel
8bb97cfe4b10 drm/xe: Add NULL checks to scratch LRC allocation
961c93afa57a drm/xe: Save off position in ring in which a job was programmed
03f5b84bbe9c drm/xe/guc: Track pending-enable source in submission state
871a281c83c9 drm/xe: Track LR jobs in DRM scheduler pending list
d73ddcea71c1 drm/xe: Return first unsignaled job first pending job helper
1559fe5cb2b5 drm/xe: Don't change LRC ring head on job resubmission
4c6615dd2762 drm/xe: Make LRC W/A scratch buffer usage consistent
16ac06f4c408 drm/xe/vf: Add xe_gt_recovery_pending helper
b5b141b347bb drm/xe/vf: Make VF recovery run on per-GT worker
55bece6b5886 drm/xe/vf: Abort H2G sends during VF post-migration recovery
9ab787a499a8 drm/xe/vf: Remove memory allocations from VF post migration recovery
96b18f3efb67 drm/xe: Move GGTT lock init to alloc
f99d5e676f8a drm/xe/vf: Move LMEM config to tile layer
-:185: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#185: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 184 lines checked
9ccf9cd1940c drm/xe/vf: Close multi-GT GGTT shift race
759957840acb drm/xe/vf: Teardown VF post migration worker on driver unload
047a6fdd87e4 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
10dfc7949321 drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
22930c664798 drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
256cbbb86198 drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
1a00a209d0f5 drm/xe/vf: Flush and stop CTs in VF post migration recovery
1c7b99214ff2 drm/xe/vf: Reset TLB invalidations during VF post migration recovery
5d50f23cc4d2 drm/xe/vf: Kickstart after resfix in VF post migration recovery
b99b40fb28b9 drm/xe: Add CTB_H2G_BUFFER_OFFSET define
5d51ea995af7 drm/xe/vf: Start CTs before resfix VF post migration recovery
c8455ae6f1a0 drm/xe/vf: Abort VF post migration recovery on failure
4d1d20403374 drm/xe/vf: Replay GuC submission state on pause / unpause
c0ee3ef9300a drm/xe: Move queue init before LRC creation
2f5b89531e00 drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
702177d207ec drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
e0aa7170aedc drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
db2d7a8c7c7c drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
cb87c61545f2 drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
85eed6d14539 drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
87aafbe28147 drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


