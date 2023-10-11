Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE8CD6E5D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 11:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A0B10E72A;
	Wed, 11 Oct 2023 11:54:19 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A2910E72A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 11:54:18 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so86021941fa.0
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697025256; x=1697630056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ5IK5MgCsaJIF3tVsImYFZcA+LsUch/XGSvITrRSGI=;
 b=PZn1Dam7S2TmxqFUGY3ZC6806mewNdzYrxAHbTmE6VAbVTP8m9lYS1fD/7T06qd1UG
 SCoyFRXwQ25sVMpHrWCIaHd+AV6qsEdPCThw8Fc1pPWFY69SNvR70a3YDv/CSBMOLuVa
 5nEyrz3eKhFRVRxzWwPyurZKoB57N75YjZwttatavU0kRZVEwANxA4OkWdVLCGkkcYmY
 bwZk/RCbmEz+SmR78YEU13CJK4slZfUVwcpz90Lnkgdvwr1CHYvklXGuXWSuaqE7vDIo
 CcPLfCSf73W+5qLlAbxBfU6I2m1iCQ31p9Ep+YbtnsX4ocgVCaYdVTudcwauLaLApLP8
 AqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697025256; x=1697630056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQ5IK5MgCsaJIF3tVsImYFZcA+LsUch/XGSvITrRSGI=;
 b=apPWy8G6pVnWjd3sn4gDpPRwo37mXgAGO9qjjXyaYUiQQJYj9VF/XJ8/fFEKQbf+pz
 7KC7Oi2Opxg6rfVqLTBdh2GjQ34FqgfU7NoSzkBTWI0s4drTth+2CADdn3cBW7hl0GEB
 k7JwJEWbojmVEnSK3K0SZlR1jQGCm7fAU1jc6JE3CuF/O5jHzACUd8H7acVRKr4CCrIg
 /E53MHeBQZJwuHq5bINzf7wXGTIIIHIXFkmcFPsZYiJOOnopgVai8IS812grEjF76rhA
 vdY6ZDu7AQ9sTPrixDnfAdaZyL92AP6aJspUHDDAmdujJdsWs4NcIRNlKW8DxiEsD0jD
 WJEg==
X-Gm-Message-State: AOJu0YyoHilsDhoO3B8q5Mx43uxUvBfeNS2KEL28os2ETlP3VkSoQUQi
 Yi6cuSGujX58xRoUlIKetMc0WhayTXq8wA==
X-Google-Smtp-Source: AGHT+IErcatv+17wND7IZo6As5smndL2RdILYLXnvXa0QDVR+fUAuqUiqocHhYEYO9uvjcKeZfV6Jw==
X-Received: by 2002:a05:6512:3e20:b0:500:9214:b308 with SMTP id
 i32-20020a0565123e2000b005009214b308mr23166033lfv.65.1697025255998; 
 Wed, 11 Oct 2023 04:54:15 -0700 (PDT)
Received: from jheikkil-mobl1.home (77-105-100-22.lpok.fi. [77.105.100.22])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac24d01000000b005042ae2baf8sm2234752lfi.258.2023.10.11.04.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:54:15 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:54:09 +0300
Message-Id: <20231011115411.401900-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/2] Enable remapped display page table on Xe
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

Here added writing of remapped display page table and taken into use
where needed.

v2. couple of things fixed after forgot to run checkpatch

v3. rebase

v4. bit less code churn (Ruhl, Michael J)

v5. Minor changes. Rearange patches (Maarten)

/Juha-Pekka

Juha-Pekka Heikkila (2):
  drm/xe/display: Don't try to use vram if not available
  drm/xe/display: Add writing of remapped dpt

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 63 +++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 11 deletions(-)

-- 
2.25.1

