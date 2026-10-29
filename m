Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2723A606A323
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMtnM+hi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0526112299;
	Thu, 29 Oct 2026 13:14:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61D5112262
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:50:21 +0000 (UTC)
X-CSE-ConnectionGUID: 2SAtLfsMTZmRdLndZmcfeA==
X-CSE-MsgGUID: 54TnbKB1RZS8Ej1VaXyLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908085"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908085"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:21 -0700
X-CSE-ConnectionGUID: tXLQF5oLS424D3fXHs9RpA==
X-CSE-MsgGUID: qHAyBRVLSGOKmsXECz3keg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6887927"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:21 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 29 Oct 2026 13:50:17 +0200
Resent-Message-ID: <eb0dfeb69c4543d08306d8bbd52a3f04f8de25f4@intel.com>
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3121F20B8CD1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:38 -0700 (PDT)
X-CSE-ConnectionGUID: 9YXZGGruRpeHCCpp3YSNmQ==
X-CSE-MsgGUID: uac6cGo3Stu+yqw70RY27Q==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5036251"
Received: from orvoesa111.jf.intel.com ([10.18.183.151])
 by smtp.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:38 -0700
X-CSE-ConnectionGUID: piFtjfE/SOWdw5c5ac+ZIg==
X-CSE-MsgGUID: RQozjzefTFi+d1Y94VCg6Q==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=dmitrymalovanyy@gmail.com; spf=Pass
 smtp.mailfrom=dmitrymalovanyy@gmail.com; spf=None
 smtp.helo=postmaster@mail-ej1-f46.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6ae31d7d_5xmzWMn30C6aQjB4XcGcRcRkO0XubJlHkf1+v43HYFXpB/f
 QKNO9VTJcVtYbpSocK0xAXhftqHx1Jf6C3TYpAg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0EzBgCEHONqfC7aVdFaglkCgj8WgVYzBFSUK1oBAQEGg?=
 =?us-ascii?q?T5iixYDjEWFX4E/PQIPAQEBAQEBAQEBBwEBTwIEAQEDBDgGhEACjh0CHgcBB?=
 =?us-ascii?q?DAJDQEBAgECAQMCAQIBAQEBAQEBAQEBAQEKAQEBAgIBAQECAQECBAMBAQEBA?=
 =?us-ascii?q?hABASIZBw4SKYZPDUkBiUQBCAGCAgGBJGECBQM7AQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBBQIsXwIBAycLAQ0BGx0BAwwGEDsgAhEBB?=
 =?us-ascii?q?QEcEAmDAoIjAQYQAQM3AwQBqWuMcRYFAhaBAYINBgUDAgGBDdlUChkoDXIDg?=
 =?us-ascii?q?WUBAgIHCQEKAQGBNwGEeCpdAYI+hSR2hAN6Jxt9gRCBFYNpgh+COTiFeASCI?=
 =?us-ascii?q?oEMll0IBx8SCAEcBgoCSBUSAwQDBAQBAgsTCQMDAg4CCAMCCAYZAT8SBBMKA?=
 =?us-ascii?q?woLBwUfCgIMFgooIhIrCgM1Eg8bFQEIBgICBAQCBAwCCQICBQcCEQMEAQEIA?=
 =?us-ascii?q?gItAwEDGQEHCQgCCwURGAwLBzEDEAkDHxcIDghFCAYDEwEaBgUGCzcVBQwRA?=
 =?us-ascii?q?QIbAh8EHQ8IAwEGDgQCAQkDBBYEAhQKIQUCGwEPAwMGAwcDBwIEAwgCCAMDC?=
 =?us-ascii?q?AgDFgMDBQECAgQDAwgIBAMDBAICAwsFAwIDAwUDAwcCBAIEAwMBBQECBwIDB?=
 =?us-ascii?q?wIBGAMCBAgHBwUCCwQCCAQNCQQCBAICDwQGAwMHAQECAQcFBgMCAhABCAoFB?=
 =?us-ascii?q?gICAhwDHQEDDQEJBQIBBQ4HBQICGAMGAgMGBQEDAQkLAQECAwoBAgQCBQMDA?=
 =?us-ascii?q?QMCAwIGAwMCBQUFAwkHBRUBAwMGBQICAwIDAQIIBAYFAwIDBQEDBAMHAwIIA?=
 =?us-ascii?q?wgDDAIWAgUDAwMGCQMHBwIDBwMCBQIHBQMDBQMGAQMCAQMDCAsSIgMBBQMDA?=
 =?us-ascii?q?gEDAgUDAxgCAgQFAwMDAwMIBAICAQcGBAICAgEFBQUEBQYCBAMIAQEFAwMKD?=
 =?us-ascii?q?QECBwwDDAYDBwMDBAQDAgUKAgQBBw0HCQcDAgMHAQELBAEDAwoDAwUCAQEHB?=
 =?us-ascii?q?QMGAwcCAwMDBQQFAwILAwcCAgMDAwInAQEBAwMDAwMEAwEDAQMDBwMFAwIQC?=
 =?us-ascii?q?AEKAwIGAwcGAwUDAwIBAgMDBREDBgQFBhcCBhEyAQgCAwMBFAQEBQIFFQIIA?=
 =?us-ascii?q?QMFAwMDAwIFAQEFAQEDAwUDAwMDAwMEAQMEAgMHBggBAQECCAMDAgUDAwMEA?=
 =?us-ascii?q?wMCAQsEAgUDBgICBAIEAQcDAQICAwMDAwECBAQCBwQFAgsDBAIDAwUCAwIDC?=
 =?us-ascii?q?wYCCwQCAwMDAwMNAQILBhQFCQQIBQMPBQEFBwcJAQMIBQMGAwkDFAMDBgMDA?=
 =?us-ascii?q?woEAgUBBg4MDQQBCAMCBAIOFQQEAwcKCgEBBA4DBAEEAQICBhQCCAwHAQgCB?=
 =?us-ascii?q?QICAgMDAwIFCAIFAgYDAgcCBAkDAgMCAgIGAQMCBAEHAgIDAhkEBgMGAwMGB?=
 =?us-ascii?q?g4CBwMDAgQKBhABBQMCAwMRAwwLAwMDBAUDAgEDAwMFAgIDCQMCBQcHBgIEB?=
 =?us-ascii?q?AYDAgQEAwsSCQgHDAE8DAcKKAQ2ARUUBQQlGWcHB5Fdgj9PAYENgT10OJZSA?=
 =?us-ascii?q?ZsKlCZxaYM/in6QYoV8GjOEBJNPDDySVC6HZpB0khSXBBMHESQSgTI6gVxNI?=
 =?us-ascii?q?4EBgjZQAxkPjisZg2DOOkM1PQIHAgcOAwuFQz6EUoVVgXSBTAEB?=
IronPort-PHdr: A9a23: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
 GzV9wKU2m0=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:n4FVCqFO8GCQnGQapLqEzMeALOsnbusQ8zAXPo5KOHlom6uj5r
 2TdZEgvyMc5wxhP03I9erwW5VoBEmsjaKdgrNhR4tKPjOW3ldARbsKheCD/9SjIVyEygc078
 ZdmsNFebnN5DZB/KTHyTj9PdJl7tfvys+VbCTlo0uFjzsGV0gZ1XYBNu9TKCNLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AF87EL2nZRAATfyKIIdBK8Jc0RTzXOWXc4mvSLWL?=
 =?us-ascii?q?/MkFWRKLIQgKZ8+BWssU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AyaL+9Q0LHesH7zFDZd+9FSUv5zUj2Z2pGkIfnJs?=
 =?us-ascii?q?6lcjHOXVBamujpzvpe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032617"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-ej1-f46.google.com ([209.85.218.46])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:37 -0700
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c434376dbebso120555766b.1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:37 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793269115; x=1793873915;
 darn=linux.intel.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
 b=zMtnM+hiwcz0NYoD2DpqT9VU6yYCI405urfz0wzux7m4t8BbW/v17VFmSub8c09oB8
 x5vBIGQZmbcbtERybHmyNvcGlNC3Gf/V9niQtGBiuK5AL2b0MRf4x/PvUD6KBaSs/P5T
 Mj7jE0q69FkufnNNFlNyr65VIHIC0TCm2VNI/DohAzdOWMCiCUlFc3eBp8DsJZ/q+JFA
 GG/OlP9FYWza9gNMrvGHLgZnD7/oD8kr8/biFbhpCyMIRm/XuY+Kf8SK8jvf5ow25s8q
 ko7l675uyk2VCa6wf89KFb/TZEC0eeVXbddt/p44o2HprviiEAF2uiPFINzZmiB8bmUy
 gpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793269115; x=1793873915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
 b=F+0IHtALUTe0rtsKIVJLTImdOof3qB8c4kKvNfy4PI4f/lFKTxgTn8U6RUAglm23PG
 HHQUPLi0Z/EhqJXbNLr4d22fNjdgZ188wzWTBW2ylVzLdopCrTN04y/A/J+Gy3Ak+UF8
 ceu6+Oo39KeBlSnRNzn5mymR7Gr3D2CksQ0BsjseAzyZ9hsy4KrIBlyBtn2zZcyOAeri
 TbCe+R0tKmn8Tv9GiRgsnv7iVcUBC5S7wIISJ9ZVe2udv6X4/p5ffTId09+fHvv7zYIc
 ++1nK5lejPLLOXhg1K3Ey0nj4GBrL7I8jQ9ov0axV7zLJj4XnuefV85l9U7yhwYibZV/
 GGuQ==
X-Gm-Message-State: AFq9FYLqqsMiHwxAyJBO2kdoI/Iq85XAZeMh/4jKYnKDy7eno3n7H0P1
 e4NU7O/wZ1TFRs3GSJQwRUOr3Zs9nnrPlRruvlQ+8bvunDwejdU1lHBY
X-Gm-Gg: AYBFou2Hz4ncms/Ecb1HnEm5GkxmERPLoWvpwmUUZAmVLBSqW2KKyzn/ZdjRNEkecpQ
 m36/2BdesLyLmJzmZdEE5pd44INbJN5OYUM45n1icZ6i2Tb2lOWfbZDh6GYcZarkR9fyuHy95p7
 CfVQbNOwmMsD7VscvQPxD6+qG5ctbM4iXDef3dJuM0hUGPyyy3sVQ/Oeik24GhK9TfO4Cz2KE5s
 Q8Fn+zgqWlZMQAUtWU5LfJquKkty8dCYFL6kxb2nJ7RUTo/RDAz9eMVXfcHmTv9Yixe6Q4qAxSd
 zlzzC3J1z8cQiDpJMxbe3EET79MayFBh7pqFLq2PeUOTcCKJBxAiVQTug4nPouSRzUIaObsJpP+
 19vrPQnExy71iizrsEokcWBa6DGpNMqP2WApymO1A2GI9crL9BCZ0BIW8qJZmC2RFF7P+tTd8d7
 oA9246rVxvtwKEGBfGk62ZvneCl5Stpcna/HEw8B652QXqeH9kDHuaxjSLuddjPOoA0U1TnXmAs
 oDJ1ovlygBclFEVl8E3AfEfjQ9W9AH7aOl5avuGcBH0+TKtiiTX+hQ7kW83n/oibYBN86kY4cnD
 gDPUfXqDr+7Io9eRQMF8nvYSQWOcSxjOs2xsLD5XWWDaRnkDocUBIt8TkzA4g5M=
X-Received: by 2002:a17:907:80e:b0:c2e:62af:b6fe with SMTP id
 a640c23a62f3a-c49d11324e8mr178671366b.8.1793269115238;
 Thu, 29 Oct 2026 03:18:35 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Oct 2026 03:18:34 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:25 +0100
Message-ID: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: x05AtNaACOWF
X-Mailman-Approved-At: Thu, 29 Oct 2026 13:14:13 +0000
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the helper instead of open coding the check, so enhanced framing is
used for all DPCD r1.2+ sinks as the spec requires.

The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
the other drivers do. That is 15 bytes, it fits in one AUX transfer.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8d0626ddf..0973598c7 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -262,7 +262,7 @@ struct cdv_intel_dp {
 	uint32_t color_range;
 	uint8_t link_bw;
 	uint8_t lane_count;
-	uint8_t dpcd[4];
+	uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
 	struct gma_encoder *encoder;
 	struct i2c_adapter adapter;
 	struct i2c_algo_dp_aux_data algo;
@@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode
 	intel_dp->link_configuration[0] = intel_dp->link_bw;
 	intel_dp->link_configuration[1] = intel_dp->lane_count;
 
-	/*
-	 * Check for DPCD version > 1.1 and enhanced framing support
-	 */
-	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
-	    (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) {
+	if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
 		intel_dp->link_configuration[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 		intel_dp->DP |= DP_ENHANCED_FRAMING;
 	}
-- 
2.50.1 (Apple Git-155)

