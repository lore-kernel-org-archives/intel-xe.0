Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572ADE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2C410E630;
	Wed, 18 Feb 2026 22:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="im8wSdUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539F510E630
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771452590; x=1802988590;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3k5lPcbqzKT3mSB/y1iogsLNSngCOnxsB3Jsi55V2yo=;
 b=im8wSdUbCpjIX1YcHpZ5uqDS5Qeu7KVh3mJAX/WdkNBuboEIWzR4+kQT
 RB74gs0nBVSSVvW4ec/aic0NFqw+Dt8dhwZYSMAuc2aLSFc0ydGKnOH2b
 zOKCxTx8P1nMVd9pbse5EGmZCPzaHuQDmsYk7VAxgdlfSeTEwsH4J8Jk5
 rEpEbS8djGwsBjhw1o3o6Bz2lOyZi+rycMF3fhpjecQrMzih7CYjyt+DD
 W78GaTDD5Ct2ajeXyudOkfs4hoaOvBZM9sxlial/pe4u/D9cWCf5GFlRc
 213evKbKY2XGqJEoWcnj1rr4LObl2N+c/K+TsGjvL+aHfy1HDUoiLOVao w==;
X-CSE-ConnectionGUID: iFo66mLmSi6aA9lPkMR3EQ==
X-CSE-MsgGUID: 3/Z7PxcpQtam5uImCufxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76399068"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76399068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
X-CSE-ConnectionGUID: 41fdcmeOThaikRXSwump+Q==
X-CSE-MsgGUID: 1/x5d7B5QaS+Ml6oaT2NqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214329415"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Feb 2026 14:09:14 -0800
Subject: [PATCH v4 3/4] drm/xe: Add facility to lookup the value of a
 register in a default LRC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sr_verify-v4-3-35d6deeb3421@intel.com>
References: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
In-Reply-To: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4556;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=3k5lPcbqzKT3mSB/y1iogsLNSngCOnxsB3Jsi55V2yo=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpljisUhogPjwEASrfQKUpWjufcFoCJ4j9SrmiC
 Da8dj4COXGJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZY4rAAKCRBNeSQFyHKQ
 BFxcD/0QIPUJVua8ISKwUHevnDDmLapbus821J1eHYnyPjxbzcYesJ7Yg7KcRbQ3HlauYFcCyYJ
 wKd30zKEYKd925tILlO1O7YvvWc74Ivzrdqo+xWQ50FxaduqbjEYSPhp+j3LKdtQwElQQvJD1R+
 4mdLE1GENoWuckrq+DOqLEmJkvCcgohgRX9nRN8WBJ9kGYP9DyxMJrqn12W8JUOo5CMbEdX4uMc
 eRn5h3f26o38HT/CH4bZC/Wl5YtV9HoMiL4M+t1zGT7gn3ZI4I+EZnA2PdkLkv/er1BAIvIxBBj
 UBDN0Mb1MuM8dXRX+tm3ufZuc+HUNhR/uCxptzq26L8pvzgKGqzU747H6k95eoFQVwQco/mIvLA
 cM+hlg1XtmTFXlCFGgyT4gtTj3FePGT1cf9u6kxTBmB+EvyXdMhoJF0V3SjcEFrp9gnoJcxMhGQ
 ZCoCQE3peJAiDfl/mHO2ZEjKEutfVxJXkbzO2wq0CFNmy2h11xVj13kXSB2jWkFErrjzzduoXNA
 NwLRLz7tnh53QxmM07wgXHf/3jDa2Q3kCfbNArnOVTHIi+hqozaK8alN5QPVenG/APpO5c60IQ4
 95nQRp7tUg6RPB6VL5F3Z9DtXCuTwbRYd4DAtJ+VbB57weJ1XO5Ehmbt13tqiFrJHHVoUR4y7kV
 nY8ul2TtBWtIl7Q==
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

An LRC is stored in memory as a special batchbuffer that hardware will
execute to re-load state when switching to the context; it's a
collection of register values (encoded as MI_LOAD_REGISTER_IMM commands)
and other state instructions (e.g., 3DSTATE_*).  The value that will be
loaded for a given register can be determined by parsing the batchbuffer
to find MI_LRI commands and extracting the value from the offset/value
pairs it contains.  Add functions to do this, which will be used in a
future patch to help verify that our expected reg_sr programming is in
place.

The implementation here returns the value as soon as it finds a match in
the LRC.  Technically a register could appear multiple times (either due
to memory corruption or a hardware defect) and the last value
encountered would be the one in effect when the context resumes
execution.  We can adjust the logic to keep looking and return the last
match instead of first in the future if we encounter real-world cases
where this would assist with debugging.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 96 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  4 ++
 2 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 38f648b98868d8a6caa038e2d940f72783f2074b..57ef4f527ed0d142ad382ba17c020d8f8c241bfd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2155,6 +2155,102 @@ void xe_lrc_dump_default(struct drm_printer *p,
 	}
 }
 
+/*
+ * Lookup the value of a register within the offset/value pairs of an
+ * MI_LOAD_REGISTER_IMM instruction.
+ *
+ * Return -ENOENT if the register is not present in the MI_LRI instruction.
+ */
+static int lookup_reg_in_mi_lri(u32 offset, u32 *value,
+				const u32 *dword_pair, int num_regs)
+{
+	for (int i = 0; i < num_regs; i++) {
+		if (dword_pair[2 * i] == offset) {
+			*value = dword_pair[2 * i + 1];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * Lookup the value of a register in a specific engine type's default LRC.
+ *
+ * Return -EINVAL if the default LRC doesn't exist, or ENOENT if the register
+ * cannot be found in the default LRC.
+ */
+int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
+				    enum xe_engine_class hwe_class,
+				    u32 offset,
+				    u32 *value)
+{
+	u32 *dw;
+	int remaining_dw, ret;
+
+	if (!gt->default_lrc[hwe_class])
+		return -EINVAL;
+
+	/*
+	 * Skip the beginning of the LRC since it contains the per-process
+	 * hardware status page.
+	 */
+	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
+	remaining_dw = (xe_gt_lrc_size(gt, hwe_class) - LRC_PPHWSP_SIZE) / 4;
+
+	while (remaining_dw > 0) {
+		u32 num_dw = instr_dw(*dw);
+
+		if (num_dw > remaining_dw)
+			num_dw = remaining_dw;
+
+		switch (*dw & XE_INSTR_CMD_TYPE) {
+		case XE_INSTR_MI:
+			switch (*dw & MI_OPCODE) {
+			case MI_BATCH_BUFFER_END:
+				/* End of LRC; register not found */
+				return -ENOENT;
+
+			case MI_NOOP:
+			case MI_TOPOLOGY_FILTER:
+				/*
+				 * MI_NOOP and MI_TOPOLOGY_FILTER don't have
+				 * a length field and are always 1-dword
+				 * instructions.
+				 */
+				remaining_dw--;
+				dw++;
+				break;
+
+			case MI_LOAD_REGISTER_IMM:
+				ret = lookup_reg_in_mi_lri(offset, value,
+							   dw + 1, (num_dw - 1) / 2);
+				if (ret == 0)
+					return 0;
+
+				fallthrough;
+
+			default:
+				/*
+				 * Jump to next instruction based on length
+				 * field.
+				 */
+				remaining_dw -= num_dw;
+				dw += num_dw;
+				break;
+			}
+			break;
+
+		default:
+			/* Jump to next instruction based on length field. */
+			remaining_dw -= num_dw;
+			dw += num_dw;
+		}
+	}
+
+	return -ENOENT;
+}
+
 struct instr_state {
 	u32 instr;
 	u16 num_dw;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c307a3fd9ea287d54f2d211cdb688e1143a43d03..3e500004f1ae449befaf4cbcefef36dc4c92bdec 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -133,6 +133,10 @@ size_t xe_lrc_skip_size(struct xe_device *xe);
 void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class);
+int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
+				    enum xe_engine_class hwe_class,
+				    u32 offset,
+				    u32 *value);
 
 u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
 

-- 
2.53.0

