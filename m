Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1121CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 18:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9A210E0B0;
	Tue, 12 Aug 2025 18:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfhUqOvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350C010E0B0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755023225; x=1786559225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fsiXbfayP8XVScLoynfut7jBDMojEs3ltFGE12UfHxE=;
 b=nfhUqOvMpFaSP+5++m9YlxE0/YaC2F6qTuZDvxszV5+GJKbIGLL8j60y
 MyLTftbRfLJ8q/XAR3OxI4JCLeRvdKfePDsimnjYeR6QhX4P2t4cxb4bW
 82L2L3hck3xiczk/SW3XEk1vUccKsdHszGK2vAFtKQKxSp+ZEKXvSP1yb
 vHp5ONBKhDATAd3SGwZsshUX3bAG0pWL5gPKEKc1nitK/okaFWHq53NkA
 uRNg4tMnsCmlH2q7BSb6wZ2gwdcIrPr5aSRjC17EafWKhfLvtWdtgoxd2
 Chcfyj9SCueqLt+jvlLSo+XVoM2iop+Ujcy0pOBjZdWwfVYsmx9WUO5Zk A==;
X-CSE-ConnectionGUID: HicEYzeJR0yDqwCTv8zpag==
X-CSE-MsgGUID: lYBbCsciStqiIqk6ny4tRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74757082"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="74757082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 11:27:05 -0700
X-CSE-ConnectionGUID: TwmgDRm3QcaHcWxMj8gxnQ==
X-CSE-MsgGUID: aeFEYx19T2aAEvctIxCQ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="197124875"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 11:27:04 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Date: Tue, 12 Aug 2025 11:28:46 -0700
Message-ID: <20250812182846.1608209-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812182846.1608209-1-fei.yang@intel.com>
References: <20250812182846.1608209-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write operation with
command execution proceeding normally. Although the write operation is
guaranteed to complete eventually, there is no mechanism to synchronize
command execution with the completion (or even initiation) of these
operations."
The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT consecutively
to implement user fence. However, according to the BSpec, the data write
operation is not guaranteed to be completed when triggering the interrupt,
that would cause the xe_wait_user_fence_ioctl to wait until the full user
specified timeout is reached before checking the fence value again. Great
performance degradation has been observed in IGT xe_exec_fault_mode test
cases due to this unnecessary wait. The worst case is that if user set the
timeout to MAX_INT32, the wait could end up being a hang until some other
random program triggers a user interrupt to wake it up.
A semaphore wait is added right after the data write to avoid the unexpected
wait.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c47b290e0e9f..1c9e7b35c665 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -34,6 +34,17 @@
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
+#define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
+#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
+#define   MI_SEMAPHORE_POLL		REG_BIT(15)
+#define   MI_SEMAPHORE_COMP_OP		GENMASK(14, 12)
+#define   MI_SEMAPHORE_SAD_GT_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 0)
+#define   MI_SEMAPHORE_SAD_GTE_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 1)
+#define   MI_SEMAPHORE_SAD_LT_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 2)
+#define   MI_SEMAPHORE_SAD_LTE_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 3)
+#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 4)
+#define   MI_SEMAPHORE_SAD_NEQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 5)
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5f15360d14bf..189e764e3914 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -169,6 +169,20 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 	dw[i++] = upper_32_bits(addr);
 	dw[i++] = lower_32_bits(value);
 	dw[i++] = upper_32_bits(value);
+	dw[i++] = MI_SEMAPHORE_WAIT |
+		  MI_SEMAPHORE_POLL |
+		  MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = lower_32_bits(value);
+	dw[i++] = lower_32_bits(addr);
+	dw[i++] = upper_32_bits(addr);
+	dw[i++] = 0;
+	dw[i++] = MI_SEMAPHORE_WAIT |
+		  MI_SEMAPHORE_POLL |
+		  MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = upper_32_bits(value);
+	dw[i++] = lower_32_bits(addr + 4);
+	dw[i++] = upper_32_bits(addr);
+	dw[i++] = 0;
 
 	return i;
 }
-- 
2.43.0

