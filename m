Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0350BC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 10:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22FD10E39C;
	Mon, 20 Nov 2023 10:17:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1210E39C
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700475434; x=1732011434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=31u7vNjk1xCKstxiYRg9UDU22XU1fxWi454izF1nWpY=;
 b=inYNMFIr92ShXCXoWRrK38EIeFUpfFlcw6jiD45YLbHjiRtBnrPHPMjp
 NJbRmikrDhCeD/YqG/sQ66yusk4/9NhTqqax03U+AWSii72EbVwPCElnv
 1tIo1Z/MGwd5wVr1odtcYWKsfflOTh74JCjWUYTICsfRnI1ZSbshJJdTC
 EBtd4qCH3qG1bTI8IZno1d/H2oXF7AFK2jNsznNpjbUrqI0fUMcyY8qXW
 o+4fHlf8RcXNZwfnGKa7iOF3Jf+6EvrmuYPUg/hM/D4xe7jc7BJZGlS16
 ZSkZxBO1QXcoI+Kd3OPdR53tAC72ec+b2fhEXzUK09+gTVu/RSdfcsUBa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388730698"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="388730698"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="769848889"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="769848889"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:17:12 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 15:54:20 +0530
Message-Id: <20231120102420.2527792-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] fixup! drm/xe/pmu: Drop interrupt pmu event
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

Interrupt pmu event was dropped in a previous patch
and the configs for the rest of the events were changed
in uapi header.

Change the configs in pmu file too.

v2: change to fixup patch

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 318bbc9c1c9b..c63b7f2fd8a8 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -353,10 +353,10 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *unit;
 		bool global;
 	} events[] = {
-		__event(1, "render-group-busy", "ns"),
-		__event(2, "copy-group-busy", "ns"),
-		__event(3, "media-group-busy", "ns"),
-		__event(4, "any-engine-group-busy", "ns"),
+		__event(0, "render-group-busy", "ns"),
+		__event(1, "copy-group-busy", "ns"),
+		__event(2, "media-group-busy", "ns"),
+		__event(3, "any-engine-group-busy", "ns"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
-- 
2.40.0

