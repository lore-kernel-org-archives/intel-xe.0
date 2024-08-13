Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA543C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 23:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9115610E3F2;
	Tue, 13 Aug 2024 23:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyXuWvZ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D8A10E3D6
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723590719; x=1755126719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2R94GMAFEFQIsjQK3MMvah6MocLqUZeZ+k0M3nZp+T0=;
 b=kyXuWvZ19wq5BOmeIKcacXRU0WfgAvVmE/H8gLxwwI/9LyKV1RXvmhO7
 /tq54m9GUqqWWo8bTTMGtDAMHJ4CIFpfOeKmPKO7AmJ0HK8BSetkiTAnu
 fX/TTlhzAgT7uYyzKAYU0HWDbJ6DVX5dhyYJozbn4sPkb1oh0KbHSE6O/
 D1l/4FXxeFIiTKWwrlwM9enyywaCvAUnnXQeSw/rdo1zts11J0uU/7f19
 M4+o/PQ9ddXBDoEJHOAXrkbyKxcUS4Ibe2sqGn3kS6dGxnin2eYDncaO6
 9L3GGZI+axZYsfpl4AlJcQ8jjTRjKGHtHvAiNHj4i6wBHxJJGaYn3qtOg g==;
X-CSE-ConnectionGUID: RhnxS4XxR9qDTPu0rsedhw==
X-CSE-MsgGUID: gmKyDJslTOmZAC0O9gC3/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21599838"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="21599838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 16:11:59 -0700
X-CSE-ConnectionGUID: VRjUs2e+Q1W204ed535Qgg==
X-CSE-MsgGUID: nnO+wkccTrS1lQZXZTzJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="58515524"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 16:12:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 1/4] drm/xe/gsc: Do not attempt to load the GSC multiple times
Date: Tue, 13 Aug 2024 16:11:44 -0700
Message-ID: <20240813231148.1663731-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
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

The GSC HW is only reset by driver FLR or D3cold entry. We don't support
the former at runtime, while the latter is only supported on DGFX, for
which we don't support GSC. Therefore, if GSC failed to load previously
there is no need to try again because the HW is stuck in the error state.

An assert has been added so that if we ever add DGFX support we'll know
we need to handle the D3 case.

Fixes: dd0e89e5edc2 ("drm/xe/gsc: GSC FW load")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c   | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h |  9 +++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 77ce44e845c5..66963e26c574 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -519,10 +519,22 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 void xe_gsc_load_start(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
 
 	if (!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q)
 		return;
 
+	/*
+	 * The GSC HW is only reset by driver FLR or D3cold entry. We don't
+	 * support the former at runtime, while the latter is only supported on
+	 * DGFX, for which we don't support GSC. Therefore, if GSC failed to
+	 * load previously there is no need to try again because the HW is
+	 * stuck in the error state.
+	 */
+	xe_assert(xe, !IS_DGFX(xe));
+	if (xe_uc_fw_is_in_error_state(&gsc->fw))
+		return;
+
 	/* GSC FW survives GT reset and D3Hot */
 	if (gsc_fw_is_loaded(gt)) {
 		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index c108e9d08e70..e4709d9b380d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -65,7 +65,7 @@ const char *xe_uc_fw_status_repr(enum xe_uc_fw_status status)
 	return "<invalid>";
 }
 
-static inline int xe_uc_fw_status_to_error(enum xe_uc_fw_status status)
+static inline int xe_uc_fw_status_to_error(const enum xe_uc_fw_status status)
 {
 	switch (status) {
 	case XE_UC_FIRMWARE_NOT_SUPPORTED:
@@ -108,7 +108,7 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
 }
 
 static inline enum xe_uc_fw_status
-__xe_uc_fw_status(struct xe_uc_fw *uc_fw)
+__xe_uc_fw_status(const struct xe_uc_fw *uc_fw)
 {
 	/* shouldn't call this before checking hw/blob availability */
 	XE_WARN_ON(uc_fw->status == XE_UC_FIRMWARE_UNINITIALIZED);
@@ -156,6 +156,11 @@ static inline bool xe_uc_fw_is_overridden(const struct xe_uc_fw *uc_fw)
 	return uc_fw->user_overridden;
 }
 
+static inline bool xe_uc_fw_is_in_error_state(const struct xe_uc_fw *uc_fw)
+{
+	return xe_uc_fw_status_to_error(__xe_uc_fw_status(uc_fw)) != 0;
+}
+
 static inline void xe_uc_fw_sanitize(struct xe_uc_fw *uc_fw)
 {
 	if (xe_uc_fw_is_loadable(uc_fw))
-- 
2.43.0

