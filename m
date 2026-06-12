Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA98CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 14:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADEE10F543;
	Fri, 12 Jun 2026 14:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="DzWW/u5f";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF69D10F58D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781273472;
 bh=GspJD6CP8fK0eQIfV0XNt9iqcw7M/nF6drNsQltToV4=;
 h=From:To:Cc:Subject:Date:From;
 b=DzWW/u5f6Bzs6PbcldYDqXQ8t8M6GLFqQJeP2qg0UwCkIhZTYIW9SNy1pHnVZVEEW
 UuuVXilt1GWf6Zd489WVYHCIr74ZLdEK3xyvjAp4lUiWnWS8YYgg4OPv3IbBVz1re2
 pZzrO8WMlEXOhKgEVuSG3orbt6I2q+d80THkexXAIADPe98Afpy7yhv3bICcTKnqVc
 s9MOqN8flh1WzqQBYwJY/hPGXmIqi8nFCTAqH4XQN5/qgr1MDmZ+qaSncf9tRSVEcX
 lnRTYzy+HVfRxVdZs1RLrYV5HZ9v3gNXDLGKLSY6DIib2GYiI6+TIHcq1U2UHDk1DY
 OvJSxiJMkrZKA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/2] drm/xe/display: Optimize remapped DPT pinning
Date: Fri, 12 Jun 2026 16:11:19 +0200
Message-ID: <20260612141122.17959-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

Create and use xe_bo_addr_iter to improve the time complexity
of remapped framebuffers from O(N²) to O(N)

Maarten Lankhorst (2):
  drm/xe/bo: Add xe_bo_addr_iter.
  drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 24 +++++++-------
 drivers/gpu/drm/xe/xe_bo.c             | 45 +++++++++++++++-----------
 drivers/gpu/drm/xe/xe_bo.h             |  3 ++
 3 files changed, 41 insertions(+), 31 deletions(-)

-- 
2.53.0

