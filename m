Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02945CFD647
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 15:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA8110E624;
	Wed,  7 Jan 2026 15:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMJkv+xR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD4110E615
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767801263; x=1799337263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hglSWk4HYUqwUitDMkgSnG83sD42FBtF53tdI95W/IA=;
 b=PMJkv+xR7rxYOs+8gSaOhLc10ZSULh8IlKYnUQG+qKBLvBcPQ2UFgR7e
 dzIkRgnjoFTkBOdz10RZ/PE1zBJiP/3wHFW1sNqBSaQEgrFmUIVwEYUBn
 FgFLDywY9cFMAazoMdri4pM2xIx9I4WUe/EdJo1v0QEm/6Y/NJKWBFx+F
 2AHvmFL4AYSymxuoL38k/cjMzbcv/ghz30Wi1b7YJcK7VIeUcsFdQXtm0
 P5VRqftBwezO1ja39LbswaXQGXOLQ+6av81mkZZAFHnGBJ4xSwq4dFCuM
 adrBDkGoW6uXdjnqqkdnxQbR6JgO7iNHJIiB3tClqNXtnqBn9we/8ZEJE Q==;
X-CSE-ConnectionGUID: /ez9/vUmQqq+pohJa3dtnw==
X-CSE-MsgGUID: r/8I9qTqSzKl3uzjVfW4XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56734582"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56734582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:23 -0800
X-CSE-ConnectionGUID: Y83kA7d5RZac6r2L6uwbwQ==
X-CSE-MsgGUID: Dp6SwkEZR5mimQlFrGMWtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207109329"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Badal Nilawar <badal.nilawar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/5] drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id
 kernel-doc
Date: Wed,  7 Jan 2026 17:53:59 +0200
Message-ID: <20260107155401.2379127-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107155401.2379127-1-jani.nikula@intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Fix kernel-doc warnings on enum xe_late_bind_fw_id:

Warning: ../drivers/gpu/drm/xe/xe_late_bind_fw_types.h:19 cannot
  understand function prototype: 'enum xe_late_bind_fw_id'

Fixes: 45832bf9c10f ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 0f5da89ce98b..2a8a985c37e7 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -15,10 +15,12 @@
 #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
 
 /**
- * xe_late_bind_fw_id - enum to determine late binding fw index
+ * enum xe_late_bind_fw_id - enum to determine late binding fw index
  */
 enum xe_late_bind_fw_id {
+	/** @XE_LB_FW_FAN_CONTROL: Fan control */
 	XE_LB_FW_FAN_CONTROL = 0,
+	/** @XE_LB_FW_MAX_ID: Number of IDs */
 	XE_LB_FW_MAX_ID
 };
 
-- 
2.47.3

