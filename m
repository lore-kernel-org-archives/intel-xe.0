Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A508C71136
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 01:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D32610E96F;
	Sat, 14 Jun 2025 01:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsKR0VAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474CA10E9E4
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 01:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749866168; x=1781402168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMMVfTDCY0gke7Sz81cbZu4lOaO54v5SdIBzxHqInrg=;
 b=RsKR0VAdWDQ/HZocWh8d2k1wSob3q/qRLE9Uq3R/OJ0jv2ZiB1CTDKDI
 j/M0YJ5Uq2YicJfb+YiTr2r7yq5+s2sLcvtPIqBjSEbDnw0Lfu5PzayeJ
 VG6xnT2DJwDUbKg0wbZPna958FOsg6GRB0Oztj8eq8if8g8lXKC8cYvuk
 t/sfJSbB6i+0HUm9RJZbg9YIxqFvI7hI9oFEzAJBRd73fJNvclSqG5rfA
 F0c5/tmUzj9hpe2Ure26b0PTbU/3sc0FwnjN35CtnZYfdYn1RiTk4a9/9
 nIC76xtD6Kh0vluzF5YPon8+CGO1TfEn/kei+GDeZHDuGuferPN2lEGC1 A==;
X-CSE-ConnectionGUID: 9XRZbpvvQjyN2STzRtaeMw==
X-CSE-MsgGUID: FsWNRWyBR1+13XlX2e26+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77481427"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="77481427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:56:08 -0700
X-CSE-ConnectionGUID: u3Nxc+XgS3m2oFB6Y9/DZA==
X-CSE-MsgGUID: YKqwP6rVQ1qrNNQbf4JCHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148875093"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:56:07 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 7/7] drm/xe/ptl: Define HuC FW version for PTL
Date: Fri, 13 Jun 2025 18:55:11 -0700
Message-ID: <20250614015511.691610-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614015511.691610-1-julia.filipchuk@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
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
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241011163612.6558-1-matthew.s.atwood@intel.com
Link: https://lore.kernel.org/r/20250415231610.1286014-1-daniele.ceraolospurio@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index fb520f8d6bbd2..ac8c2a6611f3b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -129,6 +129,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 3, 2))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.49.0

