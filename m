Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891F5FCB615
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 15:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CBE10ED52;
	Fri,  6 Mar 2026 15:24:27 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E31A10E14D;
 Fri,  6 Mar 2026 15:24:25 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id D72C63F1E5;
 Fri,  6 Mar 2026 16:24:22 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 5.3-6.19 0/1] Avoid oops on illegal VGA register access
Date: Sat,  7 Mar 2026 00:23:46 +0900
Message-ID: <20260306152413.758919-1-Simon.Richter@hogyros.de>
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

this is a backport of https://patchwork.freedesktop.org/series/161721/ that
should apply to anything between 5.3-rc4 and 6.19.

It adds a way to avoid the illegal VGA accesses on non-x86 platforms by
letting these platforms report that VGA registers cannot be mapped.

This patch alone doesn't fully solve the problem, it also needs complementary
changes in vgaarb to actually report this, but since the interface is unchanged
and it is wrong to ignore the error code anyway, little coordination is needed
here.

   Simon

Simon Richter (1):
  drm/i915: handle failure from vga_get()

 drivers/gpu/drm/i915/display/intel_vga.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)


base-commit: 6a753907865e35ae986b7b2ad48daa1eab4bcf3a
-- 
2.47.3

