Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836C4CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 23:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54F10E0A3;
	Mon,  5 Oct 2026 23:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tychen.cc header.i=@tychen.cc header.b="Tm8KEJ5o";
	dkim-atps=neutral
X-Greylist: delayed 916 seconds by postgrey-1.36 at gabe;
 Mon, 05 Oct 2026 09:48:32 UTC
Received: from out-2uec-a116.jellyfish.systems
 (out-2uec-a116.jellyfish.systems [63.250.43.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C8F10E23E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:48:32 +0000 (UTC)
Received: from [10.18.116.108]
 (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4hyvFK5h78z8sWP;
 Mon, 05 Oct 2026 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
 s=spacemail; t=1791192487;
 bh=2y4wr1V5I23GlnTFeGGG3Jbwi2k2otlqOWx04rBsWn4=;
 h=From:Date:Subject:To:Cc:From;
 b=Tm8KEJ5ouweADvxi8I85+HzzD9Hk5RcJfryDiZmPb6Ww4rOaYdWM+UGoMkXkjNSpO
 qDvukQdlBQq6HOzpsWDDknUpyQcDEr/uUcn69dM1OXRrTo2erwDG/xZYs/Lxd4iRxy
 1tX/t0NQzOhH4sScW0c3zKPnfZywclGWikPgUa+1OXonU53nFYolbexzLhoxI40mro
 oCHEX7tBZQRPwZGvoUgHvXx3VvPcGN7CO6T8UJjuNFsqlUkHWd2JmbYgJw/fcAECTA
 A2EE+yG2we31fSTV3JetYFJDb5wp1C+8lIqbABCriXpYmbSloHuDkiPVo8flN42U+/
 eM9XFWOCvN7dw==
Message-ID: <179119248353.3188462.12379850125625100861@tychen.cc>
From: Tianyi Chen <hi@tychen.cc>
Date: Mon, 5 Oct 2026 17:21:10 +0900
Subject: [PATCH] drm/i915/display: Correct the DKL PHY RMW documentation
To: jani.nikula@linux.intel.com,
    rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org,
    intel-xe@lists.freedesktop.org
X-Envelope-From: hi@tychen.cc
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:52:45 +0000
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

intel_dkl_phy_rmw() calls intel_de_rmw(), which unconditionally writes the
register through intel_uncore_rmw(). The kernel-doc incorrectly claims
that unchanged values are not written back.

Describe the actual read-modify-write behavior. No functional change.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 drivers/gpu/drm/i915/display/intel_dkl_phy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dkl_phy.c b/drivers/gpu/drm/i915/display/intel_dkl_phy.c
index 35e919eae369..77b4c85511d3 100644
--- a/drivers/gpu/drm/i915/display/intel_dkl_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dkl_phy.c
@@ -84,8 +84,7 @@ intel_dkl_phy_write(struct intel_display *display, struct intel_dkl_phy_reg reg,
  * @clear: mask to clear
  * @set: mask to set
  *
- * Read the @reg Dekel PHY register, clearing then setting the @clear/@set bits in it, and writing
- * this value back to the register if the value differs from the read one.
+ * Read @reg, clear @clear, set @set, and write the result back.
  */
 void
 intel_dkl_phy_rmw(struct intel_display *display, struct intel_dkl_phy_reg reg, u32 clear, u32 set)

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.55.0


