Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0022FC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B594A10EA43;
	Fri, 15 Dec 2023 15:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5371910EA37
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655170; x=1734191170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhkucno4eSlE6StBCi/D6W3cGc0kjWitsbGyJ/2eeYo=;
 b=VeTlm7sKdlwjo0wsOE01WwucRvjFwoNzphs43Q6xwzkIyy/RiNlbnBXj
 goJmymX2iqg4FiQWrDLH/nDC6vVp4Cq5WjIZPNy4fMWHRA+ktorb6Q7uR
 FknwO6gfttmUp9hOgmsWuaiEK+CGAETus5TQ181oQtkoCSfzcfVosnwXF
 QTXLrlvyAoBO3TLKuf8Vu06ErLgYd1i6ynKQy+USOvfAxiXuSEYn53PZA
 8KX0/on0XVYypWaQzq1pS8TP+dQ5vmE5dpZzJ8esv7KHi4lT7Z5eEYw4M
 EUHopn5FEdC+Q+2W2ZsvPfYHvZNEqRSkzEW0KGxvltSbyMcw5LH3l4fKm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141850"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324415"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:09 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 04/21] drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
Date: Fri, 15 Dec 2023 15:45:36 +0000
Message-Id: <20231215154553.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Those are just possible values for the comparison mask but they are not
specific magic values. Let's keep them as examples in the documentation
but remove them from the uAPI.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 128369299e49..d122f985435a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1040,11 +1040,13 @@ struct drm_xe_wait_user_fence {
 	/** @value: compare value */
 	__u64 value;
 
-#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
-#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
-#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
-#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu
-	/** @mask: comparison mask */
+	/**
+	 * @mask: comparison mask, values can be for example:
+	 *  - 0xffu for u8
+	 *  - 0xffffu for u16
+	 *  - 0xffffffffu for u32
+	 *  - 0xffffffffffffffffu for u64
+	 */
 	__u64 mask;
 
 	/**
-- 
2.34.1

