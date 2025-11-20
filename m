Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF8FCF64AB
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 09:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7DB10E29C;
	Thu, 20 Nov 2025 09:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Y6vqpfA1";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA55810E29C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1763632515;
 bh=FkIE6gVvIp7Z+vxOlEi6HqGBcUMTEXHlsGzNZthVqb0=;
 h=From:To:Cc:Subject:Date:From;
 b=Y6vqpfA1mUYsc56gbQYJwGPtJ1uft9H0ELHaYVBW/eEaFFl6fNH8A6ffBlMgKDGNa
 JSeGxepV/BEqBjUmVyOSj8BpcmBHw9e7ZkhQG8hSUcp4ZeDoVvpQZugHdHvIsECO9+
 HRQ7LNmfMyzs/kd+DO8+dg6+2JtrieM/KykBm5c9nAqC1/g0/G48FvJaoVHuBK6kQE
 5uUdoosybJFpC/gnf+OnpjArJXcoexi0BT/oPEYQP7xCo2xsNsUn0s+5mQR6Ht89Me
 nJx9eQnofQ9PlxHmRMfmr/6t+6qp5+NK2I8ZwS9Dxsf17WjbNqbXV9KnSry9vXVaA5
 8u6AmjH/Mw2kA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] CI test with forcedac
Date: Thu, 20 Nov 2025 10:55:32 +0100
Message-ID: <20251120095532.264668-1-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7944a3af4545e..b62c73f883254 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -82,7 +82,7 @@ struct iommu_dma_msi_cookie {
 };
 
 static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
-bool iommu_dma_forcedac __read_mostly;
+bool iommu_dma_forcedac __read_mostly = true;
 
 static int __init iommu_dma_forcedac_setup(char *str)
 {
-- 
2.51.0

