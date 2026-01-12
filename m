Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64778CF45C0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2668910E432;
	Mon, 12 Jan 2026 18:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCtKAMDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A708310E42A
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768241320; x=1799777320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9KwI58JV0DdPxCnujsvnuI5W4Geuk7wB9fFzXcGLohc=;
 b=TCtKAMDDkwP5w50pC1ze3JFVJVAG92mnQtciHpDJ76uzqB/wRFc+0joC
 1v4LK1ZEo2FRVRXqjp0jxFqp+8LwbIcMTYaNphebHqZUHByzkSLLNuUM6
 uX6dftAXUByUjDpRAo+SUgzKqcbF7YVYcCg6169xTKWfPsLW8bSsy/Ti8
 S18u9AImXrw8oOflcNCXTdYpRYMMzjKLSsjWiDIEdxLF2/Y8MDsTmvti5
 RC+fqd8U4Pg40XM1qvoY7NyvjGKJxZiQPPd4FxJtjK8/LySVSdmCHHDkI
 xMh6DXiitMVsz9JfdAQpXinZlz0kTYzttJxkeg6dr3lbPy/QkRWcPY4cT w==;
X-CSE-ConnectionGUID: /WvWW4J/S72gpZDuNG9H5Q==
X-CSE-MsgGUID: f7ZwUnMLRPOzhbJ8KXaeuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80162745"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80162745"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:08:40 -0800
X-CSE-ConnectionGUID: HXNMl6erRpu/fNa6K2sOXA==
X-CSE-MsgGUID: EAz/kkAlS++DRAxCJGMZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204561546"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:08:39 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 4/7] drm/xe/guc: Recommend GuC v70.55.3 for BMG,PTL
Date: Mon, 12 Jan 2026 10:07:39 -0800
Message-ID: <20260112180809.1474677-13-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112180809.1474677-9-julia.filipchuk@intel.com>
References: <20260112180809.1474677-9-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.28.3

Update recommended GuC version for BMG,PTL.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index dcb4a32e7a64..3bff84ab4b5d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 55, 3))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 55, 3))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
-- 
2.51.0

