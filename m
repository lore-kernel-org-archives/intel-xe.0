Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC9C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787F810EA17;
	Fri, 27 Jun 2025 13:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D6dBxsbG";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF7510EA17
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O3XDPA2Kw9Ivbe+fRnT64W2OQCOdineN97/MEDap0ho=; b=D6dBxsbGdACzw6jkJd0ummipdB
 ulJ2n5pFX3w4aGaYQ/B2UNNdWhX5hOUeKMuN4lrzcvIMEwdbLmaQxWQBmZ2+AH7RGNZX3zIfLK04x
 NWU4qja1qyHQq0EQPufls2Eumncw6UcP/ZKzTVPLoeUOhbOUXp2xKQjYWV0BnREwKfeC86h/eyaDy
 TK6qNnBcxmNpX6zRBmJybIjMBI2+qDG+ggcyxRCu+E/vYcFLOSzpKyNcv3aKW42ntVab9yyXHbFpz
 i80bhAEcGpeNY4UbPHf14ciGZ/YLgQunlaOdGxU08iOXiV4tGI0HG3xZbvahmUOhw0tlSfPSk0zq0
 owhvpwnA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uV8ue-009PKX-Vw; Fri, 27 Jun 2025 15:14:41 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 0/2] Small emit_wa_job() tidy
Date: Fri, 27 Jun 2025 14:14:36 +0100
Message-ID: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
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

I was debugging some unrelated local issue and noticed batch buffer building in
emit_wa_job() was very verbose (in generated code). I think it can be simplified
at not much cost.

Tvrtko Ursulin (2):
  drm/xe: Simplify batch buffer allocation in emit_wa_job()
  drm/xe: Waste fewer instructions in emit_wa_job()

 drivers/gpu/drm/xe/xe_gt.c  | 86 ++++++++++++++++++-------------------
 drivers/gpu/drm/xe/xe_lrc.c | 12 +++---
 drivers/gpu/drm/xe/xe_lrc.h |  2 +-
 3 files changed, 51 insertions(+), 49 deletions(-)

-- 
2.48.0

