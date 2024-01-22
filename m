Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A489C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784710EF8E;
	Mon, 22 Jan 2024 21:17:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57A810EF87
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958245; x=1737494245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ENxuc2/DBPp6ziqo09xnbfIu4TwV2yq2DENVo0DoxKs=;
 b=d49AYLA55mhX7YOuDdfURYvy/+IiPvMoVXogAhnWiIQOoEROA2wA5FlO
 9JBcfjgO4++3w3g9LkNbl2p96TUmXMphs/cHmsWdMy+KVWQHKjCA3keHV
 j7bTl/03bS52f528SMJ1hKY57NuRzvWv74W4WZVHCSX/toZI2lDLEpoHS
 EWnXmIB06Dp8suszPnlhqmx4hFYr6DrdFcCjlLLLhh1dqb+XTzvi8Wb8+
 wwGU4TYiCrXTrzTijMKidADu7011TWsp4ky2whQm7NWA6/cuIn/xvPm4l
 c9ySfXmr+W5Y69DJXjXVCfm8mFovCO6hZkiQ05ejQ1mDmdourMdhoGV3t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432486560"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432486560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27495065"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:24 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/xe: Nuke xe from xe_devcoredump
Date: Mon, 22 Jan 2024 13:17:05 -0800
Message-ID: <20240122211709.224419-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122211709.224419-1-jose.souza@intel.com>
References: <20240122211709.224419-1-jose.souza@intel.com>
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe is never set in xe_devcoredump but if xe_device is needed
devcoredump_to_xe_device() can be used.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 9a12959ed6b14..d259119b2c980 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -47,8 +47,6 @@ struct xe_devcoredump_snapshot {
  * for reading the information.
  */
 struct xe_devcoredump {
-	/** @xe: Xe device. */
-	struct xe_device *xe;
 	/** @captured: The snapshot of the first hang has already been taken. */
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
-- 
2.43.0

