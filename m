Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B66C43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6583510EEED;
	Tue,  7 Jul 2026 19:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bvr1Wy6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2991410EEE9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783452361; x=1814988361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAyIjItKqeOfA8PHB6kF2DlcOrAxjYm5EAfdEZVpGKc=;
 b=Bvr1Wy6V6VvYussJWprLET8NDxvoQf9IiDShcWhjZa23r6rkPVYO0+kq
 e0pBSTPzGD74PauQovzMMRsZpHn7NhHVJ9AgQ9vPTrif8HKbNFxuG2ccd
 PALgMQIhBe5Xbb9Mx8bqTEkLRMaVzmJ7cG9ZdwhVdS0YXw5RPWhlVI9FP
 4DlcFRu7QRu8Ysumo7OrjX1K+rtQWkxVxeO2Q5DEIEtYRI5LwOlBuX0Ua
 EPuQI+9hBEEWt7lTk+WoDZ52oFQ+RY+L82PTMAhhyV7Zt4f+4rs+poq6o
 R/6rRu+P8CB7YwCQ8dbNmoEieatKyjX8OlimK5/pN0rKmhrUtXsjG+upJ Q==;
X-CSE-ConnectionGUID: ywR4k5HaTiOInFcowERBdA==
X-CSE-MsgGUID: 32cLZk5DRjSyq1nmWp6Rrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101657854"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101657854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:26:01 -0700
X-CSE-ConnectionGUID: nUUqCYKyShae9Bl7mCRt5w==
X-CSE-MsgGUID: GOAuGjXkQLGTnYvdMrqHrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257960808"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:26:01 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 2/6] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
Date: Tue,  7 Jul 2026 12:24:38 -0700
Message-ID: <20260707192547.50535-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707192547.50535-8-julia.filipchuk@intel.com>
References: <20260707192547.50535-8-julia.filipchuk@intel.com>
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

This reverts commit 5fa121ad5e6425277d5eb01088cef5aa126a6fa7.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 02502a954144..3ef3b3740e29 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 70, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

