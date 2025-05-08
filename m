Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5937DC3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 01:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F5210E2B8;
	Thu,  8 May 2025 01:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bznG0Fg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3E310E2B6
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746668079; x=1778204079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wj7rGYXECpULhaZ8Ra5xDPEQJ5Af1Y62WBxBJR5QRKA=;
 b=bznG0Fg7BdmNXvo/aO0dVrBAy92aLW3/l1oqBn+c9sFQnkZHczcQWqkk
 Mdl4ForKDrWvQf73N0OXIOonZzyg+bNtYb9AjY5CVkDlaqawSOqbbWaDZ
 wm9yb7o+4+kfDVLgPxeYlpiS3bk5iF9tFz81hufpjjYiclAyht56doAl7
 pnvMvUjuCTiCppSg231sX2jF1eQGQ9yQjx2j6cCpyLusVkM0fYJ3RIpRA
 Ys3ZtWTi2RDFkaY3tmyZOEj3CZu0IBKZ+NQx4BGwfn/EXX3i3ue6j3sOc
 7qUXeHojstNAEjKzNL8IaMrQ9pft9QMd3tuCY5cFzcqaFBwkTkS33S8+x A==;
X-CSE-ConnectionGUID: HjZxN2UgTAOORMZnJ/PzrA==
X-CSE-MsgGUID: HnbR04bMRDu/yzRtbZLZfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48538279"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48538279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 18:34:38 -0700
X-CSE-ConnectionGUID: 6E5YbAZUQmaDebU+D72fmg==
X-CSE-MsgGUID: cXeaQQH7SlKxV1LOtd0/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136094247"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 18:34:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 2/4] drm/xe/guc: Add missing H2G error code definitions
Date: Wed,  7 May 2025 18:34:35 -0700
Message-ID: <20250508013437.652982-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508013437.652982-1-John.C.Harrison@Intel.com>
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index 2c627a21648f..cf00300add37 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -6,8 +6,8 @@
 #ifndef _ABI_GUC_ERRORS_ABI_H
 #define _ABI_GUC_ERRORS_ABI_H
 
-enum xe_guc_response_status {
-	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
+enum xe_guc_response {
+	XE_GUC_RESPONSE_SUCCESS                             = 0x0,
 	XE_GUC_RESPONSE_ERROR_PROTOCOL                      = 0x04,
 	XE_GUC_RESPONSE_INVALID_STATE                       = 0x0A,
 	XE_GUC_RESPONSE_UNSUPPORTED_VERSION                 = 0x0B,
@@ -21,12 +21,20 @@ enum xe_guc_response_status {
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
@@ -40,10 +48,11 @@ enum xe_guc_response_status {
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

