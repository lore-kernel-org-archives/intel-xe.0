Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1431DE68147
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 17:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF3210E526;
	Tue, 17 Feb 2026 17:04:51 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A35410E51F;
 Tue, 17 Feb 2026 17:04:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id D101848A3B;
 Tue, 17 Feb 2026 18:04:47 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 4/5] pci: check if VGA decoding was really activated
Date: Wed, 18 Feb 2026 02:04:18 +0900
Message-ID: <20260217170419.236739-5-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217170419.236739-1-Simon.Richter@hogyros.de>
References: <20260217170419.236739-1-Simon.Richter@hogyros.de>
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

PCI bridges are allowed to refuse activating VGA decoding, by simply ignoring
attempts to set the bit that enables it, so after setting the bit, read it
back to verify.

One example of such a bridge is the root bridge in IBM PowerNV.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/pci/pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index f3244630bfd0..0984a0aefb88 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6198,6 +6198,12 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
 				cmd &= ~PCI_BRIDGE_CTL_VGA;
 			pci_write_config_word(bridge, PCI_BRIDGE_CONTROL,
 					      cmd);
+			if (decode) {
+				pci_read_config_word(bridge, PCI_BRIDGE_CONTROL,
+						     &cmd);
+				if(!(cmd & PCI_BRIDGE_CTL_VGA))
+					return -EIO;
+			}
 		}
 		bus = bus->parent;
 	}
-- 
2.47.3

