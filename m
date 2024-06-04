Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0C0C41513
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF54510E45D;
	Tue,  4 Jun 2024 11:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu5/0aWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265F910E45B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499840; x=1749035840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6R9vlAvRtSQX/LxpRqrjuyaUnk7ECzoJrLVXIZ4pQbY=;
 b=mu5/0aWkndAr+EaGtA5l3DIlt2XQ1A/kEYBKxa1Yda/rL7LMLgiUGMB3
 72v2eCtJIvL+1D0WdkZXTANNOTl36UBNuK1Qm30bS0iq03BoP7p88iYhS
 Q7369WAC2UNPVtLb6b4xtkh5jOFn5v0quyXHzIa13SIRdd7oWBnYae4bO
 X7dBr13EUvnGkKD0VwZn1DRB/9Hf2c1s4YLEhZ4IIVyoEZvSi7wza9qBo
 wjbek0Bc/5exr3PIFG7AOSC3AJfgHiYgwsXdz7k4dRlBUkjiqcTBsfptv
 tP50HJOgl1bq/yE8XwTius88BuOXap3gZoTciVfPG/Iqp1XvTc2naRueg A==;
X-CSE-ConnectionGUID: TaMDLpm2RRWq00EuwTzqMQ==
X-CSE-MsgGUID: mQcJDEn6Re+z/mr9gLYW9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701847"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:20 -0700
X-CSE-ConnectionGUID: bfFtJhPgS0a1/4iR2JMpuQ==
X-CSE-MsgGUID: q973crjnTtShtAFxJXqFxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669665"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:19 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 2/9] drm/xe/pat: Always call xe_force_wake_put/get in pairs
Date: Tue,  4 Jun 2024 13:02:18 +0200
Message-ID: <20240604110225.29495-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() increments the domain ref regardless of success
or failure so call xe_force_wake_put() even on failure to keep ref
count accurate.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 4ee32ee1cc88..a5bdf4de845c 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -190,9 +190,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
+	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -221,9 +221,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
+	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -250,9 +250,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
+	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -284,9 +284,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
+	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 /*
@@ -366,9 +366,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
+	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.42.0

