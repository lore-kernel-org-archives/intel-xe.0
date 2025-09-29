Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D67CCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 03:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95DF10E204;
	Mon, 29 Sep 2025 03:06:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB7210E120;
 Mon, 29 Sep 2025 03:06:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Sep 2025 03:06:48 -0000
Message-ID: <175911520844.374493.17973947153889511433@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250929025542.1486303-1-matthew.brost@intel.com>
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
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

Series: VF migration redesign (rev3)
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
commit 6b1ab8ae0216a43239004cea48375d7e8a922d7c
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Sun Sep 28 19:55:42 2025 -0700

    drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
    
    Some VF2GUC actions may take longer to process. Increase default timeout
    after received BUSY indication to 2sec to cover all worst case scenarios.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e2a896e95ea5f65aa137dcf117bfd0d61176c8ce drm-intel
d8c50815e346 drm/xe: Add NULL checks to scratch LRC allocation
1ce14b575b00 drm/xe/vf: Lock querying GGTT config during driver init
0d1ce9c6e840 Revert "drm/xe/vf: Rebase exec queue parallel commands during migration recovery"
1a9c9b825f32 Revert "drm/xe/vf: Post migration, repopulate ring area for pending request"
f7e68c9bef59 Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
a93a79b3496a drm/xe: Save off position in ring in which a job was programmed
4a81e99e537f drm/xe/guc: Track pending-enable source in submission state
d98ee26c8248 drm/xe: Track LR jobs in DRM scheduler pending list
d596834a320e drm/xe: Don't change LRC ring head on job resubmission
5e635a71b24c drm/xe: Make LRC W/A scratch buffer usage consistent
05b22c7143ef drm/xe/guc: Document GuC submission backend
ce7a7f8ac168 drm/xe/vf: Add xe_gt_recovery_inprogress helper
-:92: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#92: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1194:
+	if (!xe_device_uses_memirq(gt_to_xe(gt)))
+	       return false;

-:93: WARNING:TABSTOP: Statements should start on a tabstop
#93: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1195:
+	       return false;

-:212: ERROR:SPACING: space required after that ',' (ctx:VxV)
#212: FILE: drivers/gpu/drm/xe/xe_memirq.c:493:
+bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq,struct xe_guc *guc)
                                                             ^

-:233: ERROR:SPACING: space required after that ',' (ctx:VxV)
#233: FILE: drivers/gpu/drm/xe/xe_memirq.h:28:
+bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq,struct xe_guc *guc);
                                                             ^

total: 2 errors, 2 warnings, 0 checks, 177 lines checked
f8fa62ab6977 drm/xe/vf: Make VF recovery run on per-GT worker
31240bc5e7d0 drm/xe/vf: Abort H2G sends during VF post-migration recovery
f5af6ebcc032 drm/xe/vf: Remove memory allocations from VF post migration recovery
e3109acd36e4 drm/xe/vf: Close multi-GT GGTT shift race
959deb2cc97c drm/xe/vf: Teardown VF post migration worker on driver unload
1a83fbbc58b1 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
0cb2953404dc drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
ae59ef915b18 drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
08245628e1f1 drm/xe/vf: Extra debug on GGTT shift
d28467c0bdc3 drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
599ba8a32549 drm/xe/vf: Flush and stop CTs in VF post migration recovery
4b0790dfe8ab drm/xe/vf: Reset TLB invalidations during VF post migration recovery
ba34c61d3cd9 drm/xe/vf: Kickstart after resfix in VF post migration recovery
252e2cbc6cac drm/xe/vf: Start CTs before resfix VF post migration recovery
bfce4740236c drm/xe/vf: Abort VF post migration recovery on failure
80bfb5d66feb drm/xe/vf: Replay GuC submission state on pause / unpause
897771368173 drm/xe: Move queue init before LRC creation
ea1294fd8f11 drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
2485424c37eb drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
8c73148241b3 drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
27d17569dc05 drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
85dafe50dc85 drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
54be57cf3366 drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
6b1ab8ae0216 drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC


