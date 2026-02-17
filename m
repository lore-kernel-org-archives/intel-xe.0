Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE19E909DA
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 17:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD7410E52D;
	Tue, 17 Feb 2026 17:04:44 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8510E523;
 Tue, 17 Feb 2026 17:04:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 5129A3F1BA;
 Tue, 17 Feb 2026 18:04:40 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 0/5] bridges without VGA support
Date: Wed, 18 Feb 2026 02:04:14 +0900
Message-ID: <20260217170419.236739-1-Simon.Richter@hogyros.de>
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

this allows bridges to refuse forwarding VGA, and reports this upwards as an
error, because we cannot set up valid decoding for the requested device in this
case.

I think it should be fine to leave VGA forwarding enabled on lower bridges if a
bridge closer to the root refused to enable forwarding, because no accesses can
reach there anyway.

   Simon

Simon Richter (5):
  vgaarb: pass vga_get errors to userspace
  vgaarb: pass errors from pci_set_vga_state up
  vgaarb: mark vga_get family as __must_check
  pci: check if VGA decoding was really activated
  pci: mark return value of pci_set_vga_state as __must_check

 drivers/pci/pci.c      |  6 ++++++
 drivers/pci/vgaarb.c   | 22 +++++++++++++++++++---
 include/linux/pci.h    |  2 +-
 include/linux/vgaarb.h |  9 +++++----
 4 files changed, 31 insertions(+), 8 deletions(-)


base-commit: 9702969978695d9a699a1f34771580cdbb153b33
-- 
2.47.3

