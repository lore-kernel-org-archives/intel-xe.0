Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05D7D24468
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 03:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8922D10EA30;
	Fri, 11 Oct 2024 03:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqw8S19s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C60B10EA2F
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 03:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728619005; x=1760155005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIGNnEoogvmHno8bbjQa3j+Hu4LnBmlGjc7puPDkEAg=;
 b=cqw8S19sqoHc05OM3+JmDFFwCD2H9gtbDM/EQHGYC+RbtmE9Yj509K2c
 mrtZ0lx4dgZ3aDgAMnn8wXGXOQ/+r10TM7V4GlCehB2/IN7mXwjqp3S+y
 V6qFlYNXYC2pgFcB5ErdvG3cfpEXSNLpEIEmRovW3lOZSKIBqoQZuFJqG
 HV0uWgwDOMjrwGC9CcQIYLEkEEsyssS7DO1nRwkKNT5qrdtZgFjerJcpc
 ExGoVMVU58wrRD40fDsTfhWJIGvAaBMXnNECJTxrwNhqeLFUt9oOMR9PL
 Mub9DGJ34ufD74LvMnRBCnaMQTi8oatlFEkRgnS0KHM8s5+DIMWHVSpjO A==;
X-CSE-ConnectionGUID: dWFO8QWVRQ+EBpO0FuShfw==
X-CSE-MsgGUID: s3RS6s46T7C8k+U/3Qh0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="53411513"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="53411513"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:56:44 -0700
X-CSE-ConnectionGUID: qvbR577IS+K2KGelmAWcWw==
X-CSE-MsgGUID: No6znIw6RimclIhhqmRNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="100122316"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:56:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/3] drm/xe/query: Move timestamp reg to
 hwe_read_timestamp()
Date: Thu, 10 Oct 2024 20:56:17 -0700
Message-ID: <20241011035618.1057602-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011035618.1057602-1-lucas.demarchi@intel.com>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
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

__read_timestamps() is actually reading the timestamp from a certain
hwe. Use it as parameter, move register declarations to be inside that
function and rename it.

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 07093af0b32e3..69307ff4146a1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -85,16 +85,13 @@ static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
 }
 
 static void
-__read_timestamps(struct xe_gt *gt,
-		  struct xe_reg lower_reg,
-		  struct xe_reg upper_reg,
-		  u64 *engine_ts,
-		  u64 *cpu_ts,
-		  u64 *cpu_delta,
-		  __ktime_func_t cpu_clock)
+hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
+		   u64 *cpu_delta, __ktime_func_t cpu_clock)
 {
-	struct xe_mmio *mmio = &gt->mmio;
+	struct xe_mmio *mmio = &hwe->gt->mmio;
 	u32 upper, lower, old_upper, loop = 0;
+	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
+		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
 
 	upper = xe_mmio_read32(mmio, upper_reg);
 	do {
@@ -155,13 +152,8 @@ query_engine_cycles(struct xe_device *xe,
 	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
 		return -EIO;
 
-	__read_timestamps(gt,
-			  RING_TIMESTAMP(hwe->mmio_base),
-			  RING_TIMESTAMP_UDW(hwe->mmio_base),
-			  &resp.engine_cycles,
-			  &resp.cpu_timestamp,
-			  &resp.cpu_delta,
-			  cpu_clock);
+	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
+			   &resp.cpu_delta, cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-- 
2.46.2

