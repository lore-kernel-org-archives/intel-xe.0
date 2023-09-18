Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273CCC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 12:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AA410E044;
	Mon, 18 Sep 2023 12:08:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895A10E044
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695038887; x=1726574887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PF7U11B3FIJ1NSEdF4FdIHfBWgHfEsurcNZrg8Lw+zU=;
 b=NaoPNIMs1itE3XpXAOIRdegybcPUT8RSYabj4d/aghEXiDvZ208LG2Re
 T1/AwIVB7OPeoYfY+s9gc7HYQp/zfAhLX79qHP3YjVw1RifjEoHvbmnLh
 QfRsukum6/5BhhkXjRAEkjZ19BSxpzqwwlZcfe3uqqK0zkoD+LqqNATbx
 FsABupBEeC74r1WevTZGjEaPbjC2mGx+ExrXBoZjAU6Cu/obr4mJYlX45
 DLjhIcdIeLMT9ToZp5bFFuloYp05iotM62yCcP2ut+kvEAOnDunybQq1s
 /tS87AcD1jH7ZDotVVrzV79Sm+xa/74DmZX0jeOhqVeSe47EBhKNIMcXO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359887481"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359887481"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 05:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="835992498"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="835992498"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2023 05:08:06 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 17:32:27 +0530
Message-Id: <20230918120229.338270-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/3] drm/i915: Add wrapper for xe compatibility
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

Add a wrapper around intel_step_name to maintain compatibility
with xe driver. The wrapper will share the same name as the one
to be used by xe while both drivers include different files as
needed during compilation.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/intel_step.c | 5 +++++
 drivers/gpu/drm/i915/intel_step.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index c02a6f156a00..6b62b5fcc792 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -352,3 +352,8 @@ const char *intel_step_name(enum intel_step step)
 		return "**";
 	}
 }
+
+const char *intel_get_step_name(struct drm_i915_private *i915)
+{
+	return intel_step_name(RUNTIME_INFO(i915)->step.display_step);
+}
diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
index 96dfca4cba73..25a1b1948a43 100644
--- a/drivers/gpu/drm/i915/intel_step.h
+++ b/drivers/gpu/drm/i915/intel_step.h
@@ -78,5 +78,6 @@ enum intel_step {
 
 void intel_step_init(struct drm_i915_private *i915);
 const char *intel_step_name(enum intel_step step);
+const char *intel_get_step_name(struct drm_i915_private *i915);
 
 #endif /* __INTEL_STEP_H__ */
-- 
2.25.1

