Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83124C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 14:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187810E82E;
	Thu, 25 Jul 2024 14:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TaXLo9oR";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276D410E82E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 14:15:44 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fc587361b6so8635485ad.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721916943; x=1722521743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+RDEkQuzHUJaM6oc6K7NSgFEN5jh5Et+OzGPK6TWosc=;
 b=TaXLo9oRJgsZC9aIctlwemmdoejrHjqnoISAzFQtwyYLDLK508KmZo6pkXgZUj+awi
 BcLe/DFL/nWA53zAE1KLNHQkljdXDyb6PR5HnfbUE+qagirTNlPJsQ2gEon2V2P02yN/
 KeWKUUYLN8CBCXgrUVDiGWhKnExcfGAj0mS/B6ANmbN7I3BlnbErgmTTE0sNKQf6RvgB
 t3pEEYBLolQzysVwhyENDJU75ZXPwhZbliqtleWRCTK+0BYkEgfHAp4duxC6g7K2HNmK
 PEPWx5LBuKtYc0bwj0aFXwWiz3yMwf9SivwlKPBiBzNR7w1kdqqOfS2EjX0QDJ19STcL
 qwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721916943; x=1722521743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RDEkQuzHUJaM6oc6K7NSgFEN5jh5Et+OzGPK6TWosc=;
 b=j5T3uyihTU4soVPQp64L3NLKP03A58CO7sh2tS8ZRvpnDja+uxyLCbQG/ou7XdeWA3
 d/4Ws8+7WE66HZgOusnJ7bcmDGpNPYa3+gDubfPEW/PGfQ8TzM7iDR2AOLhTvQjPVR6P
 nWYVVqPWasZcKkDT/736rBaoJHi751ipTXAvGWxr4+v5+pbMJOUIGav1SNY/OQxWSa3b
 +6N2N6cpt6yaOCmSDKo45Gx2I6pdG6aUwUOGRasdXtvoPDzEI848j2p5V6tQZ0nPOVrL
 botJv2xFWjmtNiV910ld579VJBj8vuqeRL6I+zeW/3tZROzhX4lL2/BAQPFjJZlcSllR
 DeSw==
X-Gm-Message-State: AOJu0Yx6h4wioM1cYRo28Ff2n2po3+2nH+i5yvVHf2gjKqiRu/EdnauD
 8o8MmIGIj+SvdsYOic/LeiotBns6kQYww9MehdS2z9qJh2Re1QCsImvmQceUk4c=
X-Google-Smtp-Source: AGHT+IFdGmW/TCKcgHuaUYdYpOVPCXp9WSguLap4+yrJHKMSVYzPShtNZ8IChbdFNAGAk/CytUJyxw==
X-Received: by 2002:a17:903:22c3:b0:1fc:726e:15a6 with SMTP id
 d9443c01a7336-1fed925a5d4mr22415595ad.34.1721916943178; 
 Thu, 25 Jul 2024 07:15:43 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f71d61sm14595555ad.225.2024.07.25.07.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 07:15:42 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH 0/1] Use 64K pages on Xe2 HPG
Date: Thu, 25 Jul 2024 17:19:10 +0300
Message-ID: <20240725141916.3406757-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Here is switched on Xe2 HPG to use 64K pages to fix ccs decompression
errors on display. Possibly affecting big fb tests as well.

Alternative for doing this is with ccs modifiers (which umds are wanting
in any case), if there is wish to avoid setting all allocations to 64K
granularity on Xe2 HPG.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  drm/xe/xe2: Separate graphics_xe2 features to hpg and lpg

 drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.2

