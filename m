Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D0EC04A94
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28EE10E6B9;
	Fri, 11 Aug 2023 16:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D14210E6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oXnNg/Ieo/6vMeyaWonZO1yTIwbV/uS7n38n9cT9FVQ=;
 b=BGqW3Bzt4BeTk3okAOQtwHlgGY4ObRnxf+00NKL50oXPnX27a6Dghir3
 JXTapCTFVgW5c+6dl4/ukNQwTJZ5R5py1/wEOijQD3jVvCS8NM0wsBsVG
 QYKJ94bSJX/MBwVZ7TXxXgj20H6/YBsrgGXKopNpB0xBtp7JXonIb0Zzd
 RXjchXljAa8MczA57dgFIsr14RLvbCVg6LVBWV4Cz7nNtZ/J67YRQbsQf
 /XZhCjiidy4pS636fHWtcWZQZCJHHeUyvN0gzEsIg2OtRFE78kogTOLk/
 RL1mOZU5gVm5T8h98LkYOBDqg5vQwHC4cWG67AWi3NU/nbkndL0Lx3/2e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044332"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044332"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300466"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300466"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:12 -0700
Message-Id: <20230811160618.477297-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/15] drm/xe/xe2: Define Xe2_LPM IP features
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Xe2_LPM media is represented by GMD_ID values 20.00 and 20.04.
It provides 1 VD + 1 VE + 1 SFC.

Bspec: 70821, 70819
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ed6c4bf8c63b8..fdd2eba1b91f9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -221,6 +221,12 @@ static const struct xe_media_desc media_xelpmp = {
 		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
 };
 
+static const struct xe_media_desc media_xe2 = {
+	.name = "Xe2_LPM",
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
+};
+
 static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -344,6 +350,8 @@ static struct gmdid_map graphics_ip_map[] = {
 /* Map of GMD_ID values to media IP */
 static struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
+	{ 2000, &media_xe2 },
+	{ 2004, &media_xe2 },
 };
 
 #define INTEL_VGA_DEVICE(id, info) {			\
-- 
2.40.1

