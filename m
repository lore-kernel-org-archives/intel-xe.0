Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50408C0032E
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141D810EA02;
	Fri,  3 Nov 2023 14:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D299C10E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022156; x=1730558156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qq6nR5IIIuPTZRH/1DEicli7Tc25mur4W+x3eqX3lI8=;
 b=fGU1r6vFv0jqEELyZt3v06Gck5PfTgoWsWGPCkrKH08z0ZVGu468tWZH
 4ZfKjX5Ifkk7zpfEO/IC+lxF/wcJE0W+aVU9pLGCsgEsemwJK0shqv/29
 2dUDAiUvQlnMuk6Ngp6etd4jem8lkHcUOETU20TcilSvUedR/PRJZX3ad
 3/wU9zRxJzLI5WppMG0L7bUIj7c7AbB5nY/STs0lMt4xJtAfEzIXlA2WD
 cb51heRmLSCpGxpTk+H3Nz9dyrb7i6ksrzjrRGFuqs/i+NkOzkJNHN0sH
 AlO2OGXwbbztOBVg3R6wNJDMwAGgeOQzm2psydgFLR2WTwU++tU56UKJ8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843438"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832496"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832496"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:32 +0000
Message-Id: <20231103143456.7-27-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 26/50] drm/xe/uapi: Fix indentation issues
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
index 2541f0b6ddf6..07472a64ff88 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -490,15 +490,16 @@ struct drm_xe_query_topology_mask {
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

