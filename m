Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A1FC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D7310E0E5;
	Tue, 14 Nov 2023 13:05:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE5110E44B
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967118; x=1731503118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPOeZcS/6NyvYIfil8/+zsLlt47GbejwmMfYkxBZNok=;
 b=azLYJ2UUXJZSfg+/cWGHBBXCLL+Uo4ER5NFJi1MCndckZzagAj/oOFmO
 W6Hvew/hFhyNXeel0CY67M+GUEM2DlxvGX1dMzabA+GoF3T7dpXU3feiB
 //rAGJNW34E0jWSPrB67QVcmgqutm9XwVOgedxsmM90SZ68QY0nO6L+jI
 JwQYuWzYOWeIh85/PHiFsIzA4RsiNmhE4A4ZUrcwgQeOpTydpXA3oHzWv
 OaTQgSGRxf+/S5OlVjbnk154432/bxxodZ1OKiCqwfMI6BivrkuQyENP3
 MdylwTgDdJhoTAgjsf3no/FRrj2YJBf30zo4rY5R78gmDSfn9lxaYgmt8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394565391"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394565391"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793778968"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="793778968"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:16 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 15:04:42 +0200
Message-Id: <20231114130443.2503708-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/9] fixup! drm/xe/display: Implement display
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

Add i915_ggtt_offset into i915_vma.h compatibility header. This is needed
by intel_fbdev.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

