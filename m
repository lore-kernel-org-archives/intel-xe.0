Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D14CD4945
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFDB10E65B;
	Fri, 22 Sep 2023 11:51:32 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ED110E65B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:51:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-503f39d3236so3396995e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695383488; x=1695988288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IdaoJIQs/hgOdmvSkPsrlPWhqY7DdDl76aWllVRQPGM=;
 b=By5SovDlLwqmkoVd6ztztLH68TII0ecRQ32eCTqInvD84UHH+sImYF0FvVrSJkcN99
 CAI8CGVG87OmWnHkVMZDXkKqY5cIKe+KcUcbNN6RsNHOt5ermKiYlHWYuza96gQYUU5+
 iFWVPlgOM5tlaMtgdKJC3uJAUi0ogFzl1GesqFBWNDYZ3q4NBd2K2xIM9Xsq6v+gNi9A
 lvJR8BFhhcxaX3VTbpQ4Sil1jmRsGNIelQGp21eO7iO79IP/MRl1JYCcXQRnvJYVSZgd
 NJEfgEEJtdbcEnXYs2qKmPfrhF48iz+XDL+7CJjGtj6upAV3ZLFRuykqjkNwtrApUkdr
 eowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695383488; x=1695988288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IdaoJIQs/hgOdmvSkPsrlPWhqY7DdDl76aWllVRQPGM=;
 b=kb7atHS8sGoo+9VwN37ss/5vPbta/nNTZLYoSXZaTZROonUCjQ7Y8/HS5ghlsbaL2A
 Dcok+EO9GcbhDcf+7aUBV1iBX1fpv9Ei/MZE1KL2AcfDeubnAq9rx7xxA/ClFurT89sC
 2OeyyfXWx/Q5RaUjZmXvpwJCnz3M46ZH9CQjZZQfANYDLDK6Yk4qxhUNwJIVHtstPxkp
 qKfGdacJ2CAgjdb/4F2bYBE5r9XG6wHYZ1/oIM1pXsWWrOLGUK4O7Kqb1hQeXJrVtR75
 adKovsNRLzXLxVx3SyReZjULeVN6WJ+lM+CUqNrdHE9yahaifQvjh18wPb6akhKcBP3m
 AG/Q==
X-Gm-Message-State: AOJu0YwZCQCKRwqfjb3540aUWxNh7PefMLldCuHMNkOR77CkNDdlXlKz
 pypzPGLGujdGArP0G00xCzR/Ndfbxu7ofTSL
X-Google-Smtp-Source: AGHT+IEh9N5FKxQIWBFZK2oSmry6VXEmRhcfvMIG2Td4dy6ZfOtheTSuSA/1kIFZh20wf923VHdH1Q==
X-Received: by 2002:ac2:5f73:0:b0:503:3827:bfa9 with SMTP id
 c19-20020ac25f73000000b005033827bfa9mr6296101lfc.34.1695383487877; 
 Fri, 22 Sep 2023 04:51:27 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a3c1:45a8:51d0:6c6a])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a195207000000b005009d5aaaedsm700508lfb.172.2023.09.22.04.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:51:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:51:19 +0300
Message-Id: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Enable remapped display page table on Xe
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

/Juha-Pekka

Juha-Pekka Heikkila (3):
  drm/xe/display: Add writing of remapped dpt
  drm/xe/display: Enable remapped display page tables
  drm/xe/display: Don't try to use vram if not available

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 57 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 11 deletions(-)

-- 
2.25.1

