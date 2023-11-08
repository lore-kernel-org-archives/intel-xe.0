Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9228C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 07:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8915910E48A;
	Wed,  8 Nov 2023 07:38:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39F410E48A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 07:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699429085; x=1730965085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sY8ccqBgKCHBMtE6KwvcxhSojHDKxRZE8vAhIf+uwrM=;
 b=h6zESTe70Orj9OMW5U724FRmb5TsWirrpzGkbWbO3+XQ9mltb4FnPm86
 r3LhKieEprFEWkBJyV2gR1EaXZOHrPdjZROumdiveqqDKjuZQdoWowhfa
 NVI8PDXANYpE9U/VyfUxDKY+dRpq6nx/yT9T/qj12te79MAI+KmaqAbdU
 hOsb84nu29lKYQ/K6c9b5fwQ3xcrLq5yJqTdTuQaKMeEugjhdCifooRdh
 iiXJwnE5LmjljpD6IwNSuNkSg1LBWQJv63OUsTPVyKQ1h+sbTMcr2oLJS
 ajMJMlU9xxepAHSWJzEkpNJvuuCLfLnb17AJqq6dFQ3s1l2wj6twAAbK0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="380109702"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="380109702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 23:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="10706708"
Received: from haridhar-ms-7d25.iind.intel.com ([10.190.238.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 23:38:04 -0800
From: Haridhar Kalvala <haridhar.kalvala@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Nov 2023 13:03:51 +0530
Message-Id: <20231108073351.3998413-1-haridhar.kalvala@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1] drm/xe: Add Wa_14019877138
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Enable Force Dispatch Ends Collection for DG2.

BSpec: 46001

Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 614e114a5342..d03e6674519f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -677,6 +677,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
+	{ XE_RTP_NAME("14019877138"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+	},
 
 	/* PVC */
 
-- 
2.25.1

