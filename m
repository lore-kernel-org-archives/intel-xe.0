Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EB606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=cPgiK+np
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2E010E90F;
	Wed, 25 Nov 2026 14:58:40 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8748C10F017
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:36:59 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-94959217274so501032685a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 07:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534618; x=1796139418;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=F3fUstdnw1R9iAM56oJ0cEix/cakuApF68cHmWXsObA=;
 b=cPgiK+np+KYAcxSCf++8QZrXRDzed8SBpyDwjlQGFR35d9+oJ+IXaAYshZaVQ6s/2w
 qQROnhyYzDjDHkMEVgrf5tgEGBnGxktkaru3JmBlyAN0YBQvT/nXD5RXS/AES76iMHh+
 2vmXU7g66aXmHyx7umEgMc6burdAecsA8rmA25v/cWaR4ywBMr0AcA2qSxrGkyglzObj
 SyUY6y14TTY26Bk52tZ6wkxWXXHWTWzXY5LICM1Z6TNMGbPtv4pUF3AY5O+qlv0TTSFf
 WzhF/KRpFQN5kKTGVbVpblJCQMgaD6cM9HfumhZP3Nzl5rNIeU3XbpyxdjWVGIcRWZVf
 uN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534618; x=1796139418;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=F3fUstdnw1R9iAM56oJ0cEix/cakuApF68cHmWXsObA=;
 b=vczoUKNAd57+95KvXLloX8gpYxoAUm2206ppEQ+3p6rKkEbCcKKyfjpx0Y0DkMJ95E
 Qvn2ZDQ7Y+VoO9pgfkZuS8Ao9yH5vnvu7vLqpJ/GLACIFoOAydznZC9uYR19qG+4Qmt8
 vg/BRq8qJ9BmHaVY/kUPA0gYeC7yysLpG20eRhE19eCnGiflBf9GYSMeRslwv3kX/U7H
 ebvf4OKGV/vKv2nWHeDhkCTlPMYzPqDPGuvT6Pqx0JhZu1qyZE5solCZVO9NrS4jC9MJ
 osJpQ8uCWn0IPVB5ANrgeIuYSoWZSPZ4XHS4vpIfefyZdi9tWUR6TSQqg6vzV4mOMefH
 MRhg==
X-Forwarded-Encrypted: i=1;
 AL+hErHtiXdAKIyitwjgsd7sJ3MQGe2hQKcMfPX3IfSYhHmM0m8ami6kbRQZb1MzeYBjc1fZiPVzv7msGw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/NpfwE4sCcQfAGR0IAU9Y3+hKMXk8z80CMzaYmFgJrJAuotQGg
 thslnUWntQQH4buYllsc/7Qo9MT3Q1TYugsO3Zj0O6GNOD8gPcn+DN1+1QI3gGIcElmaBItqkM4
 8juW8zcMBow==
X-Gm-Gg: AZFdTZcPqesP6EvzjBSpwgu3UVjLKZi1vuxrrnLrkM72J9NP3KEPVYU+77qN0yiVVn7
 cW5ukk0tpUzKdKF/Op87l2baPggwYh8YFaUdM5DGMa/fPdHeefZCHZDSJObvF6JYwH/pbxAcgbD
 QzN/3Ctn01jWhmcoNgfK6jPntO4HnewrEhfbkZ92FQp1Ex8DB00BTOmaV6ux1Rq4c9cvkLQtdYF
 AAa8HRkX9QunV/13rgx84EPTK/O2hOS7pcd8vx8EXitcVdU8n8lO5kUMnysvYF8Rof9roltz6kB
 /QIYYHW4In52QZE4Q5jldQxuQ3mkIY7Z52lTcXI/fureicjsjJEuehSI2FSA5pQQmoAiPfI8/Ja
 TCpp46rdTKBiSnqhW/rf6+k6FCXszAzZztnIIWWE9a9OQeA47wTYxeYOk9a1TixMXYZGIwhjuk9
 +NR1HKh7drupxQmRyJfxKyVOpgAlUlOE4hEhaKY00Zv/+T3Bta0gs0Al6w4h0EqsJBB0ka2wxZ0
 tPhNWSJlWeaLuF/dlyQ3kSnaDaIjGzShPBD5ttOHTKWABrBfIoY9xhTybqCIyIIpRGPdclLuTEr
 ngFM0e/+CZd0ScSBN7Zk5JOVWUnXwGW9vOs8e2Ccg8R7j8NwOkjKgFrz+k1ZawXgd4fcRtsPN4C
 qK4HqMVd5kUQ3rs4eyHdvJlJ182xSLjpLQ5jDXDporlrKOKnER3u38Kg5U0WXikLsD1h4JH1+1F
 I3BU5qiFtoict1Ri/PbJYXBWJXhmD+1uuWrYTDUQ3O5D30HTEI0gyf9NseDaQYoTEx
X-Received: by 2002:a05:620a:710c:b0:949:673f:72c2 with SMTP id
 af79cd13be357-949baa0d90bmr2625315885a.53.1795534618332; 
 Tue, 24 Nov 2026 07:36:58 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:36:57 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 1/4] drm/i915/alpm: Add a helper to suspend the AS SDP in
 PR Active
Date: Tue, 24 Nov 2026 10:36:52 -0500
Message-ID: <4801e395b4ec582fd9b1bc80585c556349ffb663.1795527921.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795527921.git.j@metarealtyinc.ca>
References: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
 <cover.1795527921.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:58:40 +0000
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
 drivers/gpu/drm/i915/display/intel_alpm.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f54b29e19..24f1dce72 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -511,6 +511,26 @@ void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+/**
+ * intel_alpm_pr_as_sdp_in_active_disable - suspend or send the AS SDP in PR Active
+ * @intel_dp: Intel DP struct
+ * @disable: true to suspend the AS SDP in PR Active, false to keep sending it
+ *
+ * Set or clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] and leave
+ * the other PR_ALPM_CTL fields as they are.
+ */
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    bool disable)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	mutex_lock(&intel_dp->alpm.lock);
+	intel_de_rmw(display, PR_ALPM_CTL(display, intel_dp->alpm.transcoder),
+		     PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE,
+		     disable ? PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE : 0);
+	mutex_unlock(&intel_dp->alpm.lock);
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index f8f605d94..6ce583d32 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -37,6 +37,8 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 					      const struct intel_crtc_state *crtc_state);
 void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
+void intel_alpm_pr_as_sdp_in_active_disable(struct intel_dp *intel_dp,
+					    bool disable);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

