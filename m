Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F30EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 15:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CB110E21D;
	Mon, 19 Jun 2023 15:22:44 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF2510E21C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687188161; x=1718724161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlKpL/U1Q3C/h6d/9E0NCHvTZzIHvvZ3tSIzVkSmgCk=;
 b=jD2mSamSqiC6ojUbfsXc9eZo3xiCIwCXb6KWP76bcPAbf7e7YGj4loxk
 nAcUj9+PnrUo3nKIfY4PRaDhoUsj7eMrossQCtHsYotLioFn0fxsnW1tu
 VQN4qzt6svqLIq+d9KoNUfvf6F6uEDZLC46qXiDPEifQ50oHaFs0XpD+k
 OWEYyZWIxpYf1b8YPRIx4NqwC8s0NyzBHp3IhrLjS6A/20NNHN3qCvOFp
 dCtA3CMM06/W9Ke+Eg6Q0gXf8xNhx/YPKv+1h/CeAteBuGTiRlzw+/ra3
 EMtpZpU85L8V4HMfXDVanGVGhSlzBNjXYJa34us9RFdj01Wp1YAg5AMUS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349381555"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349381555"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858250601"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="858250601"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:22:20 +0200
Message-Id: <20230619152222.11733-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/6] drm/xe/bo: Gracefully handle errors from
 ttm_bo_move_accel_cleanup().
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

The function ttm_bo_move_accel_cleanup() attempts to help pipeline a
move, and in doing so, needs memory allocations which may fail.

Rather than failing in a state where the new resource may freed while
accessed by the copy engine, sync uninterruptible and do a failsafe
cleanup.

v2:
- Don't try to attach the signaled fence on ttm_bo_move_accel_cleanup()
  error.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cfbcc071f2ef..c95fedc22fdf 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -700,6 +700,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (!move_lacks_source) {
 			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
 							true, new_mem);
+			if (ret) {
+				dma_fence_wait(fence, false);
+				ttm_bo_move_null(ttm_bo, new_mem);
+				ret = 0;
+			}
 		} else {
 			/*
 			 * ttm_bo_move_accel_cleanup() may blow up if
-- 
2.40.1

