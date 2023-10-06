Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D2FE92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3E410E4E1;
	Fri,  6 Oct 2023 10:00:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9363B10E4DA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586420; x=1728122420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3nDnDGNUCS2pvUz7epUKzpdvPO+9I6yh+oHhIKBIAN8=;
 b=lCZVwNoytLkxcWXeVtHG6pxJxRu0PCc1C5m//06RCqquF3DMKejMS9kx
 2BGzmu1aAAeR6LERtUgRPNy3JgXtdOKepcOr8lG7EHKyrZ6l7tR6F5jSk
 iMyvyYJnv4KYWulgf+eAE7X/T8s78uL2XAeS55qaQmL+1pSO+NXWUX11Q
 jUGuZtugZJP3BbdpIUjCq9K/q9N9t6WtrpQLHBSQEZC8i9Uk4En9OTYh0
 WKtEkzxXGPA9mKhxCFTx3J4e1B1GZ64wrkAV48WtnaAyhdHTqFdiLrtJU
 gHVskb5wPRD2HMoux3i4u1A2huuxZlDkRy2qZR8rv7uofstaxy+qUfGWT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907209"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815998"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815998"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:18 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:41 +0000
Message-Id: <20231006095943.7-19-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 18/20] drm/xe/uapi: Remove unused field of
 drm_xe_query_gt
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

We already have many bits reserved at the end already.
Let's kill the unused ones.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 11bc4dc2c78c..538873361d17 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -352,8 +352,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/** @features: Reserved for future information about GT features */
-	__u64 features;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-- 
2.34.1

