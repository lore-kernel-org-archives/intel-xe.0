Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75001C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 07:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5DE10E12A;
	Fri, 16 May 2025 07:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IEi/mLEi";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A8C10E12A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qJJEwWYgsjwjfbmrA6HmHO3BWDWyqP+yMRuOmsharVY=; b=IEi/mLEiJWMx22yc34I7MOeD6A
 CKHQYBmYtisERwm7yedo/u+Z96CjdeTrnUuYvuZDEwxdcK+clqdiAJfE34bAh8K0Xf8PeLd+5oYTp
 dU7/WmxeaPuEjmdjbj6vn1VMVMNGVSMuG5fnA8DNgE+21lLBzMmG28Z9YbrMOWzAIaDky0OkZlLPH
 v6lE9mwnQl92vRYG7Ol7IbpNK+aDxwTpqO/VsSkTnj0cWxzGG51PQU1ybjGqypiqOmfzOXspRPde+
 eB346YNxaA6EyNlFyeKpFuV+D/xJcG8kG2fydMGL8K7Snzm4XSBoEX/oVh3IVkDLQ/OBhjP89DESX
 MtZou6zQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFpe6-008yOm-MD; Fri, 16 May 2025 09:44:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 0/3] More missing XeLP workarounds
Date: Fri, 16 May 2025 08:44:09 +0100
Message-ID: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
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

Some more missing XeLP workarounds. This time round the indirect context ones,
which also means some plumbing had to be added too.

Tvrtko Ursulin (3):
  drm/xe: Clarify LRC size when allocating
  drm/xe/xelp: Implement HSDES#16010904313 workarounds
  drm/xe/xelp: Add Wa_18022495364

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 ++
 drivers/gpu/drm/xe/xe_lrc.c              | 144 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc_types.h        |   5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules       |   1 +
 5 files changed, 149 insertions(+), 12 deletions(-)

-- 
2.48.0

