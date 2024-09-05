Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E3ECD5BCB
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 15:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8355210E8F5;
	Thu,  5 Sep 2024 15:00:53 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9520810E8F6
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 15:00:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/4] drm/xe: Implement device shutdown to make kexec work.
Date: Thu,  5 Sep 2024 17:00:48 +0200
Message-ID: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
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

Testcase:
kexec --reuse-cmdline --initrd=initrd.img -f vmlinuz

Because we don't shut down xe correctly, we cannot reload xe afterwards.
Implement device shutdown by performing a FLR, then we can load the device
cleanly again afterwards.

Some cleanups come first, those can be merged without the rest.

Maarten Lankhorst (4):
  drm/xe: Fix missing conversion to xe_display_pm_runtime_resume
  drm/xe: Remove runtime argument from display s/r functions
  drm/xe: Wire up device shutdown handler
  CI-only: Test if FLR is disabled?

 drivers/gpu/drm/xe/display/xe_display.c | 90 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/display/xe_display.h | 12 ++--
 drivers/gpu/drm/xe/xe_device.c          | 43 ++++++++++--
 drivers/gpu/drm/xe/xe_gt.c              |  7 ++
 drivers/gpu/drm/xe/xe_gt.h              |  1 +
 drivers/gpu/drm/xe/xe_pm.c              |  8 +--
 6 files changed, 129 insertions(+), 32 deletions(-)

-- 
2.45.2

