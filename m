Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0E0F357DA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 10:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394EF10E733;
	Wed, 25 Feb 2026 10:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KflmgFfc";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A1E10E229;
 Wed, 25 Feb 2026 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772014536;
 bh=bcKeBLFA7r09gergzTg5pIlB76wIyA8EmIDez8Nds/k=;
 h=From:To:Cc:Subject:Date:From;
 b=KflmgFfcUjSwA9qLCh1cybV9mO5O6HCk5Ve7Kmhe8oF2jTlrxO+aZ4BQpa7MtHOgn
 YZrxciX/19hZB38uNNvNy9Xb35+IxSI9ST4ce7UjGiLxYQ+G8vAqOcDkhOj7JEGYUu
 hRcdjxykZV8SBGDAYV13b6AWIlFFyPvJni2QDqcVeyfCl5Mt4oq3m2YSm1FdAv5hJN
 rUJ4iK+/QLHd8cDh8mq4giTW3PbNMmhhBTAkXXspCi6iyfSEmFyLfS5/NJ9swYmIrT
 C5sP0WOGVFuOi/FIj/9+nV788QUGIgdlF51FfuN3XVNR5vszCIeu/05OLNeODcHvcz
 l5XhmnW7Ede8w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/1] Fix use-after-free on framebuffers and property blobs
 when calling drm_dev_unplug
Date: Wed, 25 Feb 2026 11:15:33 +0100
Message-ID: <20260225101532.13260-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

I tried to see what happened with xe_module_unload --r reload on a fully
running system, and came across these bugs in the kernel. Even after
these fixes I still see a hang when reloading, related to cgroups, so
likely some more fixes are needed to address those.

Should this patch have a fixes tag or cc stable patch?

Test-with: https://patchwork.freedesktop.org/series/162133/

Maarten Lankhorst (1):
  drm: Fix use-after-free on framebuffers and property blobs when
    calling drm_dev_unplug

 drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
 drivers/gpu/drm/drm_drv.c           |  3 +++
 drivers/gpu/drm/drm_file.c          |  5 ++++-
 drivers/gpu/drm/drm_framebuffer.c   | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c   |  8 ++++++++
 drivers/gpu/drm/drm_property.c      | 20 ++++++++++++++++++++
 6 files changed, 63 insertions(+), 2 deletions(-)

-- 
2.51.0

