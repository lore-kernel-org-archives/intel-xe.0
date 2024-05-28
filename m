Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514CBC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EF21127E2;
	Tue, 28 May 2024 21:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHpBQ7g9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FCB1127E2
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716933335; x=1748469335;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dOyIVpzIfhTG2HGiB1xuwgtqvOAheSnU6YN+v0nFiYE=;
 b=GHpBQ7g9JoayqQLkzPckC6c3d0A3Efdbas/KeZj6ABkspllz4RPDCsz3
 OSan7qZg+dBJJQBO6oGq/6gK1lOI7qDW+BTlAq5CemfU1vw6cyJa/QQD0
 cTfsQVOnp+3Tyl0Km6rIsx51E4xAB57uTMS3YhmB9r0sDl9O0FolR9WKs
 jdH8ufeNn4SkAkKYuQR0YIv4AF0bkOk7NI0yAd5w8Lvu5ViGw4qbAXsgV
 8TYgmhzIAFeBAwoUqOGt10aAOPbC8A4R5YIsm/76y/XxNCV4ehlOyOrjB
 v6CruMxaqOLCJZuqdcnS3AZcmQS95u9bmjwHDpSNj2l7AfOIq2yqrACAr Q==;
X-CSE-ConnectionGUID: sgLv/UogRzmWrX5UAmdOtQ==
X-CSE-MsgGUID: +1m0Y1/aTGu66BL7VDOzSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13079777"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13079777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:55:35 -0700
X-CSE-ConnectionGUID: +GBt7X+YSb+mpxB4QIRDaA==
X-CSE-MsgGUID: vbbxckJUTN2cYoULNCjVew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="66399963"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:55:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 3/3] Reapply "drm/xe/gsc: define GSC FW for LNL"
Date: Tue, 28 May 2024 14:55:23 -0700
Message-ID: <20240528215523.1202083-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528215523.1202083-1-daniele.ceraolospurio@intel.com>
References: <20240528215523.1202083-1-daniele.ceraolospurio@intel.com>
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

This reverts commit 684685f297175fb825771a33adfbb6a293d7b614.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 12346645a8e5..6500765b5779 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

