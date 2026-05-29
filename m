Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E61CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DFD112485;
	Fri, 29 May 2026 19:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4whHkhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67B112485
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 19:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780083380; x=1811619380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3kOtgzYw2xQxmpZ91WjyUnOzp7OCHFpDyOxrPwi3pQ=;
 b=c4whHkhdesyOC7QwX+99DBXiaKsXh66HhnBmrP+RQeTE/mRH5/pRZ87h
 2yyAbqi/khlbYFBTu0YRNKTflYxjFoEww++VmndRYB/uebPL4viMMmYUB
 lAmWk54uh+r6GcTXydy6yT8WrSCqeT7F33qxrggFNg77QBT3T9S++dcb8
 fJuc0UaDl5ePi7V+fWnz5xbSRTPdnPYO83iobGDWR52dJLrMsCn6zeOHi
 2kQRNB8mpmMQcE+HJovYgQJ5201y1sN11f7HtNzaX/hB6l6Ydf9s0q71y
 uL8aBa8fsU6l6DD4QsG7nS7GsHA5hEG3RVbO7AnX4tdJOq4ACi42XsJHj w==;
X-CSE-ConnectionGUID: +gu+TZkKR0GT/s7lj8bBkQ==
X-CSE-MsgGUID: P5a/xH0TT4m9Ian78fA/sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80969686"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="80969686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:36:19 -0700
X-CSE-ConnectionGUID: 6KB4RK6hRaWxFXH8SkwyAg==
X-CSE-MsgGUID: Y+WfoSaSTb+ViONW24SoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="246943916"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:36:20 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
Subject: [PATCH 3/6] Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
Date: Fri, 29 May 2026 12:36:02 -0700
Message-ID: <20260529193558.185436-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529193558.185436-8-daniele.ceraolospurio@intel.com>
References: <20260529193558.185436-8-daniele.ceraolospurio@intel.com>
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

This reverts commit 4e88de313ff4d1c67b644b1f39f9fb4089711b71.

The early GuC FW definition meant for our CI branch was accidentally
merged to the drm-xe-next branch instead. This GuC FW will never be
released to linux-firmware, so we do not want the definition to be
available in the mainline Linux codebase.

Fixes: 4e88de313ff4 ("drm/xe/nvls: Define GuC firmware for NVL-S")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v7.0+
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70bccbc1af82..498c89452779 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.43.0

