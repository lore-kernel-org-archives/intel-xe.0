Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ADA606A32A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IjxuoTIV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9086910E1D8;
	Sun, 22 Nov 2026 15:30:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CECE10E1D8
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795361441; x=1826897441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/u2Eps2N9wi8/X4Ntbvf6/Q7Gzg9yrhfur/Wcus211Y=;
 b=IjxuoTIV8TAUI6zXpyqKtLG4F9QLY2G2zUA5rsZYt2EJCWT9m8KPclwN
 8X71thPSEbPJ052i2hrZ+/9XH8fO8qmhzt9sSn9TE7wdVYJM8wmrOer/6
 op84dsZ4Id9xk/3nf3f0RlbIF2qj2JRJ9eFaOm0rpx8xFv6cF2c3V3U0X
 eSQAO8BHZIPPjmrpLjKETcX5mFbWWnxoNXvzvKkwRITdqEk0buIgvwSho
 awHa5vzURoNY3cL2DG/cgNDNvnPH4xbo02f8CjDAfM2gioIQYOIxqo8hp
 qCUqxPul66lCPwIMjCq0IIN0vp0MUWC6NpBhippQRv5enrjHPu7bvHecF w==;
X-CSE-ConnectionGUID: AM8TmLCiTfarmOsmosQMDQ==
X-CSE-MsgGUID: Rl5BOqBRSlS9H2+Z4SdEEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4088509"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4088509"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 07:30:41 -0800
X-CSE-ConnectionGUID: W4+IUcoiT0yNATIqRj/FYA==
X-CSE-MsgGUID: D63upnmARkOTdvBDZplFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13093172"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 07:30:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 1/2] drm/xe/ras: Drop SIGID logging in page offline flow
Date: Sun, 22 Nov 2026 21:00:17 +0530
Message-ID: <20261122153015.877434-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261122153015.877434-4-riana.tauro@intel.com>
References: <20261122153015.877434-4-riana.tauro@intel.com>
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

The page offline flow reports multiple SIGIDs for a single error,
generating multiple CPERs. Drop the repeated SIGID logging and replace with
xe_err or xe_dbg.

Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: split patches
    add more detailed commit message
    remove non-functional changes from commit
    convert some logs to xe_dbg (Rodrigo)
---
 drivers/gpu/drm/xe/xe_ras.c | 42 ++++++++++++-------------------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..07c048149da6 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -272,13 +272,6 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	request.page_address = page_address;
 	request.action = action;
 
-	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
-		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
-			   page_address);
-	else
-		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
-			   page_address);
-
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
 				  &request, sizeof(request), &response, sizeof(response));
 
@@ -303,12 +296,15 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	}
 
 	if (action == XE_RAS_PAGE_ACTION_OFFLINE) {
+		xe_info(xe, "[RAS]: Page address 0x%llx offlined\n", page_address);
 		ret = xa_err(xa_store(&state->offlined_pages,
 				      page_address >> XE_PTE_SHIFT,
 				      XE_RAS_PAGE_OFFLINED, GFP_KERNEL));
 		if (ret)
-			xe_err(xe, "Failed to store offlined page 0x%llx: %d\n", page_address,
-			       ret);
+			xe_err(xe, "[RAS]: Failed to store offlined page 0x%llx: %d\n",
+			       page_address, ret);
+	} else {
+		xe_info(xe, "[RAS]: Page address 0x%llx removed from queue\n", page_address);
 	}
 
 	return 0;
@@ -322,15 +318,14 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	int ret;
 
 	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
-		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
-			   page_address);
+		xe_err(xe, "[RAS]: Unaligned page address: 0x%llx\n", page_address);
 		return -EINVAL;
 	}
 
 	/* User policy set to disable page offlining */
 	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
+		xe_dbg(xe, "[RAS]: User policy set to disable page offlining\n");
 		goto notify;
 	}
 
@@ -350,34 +345,23 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
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
+		xe_err(xe, "[RAS]: Page address 0x%llx belongs to critical BO\n", page_address);
 		return ret;
 	case -EEXIST:
+		xe_dbg(xe, "[RAS]: Repeated error on already soft-offlined page address 0x%llx\n",
+		       page_address);
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
-		return ret;
 	default:
-		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
-			   page_address);
-		return 0;
+		xe_err(xe, "[RAS]: Failed to offline page address 0x%llx: %d\n", page_address, ret);
+		/* Only allocation failure is propagated, other errors are not actionable */
+		return ret == -ENOMEM ? ret : 0;
 	}
 
  notify:
-- 
2.47.1

