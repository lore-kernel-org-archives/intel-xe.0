Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69844C25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E918D10E9FB;
	Tue, 21 May 2024 10:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbtDqmyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283010E9A8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287318; x=1747823318;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qcRTLfREuMR1hqvHos6HX3lZC/0YlEMxIWGJ/1+j+aQ=;
 b=VbtDqmyV0GvjWLSIIoEAjzSvccX/CfUW5+By+qlurUwu9IAIG7rUAsay
 K05UzqMDCHTEIRU2ouGWPhBbh9poeXrDzl9AUoOmc8mSpdGPBUldRQJng
 y5BwOKxV+atza3NybiyilNIcu8+Y52pjYOqn8Lj5Df34YXfkC1z9JSj2N
 w4pOiec4UOUTyZ+aL36Id7ERK2c+moXgbh9Uv7q39YB2C1NYBuUS97o2t
 wTLmqGTjidloIhEbteNR93Rv3JiBUM/AwJvKtThEUllf0rogsoNPdQvzj
 NbOyNF4i/LkUuRiNUXMHQy7m3YICKZ/Qp/CcJT3EHmQcVbGzuTfaIIXxW Q==;
X-CSE-ConnectionGUID: nX3k+Wv/TgaihW8X7yiLEw==
X-CSE-MsgGUID: f+3Bi/zWRria8k1plXKvYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23606682"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23606682"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:38 -0700
X-CSE-ConnectionGUID: WhmebY2ET5OEXJxQn/Tjew==
X-CSE-MsgGUID: /vqKIRu+STa8AKWwEP+ukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37392857"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Fix xe_uc.h
Date: Tue, 21 May 2024 12:28:25 +0200
Message-Id: <20240521102828.668-2-michal.wajdeczko@intel.com>
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

Prefer forward declaration over #include xe_uc_types.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 5dfa7725483d..11856f24e6f9 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -6,7 +6,7 @@
 #ifndef _XE_UC_H_
 #define _XE_UC_H_
 
-#include "xe_uc_types.h"
+struct xe_uc;
 
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_hwconfig(struct xe_uc *uc);
-- 
2.43.0

