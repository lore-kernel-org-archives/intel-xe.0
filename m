Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA7CC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 20:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771F10E2B9;
	Thu, 24 Jul 2025 20:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Xhey8crV";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DC610E091
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eOWelSHHKSyOvfd6zhf0R0z8YVwWds2X+3nUvlCQh18=; b=Xhey8crVqmxwpJIyKY9FuKKEab
 EKvkU4nznm9MtlaKSMYECJehDe8Ra3FSvKQW4Yb/Ofq1QWYwGMpsDtRZAJsoUh8kiXAI9EnJuIn9d
 ABOy6Kuz8ZfkaZobJ56viU9XLe3Ht0kUADEW1YvSxHUEsa2ZwaZ1XDvfUJRcEisDM0AuQ3mNar98u
 qpuGjIKtdxi2LR04V+M5UJD6dhUx8P/VL+NXyLpcN5Vd0KvWCNahHxCDJQW5Rdu1Wd2vcCGZcc7fE
 gOGOo21NQwuCK02d86n9Z4kHiYSGn2ZQL0033xAE8E2JigjT24Q18dxZCRACuNNxwSXsdQUALLLbZ
 0/QDrd4A==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uf2OR-003MJN-79
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 22:18:19 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 0/9] adl css test run
Date: Thu, 24 Jul 2025 21:18:06 +0100
Message-ID: <20250724201818.81269-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Poor man's "bisect" part 2

Tvrtko Ursulin (9):
  drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
  drm/xe/xelp: Support auxccs invalidation on blitter
  drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory
  drm/xe/display: Add support for AuxCCS

 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 154 +++++++++++++++---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  47 ++++++
 drivers/gpu/drm/xe/xe_ring_ops.c              | 154 +++++++++---------
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 7 files changed, 264 insertions(+), 103 deletions(-)

-- 
2.48.0

