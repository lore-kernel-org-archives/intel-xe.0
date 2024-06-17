Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC283C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 12:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C19E10E09E;
	Mon, 17 Jun 2024 12:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRsB88bP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5208310E09E
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718627183; x=1750163183;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ly/92Tyrhktymfzk/RByvtezvrosLp2PGCoX67hx0hc=;
 b=GRsB88bPPSKRDKV8OMGMIhgnVIpxDWmfPMf0/32ipqUwTIDMaxd1LEL4
 XrG3LpLBJza/utWR4I2z8mup83TKMuWpM2ft8S3HT4YOE+lT9Wrg4I71V
 qZnxm5werZoJL7xtuRhvpz5Cf6lghEpBzs253u/uy3qbQKK8SPQk7IqvV
 RN4bX/yBc9XuJL0q1nxxKt0AGDeX/nXGLEZnlFF7mc2fvjMtW7DYrLNQr
 NumqzXL43sZhpmApxnWeSSAkCHNmbCRwPdKyIMVZ33NCT31wKg4eDt1do
 3uOM4JMxOmYIT3xPOMmf05ILxEuSR1vWTyySdfFQKpHzuPdroBm6xff+l A==;
X-CSE-ConnectionGUID: PEkmbbCGQfeQ+AJN5Gd6Ug==
X-CSE-MsgGUID: QgroRPhhSFGdsRB9T3BPOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15219317"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15219317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:26:22 -0700
X-CSE-ConnectionGUID: nPSPFGpVTR6LVJZSN1+qNg==
X-CSE-MsgGUID: cZ3QkLu7Tt6bX2kjAaG/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41114784"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:26:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Allow const pointer when checking SR-IOV mode
Date: Mon, 17 Jun 2024 14:26:13 +0200
Message-Id: <20240617122613.553-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

It seems that more and more parts of the driver code rely on
having only a const pointer to the xe_device. Allow to check
SR-IOV mode in that code as well.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 486bb21c3256..688fbabf08f1 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -19,18 +19,18 @@ void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
 
-static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
+static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
 	xe_assert(xe, xe->sriov.__mode);
 	return xe->sriov.__mode;
 }
 
-static inline bool xe_device_is_sriov_pf(struct xe_device *xe)
+static inline bool xe_device_is_sriov_pf(const struct xe_device *xe)
 {
 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
 }
 
-static inline bool xe_device_is_sriov_vf(struct xe_device *xe)
+static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 {
 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
 }
-- 
2.43.0

