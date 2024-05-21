Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68114C25B7D
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E71C10EA67;
	Tue, 21 May 2024 10:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGtfywqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF5A10E9A8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287320; x=1747823320;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m8B6o9tPWKsV6itjRGu80uANtVBePrfwkhqwD2nTscg=;
 b=GGtfywqPUGSdoLEAXMvfpAUKRiu4JNxXy5GwjDVcOY7oyJOa16QG62qi
 9uCLr0XQWmwln5LPXkPYDjZrVgV1ch1Exn4ersAaIJBI8gMSz4XfKW0SW
 woteiN2xI5NyiG8OOeTYGYVbuFQw7Y9Lzjs/Fd24qkj+fZgkmmwsDmO3g
 Tvj/rh1ybtzxK04SzXJwvp9v7bP2SjhGSnANPuB0HUWEEK1kaVctJKmrO
 jYgD/f0bxjt4EKUvFC18RRJqhUFLr7ECRw6TMk/3LkB8fH0jpFB63+ok4
 AtSXuWiCAFVgySOGoemLWW1p0ySTtBmBX9WupcFiFY9spZYY8xnxL/NXM Q==;
X-CSE-ConnectionGUID: VNAUESBjSxmnrqT+Q5O4UA==
X-CSE-MsgGUID: S8Bdok4WSoCpZYyMw5X2wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23606685"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23606685"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:40 -0700
X-CSE-ConnectionGUID: uNFuC+tyR/KwFlcq7bkoUQ==
X-CSE-MsgGUID: 5Zo3ea4xSqaCsmtvepuZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37392859"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Fix xe_huc.h
Date: Tue, 21 May 2024 12:28:27 +0200
Message-Id: <20240521102828.668-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521102828.668-1-michal.wajdeczko@intel.com>
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
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

Prefer forward declaration over #include xe_huc_types.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index 3ab56cc14b00..fa1c45e70443 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -6,9 +6,10 @@
 #ifndef _XE_HUC_H_
 #define _XE_HUC_H_
 
-#include "xe_huc_types.h"
+#include <linux/types.h>
 
 struct drm_printer;
+struct xe_huc;
 
 enum xe_huc_auth_types {
 	XE_HUC_AUTH_VIA_GUC = 0,
-- 
2.43.0

