Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983FC47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF7910E93B;
	Fri, 19 Jan 2024 00:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E76210E915
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623368; x=1737159368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJnzxtKovjFbhROoXeB0RirdYbqLywzzxSJAVWt0Vgs=;
 b=h+0FFi8VVmVarPGzFJg3O42liXCzsDrilNcp1rHqpqxN+fKbMmFw45Db
 AySpZUWsi2jLcBJizQTNREZzroVZLmQL60R6CEala+xXeahR12D+JIZ9/
 JuMlefBpH3JKI6LXp9lPY8SBaJhdRJlpkxRCA3OUOrW9T+3Ltf3EIbs3X
 uPQBv+QDWC+ET+r+1vBtVDov2wH8JHDLfUnNOCuLRjHemc8332yCmQYqr
 RF0rJZ0YORv00AaX6uwTs3scICeWtubJpTYEVG4G0WtD66NU+8hqdJSyl
 k5YWEjLgEB4c4cjNpJSFLkUyZXuhZtIHb1gN8fCNa9VFZmcy4Hd8cHRAB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404373182"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404373182"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818923988"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818923988"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/xe: Use _ULL for u64 division
Date: Thu, 18 Jan 2024 16:16:08 -0800
Message-Id: <20240119001612.2991381-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use DIV_ROUND_UP_ULL() so it also works on 32bit build.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7a3c1c13dc34..ab417f4f7d2a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -642,7 +642,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
-		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
+		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
-- 
2.40.1

