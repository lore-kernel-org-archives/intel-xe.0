Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F0C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CFC10E547;
	Fri, 19 May 2023 23:19:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE0F10E630
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538330; x=1716074330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5cfK8dz6pqt4Lp/o9l5e441/j7vYBTuVWsquZJLiVE=;
 b=a145jtDv6c7YSOemR1QWmM775DiCoT6wceAdFUKZSp0zAn0gBGLzKDaE
 NtDtP6YpOb/dg7RGvWzyR8xlV0H5EVAR5+cIl5MOv8CrIONvXzhUlvPnL
 xZ4skHRnZFArFapNlv1opZ28fTrJT95Wx11St9+gPaLr4CuBmdugVHVaX
 thcfAPu0Ucr47cb8lyXQ0QNSmKdPEGWJMfjs8C3R1FcmfG61CHOJgGOt3
 1CHuXfqcx5ZlhWCTpxKBwGYu3LOHoUgxdPGke8mBBl+2sw8ghIR4tndRo
 Th6dT4scOgzduEx+8zpKj/PmYxiAUsbcPACYK42rs4M70KOActTn/5A68 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526372"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526372"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888737"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888737"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:15 -0700
Message-Id: <20230519231827.3572452-19-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 18/30] drm/xe: Add media GT to tile
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
Cc: matthew.d.roper@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This media_gt pointer isn't actually allocated yet.  Future patches will
start hooking it up at appropriate places in the code, and then creation
of the media GT will be added once those infrastructure changes are in
place.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7fa473d85be1..76ac9bb99922 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -82,7 +82,12 @@ struct xe_tile {
 	 */
 	struct xe_gt *primary_gt;
 
-	/* TODO: Add media GT here */
+	/**
+	 * @media_gt: Media GT
+	 *
+	 * Only present on devices with media version >= 13.
+	 */
+	struct xe_gt *media_gt;
 
 	/**
 	 * @mmio: MMIO info for a tile.
-- 
2.40.0

