Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD9C87FE2
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CA010E445;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1AE10E439
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481370; x=1717017370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5fDhHPN6QXeorzqMtVk5Bb2Z8D1VCJLAifQSIzAF4H8=;
 b=VpihnutFc1mCsJu/F6ZdKVnfrXhoz5e7yB4mr2/usyRXgjNBKTUXWb/D
 n2Gc0DsHFVdW6fcjeOilgUAJPiqzG2afzdTtSQRfqDw6bKP5IRiWJYxeT
 RdeI2IHbruOH8f5MyR32VCvVzT5TMMTFilvJPHj7xJBkXVODhn9J0r1cn
 5Srkpj1v/tsQJV71LoVX0fp0K3A9IwmfxX53ZQQ8anc8NyfSLZvbTKRZO
 qa/qs2aYAGeyBt/gFFI3FJSfw2bd5TV9jEnIt45mfDwb/TI3VvtT+WZIq
 bxp0pF+TTtYlEyGoPAl6/mQUAIwNITfJnFm28ZBiFM7v9W1q2R/nis2YY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311957"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311957"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139449"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139449"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:37 -0700
Message-Id: <20230530211549.2632538-20-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 19/31] drm/xe: Add media GT to tile
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
index e6af89e940a1..da553878448d 100644
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
2.40.1

