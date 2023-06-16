Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A6CEB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DAD10E59C;
	Fri, 16 Jun 2023 09:55:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3C210E592
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909349; x=1718445349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1q/b2D/RSxOSOKB7ahvjl+OmBZthb2JbQl1s4zWYwhY=;
 b=kT7c2rEhr5P8AfxSPGd6Tz+WHc7cyVNUxRlP9lFDZREYeKh6ZVuVMIQ1
 XVq6F9Vc49IW/LF3VqMZ4oGS4nJlID8TObaS3akSxlS3pAQ2NMEboD8j4
 JHk4XuAxG8/tVvFxUldzufY0j0p8EpxeKBnryYywGvDRVN9SN7E13w+2Z
 YwtFWzVSQSl/elF6hKEmjtN2bfmotC+zvvAHBO+BdsEdLkvsyrX1v12R2
 CSRAEMNDuQtvij+HLDZ0JoQa0gy3TrB9voG3zEgytj0z/nk+8S91osbpi
 BnZwcFkZcMLawZAHTysy4e68B5V3jq+nvoJDDM51j8ANuP92VaGVLdzsI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343916580"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343916580"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959557841"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959557841"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 11:55:03 +0200
Message-Id: <20230616095504.17084-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe/bo: Evict VRAM to TT rather than to
 system
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 77d5c5710688..fd41114f2dfb 100644
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
@@ -225,6 +239,8 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
 	case XE_PL_STOLEN:
+		*placement = tt_placement;
+		break;
 	case XE_PL_TT:
 	default:
 		/* for now kick out to system */
-- 
2.40.1

