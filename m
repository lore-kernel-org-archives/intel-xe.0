Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E28CCE79B1
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150D10E3D3;
	Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ADE10E24F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140181; x=1726676181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/5UIxTtAWPZ9TMW5OJVJei/mR+FC7+tQL0693WdFF9E=;
 b=OXnjYpUhx2uU3V7TR31tmTPm7Ifx76i8gCgFJUSKQjDlMgfQzv7Prt7y
 CgyieAwrZD/uE6oFsXtTnp9rSY/eSYEbEKLobCtQTG0H7dTQZCIdrIYDN
 f7f2A0gLfm+lh7PL0hCCl7lYKniDmxCy22atJtHGN+1vKpXgcWuqRnlNt
 rKP5H1lcPWmPDLM4VgXlZkdBPGZX1xXWjZlUTuLJzrlwONIJ6WGp1F0e0
 Zoa4ksB61ygS2ZoFuKPBJusng8w4xTsXmQofRG9xfIEPvxDMMfSbMGp13
 WtZBr6jtQO7ZAIteKsU10K2Lt0nkolhJ5/RASHUfAemtUl0B3SKXkY3Ks Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913580"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913580"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016557"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016557"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:47 -0700
Message-ID: <20230919161049.2307855-20-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/21] drm/xe/uapi: Drop OA_IOCTL_VERSION
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

OA version was previously used to track which OA properties were introduced
at which version. However OA version is an outlier in that a similar
version is not used anywhere else in the kernel.

For XE, we will track addition of new properties by means of
xe_user_extension. Userland can either maintain a mapping of OA properties
against the kernel version, or rely on return codes (e.g. ENOTSUPP) to
"discover" OA properties.

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c    | 5 -----
 drivers/gpu/drm/xe/xe_oa.h    | 1 -
 drivers/gpu/drm/xe/xe_query.c | 1 -
 include/uapi/drm/xe_drm.h     | 3 +--
 4 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 077698a0c5628..7cb900fc88f58 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2331,11 +2331,6 @@ static struct ctl_table oa_ctl_table[] = {
 	{}
 };
 
-int xe_oa_ioctl_version(struct xe_device *xe)
-{
-	return 1;
-}
-
 int xe_oa_sysctl_register(void)
 {
 	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index cc6f64bc24ddf..c5a2745ab7cfe 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -12,7 +12,6 @@ int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
-int xe_oa_ioctl_version(struct xe_device *xe);
 int xe_oa_sysctl_register(void);
 void xe_oa_sysctl_unregister(void);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ad280bac9eed4..8246ce4e24ce5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -202,7 +202,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
-	config->info[XE_QUERY_OA_IOCTL_VERSION] = xe_oa_ioctl_version(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3b106bed42ea6..b0563cfc351ee 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -259,8 +259,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_OA_IOCTL_VERSION		7
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.41.0

