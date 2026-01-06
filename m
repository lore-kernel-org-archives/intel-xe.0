Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B499DCEFD12
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 21:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDEC10E16F;
	Tue,  6 Jan 2026 21:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBFe3WY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C52010E16F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 21:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767734933; x=1799270933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BisTanM2y4YGqnvlWpQnIM+v1RCBHE0CdeGz5adWry0=;
 b=eBFe3WY7ujp0mOsExmX+A/KwUX4Yha8O6oaa6S/zLpOeVlKbsFxjfvuU
 WIYIpV+s8qemfCxNIk1Iu/gB8UFEmaM8JyqQZXoofwtsA89bJ5LhVAKtS
 s5Jc8LZFuBVxe0HpfAByO45wdfZkGQ6E15a6okmUHCfzpzlXntw5OrNSS
 1gCVJtowZbqIYSOfWcEkAhh3z81sY8p4K3qCgLxXmSdtNdVeEl2a2zM0v
 0qZvjP4MnI0qsgdLMuMIi7zDL3ybYq5kPx2oPOohOnjZNitA/oa102HVF
 qVTSzavP48A3DiKBrYy8sKCBXYgtLkYnPe7cwu3tpvHXdBsXb2g43ZaXk Q==;
X-CSE-ConnectionGUID: UcMOY2agTpewe2scdaM8ig==
X-CSE-MsgGUID: WbEItc+/R1u2Bd1CQMSBRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72737009"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72737009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:28:53 -0800
X-CSE-ConnectionGUID: uqiZeFjdSyi8BtJs3SDmvQ==
X-CSE-MsgGUID: FLx5luy0S1aRAQFfjLH75Q==
X-ExtLoop1: 1
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:28:53 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH topic/xe-for-CI 1/4] Revert "topic/for-xe-CI: drm/xe/cri:
 Define GuC firmware for CRI"
Date: Tue,  6 Jan 2026 13:27:04 -0800
Message-ID: <20260106212758.1172984-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106212758.1172984-6-julia.filipchuk@intel.com>
References: <20260106212758.1172984-6-julia.filipchuk@intel.com>
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

This reverts commit 7f3219f02c00680d63c06e779926b1715c42b51d.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 50458d3bdc7d..290c69032129 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

