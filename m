Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474F606A32C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=LcZbNNuG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC1010F7A3;
	Tue, 17 Nov 2026 14:29:36 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FE710F793;
 Tue, 17 Nov 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794925768;
 bh=wgkvFu5V+wcuJzs8d2ztcGa1vlfCXOEzmPGUpxmrO1M=;
 h=From:To:Cc:Subject:Date:From;
 b=LcZbNNuGX1ObgIv4zbTx5Qn8cXf9pJNTN4nALJeJvSXeuw3XGpwLHWfpghs0fZm4j
 eFIFfO0CMZsAaiB/ymjanqAKgroPB6/HguI2UtULIb3PRYLtk1Axmg0/j0Md1G5ynm
 36xMnzeW1scr0lvfReWS09P8Kvy0DgPRVDLdm+nvmrl8kO8poCSZ+J5KSjHtPeP7t3
 rhzmth0CnjgG4/cVv7JBAwLTbXgErqUxNDgS7JsRBR9+9h5S6d4MceKa0Ud7Es/vzB
 YnxkWRZ6BENiha9I/q8VABhApN81HTdUy+oAkCfPfvOM4hUJzGpsI0i+FZjqEZyLSG
 E1CbikeXr5fwQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 0/5] drm/xe/display: Transparant fallback from stolen to
 sysmem.
Date: Tue, 17 Nov 2026 15:30:39 +0100
Message-ID: <20261117143038.479557-7-dev@lankhorst.se>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix issue with migrate and address Ville's comments.

Should pass BAT and FULL again now.

Maarten Lankhorst (5):
  drm/xe/display: Avoid using stolen memory for framebuffer when media
    gt exists.
  drm/xe/migrate: Support copying between sysmem and stolen
  drm/xe: Raise gt frequency slightly earlier.
  HACK: Always fallback
  drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

 drivers/gpu/drm/i915/display/intel_bo.c       |  7 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |  1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 63 +++++++++++++++-
 drivers/gpu/drm/i915/i915_bo.c                | 14 +++-
 drivers/gpu/drm/i915/i915_bo.h                |  6 --
 drivers/gpu/drm/i915/i915_initial_plane.c     | 14 ----
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 72 ++++++++++++++++++-
 drivers/gpu/drm/xe/display/xe_display_bo.h    |  6 --
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  8 ---
 drivers/gpu/drm/xe/xe_device.c                |  6 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 54 +++++++++-----
 include/drm/intel/display_parent_interface.h  |  1 +
 12 files changed, 193 insertions(+), 59 deletions(-)

-- 
2.55.0

