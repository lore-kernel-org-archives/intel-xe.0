Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B0F55103
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 17:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E382E10E045;
	Sat,  7 Mar 2026 17:35:58 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1E010E045;
 Sat,  7 Mar 2026 17:35:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id B7AB03F1E0;
 Sat,  7 Mar 2026 18:35:53 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v3 0/5] Bridges without VGA support
Date: Sun,  8 Mar 2026 02:35:33 +0900
Message-ID: <20260307173538.763188-1-Simon.Richter@hogyros.de>
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

reformatted the descriptions to follow the style guide, removed unlikely()
from return code checks.

Companion patch for i915/xe is v3 of

  https://patchwork.freedesktop.org/series/161721/

which can be applied independently and should probably go in before the
__must_check patches at least.

Not sure if these should have a Cc stable. If yes, there is a backport of
the i915/xe patch as well (what patchwork calls "v4").

Simon Richter (5):
  vgaarb: pass vga_get_uninterruptible() errors to userspace
  vgaarb: pass errors from pci_set_vga_state() up
  vgaarb: mark vga_get() and wrappers as __must_check
  pci: check if VGA decoding was really activated
  pci: mark pci_set_vga_state() as __must_check

 drivers/pci/pci.c      |  6 ++++++
 drivers/pci/vgaarb.c   | 20 +++++++++++++++++---
 include/linux/pci.h    |  4 ++--
 include/linux/vgaarb.h | 15 ++++++++-------
 4 files changed, 33 insertions(+), 12 deletions(-)

-- 
2.47.3

