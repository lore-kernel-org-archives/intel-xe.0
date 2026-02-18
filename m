Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2A6E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 13:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039F610E2F2;
	Wed, 18 Feb 2026 13:47:12 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC19510E5CD;
 Wed, 18 Feb 2026 13:47:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 0E3C83F204;
 Wed, 18 Feb 2026 14:47:04 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v2 5/5] pci: mark return value of pci_set_vga_state as
 __must_check
Date: Wed, 18 Feb 2026 22:46:33 +0900
Message-ID: <20260218134633.461181-6-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218134633.461181-1-Simon.Richter@hogyros.de>
References: <20260217170419.236739-1-Simon.Richter@hogyros.de>
 <20260218134633.461181-1-Simon.Richter@hogyros.de>
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

This function can return an error, which should be checked.

The only caller so far is __vga_tryget in vgaarb, which did not check.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 include/linux/pci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..aa1451d402d1 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1720,8 +1720,8 @@ resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)
 
-int pci_set_vga_state(struct pci_dev *pdev, bool decode,
-		      unsigned int command_bits, u32 flags);
+int __must_check pci_set_vga_state(struct pci_dev *pdev, bool decode,
+				   unsigned int command_bits, u32 flags);
 
 /*
  * Virtual interrupts allow for more interrupts to be allocated
-- 
2.47.3

