Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDD3C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 20:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905C110E6D7;
	Wed, 21 Aug 2024 20:47:56 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFA210E6D5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 20:47:55 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/3] drm/xe: Alternative CCS fix.
Date: Wed, 21 Aug 2024 22:47:47 +0200
Message-ID: <20240821204750.539075-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Instead of making 64k CCS special, make it the only case. :)

I think the approach is interesting, so if there is no performance hit,
we should be able to get away with 64k pages always.

Maarten Lankhorst (2):
  drm/xe: Align 64k scanout buffers physically when multiple of 64k.
  drm/i915/display: Allowing looking up invalid modifiers to make xe
    happy

Zbigniew Kempczyński (1):
  drm/xe: Use 64K pages for scanout buffers for Battlemage

 drivers/gpu/drm/i915/display/intel_fb.c  |  4 ++++
 drivers/gpu/drm/xe/display/intel_fb_bo.c |  6 ++++++
 drivers/gpu/drm/xe/xe_bo.c               | 10 ++++++++++
 drivers/gpu/drm/xe/xe_device_types.h     |  1 +
 drivers/gpu/drm/xe/xe_pci.c              |  9 ++++++++-
 drivers/gpu/drm/xe/xe_vm.c               |  4 +++-
 6 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.45.2

