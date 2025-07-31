Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB515C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 11:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6AE10E394;
	Thu, 31 Jul 2025 11:38:15 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7652710E394
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 11:38:13 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 3ABFB3F108;
 Thu, 31 Jul 2025 13:38:10 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v2 0/4] Relax config dependencies for MEI
Date: Thu, 31 Jul 2025 20:36:31 +0900
Message-ID: <20250731113753.238707-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250715083132.3748-1-Simon.Richter@hogyros.de>
References: <20250715083132.3748-1-Simon.Richter@hogyros.de>
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

this allows using MEI on non-x86 CPUs, compiling it into the kernel while
GPU drivers are modules, compiling it for testing purposes, and accepts Xe
as a prerequisite for a GSC interface (i915 is still x86 only).

   Simon

Simon Richter (4):
  misc/mei: Allow building Intel ME interface on non-x86
  misc/mei: Decouple ME interfaces from GPU drivers
  misc/mei: Allow building standalone for compile testing
  misc/mei: Xe graphics also has IME GSC interface

 drivers/misc/mei/Kconfig           | 4 ++--
 drivers/misc/mei/gsc_proxy/Kconfig | 2 +-
 drivers/misc/mei/hdcp/Kconfig      | 2 +-
 drivers/misc/mei/pxp/Kconfig       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.2

