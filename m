Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6909EE7FE3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860510E8A3;
	Fri,  8 Sep 2023 12:24:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC67110E8B2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175891; x=1725711891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bsb3quguBf+31GXEmq2eVnzDjXlB4PDFbgMh1OCC9HM=;
 b=lik4+cMuYkCS3NymlJhq27l2y8gwENm8hKXbmC4lrxZFz3l2DrK6QdXJ
 bkhSVWihZIrxSiVRx+u3LOF9qI60XB++VsoEJcs9vXk+3jy8TT2udtM7/
 47ZGjkXtXRScdvcb1aHD4ktCOby63mScyV4WIV6pKL5VHYK7vzq9yCUw7
 e6o7MgtDNPpo1dOqfuWT9lqmIVRldCMNnbaoHXTkBMu+6V2silzYibRTd
 aZVOejV54ixhSsL2a1vOPxS/f9Ti5yAMK1rA+HvQpBV3puyps0CHm7K4G
 9jG2oG+7jJtG0f7gc2R4psWxn1+s9u4DRtVdIFvDgW+T8sulrrNkAb/yu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650068"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244238"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244238"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:50 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:15 +0300
Message-Id: <20230908122415.1886366-12-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/11] drm/xe: Add empty define for
 i915_ggtt_clear_scanout
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

Add empty define for i915_ggtt_clear_scanout to avoid build failure.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 4547aac8b6fa..3d8a1cc0b132 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -16,4 +16,6 @@ struct i915_vma {
 	struct drm_mm_node node;
 };
 
+#define i915_ggtt_clear_scanout(bo) do { } while (0)
+
 #endif
-- 
2.34.1

