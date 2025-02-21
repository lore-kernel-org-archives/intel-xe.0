Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494DEC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 21:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886110EB3C;
	Fri, 21 Feb 2025 21:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knAttnUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773210EB3C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740173005; x=1771709005;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d/K2lEXHgEXoBU8Bs5FgpKVvn+lAQ2DD+oAHUANwHDE=;
 b=knAttnUdyrRX2cSGuQRSd1FHfFpbebGzzw8kmgGeOhnPJWlobaYqYxRG
 4C8dibxFSC26SFZh7SNlUEWRORC9fG/qgWAEwfKaLLT/HKzRa8mG/QbJl
 EjBkF6EH+dhpihen090J7snFeuSSd+1yPKqkd+L/WZlkaUTD9c+c8Owbv
 R4tOJdHbny4LWzIoTA6MOOrxV8cjk7aQdOMZAHg0ou0jb4Kruozfp3JeN
 g5bGa7+4skLeYYRMe8T46FBbte6xdYq7ALR6UDpq8MtvkizAZBQVfGmpV
 DHt2dZeGh8y5MU+ClCXsfVfzOk6hxJw8T7ZHYKi6zDG1mjPWrC7p0TUFV Q==;
X-CSE-ConnectionGUID: vfGbqdzkQem1zMxyFvVBHg==
X-CSE-MsgGUID: dIrJGXq8QfiCQVoHzqH0tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51220239"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51220239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:23:25 -0800
X-CSE-ConnectionGUID: dMrtO7rSS8+wGCSps6n6ng==
X-CSE-MsgGUID: yC8ZzNtGTIyGcznEEMmI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120453547"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:23:26 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3] drm/xe/oa: Allow oa_exponent value of 0
Date: Fri, 21 Feb 2025 13:23:21 -0800
Message-Id: <20250221212321.1712156-1-umesh.nerlige.ramappa@intel.com>
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

