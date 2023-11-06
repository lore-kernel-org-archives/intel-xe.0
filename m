Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402C5C4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33910E274;
	Mon,  6 Nov 2023 06:49:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9586510E277
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253345; x=1730789345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ywczgnt+Tiim0gzRLEVG1s3sXlLBh9AUaQsSfvRzVOg=;
 b=akpmjXOe3M0LZ0UdYLU+3yoLtjg7lG/X4EQmp4X2Su6l3HipOwWptPjM
 d3BTkNUCM9ibDlnkC7r7S4O01dgpIh31Yc2QlyjTQHja2+q7SB9cKTk2O
 /klpwcz1G4MjqAy8zHdI5lzvOtt2Y/zQzaUj7A2RP1V776RD7F7+4/MgT
 Dtl0DfprDqYVq8pMgXX83hyj8yaRXtGrKENEMrEpCNH+DCSDqF5hw38Hp
 aBMQTBudBFxYlm8luv93qvgnKI55ZxoanblwbQ5snJ0tyyt7eiVA5vuvq
 6C8YCGHUoq7FNJTLw2HQdSbHy82yAqepbLnZTHIwZ90/9yZmVjJByGsAj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424665"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534747"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:33 +0200
Message-Id: <20231106064834.161647-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/8] fixup! drm/xe/display: Implement display
 support
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Definition of i915_sw_fence_commit is not necessary anymore

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 46652e6c8ff7..3012b787aa6a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -204,7 +204,6 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
 #define intel_uncore_forcewake_put(x, y) do { } while (0)
 
 #define intel_uncore_arm_unclaimed_mmio_detection(x) do { } while (0)
-#define i915_sw_fence_commit(x) do { } while (0)
 
 #define I915_PRIORITY_DISPLAY 0
 struct i915_sched_attr {
-- 
2.34.1

