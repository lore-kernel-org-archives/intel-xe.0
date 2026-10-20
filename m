Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201BD606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bAaYOIPO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C950310F483;
	Tue, 20 Oct 2026 10:06:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768AB10F491
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792490774; x=1824026774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P9qmvMICNbNzcg0hoAKj6GtNRTe3bKBCLMXFRMhWMBU=;
 b=bAaYOIPOmnsP61G0QIxzTlozVB0iwb2v7O9sWdaQdeYSP5cpMxVTd7N0
 8M6YwLkktlWPmkqzggPhLEylHqavqWdWez9x3fea4og7t/ZlIoJDYrQoB
 ibn5qiXqzVKaXS/AdaulgD5wDU5/vzcwrKZ1KvebuxJ3vKUOL8meh160X
 J4zqYzOcXJkelZvxbVomPShmCQON+ReeZXzTbPCfgiQ4flGTi3SxqOadU
 mt27KIg1WtOIS+8RzCknjhnyROgKBGHAYJ17QTEis1H1x1MlOuRXulLFL
 NfUe/1CW/zQagxWyiaRgE1T2jFhMnFPIGJOFk3OFgl1GO/RIy7xVSDe5u w==;
X-CSE-ConnectionGUID: TZSwMs1bRBmh6t8fdlAmaw==
X-CSE-MsgGUID: 3/JZ1lOOSwC3YIGtfjHI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1291787"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1291787"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:06:13 -0700
X-CSE-ConnectionGUID: Dyc/mZz9Tse5HK/Fa3xHDw==
X-CSE-MsgGUID: XbZ8EXV3QxKXg1Zf6xyCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3179357"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:06:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Don't fail runtime suspend permanently on VRAM
 eviction -ENOMEM
Date: Tue, 20 Oct 2026 12:05:45 +0200
Message-ID: <20261020100545.46715-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If evicting VRAM to system memory fails with -ENOMEM during runtime
suspend to D3cold, the error is returned to the runtime PM core.
Runtime PM treats any error other than -EAGAIN or -EBUSY from the
->runtime_suspend() callback as fatal, records it in
dev->power.runtime_error, and refuses further runtime PM operations
on the device until the error is cleared.

Memory shortage is a transient condition, and with eviction now using
__GFP_RETRY_MAYFAIL it is also more likely to occur. Convert -ENOMEM
from the eviction to -EAGAIN so that the device stays active and
runtime suspend is retried at a later idle transition.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index daa7ba2df317..9bf57ed1ea59 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -649,8 +649,16 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
-		if (err)
+		if (err) {
+			/*
+			 * Runtime PM treats errors other than -EAGAIN and
+			 * -EBUSY as fatal, so report memory shortage as
+			 * transient to allow a later retry.
+			 */
+			if (err == -ENOMEM)
+				err = -EAGAIN;
 			goto out_resume;
+		}
 	}
 
 	for_each_gt(gt, xe, id) {
-- 
2.56.0

