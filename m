Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106B7C5DF9D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5FC10E82D;
	Mon, 24 Aug 2026 18:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muKbQoKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E908610E829
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597095; x=1819133095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kk+bprrfwdpFXaDxtU954i9tWpTDKQp+jp5buKEI7ww=;
 b=muKbQoKPUiTwvgKx6KT88dYqt3yhtEEm5DVcHCoqG9MQQTW1z97CpFS0
 jO6H7XFo2w6/CNunvr8PyOF+0gLDOCBcA7sbkwSgAR6QQiIOEjDJrk/D5
 VKZQEkx1xQA3xSbTGIscTESzxkE6JztUfSnmuguobHlSwWbGR2MreR0Ty
 /IvnKuSr6X7DmurgsDwbPjuiokxD7zqgohvWdeIhmi8bA8rHKh8gZ94zB
 ch93zGWJeaRuYX3l+ZXxkFirKpG0JbtdHxn8M7Ev0LU/WtdsytDDnYIPN
 6QqcebmWMPpbNRdZ6oldwsLoZ/3Hc9dJYx1JQBgrt4qr3D+WxWuG8A31o Q==;
X-CSE-ConnectionGUID: sJpNY/oPRVmjPEkBSjeUtA==
X-CSE-MsgGUID: 67Lh5k/vTnu631vlXUPR3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75592759"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75592759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:44:55 -0700
X-CSE-ConnectionGUID: A3WMzP/MQbWEX8M4n5E5YQ==
X-CSE-MsgGUID: JcLZvCeWT8qbbMT/iAlveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263351748"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 11:44:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Date: Tue, 25 Aug 2026 00:13:52 +0530
Message-ID: <20260824184356.1960708-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
References: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
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

Include register offsets in GuC capture snapshot print output for both
32-bit and 64-bit registers.

When dumping captured engine register state, print each register name
alongside its MMIO offset to make the snapshot output easier to
cross-reference with register definitions and hardware debug
documentation.

This improves postmortem analysis without changing capture contents.

v2:(Sashiko)
- Ensure lower DWORD prints

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 82df19b304e1..324f25af3b0d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1774,7 +1774,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(!low32_ready);
 			low32_ready = false;
 
-			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
+			drm_printf(p, "\t%s (0x%lx): 0x%016llx\n", reg_desc->regname,
+				   reg_desc->reg.addr - sizeof(u32),
+				   value_qw);
 			break;
 		}
 
@@ -1788,10 +1790,11 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(low32_ready);
 
 			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
-				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
-					   reg_desc->dss_id, value);
+				drm_printf(p, "\t%s[%u] (0x%x): 0x%08x\n", reg_desc->regname,
+					   reg_desc->dss_id, reg_desc->reg.addr, value);
 			else
-				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
+				drm_printf(p, "\t%s (0x%x): 0x%08x\n", reg_desc->regname,
+					   reg_desc->reg.addr, value);
 
 			break;
 		}
-- 
2.43.0

