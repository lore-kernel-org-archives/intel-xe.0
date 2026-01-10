Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA76D277F1
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 15:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C99110E1FF;
	Sat, 10 Jan 2026 15:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPG7eRTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9373A10E1CF;
 Sat, 10 Jan 2026 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768059941; x=1799595941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awLfRpDGTns7NoURxyPv58Ya8PkIw5QX8sqs5iV5L/E=;
 b=DPG7eRTR5XsRZjirTapdqTzzUE+Ly3MJpAEEFYggr+PVy/1y3TfNMjW+
 pxTIDoevTuNY9nGTfDtb592fczSUG0ENuZ9tMXWjm08Xr19AeTWMYpfgU
 hm2UONxHkGUhClCVs7Zarcw0ECxHGlmkmH32BZEQtW7y/4IoOeTjmD1EA
 H7wMqV4sfci+Ixjkkvuq8MdQxv1BWfwWBICFZ5xyvNmmwAzso5L09cJun
 M6XuCbBsrEUOlj24VdloN72sKDM6knD92U6Co2Wn+MuYvjmOWJ6ErWQwi
 0YwVMuVn0KsBbwr+rcVP0+tzvUdsXzXrexrFtNtvsVtJaZP+1e2sALW5y g==;
X-CSE-ConnectionGUID: QQIKiesAS0qKGtMU2Hl/Lw==
X-CSE-MsgGUID: JwbPMaRLRH2L8xo1vqH7UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="86828686"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="86828686"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 07:45:41 -0800
X-CSE-ConnectionGUID: at7jhq1oRRKRnN6MUiccMA==
X-CSE-MsgGUID: 1Kq6VlvvQxeWlolwhvM94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="204138765"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 07:45:40 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: jani.saarinen@intel.com, suresh.kumar.kurmi@intel.com,
 mohammed.thasleem@intel.com,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [CI v2 2/2] ACPI: PM: s2idle: Add module parameter for LPS0
 constraints checking
Date: Sat, 10 Jan 2026 16:44:05 +0100
Message-ID: <20260110154405.2825339-3-michal.grzelak@intel.com>
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

Commit 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints when
needed") attempted to avoid useless evaluation of LPS0 _DSM Function 1
in lps0_device_attach() because pm_debug_messages_on might never be set
(and that is the case on production systems most of the time), but it
turns out that LPS0 _DSM Function 1 is generally problematic on some
platforms and causes suspend issues to occur when pm_debug_messages_on
is set now.

In Linux, LPS0 _DSM Function 1 is only useful for diagnostics and only
in the cases when the system does not reach the deepest platform idle
state during suspend-to-idle for some reason.  If such diagnostics is
not necessary, evaluating it is a loss of time, so using it along with
the other pm_debug_messages_on diagnostics is questionable because the
latter is expected to be suitable for collecting debug information even
during production use of system suspend.

For this reason, add a module parameter called check_lps0_constraints
to control whether or not the list of LPS0 constraints will be checked
in acpi_s2idle_prepare_late_lps0() and so whether or not to evaluate
LPS0 _DSM Function 1 (once) in acpi_s2idle_begin_lps0().

Fixes: 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints when needed")
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/x86/s2idle.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index 2a9edb53d5d4..cc3c83e4cc23 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -28,6 +28,10 @@ static bool sleep_no_lps0 __read_mostly;
 module_param(sleep_no_lps0, bool, 0644);
 MODULE_PARM_DESC(sleep_no_lps0, "Do not use the special LPS0 device interface");
 
+static bool check_lps0_constraints __read_mostly;
+module_param(check_lps0_constraints, bool, 0644);
+MODULE_PARM_DESC(check_lps0_constraints, "Check LPS0 device constraints");
+
 static const struct acpi_device_id lps0_device_ids[] = {
 	{"PNP0D80", },
 	{"", },
@@ -515,7 +519,7 @@ static struct acpi_scan_handler lps0_handler = {
 
 static int acpi_s2idle_begin_lps0(void)
 {
-	if (lps0_device_handle && !sleep_no_lps0 && pm_debug_messages_on &&
+	if (lps0_device_handle && !sleep_no_lps0 && check_lps0_constraints &&
 	    !lpi_constraints_table) {
 		if (acpi_s2idle_vendor_amd())
 			lpi_device_get_constraints_amd();
@@ -540,7 +544,7 @@ static int acpi_s2idle_prepare_late_lps0(void)
 	if (!lps0_device_handle || sleep_no_lps0)
 		return 0;
 
-	if (pm_debug_messages_on)
+	if (check_lps0_constraints)
 		lpi_check_constraints();
 
 	/* Screen off */
-- 
2.45.2

