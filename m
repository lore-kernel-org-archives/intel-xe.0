Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA2CD3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 23:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5310E28E;
	Fri,  5 Dec 2025 23:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM13Lnw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F6610E28E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 23:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764978597; x=1796514597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w20nhQhOj9kh/mL6HXB5unBZOy7DjAzyOjgyovQ3L1M=;
 b=FM13Lnw79XKNbUNiqcH0ArWuvotdPHan20BZfTDLlOJPikAzSfbVU1eU
 sR/qQJ0f1aGqQZKQS57FsSFPtRudfS5slkMemyWJbMH/Y74x1TP2aZeJQ
 lucbZ/CyQP5olYX1uji8CEpherMbRmzICDg27KRRjXfPEhHnhOT6+L8TN
 v7dKXPqXSKs2s90S8Ft51j0hbLQBzuYbZZr+3P43RdWCeNjxFp7xVBXLd
 iUQvRMSNP5uxeHir1+zMtddtky2Px5IaLeamGNS3Vv+7IkGcFbZoZhhtv
 gDcI0G4282Gh+9FrcrFp6EAm1Qti6bd3bXGe4pzQ5rj1P2bTvbs74h4cZ g==;
X-CSE-ConnectionGUID: kmjEMPU4Szm2hqKQOCzk8g==
X-CSE-MsgGUID: 8zSNpLiUTuKd74g9ckDbJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67056128"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="67056128"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 15:49:57 -0800
X-CSE-ConnectionGUID: 5KxYkJQOQtapcVvPQkpOuA==
X-CSE-MsgGUID: OnEkcNpyRECaD3/SvTb0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="199853782"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 15:49:55 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 2/2] drm/xe/oa: Limit num_syncs to prevent oversized
 allocations
Date: Fri,  5 Dec 2025 23:47:18 +0000
Message-ID: <20251205234715.2476561-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251205234715.2476561-4-shuicheng.lin@intel.com>
References: <20251205234715.2476561-4-shuicheng.lin@intel.com>
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

The OA open parameters did not validate num_syncs, allowing
userspace to pass arbitrarily large values, potentially
leading to excessive allocations.

Add check to ensure that num_syncs does not exceed DRM_XE_MAX_SYNCS,
returning -EINVAL when the limit is violated.

v2: use XE_IOCTL_DBG() and drop duplicated check. (Ashutosh)

Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cc48663c2b48..92aa25fc0422 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1254,6 +1254,9 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
 static int xe_oa_set_prop_num_syncs(struct xe_oa *oa, u64 value,
 				    struct xe_oa_open_param *param)
 {
+	if (XE_IOCTL_DBG(oa->xe, value > DRM_XE_MAX_SYNCS))
+		return -EINVAL;
+
 	param->num_syncs = value;
 	return 0;
 }
-- 
2.50.1

