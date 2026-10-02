Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB9CA5FE9
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 20:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC03110E6C3;
	Fri,  2 Oct 2026 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="ErPMe3zF";
	dkim-atps=neutral
Received: from mail-dl2-f26.google.com (mail-dl2-f26.google.com
 [74.125.229.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D0510F9FB
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 19:40:38 +0000 (UTC)
Received: by mail-dl2-f26.google.com with SMTP id
 a92af1059eb24-144f47a9b57so7822156c88.2
 for <intel-xe@lists.freedesktop.org>; Fri, 02 Oct 2026 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790970038; x=1791574838;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cik4OmGCLcSffV9aIni80ba9p8veycKB8eAV/ioP5eU=;
 b=ErPMe3zFoNPj71oqQZxaOfkvJcPEeqdNIs83wW1Mp2UPFzOEMpQzva9J4DvEvjYgnk
 VRgtK0hoKuZrWe0h0V9op6b1jF6mxbQOUQ3ntMpcrA1+J7Ck0P07nenXVKywf+ZZXDnY
 GqSQp8IeFDpj/Dwd723RnneFm4mKEUnQuey0rPdwkXQ4Bx/nMjiaEDCBzD0y9KLZT/oa
 b8Qp46VGjC/BQf9dfpNHOu5cELqSJOe+aW95/WtIjekL4mNHBhA/0KWWPJxPJTjjewXo
 +T4z+NCCMRH1oZUJTKGYwExNnq4YGIXf7+UtgxoE2y8eAZYy+Urzj056pGI9hvD/bFlw
 5IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790970038; x=1791574838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cik4OmGCLcSffV9aIni80ba9p8veycKB8eAV/ioP5eU=;
 b=pA961GUI9UPf+OebV6fplyl9Nka8qWIvgLqnAs4MZBeb+1X11cOj32YVEQh3O/hU+m
 jqH1YktM0M+A56AzlLQskZmozGReKbOFckfqFCjmdsNlEviiX2wa5YP9Q5SlafNjm5Rg
 HEret17cIg/OwlQJLl30+Zx94i7IbFQ6l7kOjw6K8yYlelhoZQhacTykU9WckDlT7cRe
 ZhOklulbEHMIel6OEs7bF5JM7h9qH6njkElucciMSQdvWWyWpjMeKO9CrXmsBR6o0ADm
 FvvGsO2kUhV03A6DzKnrMqKPRuZ7ITxIH9+3I3yNrNLZ12rgnryDFk6A8S7RLbEbugUZ
 nYTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPnGzbOWOt7iZDRdnXRNrVpl8/bkbKbahvONexosR7DrclNZMKdkinAS/N+gzIxW/U26TKTpRWoQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kBUnKFAFxujUyLLjavQ1i1a3RK/DM9jKt03fD55Z5eq1z18HUn
 O6c3jAk+LbBYxYkT6bb30pYsz42S5mdBzip2pNhYYk40DGEM62BgbrUDVMXfhfczzK5E9fC5+2R
 ia+CJb1Y+IA==
X-Gm-Gg: AYBFou3A1CN5n+OEho6ypW8Be42qa9hbWZiHrNC3TdQKa8M4mNG1IDVrEvFSdvTk+0V
 jN8SW7JspvWDCUMZfjAuG9fX0MP4acPj7cz3B0wGRQqYH7D/vOA85KSMqQPWuXvBQCp/gIGoNpP
 IACdXqfN4dLVexSWTns5XeN/Rt5RdKesnVGVj7IQuBQFh587ZqZx3BzSqslp40a2Oe+RZ1DrpTE
 CyOUkzqZatxcDwhRMzhT2JtfAu00BecRimGcKVxWexVSNUIQGwW++ey9kyz9bOOJrIWsPn4/MnQ
 b8VoQIi9r3xoUc3xZnzxakFmtjSmxkh8DKJVzuEfKy2kPZbufkt3Z/Tma+Av8n+fcrnJJs01NQz
 X4sBdPkSnuVNFI6qQLS2x6glXUyQzbVm4iu7ywB5JtX0hKfB7NQ0ea9TbvvA0jVxc7n3k4whJUW
 Z2zvhHgd3ld9/PEs4UQ0D94+VwhlNdP3Wip254YErdXdNsI/GqSVLulLffpPx7utx6wDcnGqtMG
 4z7lxZapye0AbRY4+97MPeDipUbOvmhhMy1ZiZw2FdKgAR6ojCcegBR/JMt4wY4w/6rVIwxRlas
 hzv+JA==
X-Received: by 2002:a05:701b:2096:10b0:143:2719:566e with SMTP id
 a92af1059eb24-14f5d3b9a1fmr3905150c88.42.1790970037645; 
 Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
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
Subject: [PATCH 6.1.y 2/2] drm/i915/hdcp: Add encoder check in
 hdcp2_get_capability
Date: Fri,  2 Oct 2026 15:40:27 -0400
Message-ID: <20261002194030.20489-3-artem@trailofbits.com>
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

[ Upstream commit d34f4f058edf1235c103ca9c921dc54820d14d40 ]

Add encoder check in intel_hdcp2_get_capability to avoid
null pointer error.

[ Backport to 6.1.y: upstream adds the check in the DP shim's
  intel_dp_hdcp2_get_capability(), which does not exist here. This tree
  predates the intel_connector conversion of the shims: its
  intel_dp_hdcp2_capable() takes a digital port, and the
  intel_attached_dig_port() lookup is still done in the common
  intel_hdcp2_capable() helper. Put the same encoder guard there, before
  that lookup, and return false through the bool API when no encoder is
  attached. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-3-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53050. It adds the same encoder check to the
HDCP2.2 capability query, which the debugfs path calls right after the
HDCP1.4 one.

The 6.6.y backport went out as the same 2-patch series and has been
picked up for 6.6.y. The fix is already present in 6.12.y, 6.18.y, and
7.2.y, but not in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53050
Upstream: d34f4f058edf1235c103ca9c921dc54820d14d40

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 507721c94f2fdd..d31c1f1f0e5074 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -208,11 +208,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 /* Is HDCP2.2 capable on Platform and Sink */
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
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

