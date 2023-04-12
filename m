Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E68C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921FC10E823;
	Wed, 12 Apr 2023 14:23:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA4910E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309431; x=1712845431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQcc3rY2AcihHoG3vDaN0fim5PpE67IBYbLrpYlILLs=;
 b=SLFioKeRuJIykSnV5+hfX78Rafz7tddKYBQ/Z+LYQrMgJ0ldoTaRucZm
 wwREek/BXjPWacJ8MIJwj12mJYKwOk7pey0dO/CsEN656v+KHG1/Avy9L
 6KFQxomyuHxiZF6mggCPxGksJiUhfLsoKPn6c6dO+hsBMkbnO77coTVHC
 4sggB4yBTknPX0XlZRyi4BNmYci/TqusrIGgO9E+Sy8hKQk8hqWUvWUx6
 XBzwkTNBR5SVY9AMnJgq7tkLvWfsjX+0x12k7uGHTb8qyfxNCkW3lvnMd
 eYuACX//lZrYUhW3/3vvXggGVotGL4CKhVrO8QJkwUOZglEebe/xWVDRH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341404713"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341404713"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639251246"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="639251246"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:23:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:44 +0300
Message-Id: <20230412142006.877109-20-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/41] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.h b/drivers/gpu/drm/xe/display/ext/i915_irq.h
index efff7fdd6d27..5749132032fc 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.h
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.h
@@ -32,8 +32,12 @@ void
 i915_disable_pipestat(struct drm_i915_private *dev_priv, enum pipe pipe,
 		      u32 status_mask);
 
-void valleyview_enable_display_irqs(struct drm_i915_private *dev_priv);
-void valleyview_disable_display_irqs(struct drm_i915_private *dev_priv);
+static inline void valleyview_enable_display_irqs(struct drm_i915_private *dev_priv)
+{
+}
+static inline void valleyview_disable_display_irqs(struct drm_i915_private *dev_priv)
+{
+}
 
 void intel_hpd_irq_setup(struct drm_i915_private *i915);
 void i915_hotplug_interrupt_update(struct drm_i915_private *dev_priv,
-- 
2.39.2

