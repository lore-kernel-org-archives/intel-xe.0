Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E00A10F92E6
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 17:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9E10ED11;
	Tue, 31 Mar 2026 17:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfhJKqQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3C210ED07
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774977916; x=1806513916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDJ5devEsAOXT/IZza0O0CDhsXyp59ubqJmgu/uv5zg=;
 b=IfhJKqQHvAh20MYxlUqqZkVKeYmGn3LZ2aYtaG7KcRZ3J7carKff1NAD
 iV3r3W80MR5vx/9ZLETc86GFQQ9fs6Q9O18WQDVtN+0bDFOLbdbC9lTZr
 EDXWhuE32/+hIMonYVc+uTHwrpLMiu77xH05+0B1jfWjfzj/kWEbQZydn
 TU03Uxm84sHs15vgF3UC0Xbd5YjExH+/YiXh6PX65GMN0ey7eAxIMEGVz
 7rpnIBNZskS83qc3ZrR2MHncdNuXnszBC7cN5P1wZcTXNGzWUyH2YbTNB
 2FnCnZic7aEiCsEGtS2shpmZ8Li1A1lvGqJCZRWc/iIEKWxgNIuP4rD+9 g==;
X-CSE-ConnectionGUID: Smokrm8QSBKs9/SwayduYg==
X-CSE-MsgGUID: yPxPFotcQN6jDMff6qel5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76016582"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76016582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 10:25:14 -0700
X-CSE-ConnectionGUID: oa3+Nbx1T4m7scuJCgckUw==
X-CSE-MsgGUID: ssj7It2gS0mQtJyD2/9ELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223551871"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 10:25:13 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 5/5] drm/xe/uapi: Fix doc formatting and completeness in
 xe_drm.h
Date: Tue, 31 Mar 2026 17:20:55 +0000
Message-ID: <20260331172049.3053871-12-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331172049.3053871-7-shuicheng.lin@intel.com>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
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

- Fix missing leading space before closing */ in
  comment block
- Add DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY to the
  IOCTL overview list
- Add missing query types to the device query doc list:
  DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
  DRM_XE_DEVICE_QUERY_OA_UNITS,
  DRM_XE_DEVICE_QUERY_EU_STALL
- Fix ioctl's -> ioctls (not possessive, 2 occurrences)

Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c2e8cf31a82a..9bec0ba1feb7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
  *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
  */
 
@@ -167,7 +168,7 @@ extern "C" {
  * Typically the struct drm_xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
-*/
+ */
 
 /**
  * struct drm_xe_user_extension - Base class for defining a chain of extensions
@@ -705,7 +706,10 @@ struct drm_xe_query_pxp_status {
  *    attributes.
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
+ *  - %DRM_XE_DEVICE_QUERY_OA_UNITS
  *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
+ *  - %DRM_XE_DEVICE_QUERY_EU_STALL
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -1758,10 +1762,10 @@ struct drm_xe_observation_param {
 };
 
 /**
- * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
+ * enum drm_xe_observation_ioctls - Observation stream fd ioctls
  *
  * Information exchanged between userspace and kernel for observation fd
- * ioctl's is stream type specific
+ * ioctls is stream type specific
  */
 enum drm_xe_observation_ioctls {
 	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
-- 
2.43.0

