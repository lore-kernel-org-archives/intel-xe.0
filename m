Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1553C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 21:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83D10E155;
	Fri, 21 Feb 2025 21:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoM2GRuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758510E155
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 21:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740173632; x=1771709632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zYhQ+olipvroLwhdWVQ8bWzq0wlLlQEzLYtdv8RikBY=;
 b=PoM2GRuVljQyX9BtFr8bFp1V1da5GfjlB9HoUe649VFhA5Rv5SAn0o/5
 wSs8GSKM+z1iyfIBoXEbZsxdIQ7nK1+6Hwc09YGxBOhD8FoRRCIK0hCtA
 i0Of7gJxGojfCFVJ+OzCfYCLm07FjhCjVi5n/xo3RvmwI+JwEevnRutjX
 C7pFcs0ZdBzQzyxodVDoA7CQe7v+Icg8MqDxMlNABHL2QTErCr5mPaI9p
 X4uNpaYSR0WVw/SZBi4n7Tv5wBs74uf6ZsiUloW931X0SpR2SmNSI/HOI
 6fgCmwKC4P9rAgV2jGQCZ2nszMtHb00tMGHRDTv6OKgERscdQaqEr23QH A==;
X-CSE-ConnectionGUID: 2wRSLNKPT6+/GbjWBa++qA==
X-CSE-MsgGUID: KX4oNRAfR+2jQWsu+NMpzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40715963"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="40715963"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:33:52 -0800
X-CSE-ConnectionGUID: 5vxot63OROqtByl1VDGZpg==
X-CSE-MsgGUID: FiAK8suZQmmAP3cGEL5EOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115977751"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:33:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH v4] drm/xe/oa: Allow oa_exponent value of 0
Date: Fri, 21 Feb 2025 13:33:52 -0800
Message-Id: <20250221213352.1712932-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

OA exponent value of 0 is a valid value for periodic reports. Allow user
to pass 0 for the OA sampling interval since it gets converted to 2 gt
clock ticks.

v2: Update the check in xe_oa_stream_init as well (Ashutosh)
v3: Fix mi-rpc failure by setting default exponent to -1 (CI)
v4: Add the Fixes tag

Fixes: b6fd51c62119 ("drm/xe/oa/uapi: Define and parse OA stream properties")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 2c5a24a13e87..6bf5b793b29f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1690,7 +1690,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
 
 	stream->sample = param->sample;
-	stream->periodic = param->period_exponent > 0;
+	stream->periodic = param->period_exponent >= 0;
 	stream->period_exponent = param->period_exponent;
 	stream->no_preempt = param->no_preempt;
 	stream->wait_num_reports = param->wait_num_reports;
@@ -1971,6 +1971,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	}
 
 	param.xef = xef;
+	param.period_exponent = -1;
 	ret = xe_oa_user_extensions(oa, XE_OA_USER_EXTN_FROM_OPEN, data, 0, &param);
 	if (ret)
 		return ret;
@@ -2025,7 +2026,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		goto err_exec_q;
 	}
 
-	if (param.period_exponent > 0) {
+	if (param.period_exponent >= 0) {
 		u64 oa_period, oa_freq_hz;
 
 		/* Requesting samples from OAG buffer is a privileged operation */
-- 
2.38.1

