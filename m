Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD048D2F7E3
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 11:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1E10EAE9;
	Fri,  5 Dec 2025 11:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hg/DzCUJ";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44A910EB0E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 11:39:25 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso1025771f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Dec 2025 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764934764; x=1765539564; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dIKUJhPtyy099q/7pEHPgqG0DHnRRHLJr8Bo5eZ+wuQ=;
 b=Hg/DzCUJ8YeF9XjkkSKk9V4qA9SrxeNHzQpQehlyNH59RzU8JoH+DihGu9WIX9gwyq
 xbRUAeG8vevcdkqkoCPDz+ZO8HceWyYl6wcbZQxPWgbuNf95E4U8GWKhmpV3Q/SB3Lq6
 UqSn8oKRIGzT/NuE2UeKQ6CrZhWW6wEJsngNCDStqbB0xWCBaj1bRBYrKVXHVuLN+N1e
 dI3QDggDyco9u8UuAA/Egc9rsOkUci4VedT2tiXTQH9ycityf+rpfOY9/Wtv3j7miZyd
 i9ql7ojiYUEGwXXKBwO0gNhn/ItdNYKdn9DW9i+/VVOZ7CZb9sDcMljwtIW7DYCJjtMx
 tUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764934764; x=1765539564;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIKUJhPtyy099q/7pEHPgqG0DHnRRHLJr8Bo5eZ+wuQ=;
 b=Yg4AD/6hWxX2wfe4Zl93ezxTfSuHgnxgGgI3MTOEa56wAZlIaahKDaoNY/RnjF3rsr
 E9uqQrxyiiD9FDng4fgZvGji6cJL2iyDDDl0WXZN8IWk+jefNPEMRq0oJuTJvhkLc/ZK
 6trV4m8zGFHxt1jXR/DKKmlfUuHCdijd8xFNPw+kcWIEb0xMMGPqcpiw1FTNWjZmtXlY
 /nLKV3H6cR8wGX/AwHBkbcuyjS8oX1pD/TC82q2h66hw+VteszgCPSSg4zmsyD629+DY
 avGb9Y4vu4so5kldSKuZ/YFYagazWtCClcc3CI13UI0ccsLKdJvPG0dmOwSMgDnmfpKL
 BcWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcX2PsI+4eQTEliFgIq16QFAbrjkYn4Nefs1CsPUWEjuSRvPDTFRikiWMiKQ0VP5Y3gYNQbisnHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyssWKfp/mQF9bnh5NYL+BY5mI7P7pP+o9l+Z0GluBoHoGYV8fz
 pVpHgTMJbjR7sG7Pf+AAniT5K/Msfp/Eir0F3vCUjRvI+RyPVaWPRWDyHxuTNmaQSNU=
X-Gm-Gg: ASbGnct425ZV5pVicUX/CWIr0kkhxg4bc+xK/7EdghqSqCJyfato3mIRK4sOKMkdP8E
 JgiFpcR4s2oHJbREgUjWqnNF+tWrwW7vURo7DTLx0K5mNeLENUd7FNyXOpavY2VsP74MB2eno0W
 p8PHcu54UfTur7zL8xcv34+dVE2il5WdrIWQlN7o1E4zcW5UHKPVDUqal2c3l+94h2zdPphDNsX
 iq/qQAoOh5R8LnakCWAXo30QzKLOHZ2jVX42Pom23Tj9BnNi/2fjvuOZNl49rk0Gi7BAuH6+QgY
 0k6MBz6QZn24EBhlf1mgGlCeDYIM/6uUEXI9gL34j1b+0qsI62uBIaUo4d5ZNmKV7oXnw8B8SIg
 nTTVaE4wKoEvIbPWy1U9Om7KJE/CV7Ta8eMvPTsh/FHIUJNJ/ykpFWWaEpB2unC732w/WSmspYp
 BY+gnjwRXKDg/arstG
X-Google-Smtp-Source: AGHT+IF7EWPLDwvBvMYYg19nIBOlQAnWMyTfDzDj21hkC8CsbxS4hgVB39BlXGxYOuNd95H6B+H2Lg==
X-Received: by 2002:a05:6000:1acc:b0:3eb:d906:e553 with SMTP id
 ffacd0b85a97d-42f731cbf01mr9856490f8f.55.1764934764129; 
 Fri, 05 Dec 2025 03:39:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7cbff352sm8357272f8f.17.2025.12.05.03.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 03:39:23 -0800 (PST)
Date: Fri, 5 Dec 2025 14:39:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/xe_sriov_vfio: Fix return value in
 xe_sriov_vfio_migration_supported()
Message-ID: <aTLEZ4g-FD-iMQ2V@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The xe_sriov_vfio_migration_supported() function is type bool so
returning -EPERM means returning true.  Return false instead.

Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
index e9a7615bb5c5..3da81af97b8b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vfio.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -21,7 +21,7 @@ EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
 bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
 {
 	if (!IS_SRIOV_PF(xe))
-		return -EPERM;
+		return false;
 
 	return xe_sriov_pf_migration_supported(xe);
 }
-- 
2.51.0

