Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33DC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 17:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAA10E025;
	Wed, 19 Jun 2024 17:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlTdICMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFFD10E025
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718819682; x=1750355682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G5jrjz+NUXvIGQqODhzS9Sp737jzWCjXGhNOawa5gaQ=;
 b=RlTdICMAsVuAjOVuWRjTT70nikFi5rZFSUkjcNwUjfQBJnqruDTr5bun
 wv1brtuIGxel61cRaeFKEZlP1cqi1OEBFNrF3v5A1lf0B0NeioGk7QXom
 wubIChobVO6Wm1YqnjaF7QylN6cuezNqU9GLPit5nMPNcRibuZSFSJ7zg
 75/GFr40nLB4YYXiX1I3atg9qpewx6S+gheuFwGSD2eN2Jjj/cSxAyh5J
 n3umhU8tYLE7DfjmoSshEXrpyh+ZZk4rTFi1d2FIpySDMgcBb53X43ptp
 I3AzGLEw9v7NT1TY9n2dQMAkmVIQYuhP6x+D9cjKzkWSz0Il68RhZY09V A==;
X-CSE-ConnectionGUID: iGKhzAP2RFekU5/RhstJIw==
X-CSE-MsgGUID: jojiItHPQG6vTPUiMCidkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38284414"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="38284414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 10:54:41 -0700
X-CSE-ConnectionGUID: 4RAvkaKQSwirR42hvZ1RyQ==
X-CSE-MsgGUID: QKF+hlLKSS6YFp538LRX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="65232166"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 10:54:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Fix potential NPD when OA is not initialized
Date: Wed, 19 Jun 2024 19:54:27 +0200
Message-Id: <20240619175427.861-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

If oa->xe can be NULL then we shall not use it as a valid pointer.

Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
Fixes: b6fd51c62119 ("drm/xe/oa/uapi: Define and parse OA stream properties")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 34206e0b6a08..2277af816a34 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1725,7 +1725,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
  */
 int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
-	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_oa *oa = &xe->oa;
 	struct xe_file *xef = to_xe_file(file);
 	struct xe_oa_open_param param = {};
 	const struct xe_oa_format *f;
@@ -1733,7 +1734,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	int ret;
 
 	if (!oa->xe) {
-		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
 		return -ENODEV;
 	}
 
@@ -2005,7 +2006,8 @@ static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
  */
 int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
-	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_oa *oa = &xe->oa;
 	struct drm_xe_oa_config param;
 	struct drm_xe_oa_config *arg = &param;
 	struct xe_oa_config *oa_config, *tmp;
@@ -2013,7 +2015,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 	int err, id;
 
 	if (!oa->xe) {
-		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
 		return -ENODEV;
 	}
 
@@ -2106,13 +2108,14 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
  */
 int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
-	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_oa *oa = &xe->oa;
 	struct xe_oa_config *oa_config;
 	u64 arg, *ptr = u64_to_user_ptr(data);
 	int ret;
 
 	if (!oa->xe) {
-		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
 		return -ENODEV;
 	}
 
-- 
2.43.0

