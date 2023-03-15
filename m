Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EE7C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D9310E94B;
	Wed, 15 Mar 2023 15:55:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02010E94B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678895748; x=1710431748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kGZgJEiftT+sNFU07zblYw1EnIG7ToLvEWCQ3nwZ5s0=;
 b=KJ3V0CvAM1+7ReWkEZnQ+wQuOpKmzno06x/9FQNij3idkhuFcReVqtb9
 STxPsHmEoQ2j1ZiOXuqQuL5Awc0Kaxlivmnc5ZESJPaDr+TIjnHhc+pvY
 EauxEDZDiHXpT4eiBhfMa1RiE97XEZrY/nhRUxc/wpmHROadVCC3k7KeS
 n+/7aK+CvU2BEjMGs1rk8YSkffmb76VNzfQyMaQFXyeyUUEfmVUqc6fZS
 giKHzWW/j6nY6Gd+eFopFZx1/ugLdID9QIUxi+2GSlC15MkRyUMz95lnJ
 W0AKEV3iakxBpPyNPYWI8SyUFl+C6gA7fsBFuEp8EK4vOuymk8PsiiFvC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321583182"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="321583182"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="711973845"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711973845"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 16:55:05 +0100
Message-Id: <20230315155507.43933-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/7] drm/xe: Use a small negative initial seqno
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Causes an early 32-bit wrap and may thus help CI catch wrapping errors
that may otherwise not show early enough.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 523c2611ef5d..cfe5fd603787 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -8,7 +8,8 @@
 
 #include "xe_hw_fence_types.h"
 
-#define XE_FENCE_INITIAL_SEQNO 1
+/* Cause an early wrap to catch wrapping errors */
+#define XE_FENCE_INITIAL_SEQNO (-127)
 
 int xe_hw_fence_module_init(void);
 void xe_hw_fence_module_exit(void);
-- 
2.39.2

