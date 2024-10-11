Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8368ED0EE12
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 16:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8B10EB38;
	Fri, 11 Oct 2024 16:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6VdYE6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53EA10EB38
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728664577; x=1760200577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Et7R0EYc0s63FjIeQPaJYvXxQtT7VL/UZNTH+ORB0M=;
 b=e6VdYE6FajIkKIGQ/K8CXNoH8YLWzipMZDhnvAIKvYB7Y4Dbpx7FFH7D
 CqJI8JC6DG4VO6z3gjcTtClP2Ov7N7kV7W6GVw/Vhw6YqDJrvUuLwInCR
 3ENEwTUcBCPT35okuU6BXpM/jaRchceu5eF577Y6evpXsvyu3BZUXTk0y
 8UGf9NjpxLkrwh4uZkT1GaD/oAk+5KTiBPu6kjaaqTqvV+gtlFvPuz+Ir
 0sJUgxVMUAh9tdQNGVO87sXpOpHcyj19wZQFFuVpn7IZFmKEcMtaqjJG6
 0/tFT5YI1zf1BObRUuXNAW68VcIjuhxaO01y5Y1hdeviOvc/Ii8P7RJcl A==;
X-CSE-ConnectionGUID: EfC5I+FeRpmdxyzvji/Zfg==
X-CSE-MsgGUID: ADbiY4NrRDOeUxAGJDEqHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27941333"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="27941333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:36:16 -0700
X-CSE-ConnectionGUID: flRlLF7jSVeT/ZM+Jz09YA==
X-CSE-MsgGUID: OM05TM9sSL+DJ9UOWOlzvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="76968119"
Received: from unknown (HELO msatwood-mobl.jf.intel.com) ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:36:16 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH topic/xe-for-ci] drm/xe/ptl: Define HuC FW version for PTL
Date: Fri, 11 Oct 2024 09:36:12 -0700
Message-ID: <20241011163612.6558-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

First HuC release for PTL. Note that the HuC team now only releases
GSC-enabled blobs, so we don't need the "_gsc" postfix to identify
the variant anymore. The driver can identify the type of binary at
runtime no matter the name.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 087fb96f707e..516b3296125e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -120,6 +120,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.45.0

