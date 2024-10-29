Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79767D2AB0A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 09:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359B510E5F5;
	Tue, 29 Oct 2024 09:38:46 +0000 (UTC)
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2024 09:38:44 UTC
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88A310E5F5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 09:38:44 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Xd4kC3cRgz4wy8s
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 10:30:43 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:f139:988f:a76d:7a3f])
 by xavier.telenet-ops.be with cmsmtp
 id W9Wd2D0085E9xN5019Wdvx; Tue, 29 Oct 2024 10:30:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1t5iYN-005noj-La;
 Tue, 29 Oct 2024 10:30:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1t5iYe-002W9M-Qx;
 Tue, 29 Oct 2024 10:30:36 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dave Airlie <airlied@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH drm-next] drm/xe/xe2: Remove duplicate XE2LPM_* register
 definitions
Date: Tue, 29 Oct 2024 10:30:33 +0100
Message-Id: <20241029093033.600098-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Merging commits e1f813947ccf2326 ("drm/xe/xe2: Extend performance tuning
to media GT") and 876253165f3eaaac ("drm/xe/xe2: Add performance tuning
for L3 cache flushing") with their upstream counterparts
6ef5a04221aaeb85 and 3bf90935aafc750c accidentally left multiple
identical copies of the XE2LPM_L3SQCREG2, XE2LPM_L3SQCREG3, and
XE2LPM_SCRATCH3_LBCF register definitions.

Fixes: 26bb2dc102783fef ("Merge tag 'drm-xe-next-2024-10-10' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d428d04164d9d3df..42dc55cb23f4a334 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -410,12 +410,6 @@
 
 #define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
 
-#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
-
-#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
-
-#define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
-
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
-- 
2.34.1

