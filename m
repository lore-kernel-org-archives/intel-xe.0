Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72414CA0ECE
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7C910E36F;
	Tue, 12 Sep 2023 06:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7D10E35B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501248; x=1726037248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uaxKD3vzOoOUAvcH39BdyMWlxrWkeoS3dz7/6lx2sCA=;
 b=ngxSCqCk6QWAscbpT1aHp8azIuLcJn/MwDrsMARdNiwEeTyfUgE8cofs
 k7tYDlcbiNWfOkHjmA82cgk98d59mzWCBCjwDdgAbgQoy7N3GGYVGEuiU
 uvGsxuAMHY5pbMtFpt9lS6F+2xu/m92bPxU2E0j/N0mfhV+1z5a5ZHoFc
 lXW7gSIzOUKcXAgijUxUT1ocN8kRQqoDrL22wc8dBYvR/v+cCYnPTV/PA
 u5f7wS7A7T+YxLpnny46uwlAp4aCwU3Eokq8HM+3bkm6PV0USPCWiCfzd
 uAfssC/+eLgYOq7bzZ2+ozP9OKmNd+bAAY40bgIChcMk38CADY8c8ue19 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730332"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730332"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699023"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699023"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:26 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:01 +0300
Message-Id: <20230912064709.2802305-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 04/12] drm/xe: Add macro to get i915 device
 from xe_bo
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

Add helper macro to kill couple of #ifdefs

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..2ea9ad423170 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -70,4 +70,7 @@ struct xe_bo {
 	bool created;
 };
 
+#define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
+#define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo)->dev)
+
 #endif
-- 
2.34.1

