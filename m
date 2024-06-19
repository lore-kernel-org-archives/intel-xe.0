Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94939C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 19:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE3910E1D4;
	Wed, 19 Jun 2024 19:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZ/x6WFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1C10E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718825343; x=1750361343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iwaw1/iSqIIXzV5YC+nHDkQXXbSMX+8VeLzw2pst2U4=;
 b=QZ/x6WFhctKsyzjCbqFlZ5spyUDYC73uesCPmXhMgNUQsc/7sNBjbeeT
 i4evb3JUY0MGPjNMqVue1sm55qob6wCtmyvnMIlVJRksxZT70lQ5J8IrE
 IU71Nx/coBBZswfHZYVRTDTJluvFCfo7GU99X3mx0MCd4pXEeQyHAVqt4
 E2aIsXvYBUaJoBMggShKp1TOqiaJdTaYEs/5C9wUNi0WLf4b6XOCAfBhp
 os4jPDG1HoIJB+xO5w+YeCi4iuPqQ2HeE1RerIZYrdTUo+Au+mnNXfFWx
 hFM98GLm6ddz69BGBxDgrxuL2btUgWvwUB+Kxkfc6KvABQfuTSmtYTJcH A==;
X-CSE-ConnectionGUID: 6hrMRqHtSYO9YKHn0BDHsA==
X-CSE-MsgGUID: Zki4l19tTIO2e9MUBNY5ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38291932"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="38291932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 12:29:02 -0700
X-CSE-ConnectionGUID: vM3ze494Qi2gGnNDavE+EQ==
X-CSE-MsgGUID: uhG/bJFuTcisI0G+AWm9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="79487987"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 12:29:00 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe/oa: Call xe_oa_emit_oa_config() with new config when
 updating config
Date: Wed, 19 Jun 2024 12:28:54 -0700
Message-ID: <20240619192854.199289-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When UMD ask config to be updated, xe_oa_config_locked() was calling
xe_oa_emit_oa_config() that would use stream->oa_config but that is
only changed to the next oa_config after xe_oa_emit_oa_config() finish.
So it was setting the same config for all DRM_XE_PERF_IOCTL_CONFIG
calls.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 34206e0b6a08e..a2da54d49f1ce 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -887,9 +887,8 @@ __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa
 	return ERR_CAST(bb);
 }
 
-static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream)
+static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
 {
-	struct xe_oa_config *oa_config = stream->oa_config;
 	struct xe_oa_config_bo *oa_bo;
 
 	/* Look for the buffer in the already allocated BOs attached to the stream */
@@ -905,13 +904,13 @@ static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *st
 	return oa_bo;
 }
 
-static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
+static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
 {
 #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
 	struct xe_oa_config_bo *oa_bo;
 	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
 
-	oa_bo = xe_oa_alloc_config_buffer(stream);
+	oa_bo = xe_oa_alloc_config_buffer(stream, config);
 	if (IS_ERR(oa_bo)) {
 		err = PTR_ERR(oa_bo);
 		goto exit;
@@ -989,7 +988,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 			return ret;
 	}
 
-	return xe_oa_emit_oa_config(stream);
+	return xe_oa_emit_oa_config(stream, stream->oa_config);
 }
 
 static void xe_oa_stream_enable(struct xe_oa_stream *stream)
@@ -1054,7 +1053,7 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 		return -ENODEV;
 
 	if (config != stream->oa_config) {
-		err = xe_oa_emit_oa_config(stream);
+		err = xe_oa_emit_oa_config(stream, config);
 		if (!err)
 			config = xchg(&stream->oa_config, config);
 		else
-- 
2.45.2

