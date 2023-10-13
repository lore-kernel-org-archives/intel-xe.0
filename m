Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6985ACDB483
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 06:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CB310E5C2;
	Fri, 13 Oct 2023 06:58:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AF310E5C4
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180280; x=1728716280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qb0i2psZI1COuwqYjgQr/hfVeNxwaffgK8skFl2vOW8=;
 b=BpBvpxV2osaHPwZpVSO1aAWO/sTveRucLAVSIIIsNDcqZ7RuVdN461qQ
 tQ06RqQF/tGne+dnjQQ78TUWZpT8gqm75SFM6d4ChdEZQ6zx3Rgfbdt4B
 +TgevMXVxIf8/zWLUlYVBkr7oIj77B6rg4JgArLTloL7Pv9MibBCvp/sh
 eJyR4KXM6VqzjZPXC1objTBhbH2qP5q4ETibzTWvJPwEocW9EpYrzR+1G
 Ls2sBrWEavAauc57gtf/gV1KHfppJoWJlG69PZ90L2/Z6P8x9D5rixckh
 o5+PwK5I4rAuRn6oNmsSZIUCuRdlSXZvdVSMVn9wSP9AuKsOWhRO/6+5I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384954563"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="384954563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 23:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731243508"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731243508"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 23:57:55 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:23:20 +0530
Message-Id: <20231013065323.2233783-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
References: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove redundant macro. Stepping will be handled in a separate
compat header.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

