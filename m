Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F10FC61DC4
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281D910EDA7;
	Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/v5Ev6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB56D10EDA2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764327; x=1819300327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sagR+AdOdQukqLQ6s1lH7++y8iGY+NuAIfN2DN6/Ut0=;
 b=M/v5Ev6LIJWWZMW7rnR1O2fqgb8NPPIwAleWHQXIjlvp7uLChkPWGPTb
 UYIJ5ta833iXX/LhDHsak9jXrqmCeMRpBbP5FGNaIWSLL1V/bE5unFhko
 xD1qlD/DNVyJ7pSjxfo1LU7TWQWosqgKzpsEpSYmPIjhw72XZjU63C1Z8
 kPdzutJmS9wxJUg+CbW2g2K63Lu5wITWUuuvqmP+W90WoZieLYnOWezJu
 8KaJz/wbJc2LCwlBA7L4j2tu0WaAMD4+agPWJ1HwsuHPAFm0fGCZ32Skt
 QRDcq9HI7HgrmEOmQcnoUfT8v52EO/lC5dCBxMQvvZ9y2wJabkSJFfrnG A==;
X-CSE-ConnectionGUID: XQ/t6TdKRROpEw9b8k2m4g==
X-CSE-MsgGUID: 9eRVrFEoQf2Y+vCrggGxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379131"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379131"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:07 -0700
X-CSE-ConnectionGUID: QJDtbC1MRiyUflqew+hWzg==
X-CSE-MsgGUID: suw3STWaTFOeDwmDmunGvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493154"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 5/6] DO NOT MERGE: drm/xe/gsc: define GSC for WCL
Date: Wed, 26 Aug 2026 17:11:48 +0000
Message-ID: <20260826171149.708378-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

This patch is just to show how the separate WCL definition would look.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 12fbc25dc6b8..dc4e268f1379 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -147,6 +147,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(PANTHERLAKE,	SUBPLATFORM_WILDCATLAKE,major_ver(xe,	gsc,	wcl,	105, 1, 0))	\
 	fw_def(PANTHERLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	SUBPLATFORM_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
-- 
2.53.0

