Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6024C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4810E9A8;
	Tue, 21 May 2024 10:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2n7cShu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB810E9A8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287319; x=1747823319;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HHGjXMFAQBEWl4x18NW0muaiY6HvK8TGMUfc9wTi0zw=;
 b=G2n7cShuHpb1qmZQZsLO9g72ncJJnUP28W/e0M+G80KWR0Ae2OI/Kuo/
 snvMtOFQMsD5QwDZVx05oBI57W4RySpU2F4mW7kYrVyqpd8A3ez6Nnkju
 ZqW424dhaAgxR/6ad7Lgedz65+SD2Rj92+qFhrNC5ZwgcnGPPquuliyEX
 1ebymJutB/udjW5FYq9iMxaGFMp9Rk8cQ+fIAatdgITjopR4OnnJjgS7b
 cGAlWMm4tByP6BJ2JXyKBkK3nDFBwArdpufITXsGZQX83HK5w/b/BWaTF
 X+sXWPa1JiKnJGAhX6dnJ6HaE+UE7fCfSrYD2b+LfM1HQ4pOoBJeB0msU Q==;
X-CSE-ConnectionGUID: QQC128P9QRGwF0rP4Ixw1g==
X-CSE-MsgGUID: YidP1W/rSdG5dMglLLvsJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23606684"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23606684"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:39 -0700
X-CSE-ConnectionGUID: W3XTe9MpSlW3MuRktwHArw==
X-CSE-MsgGUID: jtWqTt2PTEKUiRmem+i+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37392858"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Fix xe_gsc.h
Date: Tue, 21 May 2024 12:28:26 +0200
Message-Id: <20240521102828.668-3-michal.wajdeczko@intel.com>
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

Prefer forward declaration over #include xe_gsc_types.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index dd16e9b8b894..1c7a623faf11 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -6,8 +6,9 @@
 #ifndef _XE_GSC_H_
 #define _XE_GSC_H_
 
-#include "xe_gsc_types.h"
+#include <linux/types.h>
 
+struct xe_gsc;
 struct xe_gt;
 struct xe_hw_engine;
 
-- 
2.43.0

