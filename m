Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A970BCD4850
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 14:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695E210E7C7;
	Mon, 11 May 2026 14:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GqZXOw6o";
	dkim-atps=neutral
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0727888697
 for <intel-xe@lists.freedesktop.org>; Sat,  9 May 2026 16:24:26 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7dcd54a8d17so186554a34.0
 for <intel-xe@lists.freedesktop.org>; Sat, 09 May 2026 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778343865; x=1778948665; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LO2P0xIyQDisD90PKW6kTEf7ozKUuDCN/MlNOVEwtA8=;
 b=GqZXOw6oXghP0yIrow/tU24BgNnJyQXl+7h1EJHsugVbpI802zf1C+53cbwCAgTa7w
 r40ua542vETZ3WwwdTlgc8sP8CYQafyflucoNp6B9G8C2MjMEwlvke3Icz4Pc8jGoFwP
 k3KYuJIsa38gxqbrJNxJ68qFXz6MWWGUAM570glqJHzaKUpUS5og/uRNowXREq4Zhzmh
 LJxm1uIf4ndADEdUapWPUqVRFYb5rN9+PYqnRdvUIUD+46pjLhGTw6gaTHaXzmZeirrj
 90su9JlTGOqRqabb3KH7XAHErJafSNDX10GSoknhvUJrLIZn5q+dBRhBOXuQcJa2vWta
 YIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778343865; x=1778948665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LO2P0xIyQDisD90PKW6kTEf7ozKUuDCN/MlNOVEwtA8=;
 b=BkamU537+gre+jZ8b1b7KAt//HKKxEss91+M1Q67fC21aFeXTQuc0E+DV+Tq8dg3uD
 dLO1t4pphfYYZ+rw+hFBUlQ7nO2ScjJypXWtH1d3g6qGqlbRs/5hOZGp9e6oh6YXp4bo
 +UDiAeOpcjSglA80KPVFXTE/fFpxWm4OGj4Fe1qtjP7ETYWqW8KKZTBQWRwrpqeohAwt
 ARSlQdH9ashqmsjTBbTWT9SF4xyQ+onCzDiNvEiOoql3noH2vhy6TK4AGBYmIFATw8Zf
 bYIIbi1xLeH8Xf+uQd2THIusjP6TVuwg9eb/I6VqgGqDl6NYaizUysjxxLhnD04esuGK
 45hA==
X-Gm-Message-State: AOJu0YxhDGkZCWpkjnZVgQHGf6DIjq+ThhDuY/Y6vJ+Q07YmaDXkJWA4
 zQ0LYDeo7Uu7W3viOw2cQpaDiE/hs8N57CXBJoMohM2li+DRHvxP3rl7
X-Gm-Gg: Acq92OGNrOkoHARLCPE6030oN5vJCRKIB99Bb0v1OlRMaCVXcbEZL8tO8kieFoo1rLe
 WyI6wja0jPX1SjsLUTU/DNRYduKR6TR6ahYxsQI9rW5A+X26JvN755aG+eIPsW8uKL8ovZFWbAc
 VtERtDuASZtg1tj7vEhzeY10XL0nk9HZiy/cHmJVVrXmV4kSkGjcdQB7944tyyC/mFLT0WGIqQk
 kAShIt/Kj4V2MBFxsSztrAUUVO+Ls0tzSTWkZH7kAuw12RXDfKgBeMv03//WuAAr1K9yRYqbmil
 55fHG5AO4yocyeh5xOVzXLFpnHFKElDzuPo+0MSDggisXndSn/R5wxtylZxRaKGlHSBrnWuVVM8
 o5Sb/4vGr09LX3U8c+b3Ic8/D18sGxltitcB9EIUk7tvJqGh7MNbpkgKfVhgGlJBGzcZ0d/ysNm
 NpuWP6OezCQcuLj0SXAHaVxpUsnkGRWXU5uLdG10NFHqAlFOoE3tUdZYtz6diXMQyNC4ap7yRIi
 A/TZBKwCsHDYDJCNXIRjbRk
X-Received: by 2002:a05:6870:fbac:b0:434:357:6dcd with SMTP id
 586e51a60fabf-434fc418c5amr6222410fac.8.1778343865106; 
 Sat, 09 May 2026 09:24:25 -0700 (PDT)
Received: from localhost ([136.49.184.116]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-435571099a4sm4623244fac.7.2026.05.09.09.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 09:24:24 -0700 (PDT)
From: Aaron Esau <aaron1esau@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 mika.kahola@intel.com, stable@vger.kernel.org,
 Aaron Esau <aaron1esau@gmail.com>
Subject: [PATCH 1/3] drm/i915/cx0: check PLL ACK bit in
 intel_cx0_pll_is_enabled()
Date: Sat,  9 May 2026 11:24:05 -0500
Message-ID: <20260509162407.510539-2-aaron1esau@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509162407.510539-1-aaron1esau@gmail.com>
References: <20260509162407.510539-1-aaron1esau@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 May 2026 14:41:03 +0000
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

intel_cx0_pll_is_enabled() only checks the PCLK_PLL_REQUEST bit in
PORT_CLOCK_CTL, which is set by the driver during the PLL enable
sequence. It does not check the PCLK_PLL_ACK bit, which is the
hardware's response indicating the PLL actually locked.

When the CX0 PHY MSGBUS is unresponsive (e.g. after a failed s2idle
resume), the PLL register programming via MSGBUS silently fails and
the PLL never locks, but intel_cx0_pll_is_enabled() returns true
because the driver-set REQUEST bit is present. This causes all
downstream state readout and verification to operate on a PLL that
is not actually enabled.

Check both the REQUEST and ACK bits so that a PLL is only reported
as enabled when the hardware has confirmed it locked.

Fixes: bf8531990380 ("drm/i915/display: Allow display PHYs to reset power state")
Cc: stable@vger.kernel.org
Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Aaron Esau <aaron1esau@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 7288065d2..4cacea802 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3581,9 +3581,12 @@ static bool intel_cx0_pll_is_enabled(struct intel_encoder *encoder)
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	u8 lane = dig_port->lane_reversal ? INTEL_CX0_LANE1 : INTEL_CX0_LANE0;
+	u32 val;
 
-	return intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port)) &
-			     intel_cx0_get_pclk_pll_request(lane);
+	val = intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port));
+
+	return (val & intel_cx0_get_pclk_pll_request(lane)) &&
+	       (val & intel_cx0_get_pclk_pll_ack(lane));
 }
 
 void intel_mtl_tbt_pll_disable_clock(struct intel_encoder *encoder)
-- 
2.54.0

