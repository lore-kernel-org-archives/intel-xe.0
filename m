Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FACAD0BB46
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EAA10E872;
	Wed, 23 Oct 2024 23:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEL0FLAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A1610E872
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729725129; x=1761261129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=os8a2fCHVd6ELa46QNVNsKU6zh2Mo6GSqF+gDimHs9I=;
 b=TEL0FLAW0P1IlrMBn9HdDVIprBV2AIDjsUwWiK8ZW/adA96sXankRSSn
 PKFwPWodDXFlGsNtEHxS38eC2F+tIw4jdPchqygPEYpOSforVMUyYM8ZY
 Xrt8BJpNMl/oUnX6cGIntvs3uqpi5JYFpYwP/SfTpLZsLD/SdkQBua376
 Mgghu61Z68z+LMu4BKjkkiBeuCL4nLF8gto12TX8trPv869hU6wjKtOz/
 mvgQBEKNitnnME7K7kmfIYZ2z/fapWIBUxy0Yp9XLjJEyL5PskpIo0chE
 qwzURu5V+47aDhbz6u7VVHmIwrziW0GoZA/AtMKYfdEOJbhbLdpDIAyIx A==;
X-CSE-ConnectionGUID: x2u/wMq5RlywK6m/Homj+g==
X-CSE-MsgGUID: BANjgAdRTPm/MRsTDlHT/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28775152"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="28775152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:09 -0700
X-CSE-ConnectionGUID: fc7qrwklSHSJ5dJz364oKw==
X-CSE-MsgGUID: DZnIxDnkSbir7HNgBhDoCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111217976"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/5] drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
Date: Thu, 24 Oct 2024 01:11:49 +0200
Message-Id: <20241023231152.1815-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
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

Recognize new VF_CFG_SCHED_PRIORITY key in to_string() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 9d99fe266d97..146a6eda9e06 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -49,6 +49,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "begin_db_id";
 	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
 		return "begin_ctx_id";
+	case GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY:
+		return "sched_priority";
 
 	/* VF CFG threshold keys */
 #define define_threshold_key_to_string_case(TAG, NAME, ...)	\
-- 
2.43.0

