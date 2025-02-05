Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0019C02197
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 05:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A9310E181;
	Wed,  5 Feb 2025 05:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPVymJNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992D510E181
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738732460; x=1770268460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4I8g7EnnCHnNclNFsPvk1b+4uiTIAPjPMuMxmX3UKLE=;
 b=gPVymJNp/PUdRxxlxhUPgc0mfO1f6TLB8FTdsDq7EvY5gKadglT2a10s
 eq5j2CcQDGpfw33+4WnAqTI+ymfWSfI4zq8CvmV0O7pw5mC0gEpwr9qW+
 N7BxaV6EkrZYIGFi+o9RQcsVSdzp3iXS/Lhs4f+Xi0Gb52raQ6NGGGoIE
 fu5YtKEo4IZYmLp5KPP53W9Qm1dOsnEjAe/vd/SUWATMqCUw1UH1AKsLs
 IPgfhAfSZprTDYy/6AEqpXaXd93ZAKLvGbukm+52H+CtlY37xE3nUW3VT
 NI0LaHMNCyoBt5afPqZQ7mXH5w4CN1NAon18MHny8dtDpUf86uCB5k+hg Q==;
X-CSE-ConnectionGUID: Bdp7LHzPQp2ocCeTpdZ8Jg==
X-CSE-MsgGUID: rvlx59FtTiC4stdsoa/Hrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39183785"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="39183785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 21:14:19 -0800
X-CSE-ConnectionGUID: 91ZpK8oUTAifsc5n3+Hh3g==
X-CSE-MsgGUID: Ah1Dit/RTcaStu1xkJ5I7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="111335991"
Received: from ayaz-z790i-aorus-ultra.iind.intel.com ([10.190.238.64])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 21:14:17 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe/client: bo->client does not need bos_lock
Date: Wed,  5 Feb 2025 10:40:42 +0530
Message-ID: <20250205051042.1991192-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

bos_lock is to protect list of bos used by client, it is
not required to protect bo->client so bring it outside of
bos_lock.

Fixes: b27970f3e11c ("drm/xe: Add tracking support for bos per client")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 63f30b6df70b..2d4874d2b922 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -135,8 +135,8 @@ void xe_drm_client_add_bo(struct xe_drm_client *client,
 	XE_WARN_ON(bo->client);
 	XE_WARN_ON(!list_empty(&bo->client_link));
 
-	spin_lock(&client->bos_lock);
 	bo->client = xe_drm_client_get(client);
+	spin_lock(&client->bos_lock);
 	list_add_tail(&bo->client_link, &client->bos_list);
 	spin_unlock(&client->bos_lock);
 }
-- 
2.43.0

