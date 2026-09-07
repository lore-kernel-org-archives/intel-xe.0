Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F93C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2169210E38E;
	Mon,  7 Sep 2026 09:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp6q0L7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6078A10E745
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774472; x=1820310472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hx/lCPsM1MKaeQuXOaVVDvlkHwQrfsActi+Xmw/E9Ho=;
 b=Kp6q0L7yTaElGgCHhrlsQUwSnb9jYr3NXqv8996oaTYQmhNJdVjXkVBi
 Uj10zYqD1UZjfAsZIsA6bpdaE33f2R7SnMShF4/izZU5VMQ4S+6boMMsB
 vIsRXFSU+LT6OtL7DIBjmMyGcUjg2vsLt2pCU8tuXrNhWjOD/IBnOQNuM
 kDUI2L3MIWDnSJJ9Lhx5yCobZMzG9bsr8DWG8Oi3/xH9pL/T2gYHjyEB1
 ZGRIKM0jLVQek5O2rga2OPDeX+YrBuBRGpqMd6J2M71NACrJBz2CgFC19
 NvCNHdqdJevc6F/P7yVfbTCIkFUFp9K85ZsRmBOOidSNjV8EErE1mKhmb Q==;
X-CSE-ConnectionGUID: rUYbPLSGQHmbeJvrmly4gw==
X-CSE-MsgGUID: /HgNCWvqSHefpJ+9BcIlgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100532046"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100532046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:52 -0700
X-CSE-ConnectionGUID: Le7AEzMQQPWBQ7YfUAdnJQ==
X-CSE-MsgGUID: x74Jel+nQQS27FYmOqTU/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274175778"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v2 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Date: Mon,  7 Sep 2026 15:17:10 +0530
Message-ID: <20260907094706.1407436-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260907094706.1407436-8-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
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

Add function to get maximum number of pages that firmware can store for
offline tracking. This will be used in sysfs while reporting bad pages.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c       | 4 ++++
 drivers/gpu/drm/xe/xe_ras.h       | 5 +++++
 drivers/gpu/drm/xe/xe_ras_types.h | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index b5b0c1a3a663..7058482e32a9 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -381,6 +381,7 @@ static void get_offlined_list(struct xe_device *xe)
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_offline_list_response response = {0};
 	struct xe_ras_offline_list_request request = {0};
+	struct xe_ras_state *state = &xe->ras.state;
 	u32 count = 0, total_pages = 0;
 	size_t rlen;
 	int ret, i;
@@ -412,6 +413,9 @@ static void get_offlined_list(struct xe_device *xe)
 		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
 			handle_page_offline(xe, response.page_addresses[i], false);
 
+		if (!state->max_pages)
+			state->max_pages = response.max_entries;
+
 		count += response.pages_returned;
 		if (!response.pages_returned)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 6e65443cd262..c411a6cb3731 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -27,4 +27,9 @@ static inline bool xe_ras_get_disable_page_offline(struct xe_device *xe)
 	return xe->ras.state.disable_page_offline;
 }
 
+static inline u32 xe_ras_get_max_pages(struct xe_device *xe)
+{
+	return xe->ras.state.max_pages;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index ca459e785add..9f23970fd5a1 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -423,5 +423,7 @@ struct xe_ras_set_health_response {
 struct xe_ras_state {
 	/** @disable_page_offline: cached configfs policy, immutable after init */
 	bool disable_page_offline;
+	/** @max_pages: Total number of pages that can be stored by firmware */
+	u32 max_pages;
 };
 #endif
-- 
2.47.1

