Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A41CC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 15:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EE710F910;
	Thu, 15 Oct 2026 15:46:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2010E5CA
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079172; x=1823615172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DPksY4x3jmyv6XioKG6N11ZPiLZ07Ow+ioeigu6V06A=;
 b=N5BPJOQgADytbj0/g3wK8cyfoPpT96sWIgLrKZObzu8p/dZvdWfwUivV
 /KmYFd/26DWt7JgsShF8SrtlbPbmgb3359WxHZ0BxY8et+eYkxolPiuFk
 IoeOzUa+gWnAV0wWWpFSUH8OCCmhTZey0UTX+hOP9FuC48SPkN+MEH0ec
 SLaxIp1qIs0Z/JyQO+zUQ01Mq+ECHdpdyNWGNkrkPIR+KiN8cWFxXWMoU
 i04O88o59QgAsw/OGpaAZf0EVsviw40bQJPYnP2zWSfZY0Q/vesuYCnL7
 9kxOqgAwJO/w9yrc6byjVqlbs0Apk7yUgoZwT5clgt3z2t9Ph/3zkwT9t Q==;
X-CSE-ConnectionGUID: PAT4FIg0SJao/L4yGOskfw==
X-CSE-MsgGUID: 5GJEL5RHT7iBzHqgiNMcNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="849796"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="849796"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:10 -0700
X-CSE-ConnectionGUID: 2iBLVQMzSZOIwKncCyABWQ==
X-CSE-MsgGUID: LsY+iw0YQo6+/d05Hf4Jww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3474831"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when querying an
 index
Date: Thu, 15 Oct 2026 16:45:57 +0100
Message-ID: <20261015154553.483229-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015154553.483229-5-matthew.auld@intel.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
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

Make the bevaviour consistent. If trying to extract comp or l3 on an
unknown index, just treat as a programmer error, like we already do for
coh_mode (implicit).

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 6 +++---
 drivers/gpu/drm/xe/xe_pat.h | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index d239693b803b..1189d7255c12 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -303,7 +303,7 @@ bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)
 
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
 	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
 		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
 	return xe->pat.table[pat_index].coh_mode;
@@ -311,13 +311,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 
 bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
 	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
 }
 
 u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
 
 	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
 }
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index f6b0fac2000a..de4d57ef9a4e 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -75,7 +75,7 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
 /**
  * xe_pat_index_get_comp_en - Extract the compression enable flag for
- * the given pat_index.
+ * the given pat_index. Index must be valid for the hw.
  * @xe: xe device
  * @pat_index: The pat_index to query
  *
@@ -88,6 +88,7 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
 #define XE_L3_POLICY_UC		3 /* Uncached */
 /**
  * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_index.
+ * Index must be valid for the hw.
  * @xe: xe device
  * @pat_index: The pat_index to query
  */
-- 
2.56.0

