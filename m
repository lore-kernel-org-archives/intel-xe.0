Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965F7CAC5B2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C037F10E692;
	Wed, 24 Sep 2025 01:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJxEClCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D0010E691
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676569; x=1790212569;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cX2WjujoIMmoMi/HaDffSROIUMuhS4IIaYzguvx5+Zw=;
 b=jJxEClCjCwHKzf++BkuBS5TPRGGibFVva/1NeEP6DZhi7IN+nEyhNLxQ
 UfXx31x9QZfTdwhIkGi1xD4Q3GOQFz2+kuSD2m+up6/Yq3E0OoWijiJMM
 tbzTCwRCK9qWOuHnurD5zP0e53ry8+pPHMDzvRL1nxC+gJ4Wk2R7gjJ8W
 J0ZWrc9MpPzFXjcFKr/q1OrYB4qQs9D6D34IgaiUVmYFZuE9QCAknsV8A
 +rw+D2bdPThnFpJO+kBpl0/RMNqK5pegseF6rPAfp/M8bkG18k4NXW1iZ
 r6EBiXRWC32ll0Q/tCH4MCWSKz6po+J+rH3/l/Y/vSyviTM27V1CMi9PS A==;
X-CSE-ConnectionGUID: D5PuEx05Tc+25LH/6NhpaQ==
X-CSE-MsgGUID: ZCKsKMYxStmzJhbL10ICWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908254"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908254"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:08 -0700
X-CSE-ConnectionGUID: GUkUBMOvTlqx/3aWJd4aNw==
X-CSE-MsgGUID: GvBvfPKMQGqNx/6GMOhtlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841789"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 09/34] drm/xe: Make LRC W/A scratch buffer usage consistent
Date: Tue, 23 Sep 2025 18:15:36 -0700
Message-Id: <20250924011601.888293-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

The LRC W/A currently checks for LRC being iomem in some places, while
in others it checks if the scratch buffer is non-NULL. This
inconsistency causes issues with the VF post-migration recovery code,
which blindly passes in a scratch buffer.

This patch standardizes the check by consistently verifying whether the
LRC is iomem to determine if the scratch buffer should be used.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 47e9df775072..aed0a3155d1f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1248,7 +1248,7 @@ static int setup_bo(struct bo_setup_state *state)
 
 static void finish_bo(struct bo_setup_state *state)
 {
-	if (!state->buffer)
+	if (!state->lrc->bo->vmap.is_iomem)
 		return;
 
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
-- 
2.34.1

