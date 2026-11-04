Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF80606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f500tWr2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C028825E;
	Wed,  4 Nov 2026 09:07:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCAC8825E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793783238; x=1825319238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vzk+KY6lePWf0PXb5uOn9fYcG83tl7PFnXP4e0cDg9Q=;
 b=f500tWr29cJ1VRTIg/v4EzKp4xV8Eg+PVOkowOtDlHlegIG8ogySU50G
 5vUpdrvCq2FzO3d9ZWi+6RLGMIeVlCVia7Uhjb4msYHIT31Kban8uXrs8
 n7PQPfkZAG5CwCxf2RjWMsSgwth6QNxYg8WvWz7u13H+483HwZll4F6zP
 VGNAg/4DNaJ+4mGFlU3oURfm6vIJO9YAYJ0Udgxo82P3AzSa0YVSz54ts
 oJiDqFiNELUqCvQizes5C5hORR7k2pJJOBXcuMjkdQ8e/RlkXPmjpXxDO
 FOwKhojLhQD1+FgvFbawvaogl9QD/YxnzXt/VSormiC9BUp5T0bBjzXSy w==;
X-CSE-ConnectionGUID: WLezBNVTRXWPzEC/zXsvXA==
X-CSE-MsgGUID: R/fp/MzSSwaYp8KZXd4z1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2544165"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2544165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 01:07:17 -0800
X-CSE-ConnectionGUID: KCiZETxYQqyq7Z8jNrbVsw==
X-CSE-MsgGUID: fy0uHlbhQ5SAOKG4m/a01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6673761"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 01:07:13 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: [PATCH] drm/xe/ras: Remove unnecessary SIGID logging
Date: Wed,  4 Nov 2026 14:37:02 +0530
Message-ID: <20261104090701.1748619-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove SIGID logging for all Double-bit ecc memory errors

No functional changes.

Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page offline queue and list")
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 57 ++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..46e2a40eee95 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -269,32 +269,29 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	request.action = action;
 
 	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
-		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
-			   page_address);
+		xe_info(xe, "Requesting firmware to offline page 0x%llx\n", page_address);
 	else
-		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
-			   page_address);
+		xe_info(xe, "Requesting firmware to remove page 0x%llx from queue\n", page_address);
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
 				  &request, sizeof(request), &response, sizeof(response));
 
 	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 	if (ret) {
-		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
+		xe_err(xe, "sysctrl: failed to send page offline command %d\n", ret);
 		return ret;
 	}
 
 	if (rlen != sizeof(response)) {
-		xe_log_err(xe, SYSCTRL, -EINVAL,
-			   "unexpected page offline response length %zu (expected %zu)\n",
-			   rlen, sizeof(response));
+		xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
 		return -EINVAL;
 	}
 
 	ret = ras_status_to_errno(response.status);
 	if (ret) {
-		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
-			   response.status);
+		xe_err(xe, "sysctrl: page offline command failed with status %#x\n",
+		       response.status);
 		return ret;
 	}
 
@@ -318,15 +315,14 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	int ret;
 
 	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
-		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
-			   page_address);
+		xe_err(xe, "Unaligned physical page address: 0x%llx\n", page_address);
 		return -EINVAL;
 	}
 
 	/* User policy set to disable page offlining */
 	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
+		xe_info(xe, "User policy set to disable page offlining\n");
 		goto notify;
 	}
 
@@ -346,33 +342,24 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	switch (ret) {
 	case 0:
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
-			   page_address);
 		break;
 	case -EIO:
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
-			   page_address);
+		xe_err(xe, "Physical page address 0x%llx belongs to critical BO and cannot be soft-offlined\n",
+		       page_address);
 		return ret;
 	case -EEXIST:
 		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
 			action = XE_RAS_PAGE_ACTION_REMOVE;
 		else
 			action = XE_RAS_PAGE_ACTION_OFFLINE;
-
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
-			   page_address);
 		break;
 	case -ENOMEM:
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, failed to soft-offline\n",
-			   page_address);
+		xe_err(xe, "Failed to soft-offline page at physical address 0x%llx\n",
+		       page_address);
 		return ret;
 	default:
-		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
-			   page_address);
+		xe_err(xe, "Failed to handle address fault at physical address 0x%llx\n",
+		       page_address);
 		return 0;
 	}
 
@@ -433,15 +420,14 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 
 		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 		if (ret) {
-			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
-				   cmd);
+			xe_err(xe, "sysctrl: failed to get page offline data for cmd %#x, ret %d\n",
+			       cmd, ret);
 			return;
 		}
 
 		if (rlen != resp_size) {
-			xe_log_err(xe, SYSCTRL, -EINVAL,
-				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
-				   rlen, resp_size, cmd);
+			xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu) for cmd %#x\n",
+			       rlen, resp_size, cmd);
 			return;
 		}
 
@@ -471,9 +457,8 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 			total_pages = common->total_pages;
 
 		if (count > total_pages) {
-			xe_log_err(xe, SYSCTRL, -EINVAL,
-				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
-				   total_pages, count, cmd);
+			xe_err(xe, "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
+			       total_pages, count, cmd);
 			return;
 		}
 	} while (common->additional_data);
-- 
2.47.1

