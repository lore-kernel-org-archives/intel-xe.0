Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7FBC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 12:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECDB10E4CA;
	Tue, 16 Jan 2024 12:02:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5F310E4CA
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705406543; x=1736942543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y2kLZmV5QRzv7/tPYPHksxWTSWDAZtDzyg9/17QHRf0=;
 b=YboIogOSUvXolebHDaOq3Yn3NJNv2rG2+yUAsOPEBYjI6zUw+azIySrU
 avj7AE1GGRLDT0cAkgBqM7eyWOmPHPGODfA6LVyJ90H7nAF+TS4Pxn4u+
 JSIUgtRFpLKmndke/a5d4Js+Rs+A5bhYRIzGlo4U5apNABdSJ+QUidonx
 AL57kXv7uRmRrOFqbbL5BmPexr3ESSpFVWQtGZx6H6QHQu5i5vARALW3O
 8frJ8tb53RoZ08eA70lYcHVUiTfzF0vVVJp2DsiJ2CCfu9Jb7YeEOlG2v
 yyl6FZI7oaezCDu2KsAj83ueNBu4t7Dx/A3XYg5hAUfXuRYhYvIRCAhgV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="13197327"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="13197327"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="1030970914"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="1030970914"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:02:20 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Mark internal gmdid mappings as const
Date: Tue, 16 Jan 2024 13:02:07 +0100
Message-Id: <20240116120207.1133-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The mapping between HW IP version and its description is const, so
mark it as such.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4de79a7c5dc2..df6b3b31f419 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -340,14 +340,14 @@ static const struct xe_device_desc lnl_desc = {
 __diag_pop();
 
 /* Map of GMD_ID values to graphics IP */
-static struct gmdid_map graphics_ip_map[] = {
+static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
 	{ 2004, &graphics_xe2 },
 };
 
 /* Map of GMD_ID values to media IP */
-static struct gmdid_map media_ip_map[] = {
+static const struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
 	{ 2000, &media_xe2 },
 };
-- 
2.25.1

