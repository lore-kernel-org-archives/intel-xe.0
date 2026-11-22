Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF8606A331
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CcLBgvoB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A546010E4DA;
	Sun, 22 Nov 2026 15:30:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC1410E4DA
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795361447; x=1826897447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aOihvZ5rZmPDpKNDvG8/4mKWKU86eXezlBVzl+DWfnU=;
 b=CcLBgvoBFnUH4khCuWWCnc76UCgUMw2dgG/ayjvOI9ppvD/CtXlohqqB
 ToWsnaYpQP78m8siRfv4kpHTCQZ6hMp+zs8gu9d22Jpoo2kZ7L+aGn5SG
 uC05TC+c1f92AC2VlW/EAbtLkmaRawBEyJJ/H0a+5oej/0FQcXen+n+Au
 Vwl7wfSRBSmFvdam47yuF5ybpH2C9+Jin5RlJc5f+ckdj+ll6G2x6PEXE
 gd15u+jzn0T5elYNid9tFbtkuGTJ5Li01tznY2pOCXdRFPMn1K7QiC6FD
 fs0immUO+oBJ9IBqZIm3HA+JzJ3HkaqjAqoHYkZ0rRhcByX7RuOpei65J g==;
X-CSE-ConnectionGUID: CGmjgoqBQVC2jRdrE1ERyQ==
X-CSE-MsgGUID: G9ptUfzsQM2Ut4QV7kIoDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4088511"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4088511"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 07:30:45 -0800
X-CSE-ConnectionGUID: yCv1vyZlT3G9YIgx5QifRA==
X-CSE-MsgGUID: YfzVTE8XSjGA2tnFbOj3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13093184"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 07:30:42 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 2/2] drm/xe/ras: Drop SIGID logging for sysctrl errors
Date: Sun, 22 Nov 2026 21:00:18 +0530
Message-ID: <20261122153015.877434-6-riana.tauro@intel.com>
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

The sysctrl mailbox layer already logs the failure with its group and
command IDs via SIGID. Drop SIGID logging and replace with plain xe_err logs
to avoid multiple CPERs.

Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page offline queue and list")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: split patches
    add more detailed commit message
    remove non-functional changes from commit (Rodrigo)
---
 drivers/gpu/drm/xe/xe_ras.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 07c048149da6..f8c1d8a97fc0 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -277,21 +277,20 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 
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
 
@@ -421,15 +420,15 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 
 		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 		if (ret) {
-			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
-				   cmd);
+			xe_err(xe, "sysctrl: failed to get page offline data %d, cmd=%#x\n", ret,
+			       cmd);
 			return;
 		}
 
 		if (rlen != resp_size) {
-			xe_log_err(xe, SYSCTRL, -EINVAL,
-				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
-				   rlen, resp_size, cmd);
+			xe_err(xe,
+			       "sysctrl: unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
+			       rlen, resp_size, cmd);
 			return;
 		}
 
@@ -459,9 +458,8 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 			total_pages = common->total_pages;
 
 		if (count > total_pages) {
-			xe_log_err(xe, SYSCTRL, -EINVAL,
-				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
-				   total_pages, count, cmd);
+			xe_err(xe, "sysctrl: pages returned %u exceed total pages %u, cmd=%#x\n",
+			       count, total_pages, cmd);
 			return;
 		}
 	} while (common->additional_data);
-- 
2.47.1

