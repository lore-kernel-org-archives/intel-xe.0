Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71AAC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14310E2DE;
	Mon,  8 May 2023 14:47:44 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7490310E2DE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557263; x=1715093263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gW2K79fKe8TS2r7Wekd9dEvQvS9L9H34SlGpjnhCAnI=;
 b=kKzoE7KVEzEd0jn7xyHB6NJgJxpRSsbWjtvTuUCFskJRJR+nySikZfOb
 gIMSCsAkanYvrgPpJGpcvUY5KsTzRQGS+gXfwxK2bAXGlPE800/pwbFCt
 Kc511gMBP4HGvaScQbk8QC8lPEv6i/v1URCis4jHgFE8N5mVcz5+0OALQ
 gDDNb5jIB3YweuPzIUAA8HhZhy5Dobq9BCB+ymHeo4uOogd04NGZplZlk
 V7yonsSrZB5X6A/ZPBbON73b36MvVOv4BBqfZhRH453fD/7biL3IxsOCZ
 aKJoguDSg/88CAEM5Gkkxx7Xw7ZI6yCK7eIcOXQxahADuyYFghAqY5MnL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="338888517"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="338888517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729100298"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729100298"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:14 +0300
Message-Id: <20230508144618.162140-15-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/18] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

Remove an unused function.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index e858011efa02..42552d8c151e 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -111,12 +111,6 @@ intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 	intel_uncore_write_fw(&i915->uncore, reg, val);
 }
 
-static inline void
-intel_de_posting_read_fw(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	intel_uncore_posting_read_fw(&i915->uncore, reg);
-}
-
 static inline u32
 intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t reg)
 {
-- 
2.39.2

