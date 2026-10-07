Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C026CA600A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC910F7F6;
	Wed,  7 Oct 2026 22:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxKGpY7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93E910F7F6;
 Wed,  7 Oct 2026 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411803; x=1822947803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xdkkwDNuonOoM8T1q0jC8p1CUXNWkQv9sGymcSSoTeQ=;
 b=lxKGpY7JO/Tx5OjMI2ic2l2waxRb1L9Tfp23LSU8invHTvpn6fs4vFSz
 9EDEH1m+hJ/WcZEH7O+PwsYwUSxAnl/HdKS5WG7NyTDjOCPQj4lA8j2QK
 zOKsGh6RVy/cd1mwhaVlVimMyDtQKnNcMpMXOckG3iwuYHuZXHzrtkk1T
 E2zXp7NFJ1mJHuYLQKXLTUx/Haw96EghFmRcdNaSGVVrpQIrM3942Uh4P
 OcfWZTcd1uFYKJWe4A93dtz0zF0rU2e2XCj1oFHvyOSCOAQFdhN1xOOnG
 QGjeQMDBrTGAl3LQauysaEMfaEJA4t/PcczifMBegL890EkdQHai68M2b g==;
X-CSE-ConnectionGUID: OSUJaVM/R92SCOkLVETqYQ==
X-CSE-MsgGUID: U2Y+aqChRGWEq7u4M/ktyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="88781"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="88781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:22 -0700
X-CSE-ConnectionGUID: oK7lGbEUQ2OPs3jGUP6QVQ==
X-CSE-MsgGUID: pNgfDYCiTB2PaF5XMALRYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="193210"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:21 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/gmbus: Stop frobbing with pin direction in
 .getsda()/.getscl()
Date: Thu,  8 Oct 2026 01:23:10 +0300
Message-ID: <20261007222314.5714-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

i2c .getscl() and .getsda() are just supposed to report the state
of the pin without changing its state in any way. So nuke the
bogus register writes from there that configure the pin as an
input (ie. tri-state the pin).

Given how i2c works the pin will already be tri-stated when
.getsda()/.getscl() are called so these writes are in fact
redundant. And even if that weren't the case the input bit
does appear to reflect the state of the pin, even when driven
as an output.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 13bc6ab6b2f6..d23422e12aa4 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -269,10 +269,6 @@ static int get_clock(void *data)
 {
 	struct intel_gmbus *bus = data;
 	struct intel_display *display = bus->display;
-	u32 reserved = get_reserved(bus);
-
-	intel_de_write_fw(display, bus->gpio_reg, reserved | GPIO_CLOCK_DIR_MASK);
-	intel_de_write_fw(display, bus->gpio_reg, reserved);
 
 	return (intel_de_read_fw(display, bus->gpio_reg) & GPIO_CLOCK_VAL_IN) != 0;
 }
@@ -281,10 +277,6 @@ static int get_data(void *data)
 {
 	struct intel_gmbus *bus = data;
 	struct intel_display *display = bus->display;
-	u32 reserved = get_reserved(bus);
-
-	intel_de_write_fw(display, bus->gpio_reg, reserved | GPIO_DATA_DIR_MASK);
-	intel_de_write_fw(display, bus->gpio_reg, reserved);
 
 	return (intel_de_read_fw(display, bus->gpio_reg) & GPIO_DATA_VAL_IN) != 0;
 }
-- 
2.55.0

