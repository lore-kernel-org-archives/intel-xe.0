Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AE5E81DFF
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE010E4EE;
	Fri,  6 Oct 2023 13:45:50 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9081010E4EE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 13:45:47 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c007d6159aso25368761fa.3
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Oct 2023 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696599945; x=1697204745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jTAM5CNpSgEwzVKSW9e4FRoovMLtcaIYiChl+KBZzEM=;
 b=JycntM3psOqGtOvyF20Y3In2oubqhHksVUueP9hSF4BferYxcunyWlL5V665vGYprm
 x/zj2ya+xMOgpAA97PCqNy3Q8ydbi1/ApFcoQBGs3beiIa1WOmhoJDqby9OW4iAZsgVX
 NX7Pbf0CBXxJ9liJFBkvrcw+MtZDaXaZeRsflXQXfjRCvKY0NdkM/yeh+sa0PNEqjNd3
 NhwtM78p9ZJCgsmwu7oZAUyMe5BWyPVzSMz+/h+9WFhIGOmxLHzmoCsJX9xWDrXiO54d
 qkEFkPZr78b3J7J3/bvISUJUUkBU8YaAFQvDA3lHmuLd9419W5Fr/mg8M7EuFyvcrvhf
 3Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599945; x=1697204745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTAM5CNpSgEwzVKSW9e4FRoovMLtcaIYiChl+KBZzEM=;
 b=kQUH/2zrJaYY6VEkmntjilFL6c7auRIGZdC8esG4L5ScQFLulNPPXFtVs4F0ut/P61
 gF3kHhmnqqH73NFDcMhzFgQeiPv+IQXTE7i2dOllaMj13vfEioXnnIXAgCL75O7nejwc
 0iESZ0OJVC5UYfSMogKuTCyt89wKuToncznKy6St0xYouFLzAKSjA8NwaAYgBGnTpKaO
 UoP6/HevEuqW9k3t6EhUdARQ1e0w9xJ8OTXUMceTKV7QUeNL/wS+HLhNvDW1St/ZLM8y
 9SDRKFSnwn6BTtmeejF5sWGD/KF3+aY79X/0Q5vw8+ZDv0O1qZnZuaZCnMIkmyxaah+C
 yOZQ==
X-Gm-Message-State: AOJu0YxLCLMRuITLTYi5OtwL9vrzi/HDtgiYuHyiHvEn4NCgpnSgiwEe
 DFOV/ZlEsHtKMGCS4CEujrPUNyvPTnUmRQ==
X-Google-Smtp-Source: AGHT+IGCABTg3YSF4jYIQQEOegibn/K5QeRLfm8Nz3d4UsCP4JgTM+VxSImRAEh9MuvQXdzQ+7YICA==
X-Received: by 2002:a2e:97d2:0:b0:2bc:ed75:1ba with SMTP id
 m18-20020a2e97d2000000b002bced7501bamr7372850ljj.16.1696599944895; 
 Fri, 06 Oct 2023 06:45:44 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a61b:a4af:7772:362f])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e3505000000b002bcbae4c21fsm794576ljz.50.2023.10.06.06.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:45:44 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:45:37 +0300
Message-Id: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/3] Enable remapped display page table on Xe
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

/Juha-Pekka

Juha-Pekka Heikkila (3):
  drm/xe/display: Add writing of remapped dpt
  drm/xe/display: Enable remapped display page tables
  drm/xe/display: Don't try to use vram if not available

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 63 +++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 11 deletions(-)

-- 
2.25.1

