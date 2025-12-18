Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545D8D6E2A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9710EA1C;
	Thu, 18 Dec 2025 15:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QE297iEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B0310EA17
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072132; x=1797608132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kuIsgPSbNi58n1UQO8VAy8kFOCXPlax4rwS1/CPsvQQ=;
 b=QE297iECvD/jS/aRY2a4KV/aeR1oBSsz24azzP4KnXQ0rIhzsN3QLRj2
 azX6gVkcqRxv3nRTow3Mcz3F0L5CsmQ7rGkOlQT4zHgiFw37Zr+3jV107
 UkIb4Xa6kU4ujHkgVph5fhvaB5xkTQxLjOT8eVdryK20eY6edUJktQmaJ
 rkaXrRy4kBCd8CWCOgJRYrdTEt4RdgjxZmZ651SiV0us7qPr1UsPmp7n1
 S8/6+Ig4rAbChzz/j22qH1h9Vd1hTAQEurVZ3ZVTE+7rP1QBo4K1I1ApU
 WFIkxeCVUCWn0FdIX6DTKZLd/LAwSbMWdrHFXyuF9ghN8EGKkk+AFSt4x Q==;
X-CSE-ConnectionGUID: B9085jZyQ1OfWF0MkTYqJQ==
X-CSE-MsgGUID: cr4eu90iTzCPj5XGrDFdgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906276"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:31 -0800
X-CSE-ConnectionGUID: 2eNQOboIQUGMYK9vssmIYg==
X-CSE-MsgGUID: WeKM7pKhT9KUI/UOvxQKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042233"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:31 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 5/6] drm/xe/xe_guc_ct: READ_ONCE ct state in xe_guc_ct_enabled
Date: Thu, 18 Dec 2025 15:35:33 +0000
Message-ID: <20251218153527.6436-13-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
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

Use READ_ONCE when reading ct->state in xe_guc_ct_enabled to prevent the
compiler from ignoring this operation.

Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index d4c9cb4dbcb5..cb1335f1d66f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -35,7 +35,7 @@ static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
-	return ct->state == XE_GUC_CT_STATE_ENABLED;
+	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
 }
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
-- 
2.43.0

