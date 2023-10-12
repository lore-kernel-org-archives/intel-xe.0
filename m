Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285BCCDB483
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 13:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBDB10E174;
	Thu, 12 Oct 2023 13:52:19 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1111E10E174
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 13:52:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5068692b0d9so1343371e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697118736; x=1697723536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5VEUNHj3KeTeN+MLpwpGmjZujkD4J9adZ4761L6eT4E=;
 b=BuWwquP3iUplTsrE/xGmXMiGtqw2QwDaOhW7eSRgOaYQpCAfRt9JNZjFNfcrwfZXdX
 Tl6hRCHjO5SwBoFmMqQ/7v4+T9JD31WU6aHDOtyO/vDz0ASO9flKv6AUA1wDHoUYxoqF
 SAcBGDZou5UsZp7FTlNZ9Qhv0qN995LGjNK3uG0BRAq5aHol6irQP4u9/ogLNMg+NLRh
 v5UZyGuQMTFEZ8R/fqeOoGkxA6xtvsFn92LkBZL/E+SW44hc1UHdbI0HG+fkjFZprXKY
 t4mlzJs0CRSTtIF5O5E6XfDqt92gCiCicgnavp5KWMMTClAbkEEd5rIqM5sBmZr3hlfK
 ylbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697118736; x=1697723536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5VEUNHj3KeTeN+MLpwpGmjZujkD4J9adZ4761L6eT4E=;
 b=q8FxvpDXJf9lj+BrnAx/swtY+UPoaKNMi5y57V5IYd+fhdjhQkzau2FYbTaGW85uPZ
 L+9kZnXHdOkcZfBF5c9rko0NJfnWlG2kSJqiLw2N+uPV02LAjnTV4TlF1jGhJEE9DZ/o
 ALEqfC/1+FWKNwJu9EVVqaiOPnSoGH9WhqxAAsKOem7VBsOIH5dpBCDjOTCEFdohMdBF
 NiDFeqhXv28wZeWMIFEbypKm0c0k7eY4B0gxmeTf2GlZuAAav+fShdtJOlVyxNg2V+On
 Sl9ONkbtlflpN6lppdgWkWWbtvVtEeEex3bqkNripIi+ZXETRKnUnwQEajsdzEb0C5BO
 W4tQ==
X-Gm-Message-State: AOJu0YwSx6k2atx5iOAYsMqd+LKNXE/ej0Piwr8GvxP2zRYq+PKZBx5F
 3LSZcXw90mWDjhGvkaB3k45s0bA6BVIfDg==
X-Google-Smtp-Source: AGHT+IGnZX0BuvvS0FhaQr07u59XnW4rxzKrpbYveRRLDn+mAtS8HrjpsHYzp8JmQ8CXHPA+D+VCiQ==
X-Received: by 2002:ac2:5e6f:0:b0:4ff:7046:984a with SMTP id
 a15-20020ac25e6f000000b004ff7046984amr19683108lfr.7.1697118734720; 
 Thu, 12 Oct 2023 06:52:14 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:35cf:7415:ccda:33ca])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a19ae11000000b004fb8a2b9485sm2826361lfc.248.2023.10.12.06.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:52:14 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 16:52:07 +0300
Message-Id: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/2] Enable remapped display page table on Xe
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

v6. rebase

/Juha-Pekka

Juha-Pekka Heikkila (2):
  drm/xe/display: Don't try to use vram if not available
  drm/xe/display: Add writing of remapped dpt

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 63 +++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 11 deletions(-)

-- 
2.25.1

