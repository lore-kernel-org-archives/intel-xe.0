Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20082CEBF92
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 20:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7259210E1D2;
	Mon, 17 Nov 2025 20:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvbHb1cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DC110E1CB
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763412802; x=1794948802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkMfq1h/C2wsoJ86LkI7zReSpsVT0OLtcvn0kV2tGas=;
 b=bvbHb1cLwX+gi5kDXZssu3r5DaWWOa5dr4/ys/Tzl152h1vMJVpjjsBi
 Co8F4gZxXkquTpjSq8fPJzrVGFzOv8uVm8HyipR3LJgX5Orct/Kv274e3
 D7piSIZjLMY0K17hv4x+c+kg+H2iyV1id6mRjhMRTRgUSkIllDxk5ShJB
 jnnH9mysw+MGtB9SHXrR1svyT0oPxPevm9H3AByMACKq0bERjqQeTpMvB
 gefyWGLa22utJdAShsTUhKbZZMhcAfSFBbZ1z4myALym1eEwPh8InGmHD
 trnrsDtm7wmnzutUj5+2zxSPU3KFVeuOfsN5oydBfDHalhPReBt0DdcBt w==;
X-CSE-ConnectionGUID: hdh+fPrfTVSajTN8mMt2bQ==
X-CSE-MsgGUID: ohz/P67nTRWIYzGd9NO8Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65516554"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65516554"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:22 -0800
X-CSE-ConnectionGUID: BmK3NzDLQWmE22krTvmTsw==
X-CSE-MsgGUID: KMnuDVIDQcCuRdIdKt/lvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190227344"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, lucas.demarchi@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 3/4] drm/xe/soc_remapper: Add system controller config for
 SoC remapper
Date: Mon, 17 Nov 2025 12:53:19 -0800
Message-ID: <20251117205315.1458477-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
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

Define system controller config bits and helpers for SoC remapper.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h | 1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c           | 6 ++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h           | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
index 9edf234227a9..be0eb37e73ad 100644
--- a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
@@ -9,5 +9,6 @@
 
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
+#define   SG_REMAP_SYSCTRL_MASK		REG_GENMASK(23, 16)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index 85d37a86117a..ed6b6c594e51 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -25,6 +25,12 @@ void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
 				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
 }
 
+void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
+{
+	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_MASK,
+				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
+}
+
 int xe_soc_remapper_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->soc_remapper.lock);
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
index 75431b94e66a..289aa41c3408 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -12,5 +12,6 @@
 
 int xe_soc_remapper_init(struct xe_device *xe);
 void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
+void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
 
 #endif
-- 
2.43.0

