Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1388D5CCA0
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 09:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C7410E8D1;
	Tue, 16 Dec 2025 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Ba6fBdfU";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E0710E77B;
 Tue, 16 Dec 2025 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765876963;
 bh=Qyjkrg23NvqAtrZ6SXaT7ACN9JWfiY1iU+ZEiaE5bX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ba6fBdfUrpFW11SE9npqyrOnhhFlkhLW7oe+ERI1gAkzZe1d0LFcPg7JkT2zOZgGp
 ofJ6yAKWMQzqrKP+scuuQg80WlHdAj0lw466zhNYuX4nTt/1WGUw8PcTnHhNBsZ2lY
 gN+GGj/0BFDqpGItfhhjqJGYoCmlpX7YcIUJD3dms08XWf631ciPyofK3gzjCjdrja
 EUgCJcEwoSiA/iDcOwXhzc77QKKd9PWnm9VUcrQh1JJU+8gtgcVEdw0ipH4CcLTDdc
 cHjjckVdAAL0IAs/fTAL+a1UhxrESeN39LJsblOFDuqncsp/AeXnYk5tCf8yIYX+L9
 EUccSCNkdf2Rg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [i915-rt v2 16/16] Revert "drm/i915: Depend on !PREEMPT_RT."
Date: Tue, 16 Dec 2025 10:22:43 +0100
Message-ID: <20251216092226.1777909-34-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216092226.1777909-18-dev@lankhorst.se>
References: <20251216092226.1777909-18-dev@lankhorst.se>
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

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Once the known issues are addressed, it should be safe to enable the
driver.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 5e939004b6463..40a9234e6e5dc 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -3,7 +3,6 @@ config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on X86 && PCI
-	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
-- 
2.51.0

