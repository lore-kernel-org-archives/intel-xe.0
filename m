Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A9C04A6A
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF71D10E5B7;
	Thu, 27 Jul 2023 14:55:42 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56FF10E5B3
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469740; x=1722005740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JF+RPL5qK0UGu9++OKLGMvfFzPk+bZnXwXhGtYUBz6Y=;
 b=UxowNAqN3xRk39Ijc28nMilQ5LSsESOumfUioaLTKa5AE15TatxtTlLC
 xMVM5LI3z3X+CukI+eeNd79d/8UtzE9WObqDgxPhjFcESQios9p+I25Hg
 Eza0L2m8DuqDkXHzQO/yhIrQCHer95UltbX/Ij6Ca79wmXnWChQxLb8g7
 6USo9BglepGB/VHPO/c7pSt9sbkMMoPfBiEkCbdh14mNrzL7TFusj4dKl
 fhwDoEhwCu9DO9xW/Hug8Y7fF773Jj9uZETNL9sGUpO3yxQUdK19XHYcV
 O1HIRsh+n/b255cZCM0kUrunAYqQFcjfYJfw4C27tvC9kC5pV0jaG1/Lj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353244887"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353244887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797091706"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="797091706"
Received: from cweger-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.37.139])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:39 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 14:55:28 +0000
Message-Id: <20230727145530.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727145530.7-1-francois.dugast@intel.com>
References: <20230727145530.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/macro: Remove unused constant
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove XE_EXTRA_DEBUG for cleanup as it is not used.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 038cf28604ad..a7105050bce0 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -8,7 +8,6 @@
 
 #include <linux/bug.h>
 
-#define XE_EXTRA_DEBUG 1
 #define XE_WARN_ON WARN_ON
 #define XE_BUG_ON BUG_ON
 
-- 
2.34.1

