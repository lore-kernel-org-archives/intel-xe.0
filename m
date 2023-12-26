Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF55BC46CD3
	for <intel-xe@archiver.kernel.org>; Tue, 26 Dec 2023 17:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E8F10E0B0;
	Tue, 26 Dec 2023 17:23:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2003810E0B0
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Dec 2023 17:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703611410; x=1735147410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ueZtP8X9kLy0/lR8MAd5jLfnq8C3OsWuIM2XfyORbhY=;
 b=LblhrGECTmgOthso9TovMmn/p0JcqAaTUWmRf59zhiqf3afOQzW1U5NE
 /9tcgUeeAxTe7XxgBHKh5JXUBQ/DF/yhDWhJvep/eFDr6f+KfVCLJ0Mvc
 p7N+9RhXfvf93ZIkL1ebC2Sehvl6lmtGRHxxi9OuaYSz3kQI7NNHufdjD
 /p0HsH5KyneIW85Iuc8nVvRE/5raCeQGOz32EEj36dnFWPbRovINgPovK
 V92ftiqHcakdx/spNWphXI3vSiDCbtNFQlyJYbQnl3yGIaI2im/t0VdI+
 nE+J5sXcFlMuH7etFl14N1OLG3RdbQfka6qVQomAG7dWFG3PRsuWeqcE3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="482543651"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="482543651"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 09:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="20057875"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 09:23:28 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/uapi: Remove DRM_XE_VM_BIND_FLAG_ASYNC comment left
 over
Date: Tue, 26 Dec 2023 09:23:21 -0800
Message-ID: <20231226172321.61518-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This a comment left over of commit 52b226320b63
("drm/xe/uapi: Remove sync binds").

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9fa3ae324731a..50bbea0992d9c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -832,7 +832,6 @@ struct drm_xe_vm_destroy {
  *
  * and the @flags can be:
  *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_ASYNC
  *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
  *    MAP operation immediately rather than deferring the MAP to the page
  *    fault handler.
-- 
2.43.0

