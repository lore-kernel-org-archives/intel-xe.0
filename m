Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A160C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA17310E8BF;
	Thu,  7 Dec 2023 13:50:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E5E10E8AD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957039; x=1733493039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s22ijMpPoSoPzrIJ+7bCTMP7DZmHtfiWZgL7k4tGb64=;
 b=jfOTgpc0xI3v89C4L47BrtuUms5HjAqq4zMjr6DZFegLwEDNQNFgIq0l
 Smxiecqh2stKnY7tRZzjw8t29u8ymtbPQ4OesJ/sLs6cRNceZMGeUCd/G
 gkxchFabfSP1PtMkzNLJVUjbndcCnzedqKRxBhWrQUEoNkNzH/6zHuHPO
 Iypa7IeGx11Bg1rktPNgH5tPsEhV1Gw0xUWQ52WPaBA2WdQAf5Hq7Hrwl
 c7iIw0uIeOHU8DIHLj84mTd5Tx0t8BGAdozTz2TXDe4x8R4oWXCewiuRp
 ihEAcAd2FnYITY0ksjZzSftmHv5jpf0KSX2HJBXzLBSp0sWddLIWqlDX8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722270"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722270"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115590"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115590"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:37 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 13/14] drm/xe/uapi: Move CPU_CACHING defines before doc
Date: Thu,  7 Dec 2023 13:50:08 +0000
Message-Id: <20231207135009.7-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move those defines to align on the rule used elsewhere in the file which
was introduced by commit ("drm/xe: Move defines before relevant fields").

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6811a1c96078..7733c5a3659b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -741,12 +741,12 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+#define DRM_XE_GEM_CPU_CACHING_WB                      1
+#define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
 	 * mmaping the object the mode selected here will also be used.
 	 */
-#define DRM_XE_GEM_CPU_CACHING_WB                      1
-#define DRM_XE_GEM_CPU_CACHING_WC                      2
 	__u16 cpu_caching;
 	/** @pad: MBZ */
 	__u16 pad[3];
-- 
2.34.1

