Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883B5D73E8A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC910E8CE;
	Thu, 29 Jan 2026 20:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BSJUV3aw";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A1310E6E2
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 14:59:13 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so68086975ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769612353; x=1770217153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zohHYUiSSiWv89YYYBiAoIYe/d4kRFJrNEy84GzqibY=;
 b=BSJUV3awKpOUUKVs7/md9JOhmVnwpbt6+lFzhoMiuh6MO611G7SYqlH2f6QjMgVQ18
 zdi3sBEuxTM8BbL/jbUq2o69ENRxL6uArJANpzE6pYRPwMdzgsEArYqLpPKwNHL4M7h6
 vq1+A2WChpBhUlRlnzH+xFXlBe/4zyKrq780CLOLY+v4wFhG7ji4e931vzXJSdw8EBqt
 pGukOdlJhNJ/UcMWR3+jJd986qLjcKYU5qXWBz+WMiZ+poWs5L3UAkYZP2LvG82jRGcb
 GMYmZdR44QJOa2s2dlTJnhv4qszw7zCBXuefSJciN8GPiDme+ld7rOt44+dR04KYdxrQ
 muCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612353; x=1770217153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zohHYUiSSiWv89YYYBiAoIYe/d4kRFJrNEy84GzqibY=;
 b=psxOgQdyysqTb0M3xfdYbp3rNPZT+qIBsGB5WpsPUix1h8+hscfI2rQqdITdOF9Wv+
 kj3JkSNIloL39DTRXxqQg/zKyLIpN2KFeWkK4DqwJBMtjKm+w/BYv3cv1mEuOFJ1RXRg
 FLH+SNgOEQe7VPeZW8cqefynCoicwGU5DcK72rDNKpOIcxUx1aciDSKJwsY5bEeFtvlw
 H8r2TA0F+6dga6AcxjBD90KNeGviNCnJ0sYqQi3QkN88NCPplFsP40gcDsnQuLOOknZm
 lmaWVBzU3hQpi0J5yhwbdVlNj/owIbEAuNaL0h9WNzBdBx3Ffh8nobWoaPdGJp9yAZKu
 ZLDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsEqQONWM78GalYIQ3DkRmsCuUt7kOLXu8I99ShStDSBQ2mACHx+GKj31s+74m0EZGWQ5MuMLP0A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+1cA0UMzAQJ+sPty4qeB57iUxZlNcMY0ux50O/0q+XlHUkI96
 5pKOusPkUVG6P/dnpWzU+3wofETLVJwM6yredwONHBfszOXI2RjhsLM=
X-Gm-Gg: AZuq6aKL/VMqmSLXIcv7snCCbT3+0Ls5Ay9Qb5RWIUG9ySTfWw4KyptkuYUenH58Dqm
 jymskT1m4UCy18cOVxIBuW+CY7Ll/wJS/IbLocQpmDKtF4ZdZ5m67FTute5ofqqZfs0VQVlEnhj
 3yEVQGaherFEBnu7xnGrVfgPt1uCsHPkodsC49geZlNFK0NEp9Scq70Oa8IHVHzh4ktconrJCHU
 siy13FW9oZw//S1Xe27o/IldUpwmFo4s6Vifea0N5RMg+XTQTn5d1CZxmmhVgbLViB124ij8ScS
 oroWDaK60BkPIx51s5YPd10VIE7GN5uFP8pJTPTUbP5xp7HHLXeFQblwYD/ZFxZ1QpBIVO4aygd
 UdwtcTqCn3qNtqRM6GW1ceMm/pdkeylixuymJMLZus3fsdsykysTe4zvnCQ+dOyt57+LTy77U88
 5pwhbXClphxQix
X-Received: by 2002:a17:903:1a88:b0:2a3:e7b6:ab53 with SMTP id
 d9443c01a7336-2a870db403amr54053765ad.22.1769612352864; 
 Wed, 28 Jan 2026 06:59:12 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm25820235ad.79.2026.01.28.06.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:59:12 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lenny Szubowicz <lszubowi@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Francesco Pompo <francescopompo2@gmail.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Add support for eGPUs on Apple Products
Date: Wed, 28 Jan 2026 14:58:36 +0000
Message-ID: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 20:47:57 +0000
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

This series adds support for eGPUs on Apple products, by
enabling apple-set-os on all apple devices.

A side effect of this patch is that the iGPU becomes enabled on iMacs.
However, iMacs can’t use the iGPU to drive the display
(They can't link-train the internal display),
so displays must be disabled on iMacs.

Changes in v2:
- Reworded cover-letter
- Transferred logic to has_no_display in the 2nd patch

Link to v1:
https://lore.kernel.org/all/20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  efi/libstub: enable apple-set-os for all apple devices
  drm/i915/display: Disable display for iMac's

 drivers/firmware/efi/libstub/x86-stub.c       | 22 +++++--------------
 .../drm/i915/display/intel_display_device.c   | 13 ++++++++++-
 2 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.43.0

