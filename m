Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A86CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DBA10E5D7;
	Tue, 21 Oct 2025 12:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jtgC2wuv";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2706B10E5D6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761049105;
 bh=1zsSLZ+fl4x5xfVb3oHO4FPynhXoYydZtXj/8HjcoQE=;
 h=From:To:Cc:Subject:Date:From;
 b=jtgC2wuvDP63tKXFptc1poNlTMWoXTfRDLBNFXD/ZC5hx1/gLPDuKTL1Hm1b2z74J
 MxQv2r4nCKJhDWFRQoouUr8awMxDMCIONFI6pVW9aVLV4T5plQj/xY+XIyNPLrdIFu
 XD3I/B6BBnswQXJrlIHbS/tkwj8c9DgxQ8dna/M1RXxrrBkDebLTKi18sqR5HVtAPq
 DFamyI8e0OaaptB/LeufqAvayFjWGHlxiSUQ+vUWTUvlNKiyxPtPG+Y6zOKmDfwAgR
 EDQrxqShhSeF3EfA+JtQHCr+Ir949B11g2digwEqo/1voZRYyTdylduU6QNax5ZyCX
 HJ3+pxClE4rBg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/7] drm/xe: Privatize struct xe_ggtt_node.
Date: Tue, 21 Oct 2025 14:18:14 +0200
Message-ID: <20251021121814.2193153-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

First part of privatizing struct xe_ggtt is privatizing xe_ggtt_node.

These patches have been mostly reviewed, so send it in for CI and
to get the remaining patches reviewed.

Maarten Lankhorst (7):
  drm/xe: Start using ggtt->start in preparation of balloon removal
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
  drm/xe/display: Avoid dereferencing xe_ggtt_node
  drm/xe: Do not dereference ggtt_node in xe_bo.c
  drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
  drm/xe: Privatize xe_ggtt_node

 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 113 +++++-----
 drivers/gpu/drm/xe/display/xe_stolen.c        |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 212 +++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h                  |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  31 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  19 +-
 9 files changed, 253 insertions(+), 156 deletions(-)

-- 
2.51.0

