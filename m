Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4D1C2BD09
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 01:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631F510E0B8;
	Wed, 10 Jul 2024 01:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aW/g4202";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536F210E0B8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720574270; x=1752110270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LodFmqmPAGBsvOH6uRQq4g9s3paD8vjNvabeuQsbjCY=;
 b=aW/g4202zVknlaotoYoVq4dgvmn7x7q1caFCak2s+q/Kib/2P2k21VQt
 yMYxgRhbQ8BwU7mpy5NkYe7N0K3Dl6gwa2gIai7N/vA5pnrTMZ3Chy07u
 0gWe3vd4lEzwv8krEvjS/upqjN9L3H0zEjhG+in4wBeLUQv63FlEsBQHB
 oJ/2+lra2hx2mDazhZ3E91DtTCDmDGDlkWHZEj7anv8hfdj4ww649Huaw
 tqo3GSO34J3OqjquNQ3QvTkarKkCvxBOcn0tzpp10jFb6x1rcSIVru3TQ
 5tGDpCakQzaDEKahQNAoRuFtrBjgsFJY+0cGc+HStWrwxy30g9Zw640ZH A==;
X-CSE-ConnectionGUID: IygOyUIsRRmjfrXQrYLuXQ==
X-CSE-MsgGUID: ng3hheDzQvWy2h+4BxLgQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18006101"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="18006101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 18:17:49 -0700
X-CSE-ConnectionGUID: frkO7MqzSRWzyhsNYz7O/g==
X-CSE-MsgGUID: 0KuZS0q3S+OrjfKNnU18dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="48010528"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 18:17:50 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: [PATCH] drm/xe/oa/uapi: Allow OA config's to have arbitrary names/id's
Date: Tue,  9 Jul 2024 18:17:41 -0700
Message-ID: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Added OA configs were previously identified by means of a uuid. Rather than
forcing userspace to use uuid, here we generalize this scheme to allow
userspace the flexibility to use whatever naming scheme (including uuid)
they may wish to use to identify and track OA config's. Names must still be
unique or will be rejected.

Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 30 ++++++++++++------------------
 include/uapi/drm/xe_drm.h  |  4 ++--
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6d69f751bf78..4f00577e92b4 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -49,7 +49,7 @@ struct xe_oa_reg {
 struct xe_oa_config {
 	struct xe_oa *oa;
 
-	char uuid[UUID_STRING_LEN + 1];
+	char name[UUID_STRING_LEN + 1];
 	int id;
 
 	const struct xe_oa_reg *regs;
@@ -899,8 +899,8 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
 	/* Look for the buffer in the already allocated BOs attached to the stream */
 	llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
 		if (oa_bo->oa_config == oa_config &&
-		    memcmp(oa_bo->oa_config->uuid, oa_config->uuid,
-			   sizeof(oa_config->uuid)) == 0)
+		    memcmp(oa_bo->oa_config->name, oa_config->name,
+			   sizeof(oa_config->name)) == 0)
 			goto out;
 	}
 
@@ -1430,8 +1430,8 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto err_put_k_exec_q;
 	}
 
-	drm_dbg(&stream->oa->xe->drm, "opening stream oa config uuid=%s\n",
-		stream->oa_config->uuid);
+	drm_dbg(&stream->oa->xe->drm, "opening stream oa config name=%s\n",
+		stream->oa_config->name);
 
 	WRITE_ONCE(u->exclusive_stream, stream);
 
@@ -2066,7 +2066,7 @@ static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
 	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
 	oa_config->attrs[1] = NULL;
 
-	oa_config->sysfs_metric.name = oa_config->uuid;
+	oa_config->sysfs_metric.name = oa_config->name;
 	oa_config->sysfs_metric.attrs = oa_config->attrs;
 
 	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
@@ -2118,14 +2118,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 	oa_config->oa = oa;
 	kref_init(&oa_config->ref);
 
-	if (!uuid_is_valid(arg->uuid)) {
-		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
-		err = -EINVAL;
-		goto reg_err;
-	}
-
-	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
-	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
+	/* Last character in oa_config->name will be 0 because oa_config is kzalloc */
+	memcpy(oa_config->name, arg->name, sizeof(arg->name));
 
 	oa_config->regs_len = arg->n_regs;
 	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
@@ -2144,8 +2138,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 
 	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
 	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
-		if (!strcmp(tmp->uuid, oa_config->uuid)) {
-			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
+		if (!strcmp(tmp->name, oa_config->name)) {
+			drm_dbg(&oa->xe->drm, "OA config already exists with this name\n");
 			err = -EADDRINUSE;
 			goto sysfs_err;
 		}
@@ -2166,7 +2160,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 
 	mutex_unlock(&oa->metrics_lock);
 
-	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->name, oa_config->id);
 
 	return oa_config->id;
 
@@ -2224,7 +2218,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
 
 	mutex_unlock(&oa->metrics_lock);
 
-	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
+	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->name, oa_config->id);
 
 	xe_oa_config_put(oa_config);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19619d4952a8..43bcae64a7b0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1637,8 +1637,8 @@ struct drm_xe_oa_config {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
-	char uuid[36];
+	/** @name: Unique config name/id */
+	char name[36];
 
 	/** @n_regs: Number of regs in @regs_ptr */
 	__u32 n_regs;
-- 
2.41.0

