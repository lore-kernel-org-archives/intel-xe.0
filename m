Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92400C71150
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FABA10E5FC;
	Wed, 28 Aug 2024 21:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0A7Tgoc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CB510E5F9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724881928; x=1756417928;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LuSOmLegWx0FVNB1cl6UzwtZ2yjSNW+pYw2Diw71nco=;
 b=H0A7TgocktSPLiCcEKwy+Pi8ClhdBMUyiLNwkGsC7HeyeXGji+E57mjU
 TSNxkd3XRshpzcI8nJKYElPIgBKTwSepb0Z1NXKBHM+ppCZ4qrfSLQxPc
 ALzKN2VJKa+OwXfuBwR21eG8xBv/CW2SzJFU0y98S1hn3k+vayDpW2jPr
 vjHuwt7ULCTtrD5Hp1PBcQdwpzuwFMKJiaqveDZ7AqH4y5xPTnmCPvNJP
 66HsxYgbYFx8v6fsBtnbuA3ZKcLqyePzf6xDLFd1IbCkP82cfNtCCdX1e
 3HXs4Orp8GZQj6KIuiEqJ45LHhAaRR7NOod4Hq483h2OTTH8o8geHWAdr Q==;
X-CSE-ConnectionGUID: qJagRok7SmmXG+jwXcOs+g==
X-CSE-MsgGUID: osrxzKzxRRqe1gK8Oonwfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23330690"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23330690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:08 -0700
X-CSE-ConnectionGUID: oI8GAvb2StqpAJNR4nvbRw==
X-CSE-MsgGUID: gLDkq50ARQ+4+lRHXy7Odw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="63356534"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:09 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/4] drm/xe/gsc: Do not attempt to load the GSC multiple times
Date: Wed, 28 Aug 2024 14:51:54 -0700
Message-ID: <20240828215158.2743994-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
References: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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

v2: use "< 0" instead of "!= 0" in the FW state error check (Julia).

Fixes: dd0e89e5edc2 ("drm/xe/gsc: GSC FW load")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c   | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h |  9 +++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 8a137cb83318..9614d9e6617e 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -513,10 +513,22 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
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
index c108e9d08e70..6195e353f269 100644
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
+	return xe_uc_fw_status_to_error(__xe_uc_fw_status(uc_fw)) < 0;
+}
+
 static inline void xe_uc_fw_sanitize(struct xe_uc_fw *uc_fw)
 {
 	if (xe_uc_fw_is_loadable(uc_fw))
-- 
2.43.0

