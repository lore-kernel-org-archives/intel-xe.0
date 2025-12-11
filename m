Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23FBD41C09
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 09:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9D910E7B8;
	Thu, 11 Dec 2025 09:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SUx3om4X";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E89110E0EF
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XEZQ6BmZRd4+IzrjIdONzB421dPtXp3G5Y7RQmQUpZ8=; b=SUx3om4XaQH7e8nyPOMx6W41N1
 92BeYndbLbOuo6Pyuu95cFCj05Lh6Q8UYkKmwnwDqSZQ/dvDUGCPl/blJ0A3pRiUBWDRbC1iyxyIP
 d4ZYPF0kQHrYNGVpqdyHkolOE1M+VatNe7DW2DYapz7VI/AAFcjIkSqdwdn8veZ00/O45XXBBi2zf
 hyvU5Rwl61/uvAVlpwxGREzGx6Z6nnDkS8SnYPImscyGUSA+e8NiM2tHriiw+dzNkmADrLT8O63qX
 lrhDh2htSc0ey3ahrVnEfriresh6PG/r/go2TVqlHx5R6+6h8a3rIbxjV26HHKLwlk2ZZr4WD0ntM
 mKMkOR7g==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTcnR-00BQUb-Jf
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 10:17:13 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/10] auxccs dpt wc no stolen
Date: Thu, 11 Dec 2025 10:17:02 +0100
Message-ID: <20251211091712.19151-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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

test run

Tvrtko Ursulin (10):
  drm/xe: Fix ggtt fb alignment
  drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
  drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe/display: Add support for AuxCCS
  drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
  use wc for dpt
  drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS

 drivers/gpu/drm/xe/display/xe_display.c       |   8 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 135 +++++++++++++-----
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |  24 ++++
 drivers/gpu/drm/xe/xe_lrc.c                   |  27 ++++
 drivers/gpu/drm/xe/xe_ring_ops.c              |  84 +++++++----
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 8 files changed, 224 insertions(+), 65 deletions(-)

-- 
2.52.0

