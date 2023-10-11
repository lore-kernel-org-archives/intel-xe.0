Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92496CD6E64
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6231610E785;
	Wed, 11 Oct 2023 12:26:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523C10E782
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027205; x=1728563205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kE3OjLlmbJJisRVHtRPRRml6kc5qj9x5vRRuTVqwhS4=;
 b=GB6xaxsZZD9L4unJUoMwzWkfv36JBadfvyEhhtSPU6eANIwzyiJ66+zk
 VKXNcHmTrskJBbAIEKMGGmPDVCv+UFDBBtt+vfGp4grHxELvTXgGHOn6b
 Z19+B+RtL6WgwJEeRUQJF/FCL0xkjTNm58oORGBMILiigq6puwKkmlF5h
 Aw8o6mOdLBqgcD9vBzniPPUPNOK55ZgagdN155age59EO+Q+L64LLjDRH
 xUiTtUlpikB1pm5O5MjzvQmbGxIbg5poUOzEmZuonVXlHNdkhCHQQ6PhU
 Kzos5bvomRSQ5C3VWwdNatN2kxqlVoZ5nD8FTtUxsxWrQvnXE+SSBS8us Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010315"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010315"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543848"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543848"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:43 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:12 +0530
Message-Id: <20231011122215.2025850-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
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
index 918dd27868fa..1223619f5bbf 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -204,7 +204,6 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
 	for ((wf) = intel_runtime_pm_get(rpm); (wf); \
 	     intel_runtime_pm_put((rpm), (wf)), (wf) = 0)
 
-#define intel_step_name xe_step_name
 #define pdev_to_i915 pdev_to_xe_device
 #define DISPLAY_INFO(xe)		((xe)->info.display)
 #define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
-- 
2.25.1

