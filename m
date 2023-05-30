Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFAEC77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942810E450;
	Tue, 30 May 2023 21:16:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F5610E436
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481368; x=1717017368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ga7ssFBmADzMlmFBhQ2Wgi9o/xrY6r1gZcLUCF3P+Ec=;
 b=CMfr3+IfFj16XmFetLoY7c77Kyq3pNhoxCo1xv9M0Gl+hykAmdrLiuM8
 x+BhOZYpqKqUCAanu9cB6rBuj3wncfid2vXUwGnTOh14PYCZIW4lh57Fa
 RDNDgT1GdTNK+OznRwPwZ0Qi7QKVfe9qgVSLVwhf6si/QNLkVwoRxWZvM
 gGyHXXk1XNjoqMfnjxfaWrJTAJvN137G00BYtFHmDDTaNQ64j5OIopk67
 qlJLGwS0J225GwAq7DzpTSH/q4kViCwOoLluEPE0luS026nq0SLUgIi1w
 nPtZTgZp05/ECxo8WXo8ZlISQS1B+gaf3Xps7zLUdo1X7qjrVa723OFQo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311942"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311942"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139411"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139411"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:29 -0700
Message-Id: <20230530211549.2632538-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 11/31] fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 41540b27775c..39dd97acae08 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -51,7 +51,6 @@ static struct xe_bo *
 initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
 {
-	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo;
 	resource_size_t phys_base;
@@ -84,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= gt0->mem.vram.size) {
+		if (phys_base >= tile0->mem.vram.size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
-- 
2.40.1

