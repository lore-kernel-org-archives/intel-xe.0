Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF91C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD9410E3BD;
	Tue,  7 Mar 2023 09:25:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4110E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gaE7n/oCN6KACxSP6yuU/cngaU4OVUhlKpD/gnihyfs=;
 b=R+I0cvK4Clmqbln2aN2DwVU3B4K1GRZuEgcI+XSAapHbxZXyFDCerR32
 pjAYGLF7OECW9rNC24BHNUpWlQCX+zzo1AcD7fRQ6mixuX5tNk2Mz4tKB
 qpeqV7g72rudcS/WHQFnee/3L0QKkbN2IOmmmlVy2VEAEKHZvfqRntM2Z
 taizfxbDM4XYR2Qxtc2n21PblsiGtPJ1nC63QmzFl1mMGMciPdzQbT5EV
 /NvrUEwzWKpHMPFo4ZcGMeEsGhtUCreMcWRPdqN21hUugFvhJJzf63z33
 AE3RzeNiYg8vv0ttUEIbhEjWve+ImTQu+qHm3iDwucwB0M1fLTXHzPEAw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079119"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079119"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798814"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798814"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:35 -0800
Message-Id: <20230307092446.1263266-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/19] drm/xe: Remove dump function from reg_sr
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The dump function was originally added with the idea that it could be
re-used both for printing the reg-sr data and saving it to pass to GuC
via ADS. This was not used by the GuC integration, so remove it now to
give place to a new debug.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c       | 26 --------------------------
 drivers/gpu/drm/xe/xe_reg_sr.h       |  2 --
 drivers/gpu/drm/xe/xe_reg_sr_types.h |  5 -----
 3 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e4eb18332a9d..194a5060f1b3 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -43,32 +43,6 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, reg_sr_fini, sr);
 }
 
-int xe_reg_sr_dump_kv(struct xe_reg_sr *sr,
-		      struct xe_reg_sr_kv **dst)
-{
-	struct xe_reg_sr_kv *iter;
-	struct xe_reg_sr_entry *entry;
-	unsigned long idx;
-
-	if (xa_empty(&sr->xa)) {
-		*dst = NULL;
-		return 0;
-	}
-
-	*dst = kmalloc_array(sr->pool.used, sizeof(**dst), GFP_KERNEL);
-	if (!*dst)
-		return -ENOMEM;
-
-	iter = *dst;
-	xa_for_each(&sr->xa, idx, entry) {
-		iter->k = idx;
-		iter->v = *entry;
-		iter++;
-	}
-
-	return 0;
-}
-
 static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
 {
 	if (sr->pool.used == sr->pool.allocated) {
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index c3a9db251e92..9f47230c8ddc 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -16,8 +16,6 @@ struct xe_device;
 struct xe_gt;
 
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
-int xe_reg_sr_dump_kv(struct xe_reg_sr *sr,
-		      struct xe_reg_sr_kv **dst);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
 		  const struct xe_reg_sr_entry *e);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index 0e6d542ff1b4..3d2257891005 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -23,11 +23,6 @@ struct xe_reg_sr_entry {
 	u8		reg_type;
 };
 
-struct xe_reg_sr_kv {
-	u32			k;
-	struct xe_reg_sr_entry	v;
-};
-
 struct xe_reg_sr {
 	struct {
 		struct xe_reg_sr_entry *arr;
-- 
2.39.0

