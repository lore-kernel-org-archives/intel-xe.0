Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8535EC47258
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31C410E66C;
	Fri,  5 Jan 2024 17:11:05 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AF610E5F2
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 12:20:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-556c60c3f9aso1940900a12.3
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Jan 2024 04:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457239; x=1705062039; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VPgoGs4JCmFCXEz83XMMwyrfsqP4QMFdJVq1Hj+FDjY=;
 b=mSNt6E7cHwPW1HpT/6gSYIcUObdFm81KsCT4SYwchfSlP+AEaFm2pn8wwN4l8mMbAy
 lQcae/FC/G2964ij2iDWj7cGMOmdIDBO5qBjKM3GHUwJdlZJO1muFxKTKesAJimscFtF
 vqY/eOnJ7uGlutfOLF6V5Wj2PNcx7HE3ik2i5chRFjI8JcetYtqggAs7UN3Xbb9KB7DT
 WaAjsHC6LO4aGEQDMuEH5NqSs7TUR/WCsy7qMDLg7Bh84jA+/e99iFG9dbVWVBM8V3rf
 AxwTLkTftDtFsJs0KbCdaMg0k1B3O+1UGWXr2aZSbFlkr6n4JO3CKoYcmidNyfC8Gqgs
 E8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457239; x=1705062039;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPgoGs4JCmFCXEz83XMMwyrfsqP4QMFdJVq1Hj+FDjY=;
 b=k6kmKCQSMYhQ0p9tFkFa0KuxJWJ43nRbt0CxBUUbto2Dtt+odA+cWoLd0xeMmnxkGO
 sPQ6cOcqB0E12znuDLYgyV5pdYK6nRol/V7hugD6l0tajOqntQWKMwIWtfYoTAv13jLy
 P+E+YLGyzo3s4h9DVhUX8g2JvBS6At+3JmCYap3l9zc91MWSNkVG6qEMR17WEwffniQ1
 R4FXWWMnNDjdk0a9WOmqKuod2Tf007IFfNChePGH7b5jeiqf6Z8smMsH0GOTv6fJ75oB
 UEcIGhUlZvSOvfYsvhgL6JRn0a2+L9rPZ4/hYV1JuL+JGLi4Z1Z6w4tzl6jlXn3Ih/7H
 YpBQ==
X-Gm-Message-State: AOJu0YwYHVQsHWcMs2Vw8lRhJqWEhq2ZrsWxC0ucut65k1ha37aBj7GA
 QT7sXoEq5J9ouYx+uWUY48T9RDxOXz6h8g==
X-Google-Smtp-Source: AGHT+IGTi4ByJkUR6/L3sBCprInPncsNYvpNn81WSpgeD5kLCGkvWCFb+4d+d6d898+eLssOzT1V0A==
X-Received: by 2002:a17:906:51c1:b0:a28:fa55:3597 with SMTP id
 v1-20020a17090651c100b00a28fa553597mr923237ejk.98.1704457239116; 
 Fri, 05 Jan 2024 04:20:39 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 r3-20020a170906704300b00a27e4d34455sm820240ejj.183.2024.01.05.04.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:20:38 -0800 (PST)
Date: Fri, 5 Jan 2024 15:20:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/selftests: Fix an error pointer dereference bug
Message-ID: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Fri, 05 Jan 2024 17:11:05 +0000
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Check if "bo" is an error pointer before calling xe_bo_lock() on it.

Fixes: d6abc18d6693 ("drm/xe/xe2: Modify xe_bo_test for system memory")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 412b2e7ce40c..3436fd9cf2b2 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -125,14 +125,13 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device, bo_flags);
-
-	xe_bo_lock(bo, false);
-
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
 	}
 
+	xe_bo_lock(bo, false);
+
 	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
 			       test);
-- 
2.42.0

