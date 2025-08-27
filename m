Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3666ACA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 21:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00D010E8BB;
	Wed, 27 Aug 2025 21:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/uJJ69S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182DC10E88F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756329673; x=1787865673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XG/D/ug1wn1evcX+B0uWciCaFUh1dDFMRBxAgxUuh1U=;
 b=J/uJJ69ShbzVGeS9RA+1eoiFnBlcnxtSVYTOZ8goTt/Eg36no79ZNgh0
 iIjbVMJftz2A9LmWuCrSZekq4jmCnxWt9e3SgIwKzUYZhzZ4IavQfQMKP
 JlB2w0WFHw+im5sJ/ellxkkPrcDm1cM9ihQZHQ4Bcjs639InNsUvEzAF/
 2cQeCMu68QwBGm6IAuwGUvXgPQRWFCdG6mdIUGI8c4es9VwY1UVwh+rk0
 T5ehswybrlreAahBmXYZJcr++DhNCq5myXCMrpOwZLfLiZ95x/NCgzRMJ
 XBfTpY4x2jVx/Q59VDBqeI3mkmCheJRzBgqseljQ+Renv40EIClXo5Wmr A==;
X-CSE-ConnectionGUID: /uIn7amJTC2oJq5pPtG8vQ==
X-CSE-MsgGUID: sDZLz2whRVqQOCK7tBS++A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76040254"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="76040254"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:21:12 -0700
X-CSE-ConnectionGUID: uITXgbcXT/iwKMIYEODGsQ==
X-CSE-MsgGUID: 1nmdve1RRtyOg0X6Etv0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200838167"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2025 14:21:12 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe/guc: Increase GuC crash dump buffer size
Date: Wed, 27 Aug 2025 17:21:10 -0400
Message-Id: <20250827212110.1024961-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Increase GuC crash dump buffer size to support up to 16K dump size.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index f1e2b0be90a9..98a47ac42b08 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -17,7 +17,7 @@ struct xe_device;
 #define DEBUG_BUFFER_SIZE       SZ_8M
 #define CAPTURE_BUFFER_SIZE     SZ_2M
 #else
-#define CRASH_BUFFER_SIZE	SZ_8K
+#define CRASH_BUFFER_SIZE	SZ_16K
 #define DEBUG_BUFFER_SIZE	SZ_64K
 #define CAPTURE_BUFFER_SIZE	SZ_1M
 #endif
-- 
2.34.1

