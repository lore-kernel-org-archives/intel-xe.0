Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742C1C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36A10E8E2;
	Thu,  9 Nov 2023 15:46:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344EF10E8DF
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544769; x=1731080769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VW3M+XMU/LAEprgQuK9ZQWroUqrpA1FbV2dVWv6+RuQ=;
 b=KGVgXjp+Brck882JJ1WnuIyM2V6uQ5lNOj+uc3Y8qLolXEVCnCGPFcqw
 iN0O1Opm6/HeGqfwHvAIH0amnxjjlRdld7TOER0qb4hM0SWZwHExK5UCw
 B70zyDP0+MNXQDPeqfs05vHDLhE2LJkQXw9tNl6PyFTWaxbl6ZNrq4F2g
 DTyZhTxaFMDCAhxD6vF+vlQGip0NAL2qwEDYZassayBgspqc/2t4NLqYE
 Mz6MR1vYUXoe6rdItkLKsewhAFuiCAfXwIDQgh7xpT+8K19mFTR11u6ex
 LifPqz81yap4T939bOHoBMcHCuhkQeUrCxltB4o5yxhY9o2eQQBrIYqKa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556759"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556759"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886035"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886035"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:42 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:37 +0000
Message-Id: <20231109154457.7-24-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 23/43] drm/xe/uapi: Fix indentation issues
 that sometimes causes build warning
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

These issues were not seeing every time, but once another error was hit
these were printed out:

./include/uapi/drm/xe_drm.h:493: WARNING: Definition list ends without \
 a blank line; unexpected unindent.
./include/uapi/drm/xe_drm.h:500: ERROR: Unexpected indentation.
./include/uapi/drm/xe_drm.h:501: WARNING: Block quote ends without a \
 blank line; unexpected unindent.

This patch fixes the build issues, but also the presentation of the
uc_type list in the build html doc.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f796d05157a4..96db432d91bc 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -493,15 +493,16 @@ struct drm_xe_query_topology_mask {
  *
  * The @uc_type can be:
  *  - %DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION - This is the GuC Submission Version,
- * a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
- * support multiple VF APIs with different Submission Versions. This version is
- * negotiated by the VF KMD with GuC during VF initialization. In most of the
- * current available GuC blobs, this is a 1-1 relationship where the Submission
- * version could be inferred from the running version and vice-versa. However,
- * the submission version is the most useful information for the user space
- * perspective and needs.
+ *    a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
+ *    support multiple VF APIs with different Submission Versions. This version is
+ *    negotiated by the VF KMD with GuC during VF initialization. In most of the
+ *    current available GuC blobs, this is a 1-1 relationship where the Submission
+ *    version could be inferred from the running version and vice-versa. However,
+ *    the submission version is the most useful information for the user space
+ *    perspective and needs.
  *  - %DRM_XE_QUERY_TYPE_HUC - The actual HuC blob that is currently running
- * in the platform. It returns 0 when HuC is not currently loaded.
+ *    in the platform. It returns 0 when HuC is not currently loaded.
+ *
  */
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
-- 
2.34.1

