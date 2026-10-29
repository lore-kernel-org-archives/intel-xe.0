Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15A606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRr4dmI6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFCA10E829;
	Thu, 29 Oct 2026 13:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C18112266
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:50:37 +0000 (UTC)
X-CSE-ConnectionGUID: 1J607ukuRUCO28abMcHOhA==
X-CSE-MsgGUID: cjpQc6bET369WWckJvdbYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2031286"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2031286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:37 -0700
X-CSE-ConnectionGUID: nvwGLveGQOenpRBUSN77fQ==
X-CSE-MsgGUID: MNCmVulcSwesCzaJVJHEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5112998"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:36 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 29 Oct 2026 13:50:33 +0200
Resent-Message-ID: <8d0c228f3c669ca99c6d38c931961ff1dd0d8d61@intel.com>
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0BFEE20B8CD1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:40 -0700 (PDT)
X-CSE-ConnectionGUID: NnzS1lsaQRCeWn1uS3F6OA==
X-CSE-MsgGUID: 0dLRr15IRlCAP9N5yt2etQ==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5036253"
Received: from orvoesa111.jf.intel.com ([10.18.183.151])
 by smtp.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:40 -0700
X-CSE-ConnectionGUID: jNAAv77MRECbvAUKA1jk7Q==
X-CSE-MsgGUID: h+APIBJnSMWpQgfqETFi6A==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=dmitrymalovanyy@gmail.com; spf=Pass
 smtp.mailfrom=dmitrymalovanyy@gmail.com; spf=None
 smtp.helo=postmaster@mail-ej1-f42.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6ae31d7f_+tVlqTdHvDsNzhga8uW8SMpps8zaKYoaGiT/NuV2T3MVQUM
 3BpVmyrAd78aPoi+nngdXT59u2Z3+gnCtGKd5XQ==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0HoAwCEHONqfCraVdFaglkCgj8WdWEzBFSIJ4wEWgEBA?=
 =?us-ascii?q?QaCVIpikieBPz0CDwEBAQEBAQEBAQcBATEeAgQBAQMBAziERgKOHQIeBwEEM?=
 =?us-ascii?q?AkNAQECAQIBAwIBAgEBAQEBAQEBAQEBAQoBAQECAgEBAQIBAQIEAwEBAQECE?=
 =?us-ascii?q?AEBIhkHDhIphk8NSQGJRAEIAYICAYEkYQIFAzoBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBBQIsPwEfAgEDJwsBDQEbHQEDDAYQOyACE?=
 =?us-ascii?q?QEFARwZHIJmAYIiAQYQAQM3AwQBqWuMcRYFAhaBAYINBgUDAgF/DtlUChkoD?=
 =?us-ascii?q?XIDgWUBAgIHCQEKAQGBNwGEeCpdAYI+hSR2hAN6Jxt9gRCBFYJzdoIfgjmGM?=
 =?us-ascii?q?ASCIoEMgliUBQgHHxIIARwGCgJIFRIDBAMEBAECCxMJAwMCDgIIAwIIBhkBP?=
 =?us-ascii?q?xIEEwoDCgsHBR8KAgwWCigiEisKAzUSDxsVAQgGAgIEBAIEDAIJAgIFBwIRA?=
 =?us-ascii?q?wQBAQgCAi0DAQMZAQcJCAILBREYDAsHMQMQCQMfFwgOCEUIBgMTARoGBQYLN?=
 =?us-ascii?q?xUFDBEBAhsCHwQdDwgDAQYOBAIBCQMEFgQCFAohBQIbAQ8DAwYDBwMHAgQDC?=
 =?us-ascii?q?AIIAwMICAMWAwMFAQICBAMDCAgEAwMEAgIDCwUDAgMDBQMDBwIEAgQDAwEFA?=
 =?us-ascii?q?QIHAgMHAgEYAwIECAcHBQILBAIIBA0JBAIEAgIPBAYDAwcBAQIBBwUGAwICE?=
 =?us-ascii?q?AEICgUGAgICHAMdAQMNAQkFAgEFDgcFAgIYAwYCAwYFAQMBCQsBAQIDCgECB?=
 =?us-ascii?q?AIFAwMBAwIDAgYDAwIFBQUDCQcFFQEDAwYFAgIDAgMBAggEBgUDAgMFAQMEA?=
 =?us-ascii?q?wcDAggDCAMMAhYCBQMDAwYJAwcHAgMHAwIFAgcFAwMFAwYBAwIBAwMICxIiA?=
 =?us-ascii?q?wEFAwMCAQMCBQMDGAICBAUDAwMDAwgEAgIBBwYEAgICAQUFBQQFBgIEAwgBA?=
 =?us-ascii?q?QUDAwoNAQIHDAMMBgMHAwMEBAMCBQoCBAEHDQcJBwMCAwcBAQsEAQMDCgMDB?=
 =?us-ascii?q?QIBAQcFAwYDBwIDAwMFBAUDAgsDBwICAwMDAicBAQEDAwMDAwQDAQMBAwMHA?=
 =?us-ascii?q?wUDAhAIAQoDAgYDBwYDBQMDAgECAwMFEQMGBAUGFwIGETIBCAIDAwEUBAQFA?=
 =?us-ascii?q?gUVAggBAwUDAwMDAgUBAQUBAQMDBQMDAwMDAwQBAwQCAwcGCAEBAQIIAwMCB?=
 =?us-ascii?q?QMDAwQDAwIBCwQCBQMGAgIEAgQBBwMBAgIDAwMDAQIEBAIHBAUCCwMEAgMDB?=
 =?us-ascii?q?QIDAgMLBgILBAIDAwMDAw0BAgsGFAUJBAgFAw8FAQUHBwkBAwgFAwYDCQMUA?=
 =?us-ascii?q?wMGAwMDCgQCBQEGDgwNBAEIAwIEAg4VBAQDBwoKAQEEDgMEAQQBAgIGFAIID?=
 =?us-ascii?q?AcBCAIFAgICAwMDAgUIAgUCBgMCBwIECQMCAwICAgYBAwIEAQcCAgMCGQQGA?=
 =?us-ascii?q?wYDAwYGDgIHAwMCBAoGEAEFAwIDAxEDDAsDAwMEBQMCAQMDAwUCAgMJAwIFB?=
 =?us-ascii?q?wcGAgQEBgMCBAQDCxIJCAcMATwMBwooBDYBFRQFBCUZZwcHkV2CP08BMF57g?=
 =?us-ascii?q?U+TRYMrAY0JoidxaYM/in6BJI8+hXwaM5dTDJMQmQiSFIUGjFiFJhMHESQSg?=
 =?us-ascii?q?TI6gVxNI4EBgjYJRwMZD44uFoMIWIR4yUJDNT0BAQcCBw4DC4Fog1s+hFKFV?=
 =?us-ascii?q?YF0gUwBAQ?=
IronPort-PHdr: A9a23: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
 GzV9wKU2m0=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:mP/8Ba9e4195Pv6TtBxuk+D8I+orL9Y04lQ7vn2ZhyYlF/Bw8P
 re4cjzsCWftN9/YgBGpTntAtjifZqYz+8M3WBzB8bZYOCFghrPEGgK1+KLqF3d8m/Fh5VgPM
 9bEpSWY+eAaWSS4/yKgjWQIpIPxJ2o/smT6ts2DE0AceipUcxdBn9Ce3+m+4RNKjV7OQ==
X-Talos-CUID: 9a23:WQGvr2Mg6gCvsu5DWg9O3VBLReUfX1bX0l7tAGbhC2U2cejA
X-Talos-MUID: 9a23:JhxHQgpVOZKwjGaPKFUezzEhHf9JyYaoM2UyiawJtdCpCQJxZR7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032622"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:39 -0700
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c423b145922so274974566b.3
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:38 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793269117; x=1793873917;
 darn=linux.intel.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
 b=hRr4dmI6kKOJiQFpWT0RwaBTVdL8q+2s7b4O87mkIO5Cd6e/EUyp0Bhf9rLnjIUkS7
 DCH8SmBD6+DB40lg+tk4MSy6ReUb5IyTYA5RcjCdUXFKeNg7iI1Y+N/c9/Fw8vKDFJes
 pMkRlI88Q3oS8AB4maS1pvqPeBRqjcZe26NmCDRe8eSb16x/Va+Su0hPcbSyvEEGXuk8
 8oLy1Ej+84HI4X7BhQCN32zYVhqL9gGxPC7mKQwOmzPEnGfj20NRIpXv4LpC24DLooyK
 AW2XKQQhBlx5shC5cMZvar/pg3XKaCOwQePmLFNIGocBRvquoDCDFQG7rsH6LVROwBDw
 K5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793269117; x=1793873917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
 b=ixhVdf3rvJEue270qv9w9JVJIcKqYHIxBKYRHhycsxiD1FAvMx7jj4pry8ePfyLkvi
 2Ee0/BSrOJKtIbxYqQDf5R1mxwCRnAsRWpO7QXUMVPatp0qlH6lV6IirpLpYS8gK1TJQ
 1wYKIeJEdFKKLIrtuRjEeEwvQQMRKijCw2cimlsSGd7iLbWiBWdsgK2PL2GtB5dH7ev4
 VyAUXwWqZPVaOBGgl+EcoqdD1p24nrUZdgOepMT7MIUPS9jU/TVxOLCdv50nm278ggIj
 HT5aGO/buxhxlrFtVAnbcQHfHyMwDiu9gsOs1qtq1m0oTBML1h/hJOUwkmoWQaCMas3v
 he3w==
X-Gm-Message-State: AFq9FYKNoSywcv0JFAALFzShGsG80EdER2P9mvxIRY8PnfuWQq/TV6Xi
 +d2jf+cI3WL5uY+UmMUS1aGzcq/BWR/uTn/kH5ubfqA3OIIsFRxuWaVa
X-Gm-Gg: AYBFou2qa/y5GX4ucYg/BX6y1nXbzud4jHT6G9OLGiMPOHk4pa4YC28ei7WNLTkuI6O
 STw/lGrNspe814NmNgFxbgKLCwNWtIwc8iX8p1Mq/M+UlzYH5GkcvLSjox/f2UIK1YG/8uQhTFT
 5hvYRDTusx5JNulng2bjaRC3jE2QMAWzdAhlkA1lA5j4aJWvOEQUWlglZiZdnPU3Wybdz/rL+Xn
 J3SwpIPt/F7WiclEiUq0PuQLn0TtuAzNAxTznJSTo6CsKCA+2/aEJcbsd2O2f8W02QT1ujCEV5v
 vzNkhEs6l1iowIr4J1rAkf1aWCMAAKKCJuFLTEWdZtkaBhDdrAB4U18egyY6jF3VPq0omrZIMse
 H66Xh37pL4oFQnkLKAaUVYw/UiVF/OmyN1QCw3OMyRJNg8cBvl8BygUO1+xiFUiO4rKukb9rkXw
 W5NE5g66jDV3FL4TYnvC/LNiQ731Fc3PhJl3DiTzl2E04ek+iOXN6t/jrQUGPYU1sKq+sT2cABZ
 J3jQUZR9TYHOXWhDmCFVPuMeLzhytNSG7DGMpKXSbPd6Yxy4w4HuENf6dm14vZLeL01VTGjGM37
 o5zn/jh0iHVnUfRDnlh8WZhTMPx5GLk+tz3iQme6rJ7TtiwweNevbd2MEG9K4S//zYCD7+LgV2y
 UzakFKdeb
X-Received: by 2002:a17:907:7251:b0:c46:8c16:a656 with SMTP id
 a640c23a62f3a-c49bdecf308mr430095466b.18.1793269117120;
 Thu, 29 Oct 2026 03:18:37 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Oct 2026 03:18:36 -0700 (PDT)
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
Subject: [PATCH v2 5/5] drm/nouveau: Use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:26 +0100
Message-ID: <20261029101826.72773-6-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ujkCPkO8R0NT
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

nv50_sor_dp_watermark_sst() checks DP_ENHANCED_FRAME_CAP for the
watermark calculation, but the actual enhanced framing enable is
decided in nvkm, in nvkm_dp_train(), nvkm_uoutp_mthd_dp_sst() and
r535_dp_train_target(), with its own copy of the check. Convert all of
them so they keep agreeing with each other.

dispnv50 uses drm_dp_enhanced_frame_cap(). nvkm does not include the
drm helpers, so add nvkm_dp_enhanced_frame_cap() with the same rule.

Compile tested only, I don't have nvidia hardware.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c               |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h         | 11 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c      |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  2 +-
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93..f965d4811 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1607,7 +1607,7 @@ static bool
 nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
 			  struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	bool enhancedFraming = outp->dp.dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
+	bool enhancedFraming = drm_dp_enhanced_frame_cap(outp->dp.dpcd);
 	u64 minRate = outp->dp.link_bw * 1000;
 	unsigned tuSize = 64;
 	unsigned waterMark;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index a109348bd..fbd9935f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -509,7 +509,7 @@ nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
 	OUTP_DBG(outp, "training");
 
 	ior->dp.mst = outp->dp.lt.mst;
-	ior->dp.ef = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP;
+	ior->dp.ef = nvkm_dp_enhanced_frame_cap(outp->dp.dpcd);
 	ior->dp.bw = outp->dp.lt.bw;
 	ior->dp.nr = outp->dp.lt.nr;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
index 9a6be4391..e56acc162 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
@@ -23,6 +23,17 @@ void nvkm_dp_enable(struct nvkm_outp *, bool auxpwr);
 #define DPCD_RC10_SUPPORTED_LINK_RATES(i)                               0x00010
 #define DPCD_RC10_SUPPORTED_LINK_RATES__SIZE                                 16
 
+/* Same rule as drm_dp_enhanced_frame_cap() */
+static inline bool
+nvkm_dp_enhanced_frame_cap(const u8 *dpcd)
+{
+	if (dpcd[DPCD_RC00_DPCD_REV] >= 0x12)
+		return true;
+
+	return dpcd[DPCD_RC00_DPCD_REV] >= 0x11 &&
+	       (dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP);
+}
+
 /* DPCD Link Configuration */
 #define DPCD_LC00_LINK_BW_SET                                           0x00100
 #define DPCD_LC01                                                       0x00101
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0ce..b0158fc30 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -87,7 +87,7 @@ nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
 		return 0;
 
 	return ior->func->dp->sst(ior, args->v0.head,
-				  outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
+				  nvkm_dp_enhanced_frame_cap(outp->dp.dpcd),
 				  args->v0.watermark, args->v0.hblanksym, args->v0.vblanksym);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173f..c62900320 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -972,7 +972,7 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 target, bool mst, u8 link_nr, u8
 	if (mst)
 		cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_FORMAT_MODE, MULTI_STREAM);
 
-	if (outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP)
+	if (nvkm_dp_enhanced_frame_cap(outp->dp.dpcd))
 		cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_ENHANCED_FRAMING, TRUE);
 
 	if (target == 0 &&
-- 
2.50.1 (Apple Git-155)

