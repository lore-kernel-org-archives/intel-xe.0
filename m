Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F11C02198
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 19:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BF310E3C1;
	Wed,  5 Feb 2025 19:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgYZrbIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE6710E16E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738783024; x=1770319024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ScRMsHhZvgqOqZ8YD7GCorS3BwCt25FqiHcZktIy0sc=;
 b=MgYZrbIko4khKpUm6U/Q2DdbQkwdJZeiFT3SbU0/XEVheRmuQGiwFEbU
 RvgF5wpr3PRnaMRPpQbY9uV2d/qJYaF+9XY+D60iHjY30Fbcmkw9YDIfQ
 V6r/jdfBT9G2r0HiJJl35ZOf4S/xzYk0PESmgeXLRa6KzEp7V/zrMM9If
 /JCOg0UcjBhZZ3Y1rS8EqAkPOwP2xvZCYYGYQtN91vmqAQ1LPLtwwFNos
 Cekd4/7zDj2cqeju6oZCdHL6I9W3pC5EGve1TK7x2X3sT2BCIptoKu2Yw
 scHPxQDR1Qqczctw9pPuNM9M2sF1o7MsowsbupeFOxei6K9Sip3vNmXii g==;
X-CSE-ConnectionGUID: eN3siqhFTpuQu/936S1R1Q==
X-CSE-MsgGUID: N6w86Aj+QmuFBU6xXDldVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61837937"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="61837937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:17:03 -0800
X-CSE-ConnectionGUID: Po9gsGayRs6EqusNBao88Q==
X-CSE-MsgGUID: eIuQSHR6T1ipS7Y4hpum/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111519966"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.119])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:17:01 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/2] drm/xe/client: Skip show_run_ticks if unable to read
 timestamp
Date: Wed,  5 Feb 2025 20:16:44 +0100
Message-Id: <20250205191644.2550879-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
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

RING_TIMESTAMP registers are inaccessible in VF mode.
Without drm-total-cycles-*, other keys provide little value.
Skip all optional "run_ticks" keys in this case.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 63f30b6df70b..848dc08beace 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -324,6 +324,14 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	u64 gpu_timestamp;
 	unsigned int fw_ref;
 
+	/*
+	 * RING_TIMESTAMP registers are inaccessible in VF mode.
+	 * Without drm-total-cycles-*, other keys provide little value.
+	 * Show all or none of the optional "run_ticks" keys in this case.
+	 */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	/*
 	 * Wait for any exec queue going away: their cycles will get updated on
 	 * context switch out, so wait for that to happen
-- 
2.31.1

