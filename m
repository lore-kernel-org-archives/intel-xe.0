Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2831AC43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 17:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D2C10EE97;
	Tue,  7 Jul 2026 17:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkIVf36o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B845F10EE97
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783447036; x=1814983036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=361nlLeky6WF0yJXwk2XPLe2etxP61HGOe4Z0Fnq5q4=;
 b=NkIVf36og5e4OF7lxGaSi/VD3nHsf+oahzLzHIx/QOzt5NUOFnq/Vq+C
 VC6o9cphmT9hGyAYZvJn2IYQVHYiFXD5cRSwEVuIRfbbmljDzp83cN+Y2
 NaCJr3cxaTKCXYWZuiXJWnW96SWQBNmA5AFtSG3kKofYmIXM9cHqRKwrH
 LdHk0vj5IW8Ew0i2Yn99kruUMFNfWuvitBXksplMP2U2MTdVh4x2PUEUM
 2GGHetbGk8/bb99fpGrxxW00gwGro+tbNKAWVw2lJL0qfaOmyxL0gqc5S
 1KXtKvv79tmfjF6gy+2NFj53ET/ClrUJuA5cFFRPCMjtdIeMkLobFLWRg g==;
X-CSE-ConnectionGUID: Bzloo523Syq/k4vHuTlcTQ==
X-CSE-MsgGUID: Il58bu6WR1O0IG1Sg0qu7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="86651288"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="86651288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 10:57:16 -0700
X-CSE-ConnectionGUID: w7rC+o6rTSemPQZsq8j9+g==
X-CSE-MsgGUID: 2htlQ1bWSTeq2pBKbztK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278436375"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 10:57:15 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/6] drm/xe/guc: Define GuC firmware for NVL-S
Date: Tue,  7 Jul 2026 10:56:37 -0700
Message-ID: <20260707175638.30935-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707175638.30935-8-julia.filipchuk@intel.com>
References: <20260707175638.30935-8-julia.filipchuk@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

GuC firmware 70.71.0 (UAPI 1.37.2) is the first official GuC firmware
for Novalake S. Recommend this version for NVL-S platform.

Although NVL-S is similar Xe3 to PTL/WCL, it requires a unique GuC
firmware.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20251016-xe3p-v3-12-3dd173a3097a@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patch.msgid.link/20260108181956.1254908-9-julia.filipchuk@intel.com
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patch.msgid.link/20260529193558.185436-12-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260618222536.3351750-12-julia.filipchuk@intel.com
Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 498c89452779..65f0136859d7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

