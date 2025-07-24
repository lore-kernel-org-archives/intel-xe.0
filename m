Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F33C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 16:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFAB10E97C;
	Thu, 24 Jul 2025 16:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YyX74nXG";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA2C10E97C
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F78FLiTeon8ALK7sWRs1vLS5xy3wZlHtRtnxcuJO02I=; b=YyX74nXGpUHDRNM+cO+bLlfs5n
 yzBEEZgwHtm719Bf95SisC7GvbLgR+kvlUkd0U1fizCRR5tdBpO/MeHXOnx6vMGbG0khQ38+Uzf95
 abFtG8qh39PVwauNw9RCgKA5n13K3jfrTqH5cozO8AR+hNBpQPqxmHnHN/LDtw/9TRi1+S45pe8lB
 o2RjX9beYnPlqwufapxAM1i4TKMe82SsXyaHt6aMsULVjFOuZ09iyw3LRmbLIVILD3cM0oQkZ4v81
 cQoxvHNz+VSsE64nGbTFuPKbmGdhk1QHTGoFYJZ3EVGazkg3ut+hTuSD/NcMaimFSht86FZFD38HD
 SVPWKTQQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueyzB-003HFE-Io
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 18:40:01 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/4] adl css test run
Date: Thu, 24 Jul 2025 17:39:56 +0100
Message-ID: <20250724164000.78212-1-tvrtko.ursulin@igalia.com>
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

Poor man's "bisect" part 1

Tvrtko Ursulin (4):
  drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
  drm/xe/xelp: Support auxccs invalidation on blitter
  drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
  drm/xe/xelp: Wait for AuxCCS invalidation to complete

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              | 121 ++++++++----------
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 4 files changed, 63 insertions(+), 67 deletions(-)

-- 
2.48.0

