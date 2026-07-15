Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7976C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0DA10EFA4;
	Wed, 15 Jul 2026 11:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="HfkH6af7";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D1610E19B;
 Wed, 15 Jul 2026 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784113507;
 bh=0XmykIoDlGO0cilyqQjbKGE1v3oCBauZ9OEONLr2KUA=;
 h=From:To:Cc:Subject:Date:From;
 b=HfkH6af7/9SXa783pbp4mEKfxHqgLbyBRvcXoNx6AVYBOu1LUb3u6WPoIsuVbYVun
 VMhKpsW0v5DWSLBxti5tVpQokXIYD5NJBDSR4O+kuLpnKerFF/kIhi4YQAzdOtJiNp
 vxSfWmKhwDZehmDDi9wP5Aj9BDgowRO8uJPw4zza16Jw7q61JiSFSN2v2D1tzivhSC
 VlJ8mJ3GwQpk+xm/s2fV1RD83TYDg4crPLIvrI0iKxsRqvYac8+XRTWtJhFZOuoO27
 WAWcjP2PjrCADrLRomLmAu/EXrv2OSrgyCYiu0cW7OSYNsQELmC1SkHT20oSAyr1Ld
 XB1bDmTDCGPjQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/6] drm/xe: More BIOS FB takeover fixes
Date: Wed, 15 Jul 2026 13:05:51 +0200
Message-ID: <20260715110557.2172095-1-dev@lankhorst.se>
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

Small change since previous version, marking the entire GGTT as allocated
was causing regressions. So instead truncate to the allowed GGTT range.

This series separates the GGTT offset with the physical offset, and allows
us to fix a bug with MTL, where those are different.

Maarten Lankhorst (6):
  drm/xe/ggtt: Add xe_ggtt_insert_node_at
  drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
  drm/xe/display: Reserve the original GGTT space before creating a bo
  drm/xe/display: Use the correct calculation for phys_base on
    integrated
  drm/xe/display: Remove duplicated code
  drm/xe/ggtt: Remove xe_ggtt_insert_bo_at

 drivers/gpu/drm/xe/display/xe_initial_plane.c | 62 ++++++++------
 drivers/gpu/drm/xe/xe_bo.c                    |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 81 ++++++++++++-------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  5 +-
 4 files changed, 96 insertions(+), 60 deletions(-)

-- 
2.53.0

