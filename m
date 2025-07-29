Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50271CA0EC0
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673010E6B9;
	Wed, 30 Jul 2025 14:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TYDvor1H";
	dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0930A10E061
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:05:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id
 41be03b00d2f7-b31d489a76dso5557738a12.1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753787157; x=1754391957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLHeYkFqqgcgLLa5E70HO7JnbGS55Dax9Okm1rFtTZg=;
 b=TYDvor1HJflpktKmmgzLxjFxwD+pCcdVrDt70XVQQn8UEN5C8EHXM5lT2kyVTmo0lG
 dTIQI1KQANI0XIol7qzR/fmj4xksZz6Acr55XbReDJeaI5tttJdTafKIbpNIRihBzXYD
 B+qqHmNFWPIi2tl9dwbonA2fEpr/S2hzImsA57iRl+Y+AsEdOduF3fHqVUzBfS/mgkoU
 79snbyUmfIz4kS4cAb3yOGFARLV186wGKBnvLMMcNMXQP423vBLQm5HlEutdQclsvhVd
 BwDAgPeh2aBxXWvLkSxG13qhWtJcAZF8YvUNSHIbaIqxf+JPsTyW3qkoPwuF+s1e9zIk
 aJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753787157; x=1754391957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLHeYkFqqgcgLLa5E70HO7JnbGS55Dax9Okm1rFtTZg=;
 b=K2fd5Yw3KD+gKZ7qT+s08lxL2paN+0V7KoabjO5aaN5znY9L1x49bCL8WG2Rf8yOhR
 CtSAzMx0wz4pqA1wh2Js0pxlYgb65x4LGniw9LIkYMvYEkrltCkyWGzNau6eu6t7ntsY
 N63Ka9kuKcs7Ux3Xnd4xh7fi7TGY7HHzvWuBG+mXiUrhnzN2yh2noBykoiWQTEzKQlMx
 UZEWBhXxQO6vSOiYiewSyyoFqXbX2O/hLZZU2t0jBooA0Wp1fE3gM6pmGB3fA5PVs0Bb
 Hgk2idYT3dD68oRxnMjYh2Ew4abIqmVtPUKaVsnk1ebXkNE3s9JfBboBOOny7gUGW0KY
 dg+Q==
X-Gm-Message-State: AOJu0Yzw2OVTWlCWecAYFssBmRjfmJAPpRi+TMl5DvFz6ASUgZfgUSOw
 mNUxt4eNTigWKpSye8zTtW0KCaZQfozoFEQn49G5fvy+gHJEQkYegow=
X-Gm-Gg: ASbGnctgJW1NMzZb1OAC6AVyLLOLYuDiNOh71hUc6QJlEpcLcp9dbF24CqnbeJPwxZS
 yHenky/71tzhpL4UDWFOQ14Un6pT/sDIfn4da7TDbuy5AH0jJDqQuk1XpRFujM53kEjWnFG0poK
 R28yQkdcNSDs8tggn0O7KLUJ0kspIXaP5zCuZ14kFGaFfCzBq+xlFfAPk1g6BBhutrA7amf2XqI
 PH5RPO8+Sv3yafYN7EhGQt9vH9+wwzNzUJXnugusebLyAt1rDNkCmr/wWHkSdhyQUelnH4kwD2b
 wyUvUI7rqS93MEt6wWYimUbcFDvRaFpk16Aw6lStYIZqE+2/Otz0MHRsyrZlecOpYNxn5c7xBDP
 EkE3WJxS3UPcpAzeOyCA1Ww1cuRC+G2evIzJDgmY=
X-Google-Smtp-Source: AGHT+IEaUlgjTCWhrh0w4mjTtnBsKLmW8QBUdOBpwR84OQmFTVKiyCPzd0imDRIAZjTJTlRy2xCB8Q==
X-Received: by 2002:a17:903:94e:b0:240:7725:18de with SMTP id
 d9443c01a7336-24077252f3amr19060465ad.37.1753787157361; 
 Tue, 29 Jul 2025 04:05:57 -0700 (PDT)
Received: from git-send-email.moeko.lan ([139.227.17.83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe30bc1fsm75929025ad.5.2025.07.29.04.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:05:56 -0700 (PDT)
From: Tomita Moeko <tomitamoeko@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Tomita Moeko <tomitamoeko@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 6.12 4/4] Revert "drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()"
Date: Tue, 29 Jul 2025 19:05:25 +0800
Message-ID: <20250729110525.49838-5-tomitamoeko@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250729110525.49838-1-tomitamoeko@gmail.com>
References: <20250729110525.49838-1-tomitamoeko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

This reverts commit deb05f8431f31e08fd6ab99a56069fc98014dbec.

The helper function introduced in the reverted commit is for handling
the "refcounted domain mask" introduced in commit a7ddcea1f5ac
("drm/xe: Error handling in xe_force_wake_get()"). Since that API change
only exists in 6.13 and later, this helper is unnecessary in 6.12 stable
kernel.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 1608a55edc84..a2577672f4e3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -46,20 +46,4 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
-/**
- * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
- * @fw_ref : the force_wake reference
- * @domain : forcewake domain to verify
- *
- * This function confirms whether the @fw_ref includes a reference to the
- * specified @domain.
- *
- * Return: true if domain is refcounted.
- */
-static inline bool
-xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
-{
-	return fw_ref & domain;
-}
-
 #endif
-- 
2.47.2

