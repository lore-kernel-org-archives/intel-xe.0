Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBCBC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A110E42A;
	Wed, 30 Jul 2025 08:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CElq1Fms";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3D610E42A
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 08:00:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BCF47A551E1;
 Wed, 30 Jul 2025 08:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10271C4CEF6;
 Wed, 30 Jul 2025 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753862449;
 bh=r9eR/nwZyLwW1FqgiE98sqZzQ81LUzo2AAp0K+Z0tVQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=CElq1FmsJG6dxT4MRyZr0GyFK4p0aDn4fztiw29JvNE9VhDerE9T+JVda4h6e4JCS
 R1iCZhMveSFpPVoHrGf967mzVB0DTd7KhvDAIU9O+VW2HlGmh6wV5O06D9rv2O31aj
 AkDb41ZlZj/+wFLJNwE91hDX6HZgTI/Chm70NU3Q=
Subject: Patch "Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return
 handling"" has been added to the 6.12-stable tree
To: badal.nilawar@intel.com, gregkh@linuxfoundation.org,
 himal.prasad.ghimiray@intel.com, intel-xe@lists.freedesktop.org,
 lucas.demarchi@intel.com, nirmoy.das@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, tomitamoeko@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Jul 2025 10:00:21 +0200
In-Reply-To: <20250729110525.49838-3-tomitamoeko@gmail.com>
Message-ID: <2025073021-unshackle-lying-c8b1@gregkh>
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

    Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-xe-tests-mocs-update-xe_force_wake_get-return-handling.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-165053-greg=kroah.com@vger.kernel.org Tue Jul 29 13:05:55 2025
From: Tomita Moeko <tomitamoeko@gmail.com>
Date: Tue, 29 Jul 2025 19:05:23 +0800
Subject: Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"
To: "Lucas De Marchi" <lucas.demarchi@intel.com>, "Thomas Hellström" <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <20250729110525.49838-3-tomitamoeko@gmail.com>

From: Tomita Moeko <tomitamoeko@gmail.com>

This reverts commit 95a75ed2b005447f96fbd4ac61758ccda44069d1.

The reverted commit updated the handling of xe_force_wake_get to match
the new "return refcounted domain mask" semantics introduced in commit
a7ddcea1f5ac ("drm/xe: Error handling in xe_force_wake_get()"). However,
that API change only exists in 6.13 and later.

In 6.12 stable kernel, xe_force_wake_get still returns a status code.
The update incorrectly treats the return value as a mask, causing the
return value of 0 to be misinterpreted as an error.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c |   21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -43,14 +43,12 @@ static void read_l3cc_table(struct xe_gt
 {
 	struct kunit *test = kunit_get_current_test();
 	u32 l3cc, l3cc_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
+	u32 ret;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
-	}
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
@@ -74,7 +72,7 @@ static void read_l3cc_table(struct xe_gt
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
 				    "l3cc idx=%u has incorrect val.\n", i);
 	}
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -82,14 +80,15 @@ static void read_mocs_table(struct xe_gt
 {
 	struct kunit *test = kunit_get_current_test();
 	u32 mocs, mocs_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
+	u32 ret;
 
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
@@ -107,7 +106,7 @@ static void read_mocs_table(struct xe_gt
 				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)


Patches currently in stable-queue which might be from tomitamoeko@gmail.com are

queue-6.12/revert-drm-xe-forcewake-add-a-helper-xe_force_wake_ref_has_domain.patch
queue-6.12/revert-drm-xe-tests-mocs-update-xe_force_wake_get-return-handling.patch
queue-6.12/revert-drm-xe-gt-update-handling-of-xe_force_wake_get-return.patch
queue-6.12/revert-drm-xe-devcoredump-update-handling-of-xe_force_wake_get-return.patch
