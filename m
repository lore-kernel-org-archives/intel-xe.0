Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F62C021B7
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9911E10EB2D;
	Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtiewYrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF8D10EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163960; x=1771699960;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YwWCEfqP4LL0oYZmIXD1wxzurapgJFx9Xm9K3VD45BY=;
 b=PtiewYrn5t6Ha8E46nAZaQqBXncWxiSv86zQnWPTWCHLKcROfzyontoP
 bh3muwv01RB54Sepjdy+k47YJHR2U1Bgc8YOIMlks3bU2wBwPJ9BPRt55
 i4HbVAvY4V2cG5TGsJbJdIXJrc2WTswFya2Zt/Ivk3zYQUooY/SS15jEA
 ao4sdcz3eTAnKwAYNX61S/bd/vXOgy5y8A2Tg8Nxdn9FqoztwcqVMOEdW
 xRQGmP0iS78O2xYPWyj6nx7bVGJVj+Sf85q4JKUOk7zk3FMrK0mm700F5
 u+VrmaXb6XIzNdS2kwWB3kWSlOIG8k1zINTvmWajxShESGOBH1FYZmvFi g==;
X-CSE-ConnectionGUID: oWzWTNN3QoCRETplw0T0ag==
X-CSE-MsgGUID: pwjOHai+R0uNlK8mpF81nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403685"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:40 -0800
X-CSE-ConnectionGUID: XbAAgem2TF2MWk+uP5VPJg==
X-CSE-MsgGUID: leEb60QZTFS+m61QOIe5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071331"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:39 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:43 -0300
Subject: [PATCH v2 4/7] drm/xe: Define xe_ip instances before
 xe_device_desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-4-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

We will soon update the code so that pre-GMDID IPs are also defined with
struct xe_ip. Since we will need to refer to them in instances of
struct xe_device_desc, let's move up the current instances of xe_ip
(GMDID-based) so that all IP descriptors are kept together.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0476e16da8644711ab7d6eeef37add732a0b75fb..2c00b37e2e835a7c2edad1475a2b76964ee85b8c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -201,6 +201,25 @@ static const struct xe_media_desc media_xelpmp = {
 		BIT(XE_HW_ENGINE_GSCCS0)
 };
 
+/* GMDID-based Graphics IPs */
+static const struct xe_ip graphics_ips[] = {
+	{ 1270, "Xe_LPG", &graphics_xelpg },
+	{ 1271, "Xe_LPG", &graphics_xelpg },
+	{ 1274, "Xe_LPG+", &graphics_xelpg },
+	{ 2001, "Xe2_HPG", &graphics_xe2 },
+	{ 2004, "Xe2_LPG", &graphics_xe2 },
+	{ 3000, "Xe3_LPG", &graphics_xe2 },
+	{ 3001, "Xe3_LPG", &graphics_xe2 },
+};
+
+/* GMDID-based Media IPs */
+static const struct xe_ip media_ips[] = {
+	{ 1300, "Xe_LPM+", &media_xelpmp },
+	{ 1301, "Xe2_HPM", &media_xelpmp },
+	{ 2000, "Xe2_LPM", &media_xelpmp },
+	{ 3000, "Xe3_LPM", &media_xelpmp },
+};
+
 static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -362,25 +381,6 @@ static const struct xe_device_desc ptl_desc = {
 #undef PLATFORM
 __diag_pop();
 
-/* GMDID-based Graphics IPs */
-static const struct xe_ip graphics_ips[] = {
-	{ 1270, "Xe_LPG", &graphics_xelpg },
-	{ 1271, "Xe_LPG", &graphics_xelpg },
-	{ 1274, "Xe_LPG+", &graphics_xelpg },
-	{ 2001, "Xe2_HPG", &graphics_xe2 },
-	{ 2004, "Xe2_LPG", &graphics_xe2 },
-	{ 3000, "Xe3_LPG", &graphics_xe2 },
-	{ 3001, "Xe3_LPG", &graphics_xe2 },
-};
-
-/* GMDID-based Media IPs */
-static const struct xe_ip media_ips[] = {
-	{ 1300, "Xe_LPM+", &media_xelpmp },
-	{ 1301, "Xe2_HPM", &media_xelpmp },
-	{ 2000, "Xe2_LPM", &media_xelpmp },
-	{ 3000, "Xe3_LPM", &media_xelpmp },
-};
-
 /*
  * Make sure any device matches here are from most specific to most
  * general.  For example, since the Quanta match is based on the subsystem

-- 
2.48.1

