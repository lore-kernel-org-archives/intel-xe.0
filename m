Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92190C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 18:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4848910EB3F;
	Tue, 22 Sep 2026 18:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwgWjPhT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ECA10E6AB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790100756; x=1821636756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xKU+XOgMBiLGmaX1IqihJ0scHchbGsTS2whip9cnkc=;
 b=dwgWjPhTseYM6stwVfv5KGliOevc6/siVNm59+FIfKuUnJl/JcnxISR2
 MFHIZsyIPAqN3WCyXnSE5cGii3/4znz2N/GRGdOGaDeKmvxeKo61LeBXZ
 u0SKs03mXmEwbRH63oMfJNHWcH8Ycar79VXgdvDGT5K6XLlsNLRr1aFtS
 8r+SLWH15OHFYpym1j9LnJDHmKgcgL0M5nEOR9s2w0y3OWisYipnQ10z7
 XsNB4OykVrJV07AKLO9OUpBxBvTy+0FNqVuwaP/vobqE4W8/fzDY2rY2/
 GGflWP0h35y19+K+941RkuCv4i4lc70p2FfQLWYA+YEFSDNVn3qZVl/iJ Q==;
X-CSE-ConnectionGUID: NQ4lnvDwRpa6VS7EAUjvWQ==
X-CSE-MsgGUID: 9rfjkLIwT7OL5kN8kJ34qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1236100"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1236100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 11:12:35 -0700
X-CSE-ConnectionGUID: steRcNTMSDCx1LfGluW0LQ==
X-CSE-MsgGUID: dY5iOpSZSTeK6ph6rZeiNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272721690"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2026 11:12:35 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/2] drm/xe/gsc: Define GSC for NVL-P
Date: Tue, 22 Sep 2026 11:12:32 -0700
Message-ID: <20260922181232.1111750-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
References: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
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

NVL is identified by GSC major version 108.
The compatibility version is 0.0.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..2ce007b47f4b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -145,6 +145,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(NOVALAKE_P,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 0, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
-- 
2.43.0

