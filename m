Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD46C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCCE10E7F7;
	Fri, 26 May 2023 12:11:12 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7604110E06F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:11:10 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:10:56 +0200
Message-Id: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] Robustness fixes with eviction and
 invalidation.
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

When looking at issue 239, I found quite a few bugs related to eviction and
invalidation. Patch #2 allows me to create an IGT that tests for those bugs,
specifically patch 3 and 5. Patch 4 would be possible to test, but requires
a more considerate test.

Maarten Lankhorst (5):
  drm/xe: Kill small race with userptr invalidation
  drm/xe: Add debugfs files to evict everything.
  drm/xe: Fix extobj dropping issue.
  drm/xe: Prevent evicting for page tables
  drm/xe: Return the correct error when dma_resv_wait_timeout fails

 drivers/gpu/drm/xe/xe_bo.c      |  6 +--
 drivers/gpu/drm/xe/xe_bo.h      |  7 +--
 drivers/gpu/drm/xe/xe_debugfs.c | 17 +++++-
 drivers/gpu/drm/xe/xe_exec.c    |  7 +++
 drivers/gpu/drm/xe/xe_pt.c      |  3 +-
 drivers/gpu/drm/xe/xe_vm.c      | 95 ++++++++++++++++++++-------------
 6 files changed, 90 insertions(+), 45 deletions(-)

-- 
2.34.1

