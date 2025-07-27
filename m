Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511FCC87FCC
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 07:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B7810E3C2;
	Sun, 27 Jul 2025 07:04:27 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BB110E3C2;
 Sun, 27 Jul 2025 07:04:26 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 3634A3F108;
 Sun, 27 Jul 2025 09:04:23 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v2 0/1] Mark xe driver as BROKEN if kernel page size is not 4kB
Date: Sun, 27 Jul 2025 16:04:09 +0900
Message-ID: <20250727070413.9743-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.2
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

until either of

 - https://patchwork.freedesktop.org/series/150230/

or the (same but rebased)

 - https://patchwork.freedesktop.org/series/151983/

goes in, the xe module will Oops on insmod when kernel page size is not 4kB.
This disables the module for the time being, and should be reverted for fixed
versions.

This should probably also be added to the stable kernel series which will
likely not receive the fix.

Simon Richter (1):
  Mark xe driver as BROKEN if kernel page size is not 4kB

 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.47.2

