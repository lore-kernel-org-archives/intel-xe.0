Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84848CD1283
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E025112519;
	Thu, 28 Mar 2024 18:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwGkTBRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0AC1120CD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650724; x=1743186724;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IdLuwL4W2a76mz1P4cIbfkJEfbsWeVnoKDnFkjhGpWI=;
 b=LwGkTBRsWVp1YVen5tLaxfzKq1sNpsqaJUzdDkX5JikITxjYkrtxhHpc
 dBwrgSsVq2J3HLM7WKwHsiOyLtf2T4oeddOxSUng5F+/eqqd+sR5uty4J
 YpQSWpM2KNg36l+fQZKFMcNJz/CkO2j3wrcQWSLPI3fLUwq7dRh7dR6YO
 vyTbuBRdCg9nR7YpmDj5fGO0Rz1pNpa/iFdNZ+soJ1h7a4Ko1XcDfyePf
 TIhsQUiCeFy9tUIyK6yWS3wlpQSkArvsY59wPKPCSoQzFBfeMq68QQT27
 y03JlJod7oWuEByvhAh/uSLRJ3N5BjTlt/GWzL9x8P4+gaYCq4YdSUoMo A==;
X-CSE-ConnectionGUID: 7cSRys1lQ4G7/2EKuI/veA==
X-CSE-MsgGUID: RJL3hxbuRnaT/R22OHzcqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18205414"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18205414"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="47700452"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:32:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
Date: Thu, 28 Mar 2024 19:31:47 +0100
Message-Id: <20240328183147.495-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240328183147.495-1-michal.wajdeczko@intel.com>
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
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

VF drivers can't access GMD_ID register over MMIO.
The value of the GMD_ID register must be queried from GuC.
It is available as GLOBAL_CFG_GMD_ID KLV.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0400bc0fccdc..4cc8e6f634c5 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -35,6 +35,19 @@
 #define GUC_KLV_0_LEN				(0xffffu << 0)
 #define GUC_KLV_n_VALUE				(0xffffffffu << 0)
 
+/**
+ * DOC: GuC Global Config KLVs
+ *
+ * `GuC KLV`_ keys available for use with HOST2GUC_SELF_CFG_.
+ *
+ * _`GUC_KLV_GLOBAL_CFG_GMD_ID` : 0x3000
+ *      Refers to 32 bit architecture version as reported by the HW IP.
+ *      This key is supported on MLT+ platforms only.
+ */
+
+#define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
+#define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
+
 /**
  * DOC: GuC Self Config KLVs
  *
-- 
2.43.0

