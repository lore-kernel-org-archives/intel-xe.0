Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A23C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 14:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B4310E6FD;
	Tue, 27 Feb 2024 14:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvgjzO9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848E010E6CD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709044339; x=1740580339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KoUZJh2WGPLm301DeA7HxodxKpb7wyIkW+DL5GQRKg0=;
 b=OvgjzO9jwDLoLExcx6fokyiPbqlzsAN+y6ArmWNimInDq1zxW7PauZLt
 Vx7nB4Hb0lwSr9a//ILDQN0xex47QqEIcKNC5TUWU7EYcr8CeXV2BjiXA
 UMOC3tACpsLkRUWS/YkEtL/2JpTrERl8Ft77RIswCpO8J2zhPJhH0mI4I
 TgE3/R+9wloti8E34tOQSXST4bm5osiZ4rPmv28NONvnW2Jgw++5b0QwI
 DQ29pXxANrvf6TU4LOMzi45IGyTUXnVGf+PvXQLinb9/sY4dNIFf1+EgF
 rqqcXvfH8r+5lVh5/t6XPAlcJyjpPNhm7FoK2u/YXUlKQLsuNHY2UBJFb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20830962"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="20830962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 06:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="11817840"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 06:32:18 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/xe2_lpm: Rename media descriptor to media_xe2_lpm
Date: Tue, 27 Feb 2024 20:02:09 +0530
Message-Id: <20240227143209.346005-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
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

Media descriptor renamed to avoid conflict with future platforms.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5b5c29761c5d..f2d11543424c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -206,7 +206,7 @@ static const struct xe_media_desc media_xelpmp = {
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
 };
 
-static const struct xe_media_desc media_xe2 = {
+static const struct xe_media_desc media_xe2_lpm = {
 	.name = "Xe2_LPM",
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
@@ -349,7 +349,7 @@ static const struct gmdid_map graphics_ip_map[] = {
 /* Map of GMD_ID values to media IP */
 static const struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
-	{ 2000, &media_xe2 },
+	{ 2000, &media_xe2_lpm },
 };
 
 #define INTEL_VGA_DEVICE(id, info) {			\
-- 
2.25.1

