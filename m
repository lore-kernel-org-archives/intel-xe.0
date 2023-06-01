Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA5BC7EE2D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EA510E525;
	Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1791F10E519
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577855; x=1717113855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5fDhHPN6QXeorzqMtVk5Bb2Z8D1VCJLAifQSIzAF4H8=;
 b=LkWojU1MwK6/HTX0Gn3cdkat1LwfRMkLTtNBcMKRPiBkd3T0MTdDogwV
 2pmX97UBPg3Bk+emCeV18ril61/QezgnK1U2AVRdUq9th5BPckOTUgpsR
 NcvXhIBGmPxorxLoBey9E9NaQVpds5wxW9yJiE//JEAsyg6Q694x6Q2gI
 zlrfSDQZ+c4eFvTNR3vdsR6AUExrG52KslBdmikphHqWjMAJC+xxKfZ0M
 Su5vKI+ej5DGKlXqOVlL/tVc8SO7OHLVIF7dYNUz4fGM801lRgPu/AqZX
 6NFF/5q33DxIKeN15S1qMlun+9Rx+ECCQP2eaoe7VXFBjFTfxQcSZQCCM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996851"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996851"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556214"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556214"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:51 -0700
Message-Id: <20230601000403.432517-20-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 19/31] drm/xe: Add media GT to tile
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

