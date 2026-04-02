Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FDD6AB1A
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E50810F4DD;
	Thu,  2 Apr 2026 22:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oK3S3MqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64AD10F4DD
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775170121; x=1806706121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IldJMVkr659tZQIZUc8PNkqrWIoJlfFq88B+4i43FrU=;
 b=oK3S3MqLun9I0827vw1VJYqVzvKFwEoa05nOovV/NHctFn2q+MYK35A5
 i78scKm84avKBxMcvXR4qeZVrv4AdZrFZEkuii7iCOnFV3XoVH1gErDPU
 lSLx75kpuTu0Y9iUD90G3moExqfZq2OBxjhOlwKct1yQWBdS4BALwSjhI
 Wmj5Ussxm6F8KafNauGmjLO4A7kHGzI4dBCCMAPUYk3yO5BbWlYw85Cwh
 muN6cAeFqV9BHYEIeKvAV7fZR+ycCZMy71NYts8bsXAg7PGWtSfdxQcX9
 XCtDsodJiZxsb6/9fsCfaDfBpRxbh4MV55FfyL/6kYvvZM5bFVu0oQr9Z g==;
X-CSE-ConnectionGUID: LEUehUsjR+q63dkBfVaHOQ==
X-CSE-MsgGUID: RXQADBbURd+UI3+AUwgLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93823874"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93823874"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:41 -0700
X-CSE-ConnectionGUID: Kl9c3EGhTvaN5TJOLcFv6w==
X-CSE-MsgGUID: KcmetgRZT2GBjG3CUL0OUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231137226"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:41 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 6/7] Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Thu,  2 Apr 2026 15:47:50 -0700
Message-ID: <20260402224819.405728-15-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402224819.405728-9-julia.filipchuk@intel.com>
References: <20260402224819.405728-9-julia.filipchuk@intel.com>
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

This reverts commit cf4ab5b23116b6e7d407cda379f8e06bfe5df323.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index dec917613ead..29a5fc45606e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 60, 0))	\
-- 
2.51.0

