Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED5CCD18D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9599710E701;
	Tue,  7 Oct 2025 20:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToZ+IPNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9236E10E39A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTyPbQL/8B5MBpAWrY3a29agP1Rfy6NlkwX8qtBHACc=;
 b=ToZ+IPNV95LgD3P2btYF6p388sJGENUzgvS03yjkbJvtVeEvt68u6js7
 HcFcY09Z2PX0NO3tzz7GlsvTs2sPK259FWmg/vrSQSmevqaBpHELnBuq3
 SAfAzlC9r1529Op0ZQoNlU25c3eWnjiJ3JQVNGB4/BArMXULZonmCzsTP
 oBQjw/ZNKX7JW7xV44Q+CRO4yB+3cxm106iU1cPEZZlWIENlNAWRB2pBQ
 zQP+tJu1BHZk4kDsw0mO/dFrUm+ZaOxZuQNyE4dmA+DOR+fIZyPyDcBQ+
 3exekZjUyKYan9iE6wrfEPlFzN6C7FUZsxAnfjeW3w/JPJa/OT0z03lpw w==;
X-CSE-ConnectionGUID: dkZSZKxZTTOA8HdejPcuiQ==
X-CSE-MsgGUID: TYdKF+lDQtmyOSzuF1wY7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616747"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616747"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: IIoKh9A/TR6e+0ujJGFwUg==
X-CSE-MsgGUID: qVVnGWLOQlOxYAStRYdBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631086"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 10/23] drm/xe/query: Report hwconfig size as 0 if primary
 GT is disabled
Date: Tue,  7 Oct 2025 13:48:40 -0700
Message-ID: <20251007204829.1468209-35-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

The hwconfig table is part of the primary GT's GuC firmware.  If the
primary GT is disabled, the hwconfig is unavailable and should be
reported to userspace as having size 0.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2e9ff33ed2fe..1c0915e2cc16 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -436,7 +436,7 @@ static int query_hwconfig(struct xe_device *xe,
 			  struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
+	size_t size = gt ? xe_guc_hwconfig_size(&gt->uc.guc) : 0;
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
 
-- 
2.51.0

