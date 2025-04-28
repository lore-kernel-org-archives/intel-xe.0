Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB76C369C2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 03:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5910E32D;
	Mon, 28 Apr 2025 03:49:03 +0000 (UTC)
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Mon, 28 Apr 2025 03:49:02 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FB610E32D
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 03:49:02 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-7i_SpseSMwu4eFl6FI_7lg-1; Sun,
 27 Apr 2025 23:40:48 -0400
X-MC-Unique: 7i_SpseSMwu4eFl6FI_7lg-1
X-Mimecast-MFC-AGG-ID: 7i_SpseSMwu4eFl6FI_7lg_1745811647
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19DE419560AA; Mon, 28 Apr 2025 03:40:47 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 49F08180045B; Mon, 28 Apr 2025 03:40:44 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/tests: fix the bo evict build break
Date: Mon, 28 Apr 2025 13:40:42 +1000
Message-ID: <20250428034043.407486-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G0d1d5CQBbRe4EXSsHd10npY0ckcBfxG4V64pLFoCEw_1745811647
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

Fixes: 55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      | 2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe=
_bo.c
index 230eb824550f..378dcd0fb414 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct =
xe_bo *bo,
 =09}
=20
 =09/* Evict to system. CCS data should be copied. */
-=09ret =3D xe_bo_evict(bo, true);
+=09ret =3D xe_bo_evict(bo);
 =09if (ret) {
 =09=09KUNIT_FAIL(test, "Failed to evict bo.\n");
 =09=09return ret;
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tes=
ts/xe_dma_buf.c
index cedd3e88a6fb..c53f67ce4b0a 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -65,7 +65,7 @@ static void check_residency(struct kunit *test, struct xe=
_bo *exported,
 =09 * the exporter and the importer should be the same bo.
 =09 */
 =09swap(exported->ttm.base.dma_buf, dmabuf);
-=09ret =3D xe_bo_evict(exported, true);
+=09ret =3D xe_bo_evict(exported);
 =09swap(exported->ttm.base.dma_buf, dmabuf);
 =09if (ret) {
 =09=09if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tes=
ts/xe_migrate.c
index 52f89476bf62..4a65e3103f77 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -509,7 +509,7 @@ static void test_migrate(struct xe_device *xe, struct x=
e_tile *tile,
 =09dma_fence_put(fence);
=20
 =09kunit_info(test, "Evict vram buffer object\n");
-=09ret =3D xe_bo_evict(vram_bo, true);
+=09ret =3D xe_bo_evict(vram_bo);
 =09if (ret) {
 =09=09KUNIT_FAIL(test, "Failed to evict bo.\n");
 =09=09return;
--=20
2.49.0

