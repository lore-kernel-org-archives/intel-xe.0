Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C1C64EC7
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8710E21E;
	Wed,  1 Mar 2023 09:31:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0011710E0B7
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663107; x=1709199107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gaE7n/oCN6KACxSP6yuU/cngaU4OVUhlKpD/gnihyfs=;
 b=F1kAs6nh/hwUu9BYD682NhzfrWEFpV7z4Zkl8IXH1HqP+5+euDCQ6uke
 IiGHLjsgwpGlklKFpNlHkYd9TJ8Hx63TBIpo89CMoYRvBVzwY6T88Ygc9
 BwPSA7N1nipoyzNKIh0XJ9ure1KursjZts96b1f2hHaIsVVd+2uZS3VDO
 TsF9n5igZkljX85hgWfnP4f5WpU6fHWEDu3yGRojgD3agarLsNVGFBY9e
 jEQqjZAyQ/qqpmvTxfvsOz0qowIJbpUD7jzdbgYriD8s3gZ/6I/ahDy5S
 TulGgZhkSS3EQzSbzo3gET43Er7yix/mwcL40LLGO1f/s7CsT6Hu6JDIN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333091755"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333091755"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003600481"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003600481"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 01:31:08 -0800
Message-Id: <20230301093112.2893689-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301093112.2893689-1-lucas.demarchi@intel.com>
References: <20230301093112.2893689-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe: Remove dump function from reg_sr
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

