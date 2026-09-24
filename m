Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D24C98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 21:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4F710E1F3;
	Thu, 24 Sep 2026 21:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax2OclTD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5633310E1F3
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 21:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790284134; x=1821820134;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=/CX2Na5wEl9cz5ewfsbOwhawd/0q2reFIbGC2fw7qd8=;
 b=Ax2OclTDey6cSfjmSwK27ISbsS0xTy0yrtfRgypsTNq9vvB/e7p0duQY
 OrvmBXkeXnMvr3G0ekwgbGoiI12tYZ0D3BbhRpVoTHy90vTfcL6eEvggK
 ICw2RqKvRj9k48UWgWbtDPxLV3jDdFVqSBtrEPNOBs8+X8A9dDNq0hzVw
 c56iezSrwMKZK+YaaJgCJ5tFBVFL+flaU+kjn0ZEKWdGVVhDkgltqOt56
 XRaJtINjWX0fHiJAInG5vFWyeauVsvMnwNmmE4yBnQsScFx/FcXhrClnI
 IpfxcBxAvR6LnL8X1yB3Jfxw27G27Ts4muvyt157A1HWge9FgJw5XToAY g==;
X-CSE-ConnectionGUID: /GimG49OS/+FSCh25l+73w==
X-CSE-MsgGUID: jxPJOxqeRAG/hxNR5sV5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101247011"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="101247011"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 14:08:53 -0700
X-CSE-ConnectionGUID: vFl/C8XIQxeITe3ljOAD1Q==
X-CSE-MsgGUID: cBp5lScHQW2QZ7ExUzM2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="300425181"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 14:08:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 24 Sep 2026 14:08:42 -0700
Subject: [PATCH] Revert "drm/xe: Set mask bits for CCS_MODE register"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ccs_mode_drop_mask-v1-1-5b2b35708b83@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBPSSqirRIiMUw1RhgMRSHdPW
 r7F/xmEEpPAWGVIdLNwPAt0XQFu/lxJcSgG0xjbDKZTiOKOGMiFFC93eNmV7kxA2/dkWw0lvBI
 t/PzTaX7fD2KWatdkAAAA
X-Change-ID: 20260924-ccs_mode_drop_mask-142dc655e631
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=/CX2Na5wEl9cz5ewfsbOwhawd/0q2reFIbGC2fw7qd8=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqtZFj0ZizKt46LdEUOHk1uDnOto3Su2c96ZhuH
 2FII8KY/76JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCarWRYwAKCRBNeSQFyHKQ
 BKl6EACFuvwnMot3NATzc5v1pisGALryNk8xXfAFmeUJAGCHY/7zuDPFc15aFLOykyvJdlDdMcD
 IdEK1Ri1AJgFTRc4O9nuM9MlnEbRwLEQYFyOmwNtEFQjbf9QG8Am3GEcnzGGzVou8QB0ejTPRAt
 Aew3gieTp0ORyn75pciDhQLzKQ/8a+HEjQEjAZbm4f4wuGTFZYzPNNDV1rQdn1oXCHHxSynNedH
 D9fTvXQ6MSSyAw6FfFCZLo9+2WTnCq6X+wyZljLse1jlTbITx9fNxcJOk14Yyf0fXn1mRj798S0
 EKP8QCzMvjztXkatwVgq5/psp/gHRENgZgFq4GjMqgVfK/DNQR6u/e3oA+qzoPkVwx2eiSuXBU2
 6jIagYfqTmyW1WMXFD/aaLKbV6z+iMSTZFzk2Ch9/eP2f+4Gu5SA71Gjft+3YYFmxZ6pdTSd7HB
 wlZCG2Uva6N/Lwv9AEotvR103qOm5AqCU8VYujfBFYcYazvs68iVKY5+aq6udmscglTg5Ib3dns
 hmQjMh0m7JdUTmqaepFG8o5hre34gBF9TJDSiaKoFKmsEfW/EnoHLM6z1K+lOnrG+0f6a7mIgJx
 p4W+79soZ8MIt0AC3kyD3/UfrgizBN+DOJUXAAXOGwfA3EkDdjpJzGzvA/NQz4cvoJyHqj55Cs3
 NXEyu0jTz6PmSxQ==
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

This reverts commit 23ea2c7572d4735ef66beb1e4feb8ae510b78247.

A recent bspec update dropped the details about CCS_MODE being a masked
register (i.e., bits [15:0] are only updated by register writes when the
corresponding bit in [31:16] mask is also set by the write) on Xe2 and
later.  Apparently the documented mask bits were never actually
implemented in hardware, so all register writes will update all bits of
[15:0], just as the register behaved on Xe1 platforms.

Setting the non-existent mask bits in Xe didn't have any negative impact
since none of our existing code was trying to use the mask to limit
which bits were updated.  However this could have caused problems in the
future if we ever rework this code in a way that tried to rely on the
masking behavior.  Update the register definition and drop the use of
the mask to align with the new bspec definition and avoid potential
mistakes in the future.

Bspec: 55887
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2e059cb36c82..926b14e32c40 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -636,7 +636,7 @@
  *   [4-6]     RSVD
  *   [7]       Disabled
  */
-#define CCS_MODE				XE_REG(0x14804, XE_REG_OPTION_MASKED)
+#define CCS_MODE				XE_REG(0x14804)
 #define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
 #define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
 #define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index baee1f4a6b01..224a15675203 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -70,12 +70,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 		}
 	}
 
-	/*
-	 * Mask bits need to be set for the register. Though only Xe2+
-	 * platforms require setting of mask bits, it won't harm for older
-	 * platforms as these bits are unused there.
-	 */
-	mode |= CCS_MODE_CSLICE_0_3_MASK << 16;
 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
 
 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",

---
base-commit: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371
change-id: 20260924-ccs_mode_drop_mask-142dc655e631

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

