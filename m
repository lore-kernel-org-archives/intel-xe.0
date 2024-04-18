Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DBCC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0811113317;
	Thu, 18 Apr 2024 15:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDEeJO3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDB510F9D1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713454091; x=1744990091;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=58Ptijvl2N4SU2QVQdSPrjWGmzkHjULI6ZiIdANhDyk=;
 b=LDEeJO3qEzQ7xL8wjfAdWOxZyeyG1Uy6y6CODiLTfpVEiTHRAnKaW91E
 61gtsowNenWwwF8hYo9dReIcji3BKzu3CIU8ZjzlfFtZ9skiQnC8+zKgY
 s0WovUUgo5LqYg5R85yJmvMvm6cId54mhMBwWi3xYM2E8rN4giSswogIM
 z/UcGbSwmiAFrM3lMuOJ267PMGaWBnE+ugJz6MA9VUXDs0Kz8konBks2X
 M/iIkkd8Onc4xaViFEuEQKQCmdfr7fJKZTUcWguIsfj/Qq3mSG0wG66WX
 YGoCnarA77VGI3PpFTVQi5Zx1O2w23Q9IaNax+Y0gPSkBwrl0/kpdHJvf Q==;
X-CSE-ConnectionGUID: Tmq8/zamTtqBNJdiCy52Tw==
X-CSE-MsgGUID: OVrzLiNXTACMTdQBNZwn1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8873718"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8873718"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:11 -0700
X-CSE-ConnectionGUID: 9oDbOIfZTSWSEeIccMPXTg==
X-CSE-MsgGUID: oMMv6Zj6QpidMqiqP+U8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="54205899"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/5] drm/xe: Add helper to calculate adjusted register offset
Date: Thu, 18 Apr 2024 17:27:59 +0200
Message-Id: <20240418152802.182-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240418152802.182-1-michal.wajdeczko@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
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

Our MMIO accessing functions automatically adjust addresses for the
media registers based on mmio.adj_limit and mmio.adj_offset logic.
Move it to the separate helper to avoid code duplication and to
allow using it by the upcoming changes to PF driver code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index a3cd7b3036c7..7d003bfb91a8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -36,4 +36,11 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
 		   u32 *out_val, bool atomic);
 
+static inline u32 xe_mmio_adjusted_addr(struct xe_gt *gt, u32 addr)
+{
+	if (addr < gt->mmio.adj_limit)
+		addr += gt->mmio.adj_offset;
+	return addr;
+}
+
 #endif
-- 
2.43.0

