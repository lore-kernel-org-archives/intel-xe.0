Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE73606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUHg+MfI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F6510E825;
	Thu, 29 Oct 2026 13:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAE2112262
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:49:59 +0000 (UTC)
X-CSE-ConnectionGUID: KKsoS7RIRCab7FzEi8e7nA==
X-CSE-MsgGUID: xz/KOuxXSbmUspg6cQqOGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908056"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908056"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:49:59 -0700
X-CSE-ConnectionGUID: pxhoXYpjREmnhFDSzkhSZw==
X-CSE-MsgGUID: 2+ifYBCJSEC/SzS3cIgqTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6887918"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:49:59 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 29 Oct 2026 13:49:55 +0200
Resent-Message-ID: <47170cc07f3793532a3d3c1eeb018a94aef34aeb@intel.com>
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6618820B8CD1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
X-CSE-ConnectionGUID: 1yaNYaoeSK2PLvNEkrv8rw==
X-CSE-MsgGUID: ToDnob7ITc+i0QCtDeGCZA==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5036233"
Received: from orvoesa111.jf.intel.com ([10.18.183.151])
 by smtp.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:34 -0700
X-CSE-ConnectionGUID: B55c+zjMQRSioq86T6toyw==
X-CSE-MsgGUID: Bour8Q8jTdOgmh3Qdqa8eA==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=dmitrymalovanyy@gmail.com; spf=Pass
 smtp.mailfrom=dmitrymalovanyy@gmail.com; spf=None
 smtp.helo=postmaster@mail-ej1-f49.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6ae31d78_3Tj3bWuleWoj7zXMaoh4SkXiAG63UDNg/AM8yrItluMSpif
 zlXwOPrkhNlMFArzMrqpEfQNKX4yTqqhGN4n0hg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0HmAwCEHONqfDHaVdFaglkCgj8WdWEzBFSUK1oBAQEGg?=
 =?us-ascii?q?T6LeJIngT89Ag8BAQEBAQEBAQEHAQE9EgIEAQEDBDiERgKOHQIeBwEEMAkNA?=
 =?us-ascii?q?QECAQIBAwIBAgEBAQEBAQEBAQEBAQoBAQECAgEBAQIBAQIEAwEBAQECEAEBI?=
 =?us-ascii?q?hkHDhIphk8NSQGJRAEIAYICAYEkYQIFAzsBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEFAg0fXwIBAzIBDQEbHQEDDAYQOyACEQEFARwZg?=
 =?us-ascii?q?wIBgiIBBhABAzcDBAEMqV+NBwUCFoEBgg0GBQMCAYEN2VQKGSgNcgOBZQECA?=
 =?us-ascii?q?gEGCQEKAQGBNwGEeCpdAYI+hSR2hAN6Jxt9gRCBFYJ6b4Ifgjk4hXgEgy6Bc?=
 =?us-ascii?q?pRrCAcfEggBHAYKAkgVEgMEAwQEAQILEwkDAwIOAggDAggGGQE/EgQTCgMKC?=
 =?us-ascii?q?wcFHwoCDBYKKCISKwoDNRIPGxUBCAYCAgQEAgQMAgkCAgUHAhEDBAEBCAICL?=
 =?us-ascii?q?QMBAxkBBwkIAgsFERgMCwcxAxAJAx8XCA4IRQgGAxMBGgYFBgs3FQUMEQECG?=
 =?us-ascii?q?wIfBB0PCAMBBg4EAgEJAwQWBAIUCiEFAhsBDwMDBgMHAwcCBAMIAggDAwgIA?=
 =?us-ascii?q?xYDAwUBAgIEAwMICAQDAwQCAgMLBQMCAwMFAwMHAgQCBAMDAQUBAgcCAwcCA?=
 =?us-ascii?q?RgDAgQIBwcFAgsEAggEDQkEAgQCAg8EBgMDBwEBAgEHBQYDAgIQAQgKBQYCA?=
 =?us-ascii?q?gIcAx0BAw0BCQUCAQUOBwUCAhgDBgIDBgUBAwEJCwEBAgMKAQIEAgUDAwEDA?=
 =?us-ascii?q?gMCBgMDAgUFBQMJBwUVAQMDBgUCAgMCAwECCAQGBQMCAwUBAwQDBwMCCAMIA?=
 =?us-ascii?q?wwCFgIFAwMDBgkDBwcCAwcDAgUCBwUDAwUDBgEDAgEDAwgLEiIDAQUDAwIBA?=
 =?us-ascii?q?wIFAwMYAgIEBQMDAwMDCAQCAgEHBgQCAgIBBQUFBAUGAgQDCAEBBQMDCg0BA?=
 =?us-ascii?q?gcMAwwGAwcDAwQEAwIFCgIEAQcNBwkHAwIDBwEBCwQBAwMKAwMFAgEBBwUDB?=
 =?us-ascii?q?gMHAgMDAwUEBQMCCwMHAgIDAwMCJwEBAQMDAwMDBAMBAwEDAwcDBQMCEAgBC?=
 =?us-ascii?q?gMCBgMHBgMFAwMCAQIDAwURAwYEBQYXAgYRMgEIAgMDARQEBAUCBRUCCAEDB?=
 =?us-ascii?q?QMDAwMCBQEBBQEBAwMFAwMDAwMDBAEDBAIDBwYIAQEBAggDAwIFAwMDBAMDA?=
 =?us-ascii?q?gELBAIFAwYCAgQCBAEHAwECAgMDAwMBAgQEAgcEBQILAwQCAwMFAgMCAwsGA?=
 =?us-ascii?q?gsEAgMDAwMDDQECCwYUBQkECAUDDwUBBQcHCQEDCAUDBgMJAxQDAwYDAwMKB?=
 =?us-ascii?q?AIFAQYODA0EAQgDAgQCDhUEBAMHCgoBAQQOAwQBBAECAgYUAggMBwEIAgUCA?=
 =?us-ascii?q?gIDAwMCBQgCBQIGAwIHAgQJAwIDAgICBgEDAgQBBwICAwIZBAYDBgMDBgYOA?=
 =?us-ascii?q?gcDAwIECgYQAQUDAgMDEQMMCwMDAwQFAwIBAwMDBQICAwkDAgUHBwYCBAQGA?=
 =?us-ascii?q?wIEBAMLEgkIBwwBPAwHCigENgEVFAUEJRlnBweRXYI/TgGBDiwiLpg/Aa8wc?=
 =?us-ascii?q?WmDP4p+gSSPPoV8GjOXUwyTEJkIjgqECpcEEwcRJBKBMjqBXE0jgQGCNlADG?=
 =?us-ascii?q?Q+SJIUTySdDNQI7AQEHAgcOAwuBaINbPoRShVWBdIFMAQE?=
IronPort-PHdr: A9a23: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
 vt0hyS0
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:PNl0Z61E/0qfouTCOhDvdgqjBJYkLtp133Aq2lEZdPWaSL38qy
 nIpoVn6faQslwssR4b6Le90cW7MBDhHNtOkPEs1NSZLXPbUQmTXedfBOLZqlWKexEWtNQtrp
 uIG5IeNDSaNykfsS+V2njbL/8QhPeCtI6n7N2w856vd21XgmNbgjuRcjzra3GejTMpOaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A6HAcJWn7bG7P4qaKRkXZ9WQ/r0XXOVeAkXyTMU2?=
 =?us-ascii?q?dMFxSSbqMGQGspr9jgtU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AfoGzIgypgIuzajqg0ZRIAO4kCheaqI6pFVpdqMU?=
 =?us-ascii?q?Eh8WjOilwYA6RlT3nT6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032605"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:33 -0700
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c40e02b2ebaso305365266b.1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:32 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793269111; x=1793873911;
 darn=linux.intel.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
 b=JUHg+MfIjbWP8sI7ku9MqeNzvDzst7a1RrwpWtDeAO3Hch/GmBJXGdqwsLVFVVr1zR
 fyUFMweYUw2QBn+62KQ0MrmnZPuMWyJ+9I+tCwbmHz3jKd3uSCteMwojNf9Vm1OZ/6Te
 CfOfHrgRJVpu726ArV2r+TU0LkEik6O7cqa2NQLJGs8+MOh3tfZuOUbNrevagfcjrsdx
 USt75umvB2NrGU2mAvn3Q5I+GDvHCK9dQcQJY4dzRwKg36pfLlrYC1/eD+xsJGbxhIME
 FhU7evmvPE/zfBTSalRaLVT8UmTf1fPtWvnFq6DDmnF+h0TlVL/A44jUYGxRJLWH5uJP
 68cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793269111; x=1793873911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
 b=1BOGd0gInW6h5bi2/KYkf6KdRY5T/69BqgEGDtFO7CNOJAhMjmQRkq5z2c7dMB+Peh
 XQ4rSblHl1fhEtFvvLub58jnYZ12F6syHU4XC2zf8yBVpBEM115d4HzVIGL3PbNa52oa
 3PIQ9jOK3wzH40j+IGFXblzaH4dL7LQqGqVk94UGCP61Ovb4SvcPbtJT+UmGUNSrRm+5
 Q4qLMeamdl699AwtgfNu9iZda2vrbusecmHlk81tob0/pLrUdXiB8P1HGVmsh76iLOYK
 KcY/FSIILZwtYb4Br9aqSaceyXe0Ff7cPpCY7ASOWrlqlJy0xSqcvFjUkh++ADRs1emy
 Ii1Q==
X-Gm-Message-State: AFq9FYLBqPOqtIEdtUpejbvSHCEYmWqnOSsC0ZDqKw336Is02QkyTIue
 cWKNyZCzF5n4Bk09q+ES/mX9WDDvq7h0dV4oKF0QbXrdAYKVDWTAfYSR
X-Gm-Gg: AYBFou0DZAENDSsal909fOOTIxPkSKcYVe+tDiUM6pgcLefqz68vpZBDUdJSowSDpFp
 cKKjLaWtc1N8YpqoaV01wAxAuycNXPrzp2VHcCJzmel+zsg84kdd6Nlcfg23QBp8sp5bDEGmY8T
 JrIXDVsk+OnwqUlKkpF95qtcQ/i9xEgrqAuifoHjQ0Vio+EnTpwW9V6DewWx1HrL4eQYuxHmNDw
 ID4ztyBLaKATc+347gSUBt0L17feGw2Efp7aQm+C867m5O6DVxrpy7Kx7z9WpOAdjFlQgiEkyhG
 2v8AyK/S+mJDb+mF0NpJYYXSi1z55I5Xt36yebLKseRHYqJJkKqpaQrBIXU8NAyF6fnFtBwmLyy
 2RTK2xmy6fAk/V+bBagTsbmDa4B9dcvtZNRIrG1pptti6SqwqW5XFGk2y4i8TEe0ch1FATZvaL3
 iwRFkVOtT7NDPKC2P8amOIIHKD1RrEX8sl+xPWLH2ViLqD0Ax102VZJ8IDc/AWv3N06FoglYuXd
 7tV6P1VNxHKmpdlb39VgakmeFTfoqT6gOgas8j5c/t2hyKksd1xE92UP3aui/F/IXXWTSyl8qz9
 L3ALiQUEx+B4Noz1NsuOeM+OYNhWVh2fFFwXmVqoilGAn8mWeC9kPgZ30Y+rSiE=
X-Received: by 2002:a17:907:930a:b0:c46:a5bb:5740 with SMTP id
 a640c23a62f3a-c49bdb64c4dmr397674666b.5.1793269110523;
 Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:22 +0100
Message-ID: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u8T3XsiVh/e4
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

DP 1.2 section 2.2.1.1 says "An upstream device interoperating with a
downstream device with DPCD Revision of 1.2 or higher must enable
Enhanced Framing Mode". So for r1.2+ the DPCD revision is enough, the
DP_ENHANCED_FRAME_CAP bit does not need to be checked.

Some sinks get this bit wrong. The Xiaomi Monitor A24i (P24FBA-RAGL)
sets it in the base receiver caps, but clears it in the extended
receiver caps at 0x2200, which are the ones we use:

  base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
  extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81

Through a USB4 dock (CalDigit Element 5) the link trains without
enhanced framing (0x202-0x204: 77 77 81), but the sink never syncs to
the stream (SINK_STATUS 0x205: 00) and shows "No signal". Forcing RBR
does not change it. Connected directly to the laptop the same sink
syncs without enhanced framing, at RBR, HBR and HBR2.

Make drm_dp_enhanced_frame_cap() return true for DPCD r1.2+. This
changes behaviour for every driver using the helper, but only for sinks
which already violate the spec by not setting the bit.

Tested on i915 (Arrow Lake-U), with the dock the link now uses enhanced
framing (0x101: 84) and the sink syncs (0x205: 03).

Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 include/drm/display/drm_dp_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5b05a7fbe..4f20f60db 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -160,6 +160,10 @@ drm_dp_max_lane_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 static inline bool
 drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
+	/* DP 1.2 2.2.1.1: enhanced framing is mandatory for DPCD r1.2+ */
+	if (dpcd[DP_DPCD_REV] >= 0x12)
+		return true;
+
 	return dpcd[DP_DPCD_REV] >= 0x11 &&
 		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
 }
-- 
2.50.1 (Apple Git-155)

