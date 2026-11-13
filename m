Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44630606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=Q+gXGkbm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E061121A7;
	Fri, 13 Nov 2026 12:43:53 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316E31121A7;
 Fri, 13 Nov 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794573825;
 bh=ZkePPFysDD1e7SfQs5NSkeM6/CpGx+CCTMKFWV29gK0=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+gXGkbmtXeHm5daqj1cMNr2HfVIUZx2VsHOdsrg0CGadRzN+qCKCuWIIVQx+k+R3
 n1s7KIsd6hHSumYHUXLbvSjKxaPixLi+YI/Qj4s1HXqU1Io1cHX7Cf0UuxgHo5WSYL
 Jv0vQP9v9RcpIzLu90Xfvo9VPjTiEwDjuDjje4mN7unA0l+5j8AHctOnP/Au5v3y45
 MiQEITafPMOPtT0dhikCRFCFKjhwTb6qawAJJhzMNKQBB2+45j4A254TJZs7oxtAGC
 vjSOlFVnwTIXDZYgFmlBahUjJOgTrWkZuGyjjrMTk8wsP+X424wg6LvfXm9GDZZlfO
 I8GSV4psxeXtg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 0/5] drm/xe/display: Transparant fallback from stolen to
 sysmem.
Date: Fri, 13 Nov 2026 13:44:54 +0100
Message-ID: <20261113124453.144408-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix all issues reported by sashiko, especially the migration code has become a lot
cleaner, and I'm happy with it now.

Sashiko should be a lot happier too!

Maarten Lankhorst (5):
  drm/xe/display: Avoid using stolen memory for framebuffer when media
    gt exists.
  drm/xe/migrate: Support copying between sysmem and stolen
  drm/xe: Raise gt frequency slightly earlier.
  HACK: Always fallback
  drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

 drivers/gpu/drm/i915/display/intel_bo.c       |  7 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |  1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 68 +++++++++++++++---
 drivers/gpu/drm/i915/i915_bo.c                | 14 +++-
 drivers/gpu/drm/i915/i915_bo.h                |  6 --
 drivers/gpu/drm/i915/i915_initial_plane.c     | 14 ----
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 72 ++++++++++++++++++-
 drivers/gpu/drm/xe/display/xe_display_bo.h    |  6 --
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  8 ---
 drivers/gpu/drm/xe/xe_device.c                |  6 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 ++++-
 include/drm/intel/display_parent_interface.h  |  1 +
 12 files changed, 168 insertions(+), 53 deletions(-)

-- 
2.55.0

