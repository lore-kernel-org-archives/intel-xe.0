Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDA606A32D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=cszfzQWS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2A112406;
	Fri, 13 Nov 2026 12:43:55 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23BB10E7E4;
 Fri, 13 Nov 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794573826;
 bh=G+gNUw7+jDF5GThuk8K3MpfJv+LQzoYTTw+8Eipmftc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cszfzQWS991XGofY1SAw+k04q8nPx2wKZ9ZJSDFHBwC5sFreBKVyJiCOD/Y5qiIwT
 u0CR8xvrg6VAM3U4nh/4k3DyUow1jgkzHfBH8GUR4d+N7UtMvZNgRScbifYYSkYk34
 FQKYFaCjC2wvLb9FeYcW6IwQV70HrIT0GFslkOfcz8YTtwc63kY+wkJnZqvxWoZShh
 Gdzk9OuJ4jiDLWpc3eq/hljZjX0dSMdGS+C1cOstRJbNZ2CBS1T4wAkkTcNaKty6VT
 jlOTWQ84e74102yIpNCeI30lRFVbB+/J0iXucvLezblz0dd9WjRveupitaTbN2EGNU
 PkeiqF5G979UA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v5 2/5] drm/xe/migrate: Support copying between sysmem and
 stolen
Date: Fri, 13 Nov 2026 13:44:56 +0100
Message-ID: <20261113124453.144408-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113124453.144408-7-dev@lankhorst.se>
References: <20261113124453.144408-7-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In order to copy out the stolen BO, we have to add some support to
xe_migrate_copy, since otherwise it tries to use the VRAM identity
mapping on integrated, which obviously doesn't do the right thing.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 102c96d6cea9a..f3ec0343e4af3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -943,6 +943,10 @@ static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
 
 static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 {
+	/* Stolen is not mapped into identity mapping */
+	if (cur->mem_type == XE_PL_STOLEN)
+		return false;
+
 	/* If the chunk is not fragmented, allow identity map. */
 	return cur->size >= size;
 }
@@ -1248,6 +1252,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
+static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
+{
+	if (mem_type_is_vram(res->mem_type))
+		return true;
+
+	return xe_bo_is_stolen_devmem(bo);
+}
+
 static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   struct xe_bo *src_bo,
 					   struct xe_bo *dst_bo,
@@ -1268,8 +1280,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 	int err;
 	bool src_is_pltt = src->mem_type == XE_PL_TT;
 	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
-	bool src_is_vram = mem_type_is_vram(src->mem_type);
-	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
+	bool src_is_vram = is_devmem(src_bo, src);
+	bool dst_is_vram = is_devmem(dst_bo, dst);
 	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
 	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
@@ -1969,7 +1981,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst,
 				   u32 clear_flags)
 {
-	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_vram = is_devmem(bo, dst);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
 	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
 	struct xe_gt *gt = m->tile->primary_gt;
-- 
2.55.0

