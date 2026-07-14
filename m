Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9070DC4450E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 16:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715F10EDD5;
	Tue, 14 Jul 2026 16:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="DNrQzLyS";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC8A10E089;
 Tue, 14 Jul 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784046457;
 bh=5ml4d6XGny5RC2V3Mlc9xfjbYPkJboY77LOEMiaYerM=;
 h=From:To:Cc:Subject:Date:From;
 b=DNrQzLySi9QgKtMaZNX1WaTUOYYNHFZyif7YL8X8H17i9TsBYGo2q2jjIe+5eeKtw
 zHg0NzvG2iRgtpBvYwOI1pRhLlq7rP6YzDUpEhH49doubOKsBHu9jKKx//XzvKkCpA
 jT6surtNo7ASvn+8Heyxuqo5cDR539hqrtSncovw7Pz+Mgg9vJYkf4/GsFuNUoi47X
 76BJ/0DSWdyRsyEY7nZ2fnS6x06AK51WApgXY0c9dicscN88EsdRqIqVy3y75Ni7K9
 ThBhRIHJtGF6uh05q6OhaijPh5Hy9++F7oPXdksgqsm2g5tgZXnvp0tCEuN0WcNlqL
 oMDa4dleJ2TDQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/7] drm/xe: More BIOS FB takeover fixes
Date: Tue, 14 Jul 2026 18:28:17 +0200
Message-ID: <20260714162824.2063637-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add some fixes for GGTT. First we allow GGTT allocations above
GUC_GGTT_TOP, but not use that area by default.

This will allow us to fully reserve the area of GGTT that is used by
the firmware allocation if it's not before ggtt->start.
This will allow us to safely perform our own allocation at the correct
place, and free the firmware allocation. Any remainder of firwmare
GGTT entries are then cleared later in xe_ggtt_init().

This separates the GGTT offset with the physical offset, and allows us
to fix a bug with MTL, where those are different.

Maarten Lankhorst (7):
  drm/xe/ggtt: Allocate the area of GGTT above GUC_GGTT_TOP.
  drm/xe/ggtt: Add xe_ggtt_insert_node_at
  drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
  drm/xe/display: Reserve the original GGTT space before creating a bo
  drm/xe/display: Use the correct calculation for phys_base on
    integrated
  drm/xe/display: Remove duplicated code
  drm/xe/ggtt: Remove xe_ggtt_insert_bo_at

 drivers/gpu/drm/xe/display/xe_initial_plane.c |  49 ++++-----
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 101 ++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 4 files changed, 95 insertions(+), 68 deletions(-)

-- 
2.53.0

