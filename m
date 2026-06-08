Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC88CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4D310F768;
	Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSzCAGuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3052110F766
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937687; x=1812473687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V28NAThEVvQyi/+7KuF5yeYYLzDx8+iq/nR2RkFLCS8=;
 b=OSzCAGuQ0kxO6ehGp1nr6OEy6ywNz1ufPRWiorgvF4eTfzL/Y3SjCJAW
 AzRSkXY/4n8U7a5C3xjwjrw3e4JKeRUN69BxeQUkFlhRFm8f37m/5yK8Y
 jc+SH+AWEq7aDYt5ymNSGYhXasKijpRkOHUd4wdgi/JXAR2IdN6bX57MK
 9JuJznXeJSIPdIABLR7+44CINrL+ZkihcerCaJaK5cylQV958zB3wyCR6
 XtOzZj5Dhn+K6E9qErvv27z8yHmdI1UTsW3Zp0E9nLZA6Ha2mAtPpLk/G
 +F+xQX2pCb0NPHKFzi5NMaDxfEmdCExNjdJefEw1Q/63JOD427KlNSvUH g==;
X-CSE-ConnectionGUID: BQUs143JT4mRCc8WlmR6NQ==
X-CSE-MsgGUID: qRZLXwsSStG5shZCKoyaIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744528"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744528"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:41 -0700
X-CSE-ConnectionGUID: 57WbNXnMT4W7hNmruKVOnw==
X-CSE-MsgGUID: SdMp/xkTQ3y17/f6AezThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467520"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 01/16] drm/xe/mmio: Assert MMIO is available
Date: Mon,  8 Jun 2026 18:54:14 +0200
Message-ID: <20260608165429.587-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

We shouldn't access device registers after the device was unplugged
or the MMIO bar (GTTMMADR) was unmapped. Instead of relying on the
NPD splat due to zeroed tile->mmio.regs, which might be unreliable
anyway as not all xe_mmio structs are using that directly, add an
explicit assert during all xe_mmio read/write operations to test
zeroed xe->mmio.regs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
v2: don't rely on drm_dev_is_unplugged (CI)
---
 drivers/gpu/drm/xe/xe_mmio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..fa9cdcf09b32 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -128,6 +128,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
 	mmio->tile = tile;
 }
 
+static void mmio_assert_available(struct xe_mmio *mmio)
+{
+	xe_tile_assert(mmio->tile, mmio->tile->xe->mmio.regs);
+}
+
 static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 {
 #define DUMMY_REG_OFFSET	0x130030
@@ -146,6 +151,7 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
 
+	mmio_assert_available(mmio);
 	mmio_flush_pending_writes(mmio);
 
 	val = readb(mmio->regs + addr);
@@ -158,6 +164,7 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	mmio_assert_available(mmio);
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	writeb(val, mmio->regs + addr);
@@ -168,6 +175,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
 
+	mmio_assert_available(mmio);
 	mmio_flush_pending_writes(mmio);
 
 	val = readw(mmio->regs + addr);
@@ -180,6 +188,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	mmio_assert_available(mmio);
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
@@ -194,6 +203,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
+	mmio_assert_available(mmio);
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
-- 
2.47.1

