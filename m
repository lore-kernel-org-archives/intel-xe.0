Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13EACCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 07:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9BA10E2DA;
	Thu, 16 Oct 2025 07:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A9aKjAjl";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91B610E02B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760601435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UuJewj/wMTo5t1P8oM57Pll0Ijh2caSnxHJ3chbbX8=;
 b=A9aKjAjlSQrDJH0fC/3XqyPQ3tGftwBMPRW5HEwexQs5PVho6o3eNWVRi4nRVkTBDQbUdZ
 RJpXDEPN41bThHTMG4Iw+WfbVTcZB5F8J3ym0NiOE+E8pKkWHjMA9XttLUyuxd/EKUZmHH
 JT5gMUgw6sdAwf/FVzVUsJAWFR21jKg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-rIDm3ARdOz6a-JrxCq1Zrw-1; Thu,
 16 Oct 2025 03:57:12 -0400
X-MC-Unique: rIDm3ARdOz6a-JrxCq1Zrw-1
X-Mimecast-MFC-AGG-ID: rIDm3ARdOz6a-JrxCq1Zrw_1760601431
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 23B161800451; Thu, 16 Oct 2025 07:57:11 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.133])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E86EA300019F; Thu, 16 Oct 2025 07:57:08 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Extract xe_bo_is_visible_vram
Date: Thu, 16 Oct 2025 09:52:30 +0200
Message-ID: <20251016075701.379023-2-jfalempe@redhat.com>
In-Reply-To: <20251016075701.379023-1-jfalempe@redhat.com>
References: <20251016075701.379023-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yzL105N-ZXNRkuo9wzHiQ54C7gWCiSY_8KITPXAteIs_1760601431
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

From: Maarten Lankhorst <dev@lankhorst.se>

This will make it possible to call from xe_display code.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4410e28dee54..c1b9c84dd4df 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -580,6 +580,23 @@ static bool xe_ttm_resource_visible(struct ttm_resource *mem)
 	return vres->used_visible_size == mem->size;
 }
 
+/**
+ * xe_bo_is_visible_vram - check if BO is placed entirely in visible VRAM.
+ * @bo: The BO
+ *
+ * This function checks whether a given BO resides entirely in memory visible from the CPU
+ *
+ * Returns: true if the BO is entirely visible, false otherwise.
+ *
+ */
+bool xe_bo_is_visible_vram(struct xe_bo *bo)
+{
+	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
+		return false;
+
+	return xe_ttm_resource_visible(bo->ttm.resource);
+}
+
 static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
@@ -1605,7 +1622,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
 		return -EIO;
 
-	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
+	if (!xe_bo_is_visible_vram(bo) || len >= SZ_16K) {
 		struct xe_migrate *migrate =
 			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a77af42b5f9e..431c4d536f9c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -273,6 +273,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
 
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
+bool xe_bo_is_visible_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
 bool xe_bo_is_vm_bound(struct xe_bo *bo);
-- 
2.51.0

