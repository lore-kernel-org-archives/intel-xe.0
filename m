Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8359C07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 12:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF5210E36F;
	Tue, 24 Oct 2023 12:23:05 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF9710E369
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 12:23:03 +0000 (UTC)
From: Maarten@mblankhorst.nl,
	"Lankhorst <maarten.lankhorst"@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 14:22:52 +0200
Message-Id: <20231024122256.19512-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe: Implement snapshot support.
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

Hopefully at least the uapi part can be merged. This takes a coredump in
2 steps:
1. On crash, take a snapshot of the VM layout, and a reference to the
bo's to dump.
2. On readout, take a snapshot of each bo to dump and release the
reference.

Because devcoredump is done in signaling context, we can't safely
allocate a lot of memory, or do things like mmap, etc. As such, we have
to wait for readout time to map the BO and copy its contents. This means
that userspace may in the worst case overwrite data after the hang, but
hopefully this is not a serious problem.

Needs more testing..

Maarten Lankhorst (4):
  drm/xe: Add uapi for dumpable bos
  drm/xe: Annotate each dumpable vma as such
  drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during
    devcoredump
  drm/xe: Implement VM snapshot support

 drivers/gpu/drm/xe/xe_devcoredump.c       |   9 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_vm.c                | 150 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h                |   4 +
 drivers/gpu/drm/xe/xe_vm_types.h          |   8 ++
 include/uapi/drm/xe_drm.h                 |   4 +
 6 files changed, 169 insertions(+), 8 deletions(-)

-- 
2.40.1

