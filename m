Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A98C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 06:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E4510E146;
	Fri, 25 Jul 2025 06:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BnDnxvhV";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E6110E078
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 06:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qcp13ciWGGaVbe0Rfga0I9tQNN5x3zxaXCxikBolQAA=; b=BnDnxvhVnYWz8buQXNbijiq4dy
 Q/wqd4oEQKOdSLy5HBIS7FEjqpvtohBfDJ2Kvn6Yqg+qnwlnW9SyAJl1NtMEp+vTdG5Nb9nX7VJdj
 NTuUyBFclXYat/A0pomlr+h4cWKBLyNkQhw3u1Dzzm33VONi55WKSwmJZcpRd1irFw7nayQLrmIwZ
 UAemBFvwlbslwxDnI4d05X6zXm4mi21unc8fEDzpvr6NS3td2EayHGIYsVsBYpoiV94hqm92TLiYf
 7ZOGCIk9ZrzfzL4Gjcg+lB5rxl2jcbbe4AK0v2i3DadsKoarpO0FdFGLp4OVr2Pj39Gbxxpb7ZFJR
 TXvSZPDg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufCMa-003ZzW-Td
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 08:57:05 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 0/7] adl css test run
Date: Fri, 25 Jul 2025 07:56:56 +0100
Message-ID: <20250725065704.87050-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Poor man's "bisect" part 3

Tvrtko Ursulin (7):
  drm/xe/xelpg: Flush CCS when flushing caches
  drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
  drm/xe/xelp: Support auxccs invalidation on blitter
  drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds

 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  47 +++++
 drivers/gpu/drm/xe/xe_ring_ops.c              | 161 +++++++++---------
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 7 files changed, 144 insertions(+), 77 deletions(-)

-- 
2.48.0

