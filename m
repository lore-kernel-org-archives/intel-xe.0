Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B8C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726410E653;
	Fri, 25 Aug 2023 09:39:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5610E652
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956375; x=1724492375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bsb3quguBf+31GXEmq2eVnzDjXlB4PDFbgMh1OCC9HM=;
 b=G9WlUGl36e5NCAPl6StP9CGBnzNVclIEA1ticR1BO1d09evhgMWzUlSM
 vqvnxapdX0ylp/ZPpJBwQyNfYAXWdrtk7vY4+PZfPgFoyb4czp8ZQfpqQ
 Rq82NSeeE/gr3H9WIEsffNe+kN/p8vAwEUiQ6dYrCR19TtqoNj80WBcTO
 DrXDMCocSMCC5ealnWqn0pRJQuB+CkvD2WpdpsmMIJNbEFWA44T4pQ2MA
 96gFJmfsF5Zd8mToBbbtkQVcilscwq9hZChFDPhc7RD4i5iv37NKkwmuh
 K41yA9CJiOUisqDpgaQjR+xR+a2epRTyaE9FjgradONc5oJRXPFpi47I2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037135"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037135"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246857"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246857"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:39:02 +0300
Message-Id: <20230825093904.1230143-11-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/12] drm/xe: Add empty define for
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

