Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E5D277C1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 22:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AB110E0D1;
	Fri,  9 Jan 2026 22:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2Ucg7Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08B10E0D1;
 Fri,  9 Jan 2026 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767998108; x=1799534108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QsWwJu0eVJ/51gMhAr4e2Y3f4Cymifs8zZZUnSOiTQc=;
 b=Z2Ucg7MjjdmKfFtkoNJZBeATOGtTaHrzNW0akJXlmCATfDSVbDmeHCPk
 QvVTzX2xCHEhcYHQdNYs9Z7QPw+oFWW+3AGVfAYV46lF3VkmDnL3cd5jY
 TOWpGeDsiNXqtEUip53PcWeY1GEX+lRNHjbr36fjdBSwtBIA/HO7onZlp
 tU3JZnto2KEPRcM/hpsOe7BHiBhKWzQgCYnUIQUwnhntIBsAn8uV9C++9
 35/lI1Y6WYCC8yNqMnX9lBY03QenIJi7C/xcqZXzWmGfC3uLiFLfV7pQ5
 UEBNohPro4iDFSpjLIm1eJb35a/yww54zz9YTeY8wBlvVrXUYSM6643x7 g==;
X-CSE-ConnectionGUID: hblp1/GPSoeVU117BO+OwQ==
X-CSE-MsgGUID: gcwSNVBXRSWdILVzKQrYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68385082"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="68385082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 14:35:07 -0800
X-CSE-ConnectionGUID: KA1rWGxEQkaFfCv06GB3jg==
X-CSE-MsgGUID: yyMw88HORPmV793fPbEmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203652207"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Jan 2026 14:35:05 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: jani.saarinen@intel.com, suresh.kumar.kurmi@intel.com,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [FOR-CI] ACPI: PM: s2idle: Add missing checks to
 acpi_s2idle_begin_lps0()
Date: Fri,  9 Jan 2026 23:34:42 +0100
Message-ID: <20260109223442.2622647-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
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

