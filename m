Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC5AEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 13:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FBB10E20C;
	Mon, 26 Jun 2023 13:58:47 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6641010E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687787923; x=1719323923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CDWOsk9DAen6MyAHpCxu17GqOVE+Yk3FNiKM9MoGJgM=;
 b=N03HpP/czce4FJf3+5JiOjD48RzIcv5bnYg4/n6z26G8U00ISGfyhq/Z
 UXZs7GLw2G0JuHfFrCv8Iwaw+HVy/1d3hVACLQ/t1i+v+4AmefGyKeJuy
 Vv9IQevQ+XZI62qdTRvMHO0plp6SWPoltDCGQRFJswQvUjo+q73XuSQn8
 42im85lybIN3hpEYFUfPCduTGz74SSY4LK9XHK5pIvVXeMxDWEsEjB505
 u4fxT8aiqhTqs4mscchGtm+D+/STdYBQCKvgfoaM7Cdq3zIiSTUMLEJYS
 FZEv3k0hReITtnHP453kO8Fa61CJ6YEIhI42GOIRrCMeaq6FFMlosP0oj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364723169"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="364723169"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="716149406"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="716149406"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.105])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:58:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:58:24 +0200
Message-Id: <20230626135824.21984-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626135824.21984-1-thomas.hellstrom@linux.intel.com>
References: <20230626135824.21984-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 4/4] drm/xe/bo: Evict VRAM to TT rather than to
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

v2:
- Remove a stale comment (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230619152222.11733-6-thomas.hellstrom@linux.intel.com
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9444130c11e3..dfa0232b2e58 100644
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

