Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C30C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3610E28F;
	Mon, 12 May 2025 21:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SoRJt4Is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA310E072
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747086810; x=1778622810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zocbs4msHtCdDH2a5RcRA3X3eCzAyiUgks5CizoTfuU=;
 b=SoRJt4IsvAL6R2O3wkAr0C0z7oYgDh25A7BFl7vX5zXkmUsyS8axbWG/
 BKW8LR1AkMdQO1uvji0Pq1YGOzR1RttaRLw39I1UMBeMYpwXaKDZCJSuR
 D0VdbXrwmrz5M0tSm+Q5fT0Pw7U3fC6LCJy8PhK3fYzPhQtKgauQtOWMF
 NJKe8vPr5XhWmkL6lFXCdWpWBMzrVNl2DlG+LI1qhL1AE3O8K7/EmnZ3M
 tHKHMZztKYG341fpK/QxGFMvAM7twoiqAkBdbycZquGG0ODX5NzYMbs5M
 igkjlzBkvbztp46xu5vYBK4JuVuaGPX3QgQDry4dVe4FMuBxOUwwG07MC w==;
X-CSE-ConnectionGUID: UYNtuppZRfSG+NQWi+6UdA==
X-CSE-MsgGUID: SpvGFV4QQ6K/o1ou8klCYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48156816"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48156816"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:53:25 -0700
X-CSE-ConnectionGUID: ay+IgTUFTdO+ez9a17QgBA==
X-CSE-MsgGUID: blgUos8DS5GVledHJJZuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142375166"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 14:53:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 2/4] drm/xe/guc: Add missing H2G error code definitions
Date: Mon, 12 May 2025 14:53:22 -0700
Message-ID: <20250512215324.1457009-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

These error codes are not actually used in the driver but it is
extremely useful to have them available to understand error messages.

v2: Add a bunch more error codes and drop 'status' from names (review
feedback by Michal W).
v3: Drop 'SUCCESS' response as meaningless in current API (review
feedback by Michal W).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index 2c627a21648f..ecf748fd87df 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -6,8 +6,7 @@
 #ifndef _ABI_GUC_ERRORS_ABI_H
 #define _ABI_GUC_ERRORS_ABI_H
 
-enum xe_guc_response_status {
-	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
+enum xe_guc_response {
 	XE_GUC_RESPONSE_ERROR_PROTOCOL                      = 0x04,
 	XE_GUC_RESPONSE_INVALID_STATE                       = 0x0A,
 	XE_GUC_RESPONSE_UNSUPPORTED_VERSION                 = 0x0B,
@@ -21,12 +20,20 @@ enum xe_guc_response_status {
 	XE_GUC_RESPONSE_CANNOT_COMPLETE_ACTION              = 0x41,
 	XE_GUC_RESPONSE_INVALID_KLV_DATA                    = 0x50,
 	XE_GUC_RESPONSE_INVALID_PARAMS                      = 0x60,
+	XE_GUC_RESPONSE_INVALID_CONTEXT_INDEX               = 0x61,
+	XE_GUC_RESPONSE_INVALID_CONTEXT_REGISTRATION        = 0x62,
+	XE_GUC_RESPONSE_INVALID_DOORBELL_ID                 = 0x63,
+	XE_GUC_RESPONSE_INVALID_ENGINE_ID                   = 0x64,
 	XE_GUC_RESPONSE_INVALID_BUFFER_RANGE                = 0x70,
 	XE_GUC_RESPONSE_INVALID_BUFFER                      = 0x71,
+	XE_GUC_RESPONSE_BUFFER_ALREADY_REGISTERED           = 0x72,
 	XE_GUC_RESPONSE_INVALID_GGTT_ADDRESS                = 0x80,
 	XE_GUC_RESPONSE_PENDING_ACTION                      = 0x90,
+	XE_GUC_RESPONSE_CONTEXT_NOT_REGISTERED              = 0x100,
+	XE_GUC_RESPONSE_CONTEXT_ALREADY_REGISTERED          = 0X101,
 	XE_GUC_RESPONSE_INVALID_SIZE                        = 0x102,
 	XE_GUC_RESPONSE_MALFORMED_KLV                       = 0x103,
+	XE_GUC_RESPONSE_INVALID_CONTEXT                     = 0x104,
 	XE_GUC_RESPONSE_INVALID_KLV_KEY                     = 0x105,
 	XE_GUC_RESPONSE_DATA_TOO_LARGE                      = 0x106,
 	XE_GUC_RESPONSE_VF_MIGRATED                         = 0x107,
@@ -40,10 +47,11 @@ enum xe_guc_response_status {
 	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
 	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
 	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
+	XE_GUC_RESPONSE_HW_TIMEOUT                          = 0x30C,
 	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
 	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
 	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
-	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
+	XE_GUC_RESPONSE_GENERIC_FAIL                        = 0xF000,
 };
 
 enum xe_guc_load_status {
-- 
2.49.0

