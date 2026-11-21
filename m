Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE892606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=By/f/+j1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591B910EF24;
	Mon, 23 Nov 2026 15:17:45 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FE610E9AB
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:55 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-9495e8ae23aso157392585a.2
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263955; x=1795868755;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pbpRr+2ryo5edvUo2p1ilxCl28GiReMUUvndavjAz4s=;
 b=By/f/+j1jv3prYqds0Z8iY1p3HYLZROv4BSAczjKWVJ77ppgPAzU6BqmFusfMY71VD
 1vz1yWrcy/pQl17gz0Ph3IpDJZTd4S8fQJR5rehrkm2WL+Gg5zU/JRatRbYLHG0QfC/1
 GAa5fX/OXxh4pA4LDqtnk2eWLJtyAwJSIpyjDcYjhHq47/5r56EZv8h0/4JdtE0PFdHX
 dt3uAsAVwHnB+f6tqlcK2AculCLf6+1yE2gfcswU2SnELo+aaNAzrU57Icfkl1kk6mLA
 nIK1WwoaYDqw01hRZyaWCxxFgQZP4OY0Im2vpx/ozlM9XMkGrH8ocxn+j5nGaXSaUXCY
 utzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263955; x=1795868755;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pbpRr+2ryo5edvUo2p1ilxCl28GiReMUUvndavjAz4s=;
 b=AVxlKTLl1+DqVoswUnXtisjA3z2iguxhdKtTnd6e2NC+wU1TCIzt+7q2kIbZQlV2NG
 xty/dx+3GeEqPtD0TeaTJBXwBb8pDGrK8+aFa2zrCD3hg8PxIC3cWUuftBGf6BLBwqV6
 kWoOccJDODEXTmFdjSKNPFNvFHhjgCi9znKIYyx4x1a216wSVGljdH49V34oURFYU9FX
 b5Lpoa9Xx66qfiJMpTix9V1iD+IVtvSbkEt9Hxf5rJcZVOSwrtoghnjcAPJQIgr7HhyK
 eSIwcZHni+DpBLf6U8UxvntztYnPp89TGRX8USeUEC29ew8+UoYpBn1ECeOvabApep+Y
 1z7g==
X-Forwarded-Encrypted: i=1;
 AL+hErGlAbdX2XJWYr7GU/BtYRnEuRvlgeJWrrwAK8hXfFjMTi0B/wxk306+2T0YAaCCxvsUXZoLV9snuA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+/gDzJVYNA/QnEQBgfetMM2YgLNLDFXdVcYm4Uy/rWS7p7oSf8
 piGnrVVNUGNEXuSMy11Vv+YS6ofXsoThWyVbKS7CfX2CS+TBtvFqzXZd4soEO0ud26w=
X-Gm-Gg: AZFdTZf7+IuztzA2Nuy/H6Lx9qQwIwLA8uz14oLrGBhhvo32+9GVK5nQaSX7Tiv5Tvt
 WEAOe5NZKD4jZ/bQL7m7k1er09/NjOrPV2SpetjQJGGIfDuH7tyw07Yp0WmtcvKGKibIYvqUdtC
 xxlJYOClU40mTDK9hFKuVolTi9RAuywbx+WJrKKwIOEgoZxJ+3uWRc/C5rJNWpy0qtZEiEEqHgp
 lE1PK2yzlFm3AJc3erN/3W4kUjlzntZt4dbwJRQobl93g1smfH3pa4JB95z0lr/U8i8jQcDcWJx
 nLZDPy1HTCYD2WGmwiL1WrReuiZMrqnZ60Kz8MG+t1M4atbWndjk8/RLgUYel+OVMOnWlKA9nEt
 f62jzbxBRcRoOjf6Cs+88OMkaL9OiATrvO0BeY5x7/hQI0HZMpm0os6FN7BGlWGG7O+tltHENNJ
 C5fLYWUKcZq3VcQD6p82VtJyNmCCBrUQ/FjQOTffGo8uhu79eJMhxXAfnH6wb6yGOSXnWMW1lXg
 QOpvoNFreJ/MUSMD4nHk0+PEm4WJAuqajcVd/r06cQDTgFgXwpp7nOhy5m71LwHozEa2BCO+SPD
 EC0p6e/rGwtQoXuMGvWKAdztuIW52LbCMdj9uNe96ORwnw0zl/Uqmtf63naKjhCxfAhmJNEERzc
 duJqeAeIQdj9Fr8UUoPskomOOMDRk9Gpj0pz3ZA2YTcmEf1zi6wstjEjH8o8YUnvllc0WWsoisl
 Zceau5vxMCiAyMTc/kvEQG0aWZGhh5lrDLS8VDMYB3JgRDZWtCQYsievGrBFzjAOaK1Q6lPvaJG
 v9QT4+1
X-Received: by 2002:a05:620a:29c8:b0:949:6fd4:3552 with SMTP id
 af79cd13be357-949baa0b570mr952702885a.34.1795263954662; 
 Sat, 21 Nov 2026 04:25:54 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:54 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 1/4] drm/i915/alpm: Add a helper to suspend the AS SDP in
 PR Active
Date: Sat, 21 Nov 2026 07:25:47 -0500
Message-ID: <3ab45d0e8c1bded51e0dadd71fd5b3fa0a1cad9e.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add intel_alpm_pr_as_sdp_in_active_disable() to set or clear
PR_ALPM_CTL[AS SDP Transmission in Active Disable] without touching the
other PR_ALPM_CTL fields. PSR code uses it in the next patch to send the
AS SDP in PR Active while frames are being updated.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f54b29e19..910067d27 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -511,6 +511,28 @@ void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+/**
+ * intel_alpm_pr_as_sdp_in_active_disable - suspend or send the AS SDP in PR Active
+ * @intel_dp: Intel DP struct
+ * @cpu_transcoder: transcoder Panel Replay is enabled on
+ * @disable: true to suspend the AS SDP in PR Active, false to keep sending it
+ *
+ * Set or clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] and leave
+ * the other PR_ALPM_CTL fields as they are.
+ */
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    enum transcoder cpu_transcoder,
+					    bool disable)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	mutex_lock(&intel_dp->alpm.lock);
+	intel_de_rmw(display, PR_ALPM_CTL(display, cpu_transcoder),
+		     PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE,
+		     disable ? PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE : 0);
+	mutex_unlock(&intel_dp->alpm.lock);
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index f8f605d94..a45ddd04f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -14,6 +14,7 @@ struct drm_connector_state;
 struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
+enum transcoder;
 
 void intel_alpm_init(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
@@ -37,6 +38,9 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 					      const struct intel_crtc_state *crtc_state);
 void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    enum transcoder cpu_transcoder,
+					    bool disable);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

