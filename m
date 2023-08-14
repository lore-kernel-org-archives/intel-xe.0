Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3BAC04A6A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 22:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884E410E132;
	Mon, 14 Aug 2023 22:37:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D530210E021
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692052662; x=1723588662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TTJNiKbPryFIQwDV/ZWmvQwkfwac1NJV6mHNRi4jchw=;
 b=CvpBDnWwaj1N94hhNlm5KLzNNWlaJeNdiFrW167hSNTcCQmhwugJcYvp
 qw8osFvsNkPt2tHYKlQYtHUlZSo2/5IaiarSGgoVRjCXpB/7MR+1MRHkT
 Ye20jl8SNGPMO0W9mRc1R0/auCFsQFxc6FmaI5A3VjhBhZ3z2kihEc+pv
 ax7TRGwC4ohTf1D1oteSnHxDh0LMQjxwzTJuXXOB/GEmU7/VLh+Ds61gR
 XkjFortXpx4MpqaSI2R0pATlbb1Ixt/oCS0INntuMMwd6HL8TZIE3E6Y2
 r2IxjnLnJVY74lWSPoOMBnK8E2NHgq1a5aviQnkTyuJA/NYp2FpfIMZmI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403130427"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403130427"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064239877"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="1064239877"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 15:37:32 -0700
Message-Id: <20230814223734.375449-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

User engine class is of type u16. Set the same type for the array used to
map xe engines to user engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 297e93a0eb8c..99a4800c7c53 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -19,7 +19,7 @@
 #include "xe_macros.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const enum xe_engine_class xe_to_user_engine_class[] = {
+static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
 	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-- 
2.38.1

