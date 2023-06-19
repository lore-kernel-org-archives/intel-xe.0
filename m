Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD24AEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 15:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C7710E223;
	Mon, 19 Jun 2023 15:22:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2CD10E21D
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687188163; x=1718724163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DGGFpWYfusS1uLTD1XLxGmSM0bqqoB3gdo9SgHg+V1E=;
 b=TLq/Wh7p22IXhr+zWeLhPkrDxmLwRQQbA79Z6paG46oyIpNdBg0RRvXP
 gfdmmKiXoNnLHoDDa75/c/TC2BBe5+BFuHHQZjQ9zb8EE3Uox7jJsGsWI
 tsmSswH6x6fFyjV88ImWGgks+KZSQsxnS4Pk4N2aqMR15UQtk7nCJrJlR
 EumAXxsmV6+Cmn/1IF6tVnIe2jWbw9oVRA2Lrgw+wm6OBXmCbuCTBsld+
 gdv3t52c7AN+OaP/qJNOViE7JwkptjLS1Zu13D8W45d2zefiO0eKHGOem
 eD8PXkICGpxwaoQM67YWu2oda/DRfiiuv2Y8ASyQuVWAtfice4k5NY2BW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349381562"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349381562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858250605"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="858250605"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:22:21 +0200
Message-Id: <20230619152222.11733-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/6] drm/xe/bo: Evict VRAM to TT rather than
 to system
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

The main difference is that we don't bounce and sync on eviction, allowing
for pipelined eviction. Moving forward we also need to be careful with
dma mappings which can be released in SYSTEM but may remain in TT.

v2:
- Remove a stale comment (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c95fedc22fdf..8f6496d2730b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -40,6 +40,20 @@ static struct ttm_placement sys_placement = {
 	.busy_placement = &sys_placement_flags,
 };
 
+static const struct ttm_place tt_placement_flags = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = XE_PL_TT,
+	.flags = 0,
+};
+
+static struct ttm_placement tt_placement = {
+	.num_placement = 1,
+	.placement = &tt_placement_flags,
+	.num_busy_placement = 1,
+	.busy_placement = &sys_placement_flags,
+};
+
 bool mem_type_is_vram(u32 mem_type)
 {
 	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
@@ -225,9 +239,10 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
 	case XE_PL_STOLEN:
+		*placement = tt_placement;
+		break;
 	case XE_PL_TT:
 	default:
-		/* for now kick out to system */
 		*placement = sys_placement;
 		break;
 	}
-- 
2.40.1

