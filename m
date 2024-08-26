Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE9CC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E827510E0DF;
	Mon, 26 Aug 2024 09:50:48 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7F810E0DF
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 09:50:47 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v5 0/2] drm/xe: Align all VRAM scanout buffers to 64k physical
 pages when needed.
Date: Mon, 26 Aug 2024 11:50:39 +0200
Message-ID: <20240826095041.75416-1-maarten.lankhorst@linux.intel.com>
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

Introduce a second patch to move the changes to intel_fb instead.

Maarten Lankhorst (2):
  drm/xe: Align all VRAM scanout buffers to 64k physical pages when
    needed.
  drm/i915/display: Add function for checking 64k physical alignment
    workaround

 drivers/gpu/drm/i915/display/intel_fb.c  | 20 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fb.h  |  2 ++
 drivers/gpu/drm/xe/display/intel_fb_bo.c |  6 ++++++
 drivers/gpu/drm/xe/xe_bo.c               |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c               | 11 ++++++++++-
 5 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.45.2

