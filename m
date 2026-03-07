Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F34EF55102
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 18:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447FA10E1D1;
	Sat,  7 Mar 2026 18:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiwZCqwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D7410E1B3;
 Sat,  7 Mar 2026 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772909151; x=1804445151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TQr5/nxjCoHe8JKgeYzwNDB3KF02PPA5ZH82EpwkU9I=;
 b=JiwZCqwx8mfdxDT7GQd7kH0e2+IhhhMDKjxIxhyaCQBZQx43FeSPEhQs
 yVuWRHRrOAKyRXqM1TQIh3FesmeK6QkcWKTLPofv/v+URc0nV8nbz3ThK
 5VybUXOhN5+rgxApM3SpNMTL3QVqlzyyRJA4r1pBtFCA6HAIHeHw/UewW
 TF9iB9rOrv/udy+cChFnibAEVym+GMIHV/fUVFnWYMT3jiq4XvxpTaICd
 x+DPMx+lEA1p1wG1WsXGjmEYCLR2WK05SHj54fAX+s+Ig6k/jIaBPvJeP
 C2VgzUyc+F0ZkakdJJ/VlgVNTUqjBLRT7D4u92Ucp0wcNT4HeJhfBqeAL w==;
X-CSE-ConnectionGUID: G0+91gJwR/q3nJWE5GPA7w==
X-CSE-MsgGUID: LzsC77g/Q9qi6KUt4Q4uOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73863974"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; d="scan'208";a="73863974"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2026 10:45:50 -0800
X-CSE-ConnectionGUID: MLMT8mDVQZa7j58AJvuxZg==
X-CSE-MsgGUID: JWSpfUsNRY+pw+e0GTpt8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; d="scan'208";a="242343572"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.55.56])
 by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2026 10:45:50 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/ras: Fix memory leak in doit_reply_value() error path
Date: Sat,  7 Mar 2026 18:45:41 +0000
Message-Id: <20260307184541.257941-1-shuicheng.lin@intel.com>
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

If get_node_error_counter() fails after genlmsg_iput() has succeeded,
the allocated msg sk_buff is leaked. Refactor the error paths to use
goto labels, fixing the leak and eliminating duplicate cleanup code.

Fixes: c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over generic netlink")
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/drm_ras.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
index b2fa5ab86d87..e98a9e74cfd3 100644
--- a/drivers/gpu/drm/drm_ras.c
+++ b/drivers/gpu/drm/drm_ras.c
@@ -195,25 +195,28 @@ static int doit_reply_value(struct genl_info *info, u32 node_id,
 
 	hdr = genlmsg_iput(msg, info);
 	if (!hdr) {
-		nlmsg_free(msg);
-		return -EMSGSIZE;
+		ret = -EMSGSIZE;
+		goto err_free_msg;
 	}
 
 	ret = get_node_error_counter(node_id, error_id,
 				     &error_name, &value);
 	if (ret)
-		return ret;
+		goto err_cancel_msg;
 
 	ret = msg_reply_value(msg, error_id, error_name, value);
-	if (ret) {
-		genlmsg_cancel(msg, hdr);
-		nlmsg_free(msg);
-		return ret;
-	}
+	if (ret)
+		goto err_cancel_msg;
 
 	genlmsg_end(msg, hdr);
 
 	return genlmsg_reply(msg, info);
+
+err_cancel_msg:
+	genlmsg_cancel(msg, hdr);
+err_free_msg:
+	nlmsg_free(msg);
+	return ret;
 }
 
 /**
-- 
2.34.1

