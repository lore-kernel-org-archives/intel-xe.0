Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F38EDE999
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 13:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF410E7EC;
	Tue, 10 Sep 2024 13:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPle7wES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1D410E7EF;
 Tue, 10 Sep 2024 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725975748; x=1757511748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQCL/3/hXo+sfoqNw7oOodZZCNZdcg7lS6ntaduk3N0=;
 b=DPle7wES7wuCXkp9lgKl3tBDiF+9dlSUo8BUOKMiMjoUcMQ6MciWXr2v
 rcxMJkzpJ3RUodGi5TACcvq9Ov2h8LyL7TTqMib/ps2D1z5tG3ApYyDzf
 LomMCQ8g8h0kC4ew5Ut60AtDr9zO6RESnox8Lo/eOLwjFzXCcaS45N524
 /Sa3PZsvFKPNlDnUXKz2r3hHHT4SYPyVZb0qbvYMRK32omLjB4cY8N6TF
 zOyvUwRSEDTffHLhAOtbt6wtFgH4/c3VtvNWl7RGJKFP+/59X+ImfcGTM
 LsJuR4VH1kpPJnVIXhxCr4Fep3FkxeBhCKjehMSb4UqG/PWgaGTDFIJgg A==;
X-CSE-ConnectionGUID: 73roU0LOTQi0Tvcf2BFOlg==
X-CSE-MsgGUID: +tImvoSwSzegnFm2aYlIbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35861226"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35861226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:42:25 -0700
X-CSE-ConnectionGUID: mhszzTAMSeSwLqu9MUrusg==
X-CSE-MsgGUID: 9i1jAfNBTpaDrQCBCMcAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67081289"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Sep 2024 06:42:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Sep 2024 16:42:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/bios: Add some size checks to SPI VBT read
Date: Tue, 10 Sep 2024 16:42:15 +0300
Message-ID: <20240910134219.28479-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240910134219.28479-1-ville.syrjala@linux.intel.com>
References: <20240910134219.28479-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Unify the SPI vs. PCI ROM VBT read codepaths a bit by
pulling some size overflow checks from the PCI side
into the SPI side.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index cd32c9cd38a9..86b81fd23f58 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3088,11 +3088,22 @@ static struct vbt_header *spi_oprom_get_vbt(struct intel_display *display,
 	if (count >= oprom_size)
 		goto err_not_found;
 
+	if (sizeof(struct vbt_header) > oprom_size - count) {
+		drm_dbg(display->drm, "VBT header incomplete\n");
+		goto err_not_found;
+	}
+
 	/* Get VBT size and allocate space for the VBT */
 	vbt_size = intel_spi_read(&i915->uncore,
 				  found + offsetof(struct vbt_header, vbt_size));
 	vbt_size &= 0xffff;
 
+	if (vbt_size > oprom_size - count) {
+		drm_dbg(display->drm,
+			"VBT incomplete (vbt_size overflows)\n");
+		goto err_not_found;
+	}
+
 	vbt = kzalloc(round_up(vbt_size, 4), GFP_KERNEL);
 	if (!vbt)
 		goto err_not_found;
-- 
2.44.2

