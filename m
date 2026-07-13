Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1618C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 07:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A86C10E591;
	Mon, 13 Jul 2026 07:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObTlXmq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E5410E591
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783928909; x=1815464909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Utu/r8GBIE0wMoxFbhG4GdqrcWjZ1Sk0w/E2ndXyUws=;
 b=ObTlXmq459Uly/0suwETyniJUdISiNuvJEI33PapYtAGYipeNNTNiewY
 iEii43NoOVeCVDJM4vO56sCISQSwEQtBxnsMqAa7w/uJ7epBkGq2ZAZ6q
 c5kfZfx5agf2f/sPwAm1RTR6mAKPPlKQpqtk++Yk3NC3IL0epwQGEoj0V
 xzlREAB9YL0jRiDxAspD5hu9cSG8Hp/EK6IwzmzdyrMb10v867W2KeScZ
 HMowtkTN4oxr4k9pKk6SCHF5Ez4yf7L2HjHraGKJRHPPXaEsvd3l8ZsFw
 lRW/eXlnMhOAmjFATDcZhx8z2ZbZAsXfG/Mqxk3MAXKkAWB4MaefAW26b g==;
X-CSE-ConnectionGUID: 9rWyT9LMSuKm8I4lfOdvPQ==
X-CSE-MsgGUID: 78rxTqvUSuuuqiwhR4529g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84548861"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84548861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:29 -0700
X-CSE-ConnectionGUID: eifzyjisTA2Ev/Gw2AOqPA==
X-CSE-MsgGUID: d4+8ezdxRVqpXazc4hYW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278737297"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v9 3/4] drm/xe/xe_ras: Query errors from system controller on
 probe
Date: Mon, 13 Jul 2026 13:17:59 +0530
Message-ID: <20260713074755.1278607-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260713074755.1278607-6-riana.tauro@intel.com>
References: <20260713074755.1278607-6-riana.tauro@intel.com>
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

On driver load, process and log any errors detected by firmware prior to
load. Critical errors such as Punit, CSC are reported through Pcode init
failure, causing the driver to enter survivability mode on probe.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: fix comment (Raag)

v3: reword commit message (Umesh)
---
 drivers/gpu/drm/xe/xe_ras.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 1204b9f05b24..845b0e99754c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -464,4 +464,11 @@ void xe_ras_init(struct xe_device *xe)
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
+
+	/*
+	 * During probe, process and log any errors detected by firmware while the driver was not
+	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
+	 * causing the driver to enter survivability mode.
+	 */
+	xe_ras_process_errors(xe);
 }
-- 
2.47.1

