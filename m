Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C53CCA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B3710E35B;
	Tue, 12 Sep 2023 06:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6E10E350
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501259; x=1726037259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bsb3quguBf+31GXEmq2eVnzDjXlB4PDFbgMh1OCC9HM=;
 b=EjPmHjIP2mlpR/HaHc1Kq0LiTKeiqLByF3jKhxX0l+dXslceuNqxJ+SK
 QBw+CGu44P9R+GBxDmu+lVIvvaEnJRXGU+2zzEHTXO6khhpa29NFPw2KV
 DoyqE7lWh2UE8naJjLM/lTycRThS1bVCK/3J1itY4LqX7ilHczlQkYhYD
 MtQTUvSzuRxDnGsGfIs1+bYm9lgkOr8/V/eyuMV9fczNEFAiEtGLLx7Ie
 LwjNWTEVjBMadpmvTy2uvQbg5djngmzjrI7wjz9VmqgauNNNXjaTFn6s/
 Mj/EmKh03RGFqf5qvkKxmGDwP7l7Q3pyW2YSGr3HmJm2Hi/qFRj9dBATo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730363"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699083"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699083"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:37 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:09 +0300
Message-Id: <20230912064709.2802305-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 12/12] drm/xe: Add empty define for
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

