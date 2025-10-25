Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65394CCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 16:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DE010E2F0;
	Sat, 25 Oct 2025 16:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E0UHd1GN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EB710E2F0
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 16:23:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F3E444328D;
 Sat, 25 Oct 2025 16:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80E5C4CEF5;
 Sat, 25 Oct 2025 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409384;
 bh=h5wu0F/GDcGy7Kk3KFaZYd8l3/8csZ5h7fH9LksjW2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E0UHd1GNdPO2fxcEPeuW0rTCjeRx1sWuzDdxI0DjqywH/ZzWGDYRE7zH//hgxQljq
 RZ+EPv0LXIAeDeydRPEVHWBRN7gJ91VxBaTmdgK682soKS6oTHtFC4c3qhBd+KvHfX
 Ujp/cBwM6tiycDPBzBDMO9mliboZWWrg++sOBSYwoiyCwM6FO7UyNZzt++rWTfVtaz
 WjvbmOWTLO1zz92FhQJczCqzrxKo4aZefB/likqlrGcVbiSVl7z2ib80pct/ufpmBw
 /vzTRctGmEQsPi+M1xdktmVulh10O29xVCb2J1CdRY2Mi9TpxIoXklCnu0CK+0awi4
 8va4Dry98CDUg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/xe/pf: Don't resume device from restart
 worker
Date: Sat, 25 Oct 2025 11:58:50 -0400
Message-ID: <20251025160905.3857885-299-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

[ Upstream commit 9fd9f221440024b7451678898facfb34af054310 ]

The PF's restart worker shouldn't attempt to resume the device on
its own, since its goal is to finish PF and VFs reprovisioning on
the recently reset GuC. Take extra RPM reference while scheduling
a work and release it from the worker or when we cancel a work.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Link: https://lore.kernel.org/r/20250801142822.180530-4-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Bug fixed: Prevents the PF SR-IOV restart worker from forcing a
  runtime PM resume, which can violate PM expectations, cause unwanted
  wakeups, and race with suspend/resume. The worker’s role is to finish
  PF/VF reprovisioning after a GuC reset, not to wake the device.

- Core change: Move the runtime PM ref from the worker body to the
  queueing point.
  - Before: Worker resumes device via `xe_pm_runtime_get(xe)` and later
    `xe_pm_runtime_put(xe)` in `pf_restart()`
    (drivers/gpu/drm/xe/xe_gt_sriov_pf.c:229).
  - After: `pf_queue_restart()` takes a non-resuming RPM reference via
    `xe_pm_runtime_get_noresume(xe)` before `queue_work()`, and only
    drops it either in the worker on completion or if the work is
    canceled/disabled.
    - New get: `pf_queue_restart()` adds
      `xe_pm_runtime_get_noresume(xe)` and if `queue_work()` returns
      false (already queued), it immediately `xe_pm_runtime_put(xe)` to
      avoid leaks (drivers/gpu/drm/xe/xe_gt_sriov_pf.c:244).
    - New put on cancel/disable: If `cancel_work_sync()` or
      `disable_work_sync()` returns true, drop the worker’s RPM ref
      (drivers/gpu/drm/xe/xe_gt_sriov_pf.c:206,
      drivers/gpu/drm/xe/xe_gt_sriov_pf.c:55).
    - Worker body: `pf_restart()` no longer resumes; it asserts device
      is not suspended and only does the final `xe_pm_runtime_put(xe)`
      to drop the ref held “on its behalf”
      (drivers/gpu/drm/xe/xe_gt_sriov_pf.c:229).

- Correct PM lifetime: This pattern matches established XE usage for
  async work (e.g., `xe_vm.c:1751`, `xe_sched_job.c:149`,
  `xe_mocs.c:785`, `xe_pci_sriov.c:171`), where async paths use
  `xe_pm_runtime_get_noresume()` to keep the device from autosuspending
  without performing a resume from the inner worker.

- Rationale and safety:
  - `gt_reset()` already holds a runtime PM ref across reset and restart
    scheduling (`drivers/gpu/drm/xe/xe_gt.c:822` get,
    `drivers/gpu/drm/xe/xe_gt.c:857` put). Taking an additional
    `get_noresume()` before queuing guarantees the device won’t
    autosuspend before the worker executes, but crucially avoids an
    unsolicited resume from the worker itself.
  - The assert in `pf_restart()` (`!xe_pm_runtime_suspended(xe)`) is a
    correctness guard ensuring the worker only runs with the device
    awake; the RPM ref taken at queue time enforces this in practice.
  - The cancellation/disable paths now correctly drop the worker’s PM
    ref, preventing leaks when a pending restart is canceled because a
    subsequent reset is about to happen (synergizes with the already
    backported reset-cancellation change in this file).

- Scope and risk:
  - Change is small, self-contained, and limited to SR-IOV PF code in
    `drivers/gpu/drm/xe/xe_gt_sriov_pf.c`.
  - No API/ABI or architectural change; just corrects RPM reference
    placement and balances puts on cancel/disable.
  - Reduces risk of unintended device resumes and PM races; aligns with
    driver PM policy.

- Stable backport fit:
  - Fixes a real PM semantics bug affecting SR-IOV PF restart handling
    after GT resets.
  - Minimal, contained, and follows existing patterns; low regression
    risk.
  - Depends only on existing helpers (e.g.,
    `xe_pm_runtime_get_noresume`, `xe_pm_runtime_suspended`), which are
    present in stable branches already carrying the async restart worker
    (see prior “Move VFs reprovisioning to worker” backport).

Given the above, this is a good candidate for stable backport.

 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index bdbd15f3afe38..c4dda87b47cc8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -55,7 +55,12 @@ static void pf_init_workers(struct xe_gt *gt)
 static void pf_fini_workers(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	disable_work_sync(&gt->sriov.pf.workers.restart);
+
+	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
+		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
+		/* release an rpm reference taken on the worker's behalf */
+		xe_pm_runtime_put(gt_to_xe(gt));
+	}
 }
 
 /**
@@ -207,8 +212,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
-	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
+	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
 		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
+		/* release an rpm reference taken on the worker's behalf */
+		xe_pm_runtime_put(gt_to_xe(gt));
+	}
 }
 
 /**
@@ -226,9 +234,12 @@ static void pf_restart(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_pm_runtime_get(xe);
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
+
 	xe_gt_sriov_pf_config_restart(gt);
 	xe_gt_sriov_pf_control_restart(gt);
+
+	/* release an rpm reference taken on our behalf */
 	xe_pm_runtime_put(xe);
 
 	xe_gt_sriov_dbg(gt, "restart completed\n");
@@ -247,8 +258,13 @@ static void pf_queue_restart(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
+	/* take an rpm reference on behalf of the worker */
+	xe_pm_runtime_get_noresume(xe);
+
+	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
 		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
+		xe_pm_runtime_put(xe);
+	}
 }
 
 /**
-- 
2.51.0

