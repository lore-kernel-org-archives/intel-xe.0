Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D17C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 18:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4214D10E8E4;
	Thu, 26 Jun 2025 18:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSES5uRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221E510E2E7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750962508; x=1782498508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WiI7pF0lnV9CXhBe4lS2++gVFmoXmlC+ttBGaAKusuI=;
 b=TSES5uRK+FVvBP71xp7TDyw2FZTJB6BBE038y374sEzXjaGf4kzzuK34
 B+ZdocdVnIk2x5u7QEY1NuDWV9Hkel4yZV4PwPGoZkE0K91Zm7u8nXxx/
 psOmL3bb03jT/cbVk2bUodQfoQStisZCZXuIIuZuHM9b13qjft/kMCQYh
 ooEPS5KaXE1uiMNyGyrsyngb53g1ttdBb3sV84CpINlip4aCrZhR3N0Om
 rjEHqR/WRRqfCLi9MFJTn5feuHJtS7GBqi4bmZFio51PiV5AzWSkeRnP/
 zbMl4mzWyx03qGTOYOhq5aQ9gmsslRmksVJnYDBZzPHFEZ99DcGcrg+i/ g==;
X-CSE-ConnectionGUID: m237KFpgS4y053iVG6rMaA==
X-CSE-MsgGUID: QCGfyeiIT3uDCQdEtQHZFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64626701"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64626701"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:28 -0700
X-CSE-ConnectionGUID: h4rzNZQtTw6jByjFS+/rZQ==
X-CSE-MsgGUID: m6IJLLdtQMK6GFh0/Ki9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152766363"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:27 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 6/7] drm/xe/ptl: Add HuC FW definition for PTL
Date: Thu, 26 Jun 2025 11:28:12 -0700
Message-ID: <20250626182805.1701096-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
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

Add the unversioned define for the PTL HuC FW.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2584ee3b0316..9bbdde604923 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		ptl))		\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.43.0

