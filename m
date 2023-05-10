Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E74AC7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 16:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2418410E4D4;
	Wed, 10 May 2023 16:02:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7410E4D4
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683734554; x=1715270554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PuQ8CiFPNTdyqQFuI+cVvWsuXEwfJ/NNHeAIw1E74cc=;
 b=lcZPW0HZJx03ZFjQuXHZfIhYbUjQ1XPmm1crLC6yemIX0cQFjz+lxZsj
 EK7xHsz582ZkrHdVCWY4MOuwdh/1LKcgEtKR9j7LZacXJ7Xnk4FUwTLP0
 A5m+TYJGSbqJrRD0coiLlQyY6i439HQbD8ls67x8XZnLtVnnxPuKHUu16
 Nn4bRjCS5lV3MlGRJ7Ts5/y1mVVhRNZ1EcEg04p0V98REPZGRqQOdq5Aj
 /zcTisN4BlCm6dWcGPSAJYtJlEIYENmCVeGEwSPGSWlwrshpGwZU5qITf
 A9CKeSotQ7+4D4T8Zdz5uwu42UsmdDBLgHT8CnigmoHGzrrMChDOfuB57 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436576140"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="436576140"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 09:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="699357072"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="699357072"
Received: from azaki-mobl.amr.corp.intel.com (HELO localhost) ([10.252.63.3])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 09:02:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 19:02:20 +0300
Message-Id: <20230510160220.714725-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Add intel_pps support too
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is an unrelated, unneeded change in "drm/xe/display: Add intel_pps
support too".

After that gets applied, "drm/xe/display: Add intel_pps support too"
should itself be a fixup to "drm/xe/display: Implement display support".

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index cfe40c64f6d4..c859b066e827 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -481,7 +481,7 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
 				    struct pps_registers *regs)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	int pps_idx = 0;
+	int pps_idx;
 
 	memset(regs, 0, sizeof(*regs));
 
-- 
2.39.2

