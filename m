Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4151CA5FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405E10F414;
	Wed, 30 Sep 2026 13:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="BRvzRBTL";
	dkim-atps=neutral
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com
 [74.125.229.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9F10E930
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 01:03:42 +0000 (UTC)
Received: by mail-dy2-f41.google.com with SMTP id
 5a478bee46e88-34ca54bfc48so181626eec.3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790730222; x=1791335022;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tqnoWOKNgk3yU/myXUZ7ovtM9FCChQAXvuNXrnvE3KI=;
 b=BRvzRBTLoVmBW9wNjdP67oKkMMNl/8+GJRkcFl/Ho1BUlF2eaiLDS+6qTJ/gbu3U7V
 joDVPqCV4eCsnVrcxBRl0bmo5sqv/ZsRDbGd8NWvrn49Q2/63toYfjN4kh5BjhSkD+RF
 1lf3SfPx6maRY1qL1cv9l97/5GmhPuXaz5hea99w3ct4xa6yohb3nFN8hQHNL/1b+u0+
 g/yNdtlZwQrkQPpwia479OQ1rWrl0ARIXOnPWO9r2aGBGJNedZPOkFtOsq4JmWackysE
 IyPqkJon726MN/vEYbd4vRk7cvG0N//4eeJwO9V0ptf8Ru2/J22O+8rQeJsYfcpd7Gcz
 lPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790730222; x=1791335022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tqnoWOKNgk3yU/myXUZ7ovtM9FCChQAXvuNXrnvE3KI=;
 b=gn5IbcX2FZGfR1O+jJr9B+sg7AfiWhsKS7NpXt8cBr8qnV46+6QwRbfP8dj/GlTDYv
 D8WgCmSP/LeZetK14wxbh0riR5eUl+3TA7mum3+rN2/1svVnNElEukkwIv9wdjzWQ81o
 ggnj2e8Lnm7R5oe6RKhd8DHOPPFrECpa17RObyo1EsWhtMv3ITI7u3T79fg+d3F6ch6w
 1byhvZtP8eM9nOOIBmL2A7fLVHlAlwA5JqfK5BR7rb81jd6IpoempP5EUwsSK9uQ9hWu
 WKU50mo1wkUAHpmwSs9iIMclDP/zyk7P2zWngo3acZUEP/oDqka0M+U1BIhvOh98UbRg
 Bz/A==
X-Forwarded-Encrypted: i=1;
 AKwUvByd5Cfz8+oi+uFDrqI4qQpvd+WfOSMX1uWeLLJ9HFCx/+2DAyyjqN2XWoV42VnTNOdi7POEGn3nsw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJGdDj7ufxG3djE7MqRQ4UdybbV8ESmcfPCZ/QEENav7cpqPY7x
 UwDXaAZBeO7M+tcPOfnrinPAAaJzxidUUkZW2maHoHbhchrZLldd9VWBIXe4NgjdSD8=
X-Gm-Gg: AYBFou2rWo+/D38UiInwul+FpP4a7EEkcPoGwgFXNVnIwR/4Chofndlmkudu56xBP63
 IEzlTzmjaLGC3PV/LpNB6IgCZq9TuLWAFdN/PgsJqo9cenTk6Xg+KRNVNnyCtvDRSBGqVFlIGcf
 8hCIm09Nr9OXSt4UKWj3kSqQth8WxbKL3bJ730sfknttwAC8i+/46lGx3eUuStUH0pX4bNp95es
 JldMi9aRXm7SYL+Chrl7rEiAXeB+1KrR/exCDukQN+lTjR4Rf96fbmME3L7t1FcfyAVv31Ro0vI
 LDpGvj1C8k4OAfWZGOdusR2rIDEfMkJASCj3beBqT5ioHKkOVyB0ig8cFZx6Kdhn3bJBnkIS9C0
 MMHe69AGwT+2x2BqM/qkxB40Oe7fXuJwUboDK6eoSaQELVVAdvshi8MGLEK6G7i3KjrNeT8uGFd
 cjU3C6XFsYfzz+q2WsBy7UMzCIy9++861W+xHHMibH2fr7bh/oQYxG6nLpI6djv9TfPeksXmLaR
 JwEy6oQCNH5T/yIrXlww1LpAQUoiwl4juPf6Cs1Dus5B8Tih4Vo0mbJxTKoM9VaihjgxttjaLuW
 0aCtqw==
X-Received: by 2002:a05:7301:a24:b0:33b:bfb7:31cc with SMTP id
 5a478bee46e88-34c66c0725bmr997520eec.16.1790730221429; 
 Tue, 29 Sep 2026 18:03:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Sep 2026 18:03:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 2/2] drm/i915/hdcp: Add encoder check in
 hdcp2_get_capability
Date: Tue, 29 Sep 2026 21:03:21 -0400
Message-ID: <20260930010323.93999-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930010323.93999-1-artem@trailofbits.com>
References: <20260930010323.93999-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Sep 2026 13:48:38 +0000
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit d34f4f058edf1235c103ca9c921dc54820d14d40 ]

Add encoder check in intel_hdcp2_get_capability to avoid
null pointer error.

[ Backport to 6.6.y: this tree predates the later intel_connector
  conversion, so the unsafe intel_attached_dig_port() call is still in
  intel_hdcp2_capable() rather than the DP and HDMI shims.
  Put the same encoder guard before that common dereference and return
  false through the bool API when no encoder is attached. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-3-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
CVE: CVE-2024-53050
Upstream: d34f4f058edf1235c103ca9c921dc54820d14d40
Backport: guard the common 6.6.y bool helper because the later DP/HDMI
split is not present in this tree.
Review: https://lore.kernel.org/r/2026-09-29-daily-reply-0012-re-i915-hdcp-encoder-check-v2-6-6@kernel.org

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f7987fb90bb1..89e378f71d67 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -168,11 +168,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 /* Is HDCP2.2 capable on Platform and Sink */
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	bool capable = false;
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	/* I915 support for HDCP2.2 */
 	if (!hdcp->hdcp2_supported)
 		return false;
-- 
2.39.5
