Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4103EDEBEF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775F410E8B3;
	Tue,  3 Mar 2026 20:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmRVH9rV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5A410E8B4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772568878; x=1804104878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uaCZKfrH4AgBus8l61j499PNz24I9XmJ+sMDGct/OdU=;
 b=hmRVH9rVLMOyAaukLreWxDonHrmw31zEcq6KVIpHSSSPcgDNNiiZ0TzX
 NckXVudpo/RMKVpgg2nif1B87/HpN5Dr4JulqR8u23dj3TkdAw8ia9IdR
 p/DRe5hzVqTINF4NsuvFPYYC1hqQxUFO3kI6uHDnSJ9nZRxeH9Ch98/TY
 DIYITeOf9/VRbzAnKV/Fueuwhh/qZGWlXphZABf6DjLVOEp19+7M5LRsd
 614cf/UBzcypUqy6LIzJl/4w7gnisQzjCVqr6J2ENxUv6Q/b/896TPbj1
 zB1IrT7VQUBbUh/vqDi8KjX3Auj39597U0cOKLQLOu/DBGtfh4qww8r2M w==;
X-CSE-ConnectionGUID: Zsz+yWZoR8aVzIgW0NZiUQ==
X-CSE-MsgGUID: TzAdp7JSSFixn0+/bDWLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99096716"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99096716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:38 -0800
X-CSE-ConnectionGUID: /OeCyykTTj+3WvFYC5bKeA==
X-CSE-MsgGUID: k49b6keyQk22tleMQA7Imw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="256005841"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:37 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe: Add MI_SEMAPHORE_WAIT command definition
Date: Tue,  3 Mar 2026 21:13:53 +0100
Message-ID: <20260303201354.17948-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303201354.17948-1-michal.wajdeczko@intel.com>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
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

This command supports memory based Semaphore WAIT. Memory based
semaphores will be used for synchronization between the Producer
and the Consumer contexts. Producer and Consumer Contexts could
be running on different engines or on the same engine inside GT.

Bspec: 45749, 60244
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c47b290e0e9f..29569eff1af3 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -34,6 +34,19 @@
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
+#define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
+#define   MI_SEMW_GGTT			REG_BIT(22)
+#define   MI_SEMW_POLL			REG_BIT(15)
+#define   MI_SEMW_COMPARE_OP_MASK	REG_GENMASK(14, 12)
+#define     COMPARE_OP_SAD_GT_SDD	0
+#define     COMPARE_OP_SAD_GTE_SDD	1
+#define     COMPARE_OP_SAD_LT_SDD	2
+#define     COMPARE_OP_SAD_LTE_SDD	3
+#define     COMPARE_OP_SAD_EQ_SDD	4
+#define     COMPARE_OP_SAD_NEQ_SDD	5
+#define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
+#define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
-- 
2.47.1

