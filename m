Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D4BCD6E6E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 20:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3561129C1;
	Thu,  4 Jun 2026 20:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3VkpLo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531591129C1
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780606424; x=1812142424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IoLAM+B9yuTmSNVMimJFgGEXqt9Go0sldOmw7mHqlQI=;
 b=I3VkpLo6ZoT+qmDsNH+xT4pT1dS4P9N4imzoL/6mm9DJ2HVWbOlq2XoH
 NQ4tZ8S3MUS5eRGRSmsSPzsbOgcPj8A2NcYBrMzi+PUqFSwRAgmqEkm09
 qfy4TSffF/hGMDBy0RgsXYzwFAEXKwaIZgvTLQsyOwlivc8af0xrmr8FP
 U8NsLqW/12cLh3mqqf0BqIT5q4XU9ao8o2HPQBIyWXPZpX8ne5xRNj+QM
 Q7yyBe4meXrxEL9+9Wn3uZaDa1ce9EfPMqrInX9Dkw02WZeD1gP1lIeba
 gGAJmE5B0Ai9kyl49hhOpsWP1TpQKbP1KrcAoG1m9bByHy15VQuB8/hLb w==;
X-CSE-ConnectionGUID: wJBgDyKzT+ez+6IJIDWqVA==
X-CSE-MsgGUID: YxFO0N3CTGm0X74pbccffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81186603"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81186603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:53:44 -0700
X-CSE-ConnectionGUID: /iEgPfWVR26Jx4i+qJPRgQ==
X-CSE-MsgGUID: 5yodnCEWQjGkuazmlI7fwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="242162853"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:53:42 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] fixup! topic/xe-for-CI: Define GuC firmware for NVL-S
Date: Thu,  4 Jun 2026 13:51:36 -0700
Message-ID: <20260604205325.1977872-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604205325.1977872-5-julia.filipchuk@intel.com>
References: <20260604205325.1977872-5-julia.filipchuk@intel.com>
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

Use GuC firmware 70.68.0, UAPI version 1.36.0 for NVL-S.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b5a49ef9dafe..cd2fa45762bb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,7 +118,7 @@ struct fw_blobs_by_type {
 	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
 	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

