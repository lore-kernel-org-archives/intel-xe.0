Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E57C30658
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 14:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB0110E669;
	Tue, 25 Jun 2024 14:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgZNq5mH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A0210E655
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719324796; x=1750860796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PE9C+/4hn9pJnO5Yvr7Ht/SUu+RK3KzC6EKcrASEvrY=;
 b=ZgZNq5mHgCgiPSNxTzFIHO6/P/AacHOAbh1ZlPRtc9TTZFFMIYR3UxV+
 4aj5pWcCQiPHLfbn8IyJAsRfcvqy1yEUbSqvn/dn0vlSLiyxvkpZnj+j7
 hKP7KGKYVcMb/XUFgstcY/aK/lJv3qea+FKgGfvBY64Wr4P6ANP1qdE2L
 IDLKw0dfvUuPxWKS2aDpYH5JefNevLAeTEVBFE+DeJLtrJw7eMtBWfUZT
 hMfWrW9txYve/jrUcUx+syqAYCGZq5qRJTg/r9fKZe0SbrPoA6RJHACCU
 cobz4YtU7Jy57hbbLi7IQkA5zU194y0NMsiDsKSxfD6LbQWrMarnchiYw g==;
X-CSE-ConnectionGUID: gP6Sdd+RSLuvhFBDCg/cBQ==
X-CSE-MsgGUID: +P5jr1xDQgSFphtEMBwbCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16477106"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16477106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:15 -0700
X-CSE-ConnectionGUID: ulEtr0ryQBibl/d5W/THKg==
X-CSE-MsgGUID: Ab+ShginSvWgsSFnCj8VRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="44319360"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Add more GuC error codes to ABI
Date: Tue, 25 Jun 2024 16:12:57 +0200
Message-Id: <20240625141258.1257-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240625141258.1257-1-michal.wajdeczko@intel.com>
References: <20240625141258.1257-1-michal.wajdeczko@intel.com>
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

There are many more error codes used that the GuC firmware can
return in the RESPONSE_FAILURE message.  Add to the ABI header
those which are more likely to be seen by the PF or VF drivers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index d0b5fed6876f..2c627a21648f 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -8,10 +8,41 @@
 
 enum xe_guc_response_status {
 	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
+	XE_GUC_RESPONSE_ERROR_PROTOCOL                      = 0x04,
+	XE_GUC_RESPONSE_INVALID_STATE                       = 0x0A,
+	XE_GUC_RESPONSE_UNSUPPORTED_VERSION                 = 0x0B,
+	XE_GUC_RESPONSE_INVALID_VFID                        = 0x0C,
+	XE_GUC_RESPONSE_UNPROVISIONED_VF                    = 0x0D,
+	XE_GUC_RESPONSE_INVALID_EVENT                       = 0x0E,
 	XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
+	XE_GUC_RESPONSE_UNKNOWN_ACTION                      = 0x30,
+	XE_GUC_RESPONSE_ACTION_ABORTED                      = 0x31,
+	XE_GUC_RESPONSE_NO_PERMISSION                       = 0x40,
+	XE_GUC_RESPONSE_CANNOT_COMPLETE_ACTION              = 0x41,
+	XE_GUC_RESPONSE_INVALID_KLV_DATA                    = 0x50,
+	XE_GUC_RESPONSE_INVALID_PARAMS                      = 0x60,
+	XE_GUC_RESPONSE_INVALID_BUFFER_RANGE                = 0x70,
+	XE_GUC_RESPONSE_INVALID_BUFFER                      = 0x71,
+	XE_GUC_RESPONSE_INVALID_GGTT_ADDRESS                = 0x80,
+	XE_GUC_RESPONSE_PENDING_ACTION                      = 0x90,
+	XE_GUC_RESPONSE_INVALID_SIZE                        = 0x102,
+	XE_GUC_RESPONSE_MALFORMED_KLV                       = 0x103,
+	XE_GUC_RESPONSE_INVALID_KLV_KEY                     = 0x105,
+	XE_GUC_RESPONSE_DATA_TOO_LARGE                      = 0x106,
+	XE_GUC_RESPONSE_VF_MIGRATED                         = 0x107,
 	XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
 	XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
 	XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
+	XE_GUC_RESPONSE_VGT_DISABLED                        = 0x300,
+	XE_GUC_RESPONSE_CTB_FULL                            = 0x301,
+	XE_GUC_RESPONSE_VGT_UNAUTHORIZED_REQUEST            = 0x302,
+	XE_GUC_RESPONSE_CTB_INVALID                         = 0x303,
+	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
+	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
+	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
+	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
+	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
+	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
 	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
 };
 
-- 
2.43.0

