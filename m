Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17903C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66810E9BD;
	Mon, 20 Jul 2026 16:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KLUMOev/";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5C610E9BC;
 Mon, 20 Jul 2026 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784563634;
 bh=EnBO18kzaCnutcHWtRGOZFJndvKkrHWG0xK4tQ/v+XY=;
 h=From:To:Cc:Subject:Date:From;
 b=KLUMOev/r2oEXiCEYpGlMyfnQNBqxmr5QgyzPm19ln+20wOvggGaKH800/X+ynHij
 3L6Kt7JVDTU3+/t2M1kUNZZkai85pIfpjSDFn7RMFBnihC+xIN7lWVTrptDPblbs95
 SCQssm3OB4T3aNgKvCjxsWpzmm+ms0gTDm1DIcbsJLGaW2rmTVJf8mdz2ZKAFkeCwr
 XygPAK6dVqn526YfIeKID8n1KWxSgj90YAKYOwbTpEN6gFHC6kSSIOMxdGwdjLXg3f
 k4sxHVpEh/Zcz3FoEs2otig8k7BYYvyx9ZDwzjXiuPptAU8PkRmuxbi521MjA9SFou
 vuKu3+/kn/POA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 0/6] drm/xe: More BIOS FB takeover fixes
Date: Mon, 20 Jul 2026 18:08:06 +0200
Message-ID: <20260720160805.380356-8-dev@lankhorst.se>
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

Compared to previous version, fix the stolen oops and create
and use xe_ggtt_reserve_area instead of xe_ggtt_insert_node_at.

Reserve the original GGTT area of the original mapping, and remove
the code that was required to deal with the fact that previously
this was not done.

Maarten Lankhorst (6):
  drm/xe/ggtt: Add xe_ggtt_reserve_area
  drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
  drm/xe/display: Reserve the original GGTT space before creating a bo
  drm/xe/display: Use the correct calculation for phys_base on
    integrated
  drm/xe/display: Remove duplicated code
  drm/xe/ggtt: Remove xe_ggtt_insert_bo_at

 drivers/gpu/drm/xe/display/xe_initial_plane.c |  41 +++----
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 115 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 4 files changed, 110 insertions(+), 59 deletions(-)

-- 
2.53.0

