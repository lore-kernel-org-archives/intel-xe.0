Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA6CCD6E6E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F94210E85F;
	Wed, 11 Oct 2023 14:00:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C3610E84C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032819; x=1728568819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1JoXCQd8HLnfKdeHg+1Srw9Dt5wDihZ9W3QuqWdJ0nk=;
 b=nDdofu3sW7dXBQRtz9iw4KydcktogSl0cRX14BnLl1YqXe1XQiNODol8
 DFSkMpZpUoPO7D9QLg0Ge6Mc+kiBukv1PWrRZMiaP8kJZqxZdFYLZo97S
 Ny6BzTipShwdfgFXlX3rXVv90EPROxYMtFJZzSP/ih+IkYUaclPh9+vYg
 jTtH4cQGei51jlCqeixYbPNSUnwL9SNv424JGvDTOL65XzNejPmDkP+TA
 QitTmkSopaTwUDiFNxEwE8E3wfREhvTb9ZT09yaNAU+gZbPwP+iefG0za
 kgLK2vofx5LxWxYkEE3mNCw65eYPmndNqpIODevCi/gynyvdEB3KzRFuW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156400"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156400"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829266"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829266"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:00:02 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:25 +0000
Message-Id: <20231011135926.7-17-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 16/17] drm/xe/uapi: Be more specific around GuC
 Version Type
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

Make it very clear and documented that it is about the submission
version, and also what that actually means.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c5196abbd15d..e0c634c6d326 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -520,7 +520,7 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 		return -EINVAL;
 
 	switch (resp.uc_type) {
-	case DRM_XE_QUERY_UC_TYPE_GUC: {
+	case DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION: {
 		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
 
 		resp.major_ver = guc->submission_state.version.major;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 97e5f8f4aca3..31a46b32f315 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -468,11 +468,23 @@ struct drm_xe_query_topology_mask {
  *
  * Given a uc_type this will return the major, minor, patch and branch version
  * of the micro-controller firmware.
+ *
+ * The @uc_type can be:
+ *  - %DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION - This is the GuC Submission Version,
+ * a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
+ * support multiple VF APIs with different Submission Versions. This version is
+ * negotiated by the VF KMD with GuC during VF initialization. In most of the
+ * current available GuC blobs, this is a 1-1 relationship where the Submission
+ * version could be inferred from the running version and vice-versa. However,
+ * the submission version is the most useful information for the user space
+ * perspective and needs.
+ *  - %DRM_XE_QUERY_TYPE_HUC - The actual HuC blob that is currently running
+ * in the platform. It returns 0 when HuC is not currently loaded.
  */
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
-#define DRM_XE_QUERY_UC_TYPE_GUC	0
-#define DRM_XE_QUERY_UC_TYPE_HUC	1
+#define DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION	0
+#define DRM_XE_QUERY_UC_TYPE_HUC		1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
-- 
2.34.1

