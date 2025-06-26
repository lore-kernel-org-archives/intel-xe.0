Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64177C8300F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 18:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213A810E8EE;
	Thu, 26 Jun 2025 18:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zui/Y8Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861AA10E8EA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 18:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750962506; x=1782498506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SAf7eF6j/wJyL6/iqPPLWcae64w4bOGu66OHhIN4ncg=;
 b=Zui/Y8TiXZGAyMVb535LAkP83FH9Jip7p6id7gTQXZIb4xqSGmNAl9Zq
 EZiDpq8YOXgzaKNg2q+snudqT071fV2ZhmFJVZ/Dn0oNdQefAhZDLITOz
 uh85HouaF1LS0gBEQbJXTei7yyX65p18CkWObNXwm56YSZdlOUjgJA8Xo
 d+u6CkEOKTop4iX51JXOL/3yuGiRKoGzNphWRnlHSJTAfYMmdcHygeOe/
 C3rR/TZX8EUmfFF2GV2+ax0Q26K5DJ9JqEgVNXH51s7GTyL0mj6YlmZf4
 XX0amaf6fpCcTaQqZcwQF6EEb5yElbs7unLpH944xLWKRq2ho26pcnypk w==;
X-CSE-ConnectionGUID: a+pbUT85RhOYo9nQ8vURRA==
X-CSE-MsgGUID: o1cvHuTXRNa/5RDkn/71fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64626689"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64626689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:23 -0700
X-CSE-ConnectionGUID: HVZa5hgwSgO9HdTas8217Q==
X-CSE-MsgGUID: K0LFPqJwQLG2go+QVdXYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152766315"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/7] Revert "drm/xe/ptl: Define HuC FW version for PTL"
Date: Thu, 26 Jun 2025 11:28:07 -0700
Message-ID: <20250626182805.1701096-10-daniele.ceraolospurio@intel.com>
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

This reverts commit cac442be6ecf55147008b369f43c84015b9cb12d.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b9aec6c5d3d7..ec946727828f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -129,7 +129,6 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 3, 2))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.43.0

