Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15830C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5D310E68E;
	Wed, 16 Jul 2025 20:45:44 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC9C10E699
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:45:43 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Fix hotplug after device suspend
Date: Wed, 16 Jul 2025 22:45:38 +0200
Message-ID: <20250716204537.217329-4-dev@lankhorst.se>
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

Small fix I noticed when running -rt patch series.

Maarten Lankhorst (2):
  drm/xe: Export xe_irq_synchronize and use it in display
  drm/xe: Disable display irqs during suspend sequence

 drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
 drivers/gpu/drm/xe/display/xe_display.c   |  8 ++++++++
 drivers/gpu/drm/xe/xe_irq.c               | 13 +++++++++----
 drivers/gpu/drm/xe/xe_irq.h               |  1 +
 4 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.45.2

