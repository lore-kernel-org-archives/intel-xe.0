Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EE2C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 17:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADFC10ED7C;
	Fri, 12 Jul 2024 17:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LexJH+Em";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7751410ED7C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720805774; x=1752341774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9VlaGe2FXWE1NewqK5UiJ0ex1CKwLSQ6wY28ZNn7/O4=;
 b=LexJH+EmmMsxoyohMVkh5o+Czks56KyG4AceArK4zl5Fv2KdpxxxMBOc
 riSk0Hd5qdmZ1jpJ6EKJoBTcuoeUeOjDiFC63prmW9vnbSYbH4JceQMWa
 LjVemQKZo6Ew2XFBdJ2Bp0WD4m9u0e4/iTEe7ptkHrbfIt9hqgOuP/pja
 +LbyacA+bkvFGCFPcZLcyvshCu8HZHFy8Rusco0sxwB+f4IpgYky1eVA8
 ZdSrnQBEzqIf/K54d09utUkZVVQUo+x/NPve8dte3QUbcQ+RB4+C40Zj5
 Vd1ke4PYzX1RYcoLwimwrkBOuExzRxNjzwh2CT6EoHCgUWNHp5TWvFYO2 A==;
X-CSE-ConnectionGUID: bG5t8fmVQbCoEI5QUXrDNw==
X-CSE-MsgGUID: Vhw2nhuVRNGNfnaCgVvLdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="21172256"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="21172256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 10:36:13 -0700
X-CSE-ConnectionGUID: xrelWhAZRBSzA9b953FcNA==
X-CSE-MsgGUID: sYe/L9JlTYKcHc3vVFE5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="53812340"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 10:36:11 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH xe-for-ci] drm/xe/huc: Define BMG HuC
Date: Fri, 12 Jul 2024 10:36:04 -0700
Message-ID: <20240712173604.2660566-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

First HuC release for BMG.

This patch will need to stay in the xe-for-CI branch until we're
ready to publish the HuC firmware to linux-firmware, at which point
we can change it to use the unversioned file name and  move the it to
drm-xe-next.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 62ed413bf1c3..c1dcf58d25d7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,6 +118,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(BATTLEMAGE,	mmp_ver(intel-ci/xe, huc_gsc, bmg, 8, 2, 6))	\
 	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
-- 
2.43.0

