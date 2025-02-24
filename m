Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EF9C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D4710E1D5;
	Mon, 24 Feb 2025 15:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZkrBZHA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A68010E1D5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409640; x=1771945640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bt0Tkbu/oDZq4J3HW1veBSvnmbOFcVrbMRaK4qKOuJs=;
 b=OZkrBZHAgKP9YytUDn7QhpIB9gSXHjR5xNXrR+D+YkSo0+4iuq3z8ra3
 rBjP3S8O9M3oSymNXkfBi+LqCsFI1/gX+MLkE8k8ENUEleOrqySfOLEj3
 HX0tKkzP7NznQ6M5nTNwMgdyESFSJUdqDI+6F6yhoynARY4ShYZyMxHUj
 4l+csVxbMIOmk8hri3tgMpfWfCZLN0B7TUcelBzB/uUmZ+Hwtv7QNfCzx
 TRYKWcYi3KCZbxpR5cd2v7xqQBO6DmkjbDvNXE5K4O60mfM9keA75cAgB
 veF36PJCLCVdf70W99uQPJwOC/ui2uPeQbJHiJLIb+HVkglKAOQm71GuO Q==;
X-CSE-ConnectionGUID: qPp10MCaRq6rk9QUaP9eiQ==
X-CSE-MsgGUID: 4yd/yr4rQeq1r7QoGlFAZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28763883"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28763883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:20 -0800
X-CSE-ConnectionGUID: Xt/qmVUhSOS3vfsn96AvWg==
X-CSE-MsgGUID: 6T5AOnthSI6XnKmgouNinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121349496"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.79])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:18 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/5] drm/xe/kunit: Export xe_step_name for KUNIT
Date: Mon, 24 Feb 2025 16:06:58 +0100
Message-Id: <20250224150700.1778-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250224150700.1778-1-michal.wajdeczko@intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We use xe_step_name() inside the xe_assert() that in turn could
be used in our kunit test modules so it must be exported.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index c77b5c317fa0..db600cc9c5f2 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -6,6 +6,7 @@
 #include "xe_step.h"
 
 #include <linux/bitfield.h>
+#include <kunit/visibility.h>
 
 #include "xe_device.h"
 #include "xe_platform_types.h"
@@ -255,3 +256,4 @@ const char *xe_step_name(enum xe_step step)
 		return "**";
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_step_name);
-- 
2.47.1

