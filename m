Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8CAC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 21:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6E010E3FE;
	Tue, 27 Feb 2024 21:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nq8Lvhx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5100610E4D4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 21:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709067622; x=1740603622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/MCmD6qL+G1CmdcEq1CJWDPJ27NcmLHmOhrVHtt/R0=;
 b=Nq8Lvhx+bV03yDJfDKvjyxktDLpJEYhg1ua3egK21f71ojTnVVsq4tB/
 17hBm1Pu0LLUYlv21lOeAxaDPa51O+15XkhkFq+fblbIGphBN+K130jI4
 xAEGCAKC0YDwXhijye3PwJEgot8/Z0JhgbgwyszHYSCBJjJrV4vIv9Gyf
 C4X7tyWnvK57GjZDfZIk5z99jmxMT1L5ogkotSIF4tXgsr5G0QClEQeSl
 AYWobGW9w6/DdLasaOxle6encDpqYM85dy3KQlBXlB8sr6+hW1d59nVNG
 +u5vXjJgyyodMfiiGZzPSgE8qgZcqTxYscqfKnOoRLgJaEwjX8mc6dubJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14858453"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14858453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7150434"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:20 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 4/4] drm/xe: Increase devcoredump timeout
Date: Tue, 27 Feb 2024 13:00:08 -0800
Message-ID: <20240227210008.182904-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227210008.182904-1-jose.souza@intel.com>
References: <20240227210008.182904-1-jose.souza@intel.com>
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

5 minutes is too short for a regular user to search and understand
what he needs to do to report capture devcoredump and report a bug to
us, so here increasing this timeout to 1 hour.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3fef81396fe8a..f1a8ccbed7f13 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -52,6 +52,8 @@
 
 #ifdef CONFIG_DEV_COREDUMP
 
+#define XE_COREDUMP_TIMEOUT_SECS (60 * 60)
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -232,6 +234,7 @@ void xe_devcoredump(struct xe_sched_job *job)
 
 	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
 		      xe_devcoredump_read, xe_devcoredump_free);
+	dev_coredump_timeout_set(xe->drm.dev, XE_COREDUMP_TIMEOUT_SECS);
 }
 
 static void xe_driver_devcoredump_fini(struct drm_device *drm, void *arg)
-- 
2.44.0

