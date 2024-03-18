Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F8EC54E69
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6A210EC36;
	Mon, 18 Mar 2024 09:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXLaX/cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA6410E868
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710754483; x=1742290483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lOK1AfZht+uAlcaEsNBJwsVPhcHvMnAVZnHAJgzff1U=;
 b=eXLaX/cuxJALL9UDdtkkljGRYzgjRrva/nMZedCPEHZtVVeh96TfdPSe
 yE08KY70biskIKZJR0zB71EKy1LshbAZVtgGFqUKxLmgVONE91Ra0/5Ko
 NoRqRSLQzxhorzYmUs+SU+S3Jk2T/IMIvqxWkJUvkHh8KQJQHN17IxKa+
 k+LFCz0xBSncGpi1D+XzjC5eFQJksynE1oe5HTcn6Qm+/7l8pGljyLxIk
 bxtkMFBu7abMYrOCodR6sirBBl+PsQZhTHMipArsKj8JasV6iQlqdSHOW
 iQT67tG+UUEzlI21RhhYOreGaASUe+ap+s+2LQNNvijbdzQS3AIU8760k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16103641"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16103641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13516926"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:34:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 1/2] drm/xe/client: remove bogus rcu list usage
Date: Mon, 18 Mar 2024 09:34:32 +0000
Message-ID: <20240318093431.21075-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

We use plain spinlock to protect readers and writers, so there is no
actual RCU here. Rather use the more appropriate non-rcu list based API.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 87c10bd7958b..59b01d838229 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -78,7 +78,7 @@ void xe_drm_client_add_bo(struct xe_drm_client *client,
 
 	spin_lock(&client->bos_lock);
 	bo->client = xe_drm_client_get(client);
-	list_add_tail_rcu(&bo->client_link, &client->bos_list);
+	list_add_tail(&bo->client_link, &client->bos_list);
 	spin_unlock(&client->bos_lock);
 }
 
@@ -96,7 +96,7 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
 	struct xe_drm_client *client = bo->client;
 
 	spin_lock(&client->bos_lock);
-	list_del_rcu(&bo->client_link);
+	list_del(&bo->client_link);
 	spin_unlock(&client->bos_lock);
 
 	xe_drm_client_put(client);
@@ -154,7 +154,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 
 	/* Internal objects. */
 	spin_lock(&client->bos_lock);
-	list_for_each_entry_rcu(bo, &client->bos_list, client_link) {
+	list_for_each_entry(bo, &client->bos_list, client_link) {
 		if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
 			continue;
 		bo_meminfo(bo, stats);
-- 
2.44.0

