Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D63BC07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B5410E4F6;
	Wed, 15 Nov 2023 06:32:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C095110E4F0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 06:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700029964; x=1731565964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BayLGZRsbMLWBMOuzXU/xPTLbF99vNB0U4JwAhATdoc=;
 b=X2sWBAf4UF1pO+utWLRiLJOr2ABnO0jZP97l0vZMdTkpHI1dJX4I/hjE
 yMmp+B6EAIIBfZQ0AoCyh5L6Uu9LpzGLKNK+kWyE3G2c2AiikrCyJANL4
 vsjkUztLRwJAjZ09v7QWM6SyYhLoNI6+gpam3IzxzfJLQd98PCXt7sXg8
 AaPxwbZNZzxHutDLljVU1SM94dFYxEzTkO8s2C6dZwgQTLyOS7kxfLIKy
 kb8O07kdLUgxptLRIElpSX58E4nd7NpKhttytG6PVX67YA1flBTkRVEVu
 HX0le6CU0/hdPBSIxmkBKvSQshi44U0gxo2wt5w66vPQZeR2NlYUTki5R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390616522"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="390616522"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938389854"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="938389854"
Received: from tmagriss-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.218.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:42 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:32:09 +0200
Message-Id: <20231115063210.3112123-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 8/9] fixup! drm/xe/display: Implement display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add i915_ggtt_offset into i915_vma.h compatibility header. This is needed
by intel_fbdev.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 9424144b1b5a..23f2d037c313 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -19,4 +19,10 @@ struct i915_vma {
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
 
 #define i915_vma_fence_id(vma) -1
+
+static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
+{
+	return vma->node.start;
+}
+
 #endif
-- 
2.34.1

