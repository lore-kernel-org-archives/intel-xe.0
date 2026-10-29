Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C1606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QvMW4zEF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFDF11229C;
	Thu, 29 Oct 2026 13:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366AE112262
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:50:06 +0000 (UTC)
X-CSE-ConnectionGUID: 63qW/aC/SKO6f9b6I8w3oA==
X-CSE-MsgGUID: hyWw4tULSbCUkt79AzcrpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908073"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908073"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:06 -0700
X-CSE-ConnectionGUID: PLWAyQ3PQb+9wqtPFfySmw==
X-CSE-MsgGUID: bVTUaIrTR9qaL9TL197jPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6887924"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:06 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 29 Oct 2026 13:50:02 +0200
Resent-Message-ID: <38feb26ecb832f64197f7eaf420c85610f8c8e16@intel.com>
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C4B3420B8CD1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:34 -0700 (PDT)
X-CSE-ConnectionGUID: dCmukK6tRzGM8zdjFQfucw==
X-CSE-MsgGUID: Y+NHrWKpT1a3j6RUBaCXhg==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5036238"
Received: from orvoesa111.jf.intel.com ([10.18.183.151])
 by smtp.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:35 -0700
X-CSE-ConnectionGUID: suum6R6nQjamOMgPnzOkfg==
X-CSE-MsgGUID: GuO2vAJaRMOdUW6E+NV/Cw==
X-Ironport-Invalid-End-Of-Message: True
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=dmitrymalovanyy@gmail.com; spf=Pass
 smtp.mailfrom=dmitrymalovanyy@gmail.com; spf=None
 smtp.helo=postmaster@mail-ej1-f45.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6ae31d7a_rdUZEnndBphdUef8biAI3TtvIdAGAM6+WdIveHteC7jgcVr
 1YxeBYtjWLH9sZN9yLhuoHSwU4GXOoPTh/BRQMQ==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0H9AwCEHONqfC3aVdFaglkCgj8WgVYzBFSUK1oBAQEGj?=
 =?us-ascii?q?TYDh1SEcYVfgT89Ag8BAQEBAQEBAQEHAQFPAgQBAQMEOIRGAo4dAh4HAQQwC?=
 =?us-ascii?q?Q0BAQIBAgEDAgECAQEBAQEBAQEBAQEBCgEBAQICAQEBAgEBAgQDAQEBAQIQA?=
 =?us-ascii?q?QEiGQcOEimGTw1JAYlEAQgBggIBgSRhAgUDOwEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQUCLF8CAQMnCwENARsdAQMMBhA7IAIRAQUBH?=
 =?us-ascii?q?BmDAoIjAQYQAQM3AwQBqWuMcRYFAhaBAYINBgUDAgGBDdlUChkoDXIDgWUBA?=
 =?us-ascii?q?gIHCQEKAQGBNwGEeCpdAYI+hSR2hAN6Jxt9gRCBFYNpgh+BaxszOIV4BIIig?=
 =?us-ascii?q?QyWXQgHHxIIARwGCgJIFRIDBAMEBAECCxMJAwMCDgIIAwIIBhkBPxIEEwoDC?=
 =?us-ascii?q?gsHBR8KAgwWCigiEisKAzUSDxsVAQgGAgIEBAIEDAIJAgIFBwIRAwQBAQgCA?=
 =?us-ascii?q?i0DAQMZAQcJCAILBREYDAsHMQMQCQMfFwgOCEUIBgMTARoGBQYLNxUFDBEBA?=
 =?us-ascii?q?hsCHwQdDwgDAQYOBAIBCQMEFgQCFAohBQIbAQ8DAwYDBwMHAgQDCAIIAwMIC?=
 =?us-ascii?q?AMWAwMFAQICBAMDCAgEAwMEAgIDCwUDAgMDBQMDBwIEAgQDAwEFAQIHAgMHA?=
 =?us-ascii?q?gEYAwIECAcHBQILBAIIBA0JBAIEAgIPBAYDAwcBAQIBBwUGAwICEAEICgUGA?=
 =?us-ascii?q?gICHAMdAQMNAQkFAgEFDgcFAgIYAwYCAwYFAQMBCQsBAQIDCgECBAIFAwMBA?=
 =?us-ascii?q?wIDAgYDAwIFBQUDCQcFFQEDAwYFAgIDAgMBAggEBgUDAgMFAQMEAwcDAggDC?=
 =?us-ascii?q?AMMAhYCBQMDAwYJAwcHAgMHAwIFAgcFAwMFAwYBAwIBAwMICxIiAwEFAwMCA?=
 =?us-ascii?q?QMCBQMDGAICBAUDAwMDAwgEAgIBBwYEAgICAQUFBQQFBgIEAwgBAQUDAwoNA?=
 =?us-ascii?q?QIHDAMMBgMHAwMEBAMCBQoCBAEHDQcJBwMCAwcBAQsEAQMDCgMDBQIBAQcFA?=
 =?us-ascii?q?wYDBwIDAwMFBAUDAgsDBwICAwMDAicBAQEDAwMDAwQDAQMBAwMHAwUDAhAIA?=
 =?us-ascii?q?QoDAgYDBwYDBQMDAgECAwMFEQMGBAUGFwIGETIBCAIDAwEUBAQFAgUVAggBA?=
 =?us-ascii?q?wUDAwMDAgUBAQUBAQMDBQMDAwMDAwQBAwQCAwcGCAEBAQIIAwMCBQMDAwQDA?=
 =?us-ascii?q?wIBCwQCBQMGAgIEAgQBBwMBAgIDAwMDAQIEBAIHBAUCCwMEAgMDBQIDAgMLB?=
 =?us-ascii?q?gILBAIDAwMDAw0BAgsGFAUJBAgFAw8FAQUHBwkBAwgFAwYDCQMUAwMGAwMDC?=
 =?us-ascii?q?gQCBQEGDgwNBAEIAwIEAg4VBAQDBwoKAQEEDgMEAQQBAgIGFAIIDAcBCAIFA?=
 =?us-ascii?q?gICAwMDAgUIAgUCBgMCBwIECQMCAwICAgYBAwIEAQcCAgMCGQQGAwYDAwYGD?=
 =?us-ascii?q?gIHAwMCBAoGEAEFAwIDAxEDDAsDAwMEBQMCAQMDAwUCAgMJAwIFBwcGAgQEB?=
 =?us-ascii?q?gMCBAQDCxIJCAcMATwMBwooBDYBFRQFBCUZZwcHkV2CP0+BDnyBNZcKAZsKl?=
 =?us-ascii?q?CZxaYM/in6QYoV8GjOXUwyTEC6HZpB0khSXBBMHESQSgTI6gVxNI4EBgjZQA?=
 =?us-ascii?q?xkPkiTOOkM1PQEBBwIHDgMLgWiDWz6EUoVVgUA0gUwBAQ?=
IronPort-PHdr: A9a23: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
 WDXoAmljw==
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:/BqTKaofGZTPf6KN16YaY9saV5oPeYIsimQD101hICG9vPbo8v
 xG+85rqCMc7Qx6ZJhOo6HmBEDtewK+yXcx2/hoAV7AZnidhILLFvAF0WKK+VSJcE3DH6xmpN
 xdmsBFaeEYZmIK6foSjjPIceoI8Z2o9OSHi47loEuFjjsHV0ij1WpE436gYzRLrcB9a6YEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3A9AtZy2uIAI78ibYYuUFu6UMT6Is+b2DYkk2OJXa?=
 =?us-ascii?q?6AGNObbKtT023+61rxp8=3D?=
X-Talos-MUID: 9a23:TMTErwao6+Hz1+BTmCLL3i9LFs5SxoOiNX9TvNYghY6vKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032608"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:34 -0700
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so251696066b.0
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:33 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793269112; x=1793873912;
 darn=linux.intel.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
 b=QvMW4zEFFIj4ldgm2Jwg1dTirbmnqllqIoDR2iUOy1Sh3PbaCviwenzAcE51cH//Gk
 vEL6wr3FPULP2KlzIT9e60oJHq0yNYfm/76BbAzRne0cgNEZwRsSeG3q3ovn8wgvezSI
 QHSSUFimxFljOg6f2cZ2HWNNi4e1K9hW7mkXxIeR3f+ghPKIxEPP32vwx3ZcbKmkuM9e
 sGAtKkvsRwJmJDCtvPiK+FktQJDKfqNc/uZLcf0pCTzJYOVkX7dTU3FBgl3lAjgkKNKj
 rccYAtwiA77ZmbjlirjYraporOFi2sU2x0CM7zFEacqQH8ndn/KHv0RhDe0DCZePwPcj
 J1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793269112; x=1793873912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
 b=anaP7h95tKKO57BVqIqFNTciJHTYPmfvR68ke+c6sKPfzOqOJROhAcvf2X8+qWyE4I
 RakzNHDUAqAZI+9QJxhxfQIuBfAg7Q+Zd6xqodfdXkxWQShhulTLfV8nrztcQc7jVkii
 sotLjjK2pyWpATK7uKEuJO66WYtnrHo4ZC1uBh+xfUGBctybTa9FDZc1Z9QlnhFYypUp
 i8XFSjvDbhnKxp4qsuyCfhsHKLyVh/PEgn3u+eSxll99tQMfEBDeto8Sf92zDUzgOxWt
 ifAOwExH1IUm2WlAEU1jyX8Iin/yT4FkJO0gEvzC7QDQljUhpL4cx2CoQ9j7lc7nKp6H
 oKkg==
X-Gm-Message-State: AFq9FYLj5arHjjNFqU6inb/ffZfBBVNfQKx+o2jKz8r0pnGo7Zh0s+lh
 ghbdeBf1Mtaj359DcFRe8QLqmuuoK0Ae0p5D/Po/0lQyHGaS79rNzGgH
X-Gm-Gg: AYBFou12OWMLAcjTHGg7VXUp89nWVXZ5yLnruucHWLAnOF+r+a4v5luhQ84YP3EGSVz
 GTmzKzZ7IxQoh4VHU7/52mWpQy4K0hc9mkH5qETI6hc6fW1FZaf+6+kReeTruP4Av551ImQGAdq
 o84J/axYvKtMSu/MCdgKab05kIItl/K5lh0vE/bYr8+vrhf6kQM4PMZKbywOI5Zt4J8y+IX37Zc
 cq/leUZuyrY4EYb5t6v+2Az5x5bh0rfEH7KrAqXtPTcnNQMiBThbMyTB00E5Bq5aq+qrPlZI1on
 6ktTZ1YA88Jdy4ChdQFVVhuw+Zer4/zboVBsXrC3sKWJa9zDWDg6+WMNh2oggQbgIXNSG96LWrQ
 lZ81GGnm+zy44ZH+GEYm2IzThJcTKBHHwegvAkwOIOK2IXDmYOFY5m2wNt+1XUQ4fbZeDCVMiYd
 Bjd3pTeoABak38BY22Bdc+0itFbQP2nFUHZ3OyTekZxNPBzp46bg5zYNPE9oHnX8X2WwBoV2fmS
 WdUdBJeF1d7Veup70+TX0FllhV32dWo5oVw52XSQOSUdE3FNbS0cB/WOohmYTafAa9aDTy490/c
 eYEeM4RE1OCmBcBPujBZZW9m4rstAhYy9NFhUXiWZC4xmvjJLoHa1qCOdG1WzOM=
X-Received: by 2002:a17:906:ef03:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c49bdf32b3emr416211766b.30.1793269111958;
 Thu, 29 Oct 2026 03:18:31 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Oct 2026 03:18:31 -0700 (PDT)
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
Subject: [PATCH v2 2/5] drm/bridge: cdns-mhdp8546: Use
 drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:23 +0100
Message-ID: <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: F2tgipXsBe+Z
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

Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f47717bd1..8cab9a3e6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1375,7 +1375,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.rate = drm_dp_bw_code_to_link_rate(dpcd[1]);
 	mhdp->link.num_lanes = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
-	if (dpcd[2] & DP_ENHANCED_FRAME_CAP)
+	if (drm_dp_enhanced_frame_cap(dpcd))
 		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");
-- 
2.50.1 (Apple Git-155)

