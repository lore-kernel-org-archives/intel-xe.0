Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1832C4345F
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813FB10E457;
	Sun, 28 Apr 2024 21:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="xVKdCiV2";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A010FB27
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 09:35:53 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1714037748; bh=+ddBqk70jyIjwwzDwfpNrfAbakiOwy4uLInAX6CByM4=;
 h=From:To:Cc:Subject:Date:From;
 b=xVKdCiV2eac1GhMN8a9iT26YD7OijEuQ6iXMQYRUWDS8hRAyPsQyhY5zG17c7sEML
 5SuiHduOenxJjU2ZSdLMZbhOXKHx30HM2t1EJIrrUqrt3hI823eOOhafX7tpkBWbTa
 2kPPI2ZNbRtCBpYs4PijKJXY2RJW6O1G7nyDlGXMB4SzYRwQNs1t+0nV65sWlPPFZu
 BW/z2VURgc/h49FtgtFW186pFh3if9RdjdJhWTF5AeMRYHRirArB7pr0hXBtcERRqU
 1/gRsTkyzxDIVKbiETmsWvNE0gM2pefeLC2WyOvPKVYhsm1ZbApWtgFxgqsI7/xfYs
 cx0JI0JvDtWVA==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 43P9ZehP356497; Thu, 25 Apr 2024 12:35:40 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ofir1.bitton@intel.com
Subject: 
Date: Thu, 25 Apr 2024 12:35:38 +0300
Message-Id: <20240425093540.356478-1-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:33:52 +0000
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

Current Xe driver supports one TLB invaliation flow, which is
for the compute TLB going through the Guc.
This driver will be used for future products which will have multiple
TLBs each has it's own invalidation flow.
In order to prepare the driver for those new flows, these patches here
will add infrastructure to easily allow each TLB to register it's own
function keeping the common code generic.

Farah Kassabri (2):
  drm/xe: rename gt invalidation functions
  drm/xe: preparations for multi instance TLB invalidations

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   6 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   9 +-
 .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.c   | 459 +++++++++++++++++
 .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.h   |  26 +
 ...s.h => xe_gt_guc_tlb_invalidation_types.h} |  15 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 484 ++++--------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  66 ++-
 drivers/gpu/drm/xe/xe_gt_types.h              |   6 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   6 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  12 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  38 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   8 +-
 16 files changed, 695 insertions(+), 452 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
 rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation_types.h => xe_gt_guc_tlb_invalidation_types.h} (54%)

-- 
2.34.1

