Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F9C87FD3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 15:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D648E10E7BA;
	Thu, 31 Jul 2025 15:27:11 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CA910E7B8
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 15:27:09 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/2] drm/xe/display: Make panic support work on vram.
Date: Thu, 31 Jul 2025 17:26:58 +0200
Message-ID: <20250731152700.2196681-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

Changes since last time:
- Add kerneldoc to xe_bo_is_visible_vram,
- reduce amount of members in xe_panic_data to minimum.

Maarten Lankhorst (2):
  drm/xe: Extract xe_bo_is_visible_vram
  drm/xe/display: Make panic support work on vram.

 drivers/gpu/drm/xe/display/intel_bo.c | 48 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.c            | 19 ++++++++++-
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 3 files changed, 53 insertions(+), 15 deletions(-)

-- 
2.45.2

