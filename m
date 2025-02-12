Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8829C0219B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 01:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7F10E1CD;
	Wed, 12 Feb 2025 01:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6OZJKVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381C10E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 01:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739322458; x=1770858458;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6nFSkS5LU9/bqUTasZ46Tu2WK/wZXo82xvJL+yzXGP4=;
 b=Y6OZJKVhjRmrvan5sSUEfUjNAMl3AJDxDY5k+CSfUrNPLPduSsmVfcAz
 8qNaN+DZYqV72BjtoE7KQQYHv2GmR4zLeeMeseRXHppOpuSYrjzDi9g9f
 wkcjpNJczXGHYxv5EUbnqGRvUq79oT4ZsAsSskapmemSPr0NoBch5ANA8
 8u0/nhweIDPbaUmKpTcm/DQeXN1SoGsv/0Odj6KcKWFWn6XVPmokjeTHq
 U4wKh8yjuVaao4jAn21O9xsboXza9DVorBk6/dsvhaQy9SFEmV6FQc7jw
 jPYHRTTHxJ8qsUnhtMcH+gpHi5+2a2tzypQqHSt8ThCkkI7fRSWO/sAas Q==;
X-CSE-ConnectionGUID: BLtCQ45yR/SUGCyfiKlkfw==
X-CSE-MsgGUID: WYRlavBrQEaCZHTxvVy2YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27564527"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="27564527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 17:07:37 -0800
X-CSE-ConnectionGUID: T+MkmWzGTQ6krShKr3w/gA==
X-CSE-MsgGUID: 6QYNYQxiTkC+fmYA9JSvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117845402"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 17:07:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Allow oa_exponent value of 0
Date: Tue, 11 Feb 2025 17:07:36 -0800
Message-Id: <20250212010736.1428108-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a692dffcb638..268403b9b527 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2025,7 +2025,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		goto err_exec_q;
 	}
 
-	if (param.period_exponent > 0) {
+	if (param.period_exponent >= 0) {
 		u64 oa_period, oa_freq_hz;
 
 		/* Requesting samples from OAG buffer is a privileged operation */
-- 
2.34.1

