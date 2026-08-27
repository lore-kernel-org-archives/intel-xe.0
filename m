Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA6C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B65010E32D;
	Thu, 27 Aug 2026 12:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GrLNtAOe";
	dkim-atps=neutral
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com
 [74.125.227.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5410E421
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 02:21:24 +0000 (UTC)
Received: by mail-pj2-f10.google.com with SMTP id
 98e67ed59e1d1-39641d0dba5so1042393a91.0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787797284; x=1788402084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w5YaH8mokWPLQfhjUseDA3RHoFgBNedWh0XDxf4FNzc=;
 b=GrLNtAOeSBPz2p1srNvKuMXJQgMEM62iX/6uTKa4t+f02YbYFtBxGkU6vcav8232w6
 aI3Kt+l+EHFCV7j5/cD9NjtR+rfO9dCTsn+21dhIcyKcDCPq+CH53vahonXsQkeuoJqB
 u/8ue5kk63oaeAq5OBTbrIVvROmnIuM7GzSsfw56WEpLQ1dWqRf6oImk1rqzvHpvSX0e
 tiGTnGqjTaSle8DIxNr+paB9X5Obpo66hU2atKDoY8pusPVB4ok1EzwJ5T2K6MZ0DKR5
 CyN64WYq6ttsf+LABxIZBAuAgPlMnYIxMdj6wro1aW2QuG0T0AEGWfXPm2r914IZM+AJ
 jB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787797284; x=1788402084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w5YaH8mokWPLQfhjUseDA3RHoFgBNedWh0XDxf4FNzc=;
 b=QvWmU64t7MGH2SvSy8Q2obCqw9g4nmkOQ60etimankTxwXY81mB587LAFjcFDEFP7w
 7WqgHl+zfEkVWPAyOvUM2X7IOIA108QTJIt0u9Cbjch0GRmcQqUOsXhO/UbVs4stdgtm
 v6ojZTKMrKElF1x83yVxcyc/8p2v+mg7KeCNvVNOBJMhw2NyyyTk91TWQqHmklihWKX1
 8mpGlNv9LfPLdt3RMjA45mwDa1/oMOUSeiZYMuYgFJeTGjiEZzzTEwEN44ole0DCrZ7w
 TFM6cRMh2pPfh0+ubNJxHtpEHJ32ZNgd8TFm+h83j809WVWZNbdl0fkdxknEPH1UtuJv
 2/wQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqa57q7BCnQ2+o/2iCnUjWEew+I/dd0IJtcOzbUY2L75qnqGvLllUDuGrbR4M3TnAHkYsQqqyXfpg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++noOCF0Y+w2qiWN+j+jLgRSun25eC6NbwXiGZb/gW2i1R4tfkgF
 XEnzXFJJvMLA0CFihIiKJnBW8uesxoJ7gHGF7Bd/WqN0Gz0MXzCDtRJB
X-Gm-Gg: AR+sD13TN0q6C/mNAJ0wDzVYoioZwXs7dMYe7kr0wRYEBw6idKVrNfCO9XhyoV8exQP
 1gM/DUQhOS8PKMj3CnZ4sqzZvcP1IDcRak1Ab2Zhns4zt7fTrpUz03Zg8//9S03qhyb8inGoO8L
 II2UzA0ip9NmqsCHTl9VMxiQpbfGJdjJu15WpEMbKI2KuN96oiB3okDpqTueEl3ZPhNy2vkhkJg
 BlBsNluk40jstIsCE6OaIWzmVeXLP3WAlrGGAUKPPcpskoFK7eeJqjdv6C3roURtEt5kKui7c8Q
 GzsYm7tnF5xDzJxmYm1AZ4j1+DqMs7LYbHUjxMaBn6YqocMkLELdfgqDamSHu1otMeV5ZecuOp3
 BFoT7hMN68RjOg056+Z+frKuqO61xKwl3N9GrzStcnosQxVRGhIqDTX82U41mlhi7FNOrUIKO3h
 WmiNQcMf0kOs7sSr6plVjqTNUmJ6cZlap8s6ShDPIEejKsPhByRsTpenX7lCZsu1RU80z01xQTl
 yJlNutBhdto8Fuf8lW+ktGu5A==
X-Received: by 2002:a17:90b:390a:b0:396:5785:843 with SMTP id
 98e67ed59e1d1-3966d203a94mr21084902a91.8.1787797284194; 
 Wed, 26 Aug 2026 19:21:24 -0700 (PDT)
Received: from DESKTOP-BDFNLNM.localdomain ([223.231.133.255])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm20850538eec.6.2026.08.26.19.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 19:21:23 -0700 (PDT)
From: tarund18303@gmail.com
To: jani.nikula@linux.intel.com
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tarun-tarun143 <tarund18303@gmail.com>
Subject: [PATCH] drm/i915/dp_link_caps: Validate max link rate
Date: Thu, 27 Aug 2026 02:20:34 +0000
Message-ID: <20260827022035.3442-1-tarund18303@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Aug 2026 12:29:35 +0000
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

From: tarun-tarun143 <tarund18303@gmail.com>

Validate the maximum link rate against the source-supported rates
before using the maximum link limits to calculate allowed
configurations.

This prevents an unsupported link rate from being accepted as a
maximum link limit.

Signed-off-by: tarun-tarun143 <tarund18303@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 7b6cc6055da8..0934488153bb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -710,7 +710,10 @@ static bool max_link_limits_valid(struct intel_dp_link_caps *link_caps,
 	    !is_power_of_2(max_link_limits->lane_count))
 		return false;
 
-	/* TODO: Validate max_link_limits->rate against the source supported rates. */
+	if (intel_dp_rate_index(link_caps->dp->source_rates,
+				link_caps->dp->num_source_rates,
+				max_link_limits->rate) < 0)
+		return false;
 
 	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
 	allowed_configs = calc_allowed_config_filter(link_caps, link_caps->enabled_configs,

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.43.0

