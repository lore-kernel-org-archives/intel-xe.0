Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DD7C369D5
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 09:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B0710E8FB;
	Fri, 25 Apr 2025 09:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dhW4w7ps";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E23110E8FB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745574643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYjhwM5apjPM+EGUWiY9we9jpkzh0M4/37tZM60ipvA=;
 b=dhW4w7psB2asMfckUBgsXnStBDoUGWN8/XlVFXACdnzZ+CYZ3fbt/ToJDpPFJ7lCuYqjIE
 1zzYtN8D5pt2J9Smy7CHu4PuyWOCM7v1Qav9uH8sIviO9bU3ZGAarj07Nd3zg1PflnHeFl
 J5IteUbFSQcyLUSRi8JOMEsKExfc+i4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-byxLFKz6NQKrg-LCEFk2SA-1; Fri,
 25 Apr 2025 05:50:38 -0400
X-MC-Unique: byxLFKz6NQKrg-LCEFk2SA-1
X-Mimecast-MFC-AGG-ID: byxLFKz6NQKrg-LCEFk2SA_1745574636
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CE112195609D; Fri, 25 Apr 2025 09:50:36 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.172])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3EE18195608D; Fri, 25 Apr 2025 09:50:30 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v7 4/8] drm/i915/gem: Add i915_gem_object_panic_map()
Date: Fri, 25 Apr 2025 11:37:50 +0200
Message-ID: <20250425094949.473060-5-jfalempe@redhat.com>
In-Reply-To: <20250425094949.473060-1-jfalempe@redhat.com>
References: <20250425094949.473060-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Prepare the work for drm_panic support. This is used to map the
current framebuffer, so the CPU can overwrite it with the panic
message.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

---

v5:
 * Use iosys_map for intel_bo_panic_map().

v7:
 * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
 
 drivers/gpu/drm/i915/display/intel_bo.c    |  5 ++++
 drivers/gpu/drm/i915/display/intel_bo.h    |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 29 ++++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_bo.c      |  7 ++++++
 5 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index fbd16d7b58d9..a050242b4089 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -57,3 +57,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	i915_debugfs_describe_obj(m, to_intel_bo(obj));
 }
+
+int intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	return i915_gem_object_panic_map(to_intel_bo(obj), map);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index ea7a2253aaa5..7e2f3b7f6fec 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -23,5 +23,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
 						   struct intel_frontbuffer *front);
 
 void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
+int intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map);
 
 #endif /* __INTEL_BO__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a5f34542135c..c5c7325372d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -692,6 +692,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
+int i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map);
+
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
  * @obj: the object to map into kernel address space
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8780aa243105..92a3dbcb7909 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -355,6 +355,35 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	return vaddr ?: ERR_PTR(-ENOMEM);
 }
 
+/* Map the current framebuffer for CPU access. Called from panic handler, so no
+ * need to pin or cleanup.
+ */
+int i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map)
+{
+	enum i915_map_type has_type;
+	void *ptr;
+
+	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
+
+	if (!ptr) {
+		if (i915_gem_object_has_struct_page(obj))
+			ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
+		else
+			ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
+
+		if (IS_ERR(ptr))
+			return PTR_ERR(ptr);
+
+		obj->mm.mapping = page_pack_bits(ptr, I915_MAP_WB);
+	}
+
+	if (i915_gem_object_has_iomem(obj))
+		iosys_map_set_vaddr_iomem(map, (void __iomem *)ptr);
+	else
+		iosys_map_set_vaddr(map, ptr);
+	return 0;
+}
+
 /* get, pin, and map the pages of the object into kernel space */
 void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 			      enum i915_map_type type)
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 27437c22bd70..fced6037222c 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -59,3 +59,10 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	/* FIXME */
 }
+
+int intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	return ttm_bo_vmap(&bo->ttm, map);
+}
-- 
2.49.0

