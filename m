Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0665C5320E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 13:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8210E26B;
	Mon, 19 Aug 2024 13:31:41 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14C010E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 13:31:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 0/3] drm/xe/display: Fixes to make kexec work.
Date: Mon, 19 Aug 2024 15:31:34 +0200
Message-ID: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
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

Lets see if we can get away with performing a FLR as shutdown handler. It should work.
These are all the patches I have used when testing if I could kexec from Xe with a game
running  to a new kernel.

Tested with:
kexec --reuse-cmdline --initrd=initrd.img -f vmlinuz

I have tested about 4-5 times successive kexecs on my ADL-P,
while having a game actively running to keep the GPU loaded.

With this series xe kept running succesfully. After that
I accidentally rebooted, but I see no reason this wouldn't work
even more times.

Changes since previous version:
- s/r patches have been merged.

Maarten Lankhorst (3):
  drm/xe: Read out rawclk_freq for display
  drm/xe: Wire up device shutdown handler
  CI-only: Test if FLR is disabled?

 drivers/gpu/drm/xe/display/xe_display.c | 22 +++++++++++--
 drivers/gpu/drm/xe/display/xe_display.h |  3 +-
 drivers/gpu/drm/xe/xe_device.c          | 43 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.c              |  7 ++++
 drivers/gpu/drm/xe/xe_gt.h              |  1 +
 drivers/gpu/drm/xe/xe_pm.c              |  4 +--
 6 files changed, 69 insertions(+), 11 deletions(-)

-- 
2.45.2

