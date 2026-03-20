Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF141093180
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0AF10E00D;
	Fri, 20 Mar 2026 07:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbObMBWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB48C10E00D;
 Fri, 20 Mar 2026 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773993081; x=1805529081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4K2Zc8yQZQAdk9142zHOEw8xB6r9cKnq9zWeLx5Jo9w=;
 b=QbObMBWf4fbqJKqt0NHSbccr65Lk/cU9KykiN+lvvT2UCR0FjQ4Ve3cM
 I69r/kRFcN7ACj9NeNtyzNCNAdhQqoQ+5FhGoiQjeLvwM9ruhNl+j2Yz7
 ej8JAZV9239D05qAriTAuNlON7r4Hj7OclhESxZUrC6kVmTRo2L7ZWnYc
 hfTVvXsd1QDsGEx3DLsfrgzE0k4njGE8pbYfHBtFafNuEc17tpN0g0NgN
 GIHiXJXMhg+VzVpGyV1zIe5CcwpKgdHkUruh50pWjSXwFNeRx5HK4QiYi
 Hq29P41/FBnuoorrunHHVbITqZeoVl7B20w+0Vh3vnGFDJxuRzgOnZNOo w==;
X-CSE-ConnectionGUID: noodYr1YSWiT4S+bCKijNg==
X-CSE-MsgGUID: ywl9U+3cQFKSO4z1HBayFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74982810"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74982810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:51:20 -0700
X-CSE-ConnectionGUID: vNtCogV9SnOPnSbJxrJUeA==
X-CSE-MsgGUID: 8nwVh/fTTG2mcRDxjjoxrQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.245.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:51:19 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/psr: Ignore device ID for Dell XPS 14 DA14260
Date: Fri, 20 Mar 2026 09:51:08 +0200
Message-ID: <20260320075108.1395951-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Dell seems to be changing device ID even within same device model. Due to
this we need to ignore device ID when applying quirk for Dell XPS 14
DA14260.

Do this by adding DEVICE_ID_ANY and assign it to Dell XPS 14 DA14260 quirk.

Fixes: 45c77d4bf8d4 ("drm/i915/psr: Disable Panel Replay on Dell XPS 14 DA14260 as a quirk")
Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 8f1bf8f418ec7..6fecce259fb05 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -116,6 +116,8 @@ struct intel_dpcd_quirk {
 
 #define SINK_DEVICE_ID_ANY	SINK_DEVICE_ID(0, 0, 0, 0, 0, 0)
 
+#define DEVICE_ID_ANY		0
+
 /* For systems that don't have a meaningful PCI subdevice/subvendor ID */
 struct intel_dmi_quirk {
 	void (*hook)(struct intel_display *display);
@@ -261,7 +263,7 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 	},
 	/* Dell XPS 14 DA14260 */
 	{
-		.device = 0xb080,
+		.device = DEVICE_ID_ANY,
 		.subsystem_vendor = 0x1028,
 		.subsystem_device = 0x0db9,
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
@@ -277,7 +279,8 @@ void intel_init_quirks(struct intel_display *display)
 	for (i = 0; i < ARRAY_SIZE(intel_quirks); i++) {
 		struct intel_quirk *q = &intel_quirks[i];
 
-		if (d->device == q->device &&
+		if ((d->device == q->device ||
+		     q->device == DEVICE_ID_ANY) &&
 		    (d->subsystem_vendor == q->subsystem_vendor ||
 		     q->subsystem_vendor == PCI_ANY_ID) &&
 		    (d->subsystem_device == q->subsystem_device ||
-- 
2.43.0

