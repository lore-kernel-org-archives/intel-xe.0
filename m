Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317A5E8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3768910E339;
	Wed,  4 Oct 2023 03:10:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C875110E08A;
 Wed,  4 Oct 2023 03:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389006; x=1727925006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6No+DcAiVC+rx81h9+NwrZDqQ/D2knzjCNjNKln/t8E=;
 b=L1vR+DiUvDZUoyOlyabMjE9ztbC3uZzWbqA7WD+9fHOpwdE/+GVVPQ5E
 PZcuwdR1qH3bsOw7hKGz23gy0t9W1Xeb6cEQBy6nuuGBWaRjHRJlETqbl
 t4rj85/u1AeepfEh1XPmhXCAhPfyTz2gLQyv5E4FvUV0Nz2zDp6m0nmxk
 6EBdnh3pHuE9xUTA1oY3yHy/xbq54+e+LzNATnGg+LqCmuyjXuVptxK++
 ++15ga1Bs4Qh+dOlyIHYaL2idheS0qucvBXuZA7bDexwTf/y9ToGOUE+y
 tBAXbk68WgxjOHdLUPBK+1La+a00FgSy0TTVz6m4xNrUK6nAchQAKFsIM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308398"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760366"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760366"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:13 -0700
Message-Id: <20231004031023.3444455-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 03/13] lib/gpu_cmds: Reorder if/else
 ladder according to IP version
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make it easier to follow the flow by following the convention of "latest
platform earlier".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/gpu_cmds.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 648451f74..0fd8f8213 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -270,17 +270,15 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (IS_GEN7(devid))
-		binding_table[0] = gen7_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-
-	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-
-	else
+	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
+	else
+		binding_table[0] = gen7_fill_surface_state(ibb, buf,
+							   SURFACEFORMAT_R8_UNORM, 1);
 
 	return binding_table_offset;
 }
-- 
2.40.1

