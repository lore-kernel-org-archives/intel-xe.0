Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE6CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC5710E4D1;
	Thu, 12 Oct 2023 12:58:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5117210E4D1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115524; x=1728651524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GxjEslH02L2mMkNXQW2Xck7i2ZId2VqYS0nMeERhUHg=;
 b=AIml+IM4fXf7jhXukFBq6tuaXp4aw0b7nGR33YkxmBTbWz4L8+aAh5mq
 IWFQwmjnuE0yKg7dqk0wHVnhDzILS84rQVynI8/XCvOBlhHDdx3RciHBM
 TRIecz2f0Tx3YOZ4iD3uMx/W5it0fTu1jwkz+DwaiozqC2pF7+R7DpReB
 T+r3W/lWQiFAcld1yOZrSErBCkkx3nsDXFQR02S3FvlG3MCIcrC4F07AA
 fVWnOrOWfh1oJZGNz+62m3SkSJ6dSmyUAgDecbGAwp6iXgC7zFcx7gP2d
 JbJvZlmU4QT7r5Gd436CGln7QHY99sYTxyvpcs1rkLMaMy0IWE9FtHYps w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259075"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541495"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541495"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:42 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:07 +0530
Message-Id: <20231012125410.2127337-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] fixup! drm/xe/display: Implement display
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove redundant macro. Stepping will be handled in a separate
compat header.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 6a40b273fef9..8f55f63ff28b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -204,7 +204,6 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
 	for ((wf) = intel_runtime_pm_get(rpm); (wf); \
 	     intel_runtime_pm_put((rpm), (wf)), (wf) = 0)
 
-#define intel_step_name xe_step_name
 #define pdev_to_i915 pdev_to_xe_device
 #define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
 
-- 
2.25.1

