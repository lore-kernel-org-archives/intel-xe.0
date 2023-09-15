Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD58EE6433
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BAB10E5D1;
	Fri, 15 Sep 2023 07:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8890C10E5C9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764147; x=1726300147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E0en4MHuuY+Vj7jm/8F9GTpTDSXF9TxlFi0XavF7Hmo=;
 b=nzf7/03MBbY53H/VA6nTkomqZy7sinByoIIIbkZd6fXEXsEMhswr4hrO
 4uxZlVg4mzfVc4+yPbolaV499kDv6jfLXDLqtWBV2p1lncMmjeioMvK1d
 hJA22DzyYjD95Gy3Ch92PMNAscZXmei5M8eaGxx/vpzcZp8NYhUf72Myh
 VI5bVv6YsODbnSKjvqL1BkQa65i1r/cXxcVQfNickhukLXKoD+4vl4O+y
 okvisuknGoPln+GdgcDHorLH8OjGLiRkaNK8ESFbeiAgJkGALjryo+5nh
 9PqOp/kC/ncXpjtlZ67rNO4/pcX+oJMKxFLeZnMH1lSrXIYjVMy3lNTmN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507588"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507588"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711632"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711632"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:42 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:15 +0300
Message-Id: <20230915074818.903353-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
References: <20230915074818.903353-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/i915/psr: Clear frontbuffer busy bits on
 flip
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are planning to move flush performed from work queue. This
means it is possible to have invalidate -> flip -> flush sequence.
Handle this by clearing possible busy bits on flip.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230901093500.3463046-3-jouni.hogander@intel.com
(cherry picked from commit 35a97f56d6ccf1870e666fb6efa12a7ec201b9e4)
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 60b486299834..b3d3f002d908 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2231,6 +2231,12 @@ static void _intel_psr_post_plane_update(const struct intel_atomic_state *state,
 		if (crtc_state->crc_enabled && psr->enabled)
 			psr_force_hw_tracking_exit(intel_dp);
 
+		/*
+		 * Clear possible busy bits in case we have
+		 * invalidate -> flip -> flush sequence.
+		 */
+		intel_dp->psr.busy_frontbuffer_bits = 0;
+
 		mutex_unlock(&psr->lock);
 	}
 }
-- 
2.34.1

