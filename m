Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C6BC531C7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525B710E2FD;
	Thu, 23 Jul 2026 08:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBLOKkHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9C10E575
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795137; x=1816331137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MI2PT4KOfrs1C9EMH5rCtC8YoJe8WrbroiAYqIwxA3o=;
 b=BBLOKkHZVwrFj0aDBzPT3JFiLlxPa+jVNJKuyHphqH73R1YDVnhgxeO7
 2htrnvEQewuvSmt+TiqbcXvC1VprGDJuGs/p+H0fFbWIrBLylO//mDDTs
 LxR4xSVyijf8Y6kbVGNRf2F44ktRvCMYCOO+weYQF1UzxdS4la4aa02I3
 y+iRlOQM68HU6lsRf/VS/4w+peABR5wcCD1fJ5Y5xL6Kz08306fZgwIUB
 XhuKxtQ1Xen6Mg7EL68rMxf9gL8lz2lTRpIKxwnDsgDfMUvjdmTyvWeM8
 ifSY4tLzCjN6TbZjJjLXHc7i626lwVL/9P5Cj6cqZhwZP6eeJ7HFoMuRz A==;
X-CSE-ConnectionGUID: nx/ohJPpTLWBe/TmbnPndA==
X-CSE-MsgGUID: yBfHkTB2T1ORfhEiPYKNUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85389084"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85389084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:36 -0700
X-CSE-ConnectionGUID: kCPkIJUAR1OdYT4/3DRhMw==
X-CSE-MsgGUID: ghuL0MzpSZuUia46YyF7YA==
X-ExtLoop1: 1
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, anthony.giardina@intel.com
Subject: [PATCH v4 1/5] drm/xe/xe_late_bind_fw: Fix firmware leak on missing
 manifest entry
Date: Thu, 23 Jul 2026 14:07:01 +0530
Message-ID: <20260723083659.716683-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723083659.716683-7-badal.nilawar@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
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

Release firmware when the "LTES" manifest entry is not found in the
firmware header.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..1529a1de4051 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -335,19 +335,19 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
 		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
 			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
-		release_firmware(fw);
-		return -ENODATA;
+		ret = -ENODATA;
+		goto release_fw;
 	}
 
 	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
 	if (ret)
-		return ret;
+		goto release_fw;
 
 	lb_fw->payload_size = fw->size;
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
 	if (!lb_fw->payload) {
-		release_firmware(fw);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto release_fw;
 	}
 
 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
@@ -359,7 +359,9 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
-	return 0;
+release_fw:
+	release_firmware(fw);
+	return ret;
 }
 
 static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
-- 
2.54.0

