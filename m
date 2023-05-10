Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37CEC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 15:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A7310E4CB;
	Wed, 10 May 2023 15:46:52 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C510E4CB
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683733611; x=1715269611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PSLkpfaCPZMJWgAIZR6rrmOmydyNy7EziOQTNABvcK0=;
 b=QbKtCH3MEexG/kDK+AVrYOudzQifA4XOARSPLM9KjJDjSkjcIfiEgLOn
 WXxMLsqZsTJFd8afhQUaEh+bVUlbLOiE9nEG3Srg825jdn4mvSRNAHCpM
 aTSSp722Q6okk+w3t3EhQUOo7yWvCVoCfS9j/+74lUuDkJgX6shUbfMc6
 oeHl8XxzNnWUSueBWZUjbTad/NnZoh30uJUsamD/MXQ0dIqD8SGVlHbcM
 9NkMq4zOczLpDq7E+SKNLvDbYVIgM5BLpssQyc3Y+4QKKk7KETznvHdHL
 fPggMNacGV0EI2dysg731WFdzaRMo3opPr9qLsEQ7RBDk44s5hPWwWOgJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353320768"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="353320768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 08:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="1029257348"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="1029257348"
Received: from azaki-mobl.amr.corp.intel.com (HELO localhost) ([10.252.63.3])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 08:46:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 18:46:43 +0300
Message-Id: <20230510154644.712030-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] DUMMY COMMIT. REMOVE AT NEXT REBASE.
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

"drm/i915/display: Remaining changes to make xe compile" adds these
lines, and "drm/xe: Introduce a new DRM driver for Intel GPUs" removes
them again. There's no point in the back and forth.

Need to temporarily add this back to create a fixup commit to remove
them from "drm/i915/display: Remaining changes to make xe compile".

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index eac5a4141bfa..a7c4101370ad 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -218,9 +218,13 @@ typedef struct {
 
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
 
+#ifdef I915
 typedef struct {
 	u32 reg;
 } i915_mcr_reg_t;
+#else
+#define i915_mcr_reg_t i915_reg_t
+#endif
 
 #define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
 
-- 
2.39.2

