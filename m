Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25118CCD184
	for <intel-xe@archiver.kernel.org>; Sun, 12 Oct 2025 12:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07DC10E01F;
	Sun, 12 Oct 2025 12:46:03 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DD010E01F
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Oct 2025 12:46:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 4EE2A3F072;
 Sun, 12 Oct 2025 14:45:58 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 0/1] Avoid crash during dump when finding an evicted BO
Date: Sun, 12 Oct 2025 21:45:31 +0900
Message-ID: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
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

Hi,

this is the horrible, but short implementation to avoid dereferencing
bo->resource when it is NULL. As far as I can see, that can happen if a BO
is evicted, and maybe for other reasons as well, and most other places
looking at bo->resource will also do a NULL pointer check.

Is the "if (!ptr) ... else switch(ptr->member) { ... }" pattern acceptable,
should I do a "goto out;" instead, or should I duplicate the unlocking
path?

   Simon

Simon Richter (1):
  drm/ttm: Avoid NULL pointer deref for evicted BOs

 drivers/gpu/drm/ttm/ttm_bo_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.47.3

