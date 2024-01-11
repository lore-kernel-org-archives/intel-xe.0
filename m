Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA0DC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 15:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F19410E913;
	Thu, 11 Jan 2024 15:27:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B199D10E913
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704986856; x=1736522856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MEDs6ADzNE0r/X3ey2CNK7QRfkHqWtkGkdXlPyjW6QU=;
 b=DU+sa2CdA1eLaPsy3vF1Td4ktteNZGdE6niIBalesTuAWHR3b7J1z6B9
 22qjIZPs1DPR73dyCwNyOo2dhEZdFSGn9xk5ivg/LP5BMFCYdM7QF4DF9
 A+RXWcYTKjOaoEdJtNZ6zBY/kkEO57Z4wMwH6gEJOINBh6g/goesveqRK
 KQZHjidGnP5D8VcMlCUsS0Ny2x1BRZucfGwvDwOQKKfesGY33PRS52FDR
 7oqpc/JnJa6bmcCAMmWULBU421Ua5PU4wLwGiqKatk9QihC3/cHTI64jd
 MzR/Pgv8HEkBocHiXCtI1jpP0E+B4oKupT1KrlX9zfV+/g8DtfHbosohI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463164337"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="463164337"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 07:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="901599056"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="901599056"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.229])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 07:27:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Return CTB response length
Date: Thu, 11 Jan 2024 16:27:24 +0100
Message-Id: <20240111152724.497-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Not all CTB responses from the GuC are fixed size and we need to
pass response length to the caller, if there was a response_buffer.
Easiest solution is to return it as positive value from all
xe_guc_ct_send_recv() functions.  The CTB response length is always
between 1 and 254 (ie. GUC_HXG_MSG_MIN_LEN and GUC_CTB_MAX_DWORDS
- GUC_HXG_MSG_MIN_LEN).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c29f095aa1b9..d490a4d42c01 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -780,7 +780,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ret = -EIO;
 	}
 
-	return ret > 0 ? 0 : ret;
+	return ret > 0 ? response_buffer ? g2h_fence.response_len : 0 : ret;
 }
 
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,

base-commit: 79184e72263e91528195db01783148435c7e4fad
-- 
2.25.1

