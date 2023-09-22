Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C815FCD4846
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 16:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49A10E6A2;
	Fri, 22 Sep 2023 16:54:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC65D10E6A2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695401648; x=1726937648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yUerAcC02CGk4XYAmk7BAROn/oefQzV/smBbR0OMA20=;
 b=Liu8Yxw6jo/rJ+m0Zou+aCGBaJOE5D5OPRFEdhqGSez1YeN6P89V+oFM
 A3YnlTRP2st1R9xiQ/OlBVwInmWp9RbqWe7oD2ODm7PmS42wyQTZOCyvg
 OFzgRzo4DIf2a5983mEp0ltXcJm9fWGPsVIigXP6dLAxzwaVD/a9Hz8DZ
 wOVhziMEzg05QMa/WZ9xmL72pgFR5Qk8YpqgcvQIWORRi6KWJe7SC/G60
 gBzQxfb/EX6NSEm2EpjoawMAtT4n0tPv7by97macf+ApjufsJkomJ8A7H
 huvyKPR+a0228tIN9/VWaaaLsxIQB43ay0lakB9N8SytdkiGz3h0il4sV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447365046"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="447365046"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 09:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750909547"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="750909547"
Received: from dut125tglh.fm.intel.com ([10.105.23.10])
 by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2023 09:54:07 -0700
From: Bommithi Sakeena <bommithi.sakeena@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 16:54:03 +0000
Message-Id: <20230922165404.17649-1-bommithi.sakeena@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] lib/xe: on xe driver use blitter with all
 tiling
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
Cc: Swati Sharma <swati2.sharma@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

on xe driver need to use blitter with all tiling modifiers

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 4b592825d..c8a7b31a8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2557,7 +2557,8 @@ static bool use_blitter(const struct igt_fb *fb)
 	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
+	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
+	       is_xe_device(fb->fd);
 }
 
 static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
-- 
2.34.1

