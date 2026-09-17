Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458BEC982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 22:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E879F10E4E6;
	Thu, 17 Sep 2026 22:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fm9xVMth";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA10910E4E6
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 22:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789684452; x=1821220452;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=7JbXTZk5cAgNMgstJ6OSMv5kOJOw0ZkWPcfxx7OSC5E=;
 b=Fm9xVMthl/V8uBvTPTxvAPqW2uhzYRgwSnJbN37tJ25WfK4O9HYVjBac
 ckgmwkyhtpENYums4giFivyNjd4byMHU9QftwVYQQfUP2iI4daGW5Otq6
 RuKAr68YBf24q/CMztFmi35lx6gFaMWG0RzN5y5fQ+43IJLngQrV/OedM
 Qg7ZTrJZCLiYuGYV1FFsJbmrm8Lkdxq3OC/8Y+d/z/PV0Jm2k8wukTFbz
 55762orqFyzK5WOPl4Xpy0nkARqzonavXJpadXKDdzimWbKQZsoOCxb5L
 VXrqPf3jHKzv2KGoTgLYcxgX3rmTvmyxL377VSfSqYhERCTShPjtlKy1J A==;
X-CSE-ConnectionGUID: cJMRKMnQQF64V4PxLvBmQw==
X-CSE-MsgGUID: yL3cR/ujSMeYzCHgyFS9Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93990508"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93990508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:34:11 -0700
X-CSE-ConnectionGUID: 9/4VjuqQTFGgnj178VD0EA==
X-CSE-MsgGUID: wJLowAnXRFagw2iVXhRmUA==
X-ExtLoop1: 1
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:34:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 17 Sep 2026 15:33:39 -0700
Subject: [PATCH] drm/xe: Consolidate semaphore instruction definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBPKJKirRIQ6U84iDSciiO6et
 HyL/x8QykwCY/VApouFUyxo6wp8sHEjxVgMutF9M7RGCe32CCnTwlFOpdF5dNgZXD2U6Mi08v0
 Pp/l9P1owEEdgAAAA
X-Change-ID: 20260914-semaphore_inst-2dbcdbd34dfc
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=7JbXTZk5cAgNMgstJ6OSMv5kOJOw0ZkWPcfxx7OSC5E=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqrGriFSKtsspR8PvhGJstnJznWoFKgBukS0B/T
 snervXevRKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaqxq4gAKCRBNeSQFyHKQ
 BCUqEACgO04KK0e7KMST60ehsmWUYYK8fLNklbv6ix3qfPGdpZG9FN+pvzxpdJfatrQauvtF3UX
 zsqHLIlO7xzYrnPcIjXX0iDYb0Y7x20BA/ruffn5u509+IaBR1kkmViTeU7t0Deu7h813m5BjVJ
 SwCdLbTV+Gp/t3ek31eXU+ISwhdh2X0B0FZ/HNX/4bFww0j3cOjkjGsuMqhYAPCOJWUzMGWi4Mn
 SKNlM7Bse9KDAiljGZf9EIZSUgTsL2m640J27RHW3dWWbUGLqxSKGDTLoja0ujx/d2xwyPpb1zn
 2YkLEkwMCMMWQeANxPoyo4pklwvZ/QTyUF0aG/smK212J+6PcG3/1AuWNLaeaQ1q91YgZTyze8N
 +6s4TBug8rF7vDEmS9CsPVTORzWIuDGS44gkzpsERGj8WPn4/2M4BfzbEqICNz/Khdi632YmWk8
 WiRAvG+s2cNZ4ZAEeGEaJmbyixg76PAhvQqA1sSznVvyVuqdYZM8t8gaCex9j4qYb0hcHsf803J
 UcJbqihDsmQ2An3TIqkF7aDwt4ndfHdR9geBviDcLvw+IV8nYcJ8EZP7k/rJrWDbzaSmdTsV6Dc
 Gz56a+eFa3ouR4+fOZ923Dh7zyRxnz+ZWqdyJFm7U4qMsMTcSYuMc1FRNhNC2zBchppJEQEg414
 QKD6iQGtWkG6Qtw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Drop the definition of MI_SEMAPHORE_WAIT_TOKEN and replace its uses with
MI_SEMAPHORE_WAIT.  Both #define's were representing the same opcode
0x1C and this GPU instruction has always been named "MI_SEMAPHORE_WAIT"
in the official specs.

The "*_TOKEN" definition appears to have been copied from i915's code.
i915 needed two separate definitions to reflect the slightly different
instruction lengths gen8-gen11 platforms (4 dwords) vs gen12 and later
platforms (5 dwords, with the extra dword representing a token), but Xe
only supports newer platforms with the 5-dword form, so only a single
definition is needed and should match the official name given in the
specs.

Bspec: 14054, 45749, 60244
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 7 +------
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 4 ++--
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index ad7d98f2dbba..835ef75bbeb1 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -36,6 +36,7 @@
 
 #define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
 #define   MI_SEMW_GGTT			REG_BIT(22)
+#define   MI_SEMW_REGISTER_POLL		REG_BIT(16)
 #define   MI_SEMW_POLL			REG_BIT(15)
 #define   MI_SEMW_COMPARE_OP_MASK	REG_GENMASK(14, 12)
 #define     COMPARE_OP_SAD_GT_SDD	0
@@ -94,10 +95,4 @@
 #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
 #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
 
-#define MI_SEMAPHORE_WAIT_TOKEN		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5)) /* XeLP+ */
-#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
-#define   MI_SEMAPHORE_POLL		REG_BIT(15)
-#define   MI_SEMAPHORE_CMP_OP_MASK	REG_GENMASK(14, 12)
-#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_CMP_OP_MASK, 4)
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 08b4a4283e96..46ab1f0f3564 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -55,8 +55,8 @@ __emit_aux_table_inv(u32 *cmd, const struct xe_reg reg, u32 adj_offset)
 		 MI_LRI_MMIO_REMAP_EN;
 	*cmd++ = reg.addr + adj_offset;
 	*cmd++ = AUX_INV;
-	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
-		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
+	*cmd++ = MI_SEMAPHORE_WAIT | MI_SEMW_REGISTER_POLL |
+		 MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
 	*cmd++ = 0;
 	*cmd++ = reg.addr + adj_offset;
 	*cmd++ = 0;

---
base-commit: e3378d2746241db1a958a23c565333fcc1e30aef
change-id: 20260914-semaphore_inst-2dbcdbd34dfc

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

