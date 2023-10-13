Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC249CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 15:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA29010E193;
	Fri, 13 Oct 2023 15:21:48 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B1D10E191
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 15:21:46 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 17:21:38 +0200
Message-Id: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] RFC for discussion of devcoredump uapi.
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

I think it makes a lot of sense to dump the BO's for hung processes
later and not from signaling context. This way we can easily grab all
locks required to dump BO state, without having to do anything in an
almost atomic context.

This patch series almost implements the discussed approach, but instead
of actually dumping, it only dumps the contents of a kvmalloc.

vmap dumping needs to be wired up still, but for purposes of discussion
it's nearly complete.

Maarten Lankhorst (4):
  drm/xe: Add uapi for dumpable bos
  drm/xe: Annotate each dumpable vma as such
  drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during
    devcoredump
  drm/xe: Almost implement snapshot support

 drivers/gpu/drm/xe/xe_bo.c                |   4 +
 drivers/gpu/drm/xe/xe_bo.h                |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |   9 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_vm.c                | 140 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h                |   4 +
 drivers/gpu/drm/xe/xe_vm_types.h          |   8 ++
 include/uapi/drm/xe_drm.h                 |  25 ++++
 8 files changed, 185 insertions(+), 8 deletions(-)

-- 
2.40.1

