Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0225C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2EC10E5AB;
	Fri,  5 May 2023 08:30:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEE210E5AB
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275453; x=1714811453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l15x44n+QdGlUMi1XWpJEkVOXgTv7CipL7ERkj/xgi4=;
 b=GGU3UqPE8cUAlqywsugCz/eBjviPKibCe7Wr3lcciPHEy2FhF6K4H2R8
 CVlS3s/9BzOKSuecy6t41XH2bkff/4WkpIm27HAEzuGYVmR/gm1wxpyMu
 ZTHdREuUwPD48NzNRNCT3La8/xVYm7IOXofAaGn8Iow77h7SgU36KlLMG
 QRkHvYmsMzG34SNxhqcri+Iu4/VX30mTOJfVIUOq+6LRsPIE6vy9d6RRB
 /G/y0Xn9kphnePsFZeiSU9keBGuvPugD7Pv9g6rKYLcSo1DeX19utW5ll
 oQ+8unVhloWlioPWCZCBkYj3xlGnbaEMXkFRFVrDFAopCnmGcvkMeKHu9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783228"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783228"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749209"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749209"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:50 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:43 +0300
Message-Id: <20230505082956.2247875-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 07/20] drm/xe: Add macro to get i915 device
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper macro to kill couple of #ifdefs

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 06de3330211d..d456d913eac9 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -70,4 +70,7 @@ struct xe_bo {
 	bool created;
 };
 
+#define intel_bo_to_drm_bo(bo) ((bo)->ttm.base)
+#define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo).dev)
+
 #endif
-- 
2.34.1

