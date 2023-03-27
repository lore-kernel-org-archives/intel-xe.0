Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E42C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 17:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B9E10E3E9;
	Mon, 27 Mar 2023 17:34:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D300E10E3E9
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679938484; x=1711474484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rmg/P6YtcnFfdEpCboY56FmX9SyRJ5w0dntaSaS5nhk=;
 b=M2jtDWUQub3J0wkvDkKgAr0ZT67v/4/kcmlgzQ4VHJ4XxIiHFbW0KykE
 DIPrhs/10XZHgeOMgjfhnm45MJB1iywZDVYQW/QPl0YFhiFxZzz4H1R5V
 1hyxIyCfXiWRkjZUdhJM+R7O1/Moh3YWfNo6F1dnTeDm/Zj3hrOoAIOML
 xkoqgPNqTxh5vLwRwj36hETCNjayEeKp1wlAVEw3OALF5ukXyZOaeEW4F
 0CftcglzVF7jdsPdRnIEkubyunMJ2swzx4hn2TaP7llvlENBcGoFPTFCw
 lQSE0/xOb17jiEuQn+W9drGX3Fsjgb7r6UX6o6U7wXfau7w/MYHElRHZR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320737083"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="320737083"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="772799724"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="772799724"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:34:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Mar 2023 10:34:33 -0700
Message-Id: <20230327173433.2957645-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/pat: Handle unicast vs MCR PAT
 registers
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Somehow I dropped the error message when sending this; add it back.

To be squashed next time the Xe driver is rebased.

Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a713afdd0510..c860b2122301 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -94,5 +94,7 @@ void xe_pat_init(struct xe_gt *gt)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
+		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
+			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 }
-- 
2.39.2

