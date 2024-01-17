Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8883C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A755310E6D5;
	Wed, 17 Jan 2024 13:41:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5530910E6D8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705498876; x=1737034876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CnZL/M47SVmDtVQ5R/1aFZ42nJ4dphBHsXZuloZhH+M=;
 b=YD/Sxz2Y0YiETo0HE/8xImF4LE24DhoPfanCGDKHj3dE2HTOFHHFDG6t
 I1d7bepQKLO5Zc5AjReEbu3NaP0Wk4rxTBpdBB91Wm3DKh7f2jfAJCbKK
 wmeWMb0ODz3p9VmW9r5EWm/1TGaG/dzWjk2CjPaBRTnj/5pDd4vK37B2p
 4gblrjAXxF1/lND08L/AE+v4TPwmua0MTpYbxq4LaGdjT2g7GmtsnyNaA
 S+4Et890jx56PWwC/rCo1jZDnwbOV+0sIeBFtYGElz+oO3nDA3vicyrnH
 ETYDp9ayn0I0L1bzT8StT4Q0Tw5MKc/u6JuxyXn4H97Pg0csh5s5gs+Dr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466549627"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466549627"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927831086"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927831086"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:07 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/xe: Annotate mcr_[un]lock()
Date: Wed, 17 Jan 2024 14:40:46 +0100
Message-ID: <20240117134048.165425-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These functions acquire and release the gt::mcr_lock. Annotate
accordingly.
Fix the corresponding sparse warning.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Fixes: fb1d55efdfcb ("drm/xe: Cleanup OPEN_BRACE style issues")
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8d..8546cd3cc50d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -480,7 +480,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
  * to synchronize with external clients (e.g., firmware), so a semaphore
  * register will also need to be taken.
  */
-static void mcr_lock(struct xe_gt *gt)
+static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int ret = 0;
@@ -500,7 +500,7 @@ static void mcr_lock(struct xe_gt *gt)
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
 }
 
-static void mcr_unlock(struct xe_gt *gt)
+static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
 {
 	/* Release hardware semaphore - this is done by writing 1 to the register */
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
-- 
2.43.0

