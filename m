Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE02ED3B9AD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 23:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7080410E22A;
	Tue,  9 Dec 2025 23:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVlguT8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F2B10E22A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 23:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765323107; x=1796859107;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zv968s8uNwnlhARONAbZnbry78gb/JMwYqRX8RZ0Ld8=;
 b=jVlguT8VXr182GIqPMUStncH2ao+2t4WdMjW4uj6yB4xzaHljz14QFDH
 Q6YiI24WdJtHTpAgj5ilno340id7YwaT8AsK6tdVwuqMAi4ZJnT3yT8jW
 ehmlEH9qG3GZcLdttvCRLwC8SDnnHVZS9GHUUUbpDk+JPFYztSOeusxM9
 iX9GfA75Hm6RPu/eZHMXzwOK8O8edxadmS8LUK0PhBoHMLx7DE8z7EE+I
 h562f2FbhwAyUujM5zZD83y7XVP6xIwKNqRqVyWTqUb8aJFtF1IO5oBTr
 XJt+GDB7q/WR6BAptbvE7F8rJhpVwQ65zUHg02vsoj/3aUYs2RyDXc5Ee g==;
X-CSE-ConnectionGUID: ewyqJiH7TQiY9QbTZ/4yRw==
X-CSE-MsgGUID: Uj3tMKx1SV6mkeAPbzoN/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67341813"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67341813"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 15:31:47 -0800
X-CSE-ConnectionGUID: uMPwctMdTGCDSgOUlNyF8A==
X-CSE-MsgGUID: 9ufKdx7hQWydIicvNA9BJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200522857"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 15:31:47 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
Date: Tue,  9 Dec 2025 15:31:34 -0800
Message-ID: <20251209233134.1076181-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Reports can be written out to the OA buffer using ways other than periodic
sampling. These include mmio trigger and context switches. To support these
use cases, when periodic sampling is not enabled,
OAG_OAGLBCTXCTRL_COUNTER_RESUME must be set.

Fixes: 1db9a9dc90ae ("drm/xe/oa: OA stream initialization (OAG)")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cc48663c2b48f..896c8f066fdd6 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1105,11 +1105,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 			oag_buf_size_select(stream) |
 			oag_configure_mmio_trigger(stream, true));
 
-	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
-			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl,
+			OAG_OAGLBCTXCTRL_COUNTER_RESUME |
+			(stream->periodic ?
 			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
 			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
-					stream->period_exponent)) : 0);
+					 stream->period_exponent) : 0));
 
 	/*
 	 * Initialize Super Queue Internal Cnt Register
-- 
2.48.1

