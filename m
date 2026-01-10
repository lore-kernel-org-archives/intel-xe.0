Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A3ED277C1
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 15:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7610E1B2;
	Sat, 10 Jan 2026 15:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtAV9TUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD93A10E1A5;
 Sat, 10 Jan 2026 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768059939; x=1799595939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nkZB6DFHXL+G4J6zTR5dqfr6z0JfuDYpCBS8Jl/MWdU=;
 b=PtAV9TUNJpxx0bIKPeYbE68G2/5CKZzJwUNQanS8B5UX1gttKcGbf+Vx
 4DPmouRQ8mft5Et9SoXBE3Dg9JZbWd6NO+ndvkB4QzYDIrFqcCedop4JP
 KuZztRasYdA4f7vvixILvLIU6kdRRS4Sh/YCluN1ZHDlkFpeZn4U4rM4x
 26O+S1hqVrk9fEIaMN/W79R2DGuJuLbC+7M2PYsh+YyhxIJOYhHJPQ/Zh
 feD5EfBrBwfYABc8RzkPqJl8kH9cKsfaCxC0wMWYaCriI7IV4wQxHxFlr
 SLROQFxXti380Kijk138wS/sRHOBePINRgsnKTYoLVLnD8L867QmjIkyj Q==;
X-CSE-ConnectionGUID: yyFt41ExTgCCXPpsi5YgZg==
X-CSE-MsgGUID: ja+4nm3kQnCLFwO9pi69Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="86828683"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="86828683"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 07:45:39 -0800
X-CSE-ConnectionGUID: WoC5TYw/SouE2qb1Mjh5EQ==
X-CSE-MsgGUID: eZs1MIWxQ8CqkiaUVo3Khg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="204138761"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 07:45:38 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: jani.saarinen@intel.com, suresh.kumar.kurmi@intel.com,
 mohammed.thasleem@intel.com,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mario Limonciello <superm1@kernel.org>
Subject: [CI v2 1/2] ACPI: PM: s2idle: Add missing checks to
 acpi_s2idle_begin_lps0()
Date: Sat, 10 Jan 2026 16:44:04 +0100
Message-ID: <20260110154405.2825339-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260110154405.2825339-1-michal.grzelak@intel.com>
References: <20260110154405.2825339-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Commit 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints
when needed"), that attempted to avoid useless evaluation of LPS0 _DSM
Function 1 in lps0_device_attach(), forgot to add checks for
lps0_device_handle and sleep_no_lps0 to acpi_s2idle_begin_lps0()
where they should be done before calling lpi_device_get_constraints()
or lpi_device_get_constraints_amd().

Add the missing checks.

Fixes: 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints when needed")
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Link: https://patch.msgid.link/2818730.mvXUDI8C0e@rafael.j.wysocki
---
 drivers/acpi/x86/s2idle.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index 6d4d06236f61..2a9edb53d5d4 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -515,7 +515,8 @@ static struct acpi_scan_handler lps0_handler = {
 
 static int acpi_s2idle_begin_lps0(void)
 {
-	if (pm_debug_messages_on && !lpi_constraints_table) {
+	if (lps0_device_handle && !sleep_no_lps0 && pm_debug_messages_on &&
+	    !lpi_constraints_table) {
 		if (acpi_s2idle_vendor_amd())
 			lpi_device_get_constraints_amd();
 		else
-- 
2.45.2

