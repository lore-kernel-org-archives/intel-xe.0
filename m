Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2340D43343
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 20:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EF510E12C;
	Thu, 11 Dec 2025 20:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTJ4C8Qk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965F110E12C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 20:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765485964; x=1797021964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jidKo+6sKoFDfhvbisEa1dHhnLccbHw6UfUdlKOnaL8=;
 b=CTJ4C8QkadPcTesNzQ+/Xzvq28DBrcaRNeJ1+B+jERXNSAsqbDJl2lHc
 91aw2Ire/rka9Q2vCyPvSXH/zE+YLe2lL6RttT+EmoV0fJZ8ilMxYwFzc
 VSVP8lJZerQ+Wy3TNPBKCJaCmyunzjMEt3NXhXXluG2VovEQdJ9svpZd+
 jc5TdeliiHyYOcJc6hCbzL+ngOutQAJGpFgq+Qkp/lHku2dfSiV2p2YAM
 t8XAvdOX7rrKBONgYqZRtma0kj0ZAck/swcPO1ruSzka7F5hAeIBWSgOp
 fJzXIcVH/O8Nf0WkLK8RsOTHKF0IeMK1rhkFeiMuxjqH9kXWu6FVe59bM g==;
X-CSE-ConnectionGUID: 0Ldt8fHxR8eONYuYS+88hA==
X-CSE-MsgGUID: zatwbf1iT4eX89FeXn0FGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71345701"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71345701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:46:04 -0800
X-CSE-ConnectionGUID: gSzEJS6MS2CRZpk2B5fIrg==
X-CSE-MsgGUID: g4P+mRJVRHaFwjk3QZwXAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196799546"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:46:02 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, stuart.summers@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] drm/xe: Increase TDF timeout
Date: Fri, 12 Dec 2025 04:45:43 +0800
Message-ID: <f95d5884e2ed41aaabd83c319c96d309442679c2.1765485659.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.52.0
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

There are some corner cases where flushing transient
data may take slightly longer than the 150us timeout
we currently allow.  Update the driver to use a 300us
timeout instead based on the latest guidance from
the hardware team. An update to the bspec to formally
document this is expected to arrive soon.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef77..db2f04e1e60e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1050,7 +1050,7 @@ static void tdf_request_sync(struct xe_device *xe)
 		 * transient and need to be flushed..
 		 */
 		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
-				   150, NULL, false))
+				   300, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
 	}
 }
-- 
2.52.0

