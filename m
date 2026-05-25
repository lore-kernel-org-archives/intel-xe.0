Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DDDCD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 13:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251010E62D;
	Tue, 26 May 2026 13:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=poorly.run header.i=@poorly.run header.b="VyWwa/km";
	dkim-atps=neutral
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3892B10E31A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 13:57:37 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-7bdf83185bbso93351827b3.2
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1779717456; x=1780322256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIiu1ri2o7Ro6bhV4J7LIEJCYOdJihANjgjmW46ndBY=;
 b=VyWwa/kmvRYntINVD3k92mcfzF709r74BBo/7cJy3Dpis6ybpoV1FLuaU7R9Vrqc+L
 Wc26WRcgc3OXWloggpfweikJy4k1kApXF0rKVL7LetZdmhBHGFP/VNWXU3j4pL7a0g2m
 IyTLFu3VQxwkTh1fHqqZCV+3HRSOMxYDO9b7YHxTPF+YjufKdA/gNjcMXnpSkWTLWcv7
 gPt+h9jUt05BuJO+qcL1f25vP3PjRwYh0babRQL/3SVsUF3mwIzU7lGPPC5cu46lXmGB
 Tylg9MMUs8ADdCi0AEt6m7f7OBSPdMikJ6VHdl2oSTJ2lbXtT9PWT0E5cDVcwU8mdSFT
 NAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779717456; x=1780322256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gIiu1ri2o7Ro6bhV4J7LIEJCYOdJihANjgjmW46ndBY=;
 b=DsFKUcldt4SI87TTqUdwePxom5RzUlg/R2Tx7CDJldtFGCa7vh/ihmWrLQzzmsA8UN
 cdunJkvpTf89UrhSg1basIlpaGsApJ9gSSI/hQVskKIOOTPMufcLtwje/ISgtrUlWdrQ
 IYqlcRVIoBuDHiZ+uFNUQCsEL5RojpI9Gu6xcvy6xBP8QUyfDi5lZepyt6hhCKdNC1I+
 q0NgK8YE1wRfz9gxlFeBeVbYul3InihSF2XDF/FcM4VEdJfpPTJnCvsf0nK+b0oldnbW
 jtPVcSE2JnRVl1vdrCaFCoXT1H5IUUrJsTua7rrHax+ec3wxOD6wPldG1q9jdlIc0nO8
 bS9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+SR1zY3XTo94WRqheb5W+oFhCksQmyOO7PkRF+xLeuDNNF5luA1rs5Yz/I2KnKiXX/hCQVdT3Nw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK/UQVklALO9SgLoCKryeUK8RZyoRh3LJ04d39V0M4+1/5iXwN
 Jy6+0BDbawDKilaP3hFJnTp/7iKsp0W370FzYO8Y6pw8ab9sTyhpgoJCk+si0ZEoauM=
X-Gm-Gg: Acq92OHtCvDVtkLz+hiSfK7n1VGOifWhJ19AeHhqJgbLuOM9sBJBH3G9yUb8eoCUVh7
 dFQAg2ZVAanuh+HVzrXeLKCz/ACHeYiw5ZsFSu11/vGAPGKMdZ6yWe2KODm3R+4vxTKxEjKadyf
 YVRHoibDlBWY3c5ecuU73Orn5TVEwGXnqPcDZkFQ+RTXBiIvl4R/6KNXwkcX9FGqyBdIDP/y9eD
 ij1AN8Cw2XMaqE1tF+td3IPzSJ1DKHb5Gz+0x41T+qU4F1aABFWez67JO6iSeW6hIA3MQfXuPtn
 wIWgyIqvdPiEmDHl1ZYmUH5C5CcCY6z1EsvcM71J0NQbTQ1jomgtzlQ3F3HJ/HPGFXXhG78GNvj
 n705jDJQCCy6xj3khOPzaIRn0veR0a31w63UM3he2cmCC5bJDrAjcnpNsUQ13r7jxgZ7xkkYhO2
 HKtunw38vJq5Ar6ZgFFE69B8p/xTe+hXHNg2lloO6KcTb/L9cUKUadA4M=
X-Received: by 2002:a05:690c:6982:b0:7cf:e690:3e3c with SMTP id
 00721157ae682-7d338488bc8mr153718117b3.11.1779717456255; 
 Mon, 25 May 2026 06:57:36 -0700 (PDT)
Received: from localhost (191.99.245.35.bc.googleusercontent.com.
 [35.245.99.191]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7d38be2dc9csm46036237b3.24.2026.05.25.06.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 06:57:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Cc: Sean Paul <seanpaul@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2.1 2/2] drm/i915/color: Fix Pre-CSC degamma LUT bounds
Date: Mon, 25 May 2026 09:56:05 -0400
Message-ID: <20260525135730.1122696-2-sean@poorly.run>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
In-Reply-To: <20260525135730.1122696-1-sean@poorly.run>
References: <20260525135730.1122696-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 May 2026 13:01:58 +0000
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

From: Sean Paul <seanpaul@google.com>

Fix a typo in the loop condition in xelpd_program_plane_pre_csc_lut
for Segment 2 degamma programming, changing 'while (i++ > 130)' to
'while (i++ < 130)'. Also clamp Segment 2 to the last user-provided
LUT entry value instead of hardcoding it to 1.0 (1 << 24) to fix
a step discontinuity.

Link: https://lore.kernel.org/intel-gfx/20260521180143.2143262-1-sean@poorly.run/ #v1
Signed-off-by: Sean Paul <seanpaul@google.com>

Changes in v2:
- Split out into separate patches for pre/post csc fixes
- Dropped loop bounds fix in favor of [1]

[1]- https://lore.kernel.org/r/20260519075245.383864-1-pranay.samala@intel.com
---

Changes in v2.1:
- Rebased on Pranay's patch and sending without in-reply-to

 drivers/gpu/drm/i915/display/intel_color.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 7185f3628dcf..458508bcf1f4 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3968,6 +3968,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	enum plane_id plane = to_intel_plane(state->plane)->id;
 	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
 	u32 i, lut_size;
+	u32 lut_val = 1 << 24;
 
 	if (icl_is_hdr_plane(display, plane)) {
 		lut_size = 128;
@@ -3978,7 +3979,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 
 		if (pre_csc_lut) {
 			for (i = 0; i < lut_size; i++) {
-				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+				lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
 
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
@@ -3990,7 +3991,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 			do {
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
+						   lut_val);
 			} while (i++ < 130);
 		} else {
 			for (i = 0; i < lut_size; i++) {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

