Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6D7C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC5710E420;
	Wed, 30 Jul 2025 08:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sZ/xx72i";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3410E426
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 08:00:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB3A360007;
 Wed, 30 Jul 2025 08:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FA0C4CEE7;
 Wed, 30 Jul 2025 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753862437;
 bh=E0cc0xCuqi7eBZd+HjTFdRJSfRLYHSXlMHzlCBLIjv4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=sZ/xx72ikT/aP0lqWZk5ouROXLxzYieUVmdnZbdXN7GqIQEMo+la8DrYdm5rVOLYO
 nxxBShLeXCCJ42Jm18eviQR86fUm6FyEfJ/jbhokodWJsYnDeBVdae6Bsjd89fxSun
 dXyFNqWflTvplX1cWlwYoVmfEZb1+CzBsT3s9Xfo=
Subject: Patch "Revert "drm/xe/devcoredump: Update handling of
 xe_force_wake_get return"" has been added to the 6.12-stable tree
To: badal.nilawar@intel.com, gregkh@linuxfoundation.org,
 himal.prasad.ghimiray@intel.com, intel-xe@lists.freedesktop.org,
 lucas.demarchi@intel.com, nirmoy.das@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, tomitamoeko@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Jul 2025 10:00:20 +0200
In-Reply-To: <20250729110525.49838-4-tomitamoeko@gmail.com>
Message-ID: <2025073020-immorally-tummy-7a8b@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    Revert "drm/xe/devcoredump: Update handling of xe_force_wake_get return"

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-xe-devcoredump-update-handling-of-xe_force_wake_get-return.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-165054-greg=kroah.com@vger.kernel.org Tue Jul 29 13:05:57 2025
From: Tomita Moeko <tomitamoeko@gmail.com>
Date: Tue, 29 Jul 2025 19:05:24 +0800
Subject: Revert "drm/xe/devcoredump: Update handling of xe_force_wake_get return"
To: "Lucas De Marchi" <lucas.demarchi@intel.com>, "Thomas Hellström" <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <20250729110525.49838-4-tomitamoeko@gmail.com>

From: Tomita Moeko <tomitamoeko@gmail.com>

This reverts commit 9ffd6ec2de08ef4ac5f17f6131d1db57613493f9.

The reverted commit updated the handling of xe_force_wake_get to match
the new "return refcounted domain mask" semantics introduced in commit
a7ddcea1f5ac ("drm/xe: Error handling in xe_force_wake_get()"). However,
that API change only exists in 6.13 and later.

In 6.12 stable kernel, xe_force_wake_get still returns a status code.
The update incorrectly treats the return value as a mask, causing the
return value of 0 to be misinterpreted as an error

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -197,7 +197,6 @@ static void xe_devcoredump_deferred_snap
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
@@ -211,12 +210,11 @@ static void xe_devcoredump_deferred_snap
 	xe_pm_runtime_get(xe);
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 
 	xe_pm_runtime_put(xe);
 
@@ -243,9 +241,8 @@ static void devcoredump_snapshot(struct
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
 
-	unsigned int fw_ref;
-	bool cookie;
 	int i;
+	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -268,7 +265,8 @@ static void devcoredump_snapshot(struct
 	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
 	ss->ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
@@ -286,7 +284,7 @@ static void devcoredump_snapshot(struct
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
 }
 


Patches currently in stable-queue which might be from tomitamoeko@gmail.com are

queue-6.12/revert-drm-xe-forcewake-add-a-helper-xe_force_wake_ref_has_domain.patch
queue-6.12/revert-drm-xe-tests-mocs-update-xe_force_wake_get-return-handling.patch
queue-6.12/revert-drm-xe-gt-update-handling-of-xe_force_wake_get-return.patch
queue-6.12/revert-drm-xe-devcoredump-update-handling-of-xe_force_wake_get-return.patch
