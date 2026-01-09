Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272AED26D60
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE10F10E012;
	Fri,  9 Jan 2026 15:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKtC66mR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6CB10E012
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767971556; x=1799507556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srOoIIvR3wg4AIUhI/g2BBIBWAtEIUFp2zAGH/KDut8=;
 b=KKtC66mRC6psxq/HIXEPoHlGqrcR/tCb/GZcDL/iveEe91Yw4KUVkZqt
 UPSUBp6FnlFNRZZds+QNRBhr3lCfHCM3aCaRTtMlQyrxFNIefoXQjatNV
 l5+L10GqpeY+iMb/dAaExI2OmQy/gMkfCIxjuyrk+AiW9srKBJzZh00hN
 4fhcefcXTtLQfxuaJKM05lazsrttIzk4dAmD+6c9JHqmtC5uVjOR8EIRB
 FlAPTccnBXVj1TdVsr2ev/98vXkwUGxhw/sDuonX0YTeYJ4hQQOKt3j09
 D2ia8EAb3EyLUbaKbIygOCvWfdIiW7sd6jP4auhWu/Pz7jjDw9QzgJ5uP Q==;
X-CSE-ConnectionGUID: 3NmZVM75QKS5rkjucTK4aA==
X-CSE-MsgGUID: a0f0jdF6TyKpOwyHVxVTlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79990715"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="79990715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:36 -0800
X-CSE-ConnectionGUID: yZ+GEHzzT6CZvsiwEBym8w==
X-CSE-MsgGUID: ACPgk8P5QESJaDIJ6GHm3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234687622"
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 1/5] drm/xe/mert: Normalize xe_mert.h include guards
Date: Fri,  9 Jan 2026 16:12:15 +0100
Message-ID: <20260109151219.26206-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109151219.26206-1-michal.wajdeczko@intel.com>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
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

Most of our header files are using include guard names with single
underscore and we don't use trailing comments on final #endif.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_mert.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
index 2e14c5dec008..0de8243e46bd 100644
--- a/drivers/gpu/drm/xe/xe_mert.h
+++ b/drivers/gpu/drm/xe/xe_mert.h
@@ -3,8 +3,8 @@
  * Copyright(c) 2025, Intel Corporation. All rights reserved.
  */
 
-#ifndef __XE_MERT_H__
-#define __XE_MERT_H__
+#ifndef _XE_MERT_H_
+#define _XE_MERT_H_
 
 #include <linux/completion.h>
 #include <linux/spinlock.h>
@@ -29,4 +29,4 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
 static inline void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl) { }
 #endif
 
-#endif /* __XE_MERT_H__ */
+#endif
-- 
2.47.1

