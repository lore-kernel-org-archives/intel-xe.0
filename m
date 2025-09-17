Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C79DCAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D7B10E027;
	Wed, 17 Sep 2025 03:55:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98DC10E027;
 Wed, 17 Sep 2025 03:55:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_migration_redesign?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Sep 2025 03:55:33 -0000
Message-ID: <175808133388.340256.14147592887693684876@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250917034615.3977603-1-matthew.brost@intel.com>
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
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

Series: VF migration redesign
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
commit 0a49cb521204722b79e2ae72236c18de7427a73a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Sep 16 20:46:15 2025 -0700

    drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
    
    A race condition exists where a paused VF's H2G request can be processed
    and subsequently rejected. This rejection results in a FAST_REQ failure
    being delivered to the KMD, which then terminates the CT via a dead
    worker and triggers a GT reset—an undesirable outcome.
    
    This workaround mitigates the issue by checking if a VF post-migration
    recovery is in progress and aborting these adverse actions accordingly.
    The GuC firmware will address this bug in an upcoming release. Once that
    version is available and VF migration depends on it, this workaround can
    be safely removed.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ab86b32a024c2a431a0300c91745fca9aa0b9370 drm-intel
d2b66e5ddbd0 drm/xe/vf: Lock querying GGTT config during driver init
5959da92c76b Revert "drm/xe/vf: Rebase exec queue parallel commands during migration recovery"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:112: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 92 lines checked
ceed637ab37d Revert "drm/xe/vf: Post migration, repopulate ring area for pending request"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:113: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 56 lines checked
7446b3574fcd Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:278: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 247 lines checked
43de11cbbc0e drm/xe: Save off position in ring in which a job was programmed
61c99c165fd8 drm/xe/guc: Track pending-enable source in submission state
69ef771001ec drm/xe: Track LR jobs in DRM scheduler pending list
40b4981c070b drm/xe: Don't change LRC ring head on job resubmission
7bc1e04cc943 drm/xe/guc: Document GuC submission backend
-:24: ERROR:BAD_SIGN_OFF: Unrecognized email address: '<Matthew Brost matthew.brost@intel.com>'
#24: 
Signed-off-by: <Matthew Brost matthew.brost@intel.com>

-:327: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 0 warnings, 0 checks, 292 lines checked
26f6c484496b drm/xe/vf: Add xe_gt_sriov_vf_recovery_inprogress helper
341967ddfec9 drm/xe/vf: Make VF recovery run on per-GT worker
2e16d301aa76 drm/xe/vf: Abort H2G sends during VF post-migration recovery
22636ceaf1c1 drm/xe/vf: Remove memory allocations from VF post migration recovery
f3c6dd1566f9 drm/xe/vf: Close multi-GT GGTT shift race
27507a4f3aa4 drm/xe/vf: Teardown VF post migration worker on driver unload
9634b48dc388 drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
1dd9f54d3ca9 drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
-:22: WARNING:MEMORY_BARRIER: memory barrier without comment
#22: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:818:
+		smp_wmb();

total: 0 errors, 1 warnings, 0 checks, 151 lines checked
cbb3c08333c7 drm/xe/vf: Extra debug on GGTT shift
40498775256d drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
-:26: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#26: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:740:
+#define MAKE_ACTION(type, __action)				\
+	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
+	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
+		   GUC_HXG_EVENT_MSG_0_DATA0, __action)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

total: 1 errors, 0 warnings, 0 checks, 46 lines checked
5c12417aad9b drm/xe/vf: Stop and flush CTs in VF post migration recovery
a38dddc5dd96 drm/xe/vf: Reset TLB invalidations during VF post migration recovery
85f56e8fab87 drm/xe/vf: Kickstart after resfix in VF post migration recovery
860bee3327b0 drm/xe/vf: Start CTs before resfix VF post migration recovery
42e3e35c55ba drm/xe/vf: Abort VF post migration recovery on failure
c0232e223edc drm/xe/vf: Replay GuC submission state on pause / unpause
b157a005bd9b drm/xe: Move queue init before LRC creation
c2facdd64b48 drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
0a49cb521204 drm/xe/vf: Workaround for race condition in GuC firmware during VF pause


