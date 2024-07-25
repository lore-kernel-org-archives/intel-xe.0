Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60120C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBA210E30C;
	Thu, 25 Jul 2024 00:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBc5wdmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4792610E30C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867560; x=1753403560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=duToFAktQERV1WA0QCRno4QIEkgtYhPqn6UnuaMXHxI=;
 b=LBc5wdmWou0W9qiL03RE6r1yAxQ7kaQ/9wClBmsq99wr2INQOVQGiswk
 WF6qkUz8a+Kq+XIw6wqfiguwHNxjmujgtXF0VkDEvWSyjhunfgQf/J42M
 EuSKC6edimbbU8rnQVwN0foIPif4SRpWuoBy+jgoqwaJ+1tjGy8put8Fl
 whfkIWRg0HuVm0+4RqJACMRA/CASGCBpVHG6y+l6XsA8tXECW+u4Ym0M3
 huHjduv/C1iwduSYKGsylXdvHDdHs1pP/CFHF7FvpN1JWgEjP6GZ3ABNf
 e+KsPsvVaEgW0xjuMnx17naWH+eoSCNMA3vG6zXRBHtrFESUqrUnAwNtu Q==;
X-CSE-ConnectionGUID: jzsZXGS9SCKozwRPqFGwGA==
X-CSE-MsgGUID: hOUf7ZP3S2ycn1lacxiM2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192540"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:40 -0700
X-CSE-ConnectionGUID: q87HzkInS4yqH0UNMco7jw==
X-CSE-MsgGUID: EFCSGH8IQrGpAH4jyoBVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976381"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 5/6] drm/xe/gsc: Define GSC binary for LNL
Date: Wed, 24 Jul 2024 17:32:22 -0700
Message-ID: <20240725003224.516233-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

As with previous binaries, we match the compatibility version instead of
the build number.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 24c165011265..f6a242822d6e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	1, 0, 0)) \
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

