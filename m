Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD3CA5FEA
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 20:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF06C10F9D3;
	Fri,  2 Oct 2026 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="GUSPIceb";
	dkim-atps=neutral
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com
 [74.125.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D2210F9FB
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 19:40:37 +0000 (UTC)
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144f47a9b57so7822132c88.2
 for <intel-xe@lists.freedesktop.org>; Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790970036; x=1791574836;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gsIJDrrqVrbyQzUJcQTVkyHK/0UNIS8D9cN3PD9t/4o=;
 b=GUSPIcebH4KQM7BQYohWJ7O3GivQZlkayO0xM8PlIGE7n6aDEgnnSR95W5y3x3lQ42
 sR6PIvXQUeNZJDpy2WHBaxIec77Kd/e6JqB7n5tV3UtUksZh0m4t/hkwiJ4SAZM6WVKg
 NmWpkyXNEL3e4Gbmrqg1i+QmM6r6UMK/tf/D597kQ5L9LvNUg60g+fCHVnbxjlK2iLX4
 90U+NlPoQ47sd9S+v5jm1oQzEmUeHiPCY8dtp1kTqBhdFrbv/YGwqvRTnxTPJQUB1M1c
 wR6mvPNbP4Mg5W+3S8bkqegRtKx8AOsMcioVsXze/dZre0T90lRbY8EDcsh4Qd6//Q1X
 /ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790970036; x=1791574836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gsIJDrrqVrbyQzUJcQTVkyHK/0UNIS8D9cN3PD9t/4o=;
 b=WG/ZIykIIhqaOjH9z3geF2saYNeGJob2Rs1jc92GljHpvEIxAfdi2rt4BiZFbquVE/
 kIXEk8aG+COkZ78nEnykVDNDSMV7xJR9vkr5koZrjkxF2Ns2kN3KpGtCn6p5W8gjy266
 k+kQxZj9u8l+CAPGFZw6H2XI+5V2DvclzDxmpwzDI0Q9f47iG31xXxa57ieorhJweihm
 AuDHK3liZ6jGPlrXypA49pfQNEEFftvjuVgMBMLKbqR9rwY6S5aaaZLwHqN02I/R3ZsJ
 U3JLHe2lbzVRLpadReg4aYA191a3aVQ3wvASM004Pghrv4qu2jZ7Rl4Cby7FNhqL698A
 MfuQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByNTJe5qRaMqkBw236aj5R9vcj1lSSWW0rxaDZ0YM2p/oyR+WyCM9SSZBnCxldp0b/eIiNJ9nAUCg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mRZ7/jkho3ZW2B2Btrbf4qNeUBML/OjiCORHUQbIPTuDNZO5qM
 RKI7Pd9mcnLyqWGbre9HwySMNYICFKLjKuaqh+urVWJnqDDl/0tZgJQlYYHVT6nkrys=
X-Gm-Gg: AYBFou2owBMy4BKDGXsjIx2MiwwCjO3lzMk4t/pBB+5gw6pHtTxRRzYzlFZLEpUqvsw
 3hZ/YaZqknCSDZidA8n6tzXjfeXkC9PAwU6UGxv8cYzaM6r0HuXeNOI+Xq5Wedmfvp2vyH3yGyx
 5rrMYRwgGnW0I59/rlZAH8dvSrLHFQ4QwZxrIzq8C8WaSVaKNggUmdxe4poHAUUmCga4nl+iWXL
 dTG4TRfj60a8LnIsthSOKEr3R3RAvk+nHI/At/+l6HjsuCGfuwKYmtEObqN8JlTvekn60SBJDzp
 Aiwz9EWPk2DQgf4OmLrfmtutYnP/mhoBT9cOpk3P6fb1UvXIfm+J+cGEWSbyPT67J2BJFpJevSB
 4u1f0ZS1k/TYnICNkF4iLGJeoVr4QVGP/balR+kN4O/5M2RHh3rU7a1AZI9Ecg88Vq8Npdiixc7
 M1wf4HvmqUe7I7ogEQBl6THQR6lIdmsP111PMzHx5I28mTBBOofpglvHSgnFtCJ/1RzYuwDgSaU
 3lbD8ZwA6VOQi8Lo+H4sPLESC1rByaa2stCvW6v972VPJLipiOylSQA8ckwjote8d1whGk=
X-Received: by 2002:a05:701b:241c:b0:14f:99a2:1715 with SMTP id
 a92af1059eb24-14f99a217ebmr3412492c88.39.1790970036327; 
 Fri, 02 Oct 2026 12:40:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 02 Oct 2026 12:40:35 -0700 (PDT)
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
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org
Subject: [PATCH 6.1.y 1/2] drm/i915/hdcp: Add encoder check in
 intel_hdcp_get_capability
Date: Fri,  2 Oct 2026 15:40:26 -0400
Message-ID: <20261002194030.20489-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002194030.20489-1-artem@trailofbits.com>
References: <20261002194030.20489-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:44:45 +0000
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

[ Upstream commit 31b42af516afa1e184d1a9f9dd4096c54044269a ]

Sometimes during hotplug scenario or suspend/resume scenario encoder is
not always initialized when intel_hdcp_get_capability add
a check to avoid kernel null pointer dereference.

[ Backport to 6.1.y: this tree uses the older intel_hdcp_capable()
  helper name. Apply the same guard there; the code change is otherwise
  unchanged. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-2-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53051. It rejects the HDCP capability query
when hotplug or resume left the encoder unset.

The 6.6.y backport went out as the same 2-patch series and has been
picked up for 6.6.y. The fix is already present in 6.12.y, 6.18.y, and
7.2.y, but not in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53051
Upstream: 31b42af516afa1e184d1a9f9dd4096c54044269a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index cb7f86de967a88..507721c94f2fdd 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -182,11 +182,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 /* Is HDCP1.4 capable on Platform and Sink */
 bool intel_hdcp_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
 	bool capable = false;
 	u8 bksv[5];
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	if (!shim)
 		return capable;
 
-- 
2.39.5

