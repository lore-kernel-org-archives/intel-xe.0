Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D105C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 01:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEF310E480;
	Thu, 25 May 2023 01:56:17 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1324010E480
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 01:56:14 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-335598ae8b4so3773395ab.2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 18:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684979774; x=1687571774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l80qr9iPZrTUggTGNPdD3FDYDsexOgdqHHtAX/px8j8=;
 b=JC6i79rYwz35xMx0a/eYTo35/hlQ+cE/ArX64hNQfkuy4G69yGHBaBmgrQ7HF1QQbG
 pQZ9rbZSTGRpK7sUB2AoeymcBrfObYafb7a88UWttw1Lm5x2enX3K/cj85meNBZyP2sc
 qOXGFp2bGTXi8HE2SeGnSAk4lb1+T1BqvOFiAdiTZfDsV8cMlwB2JTUXa3qrlzOE6yGZ
 JuWD1ZuEpi3xwm57DKkxWMxRLzIv7qLrKY7o7ttsjFZSp9pbS3DXazJ/wWiEx1+TRMNt
 Shk3WHwKl/lqNQB3BLoR1PJqCTjsBOPbRofa4oh5DcNJM+0pUvb7Fu11GeR//Yt7on2m
 5X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684979774; x=1687571774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l80qr9iPZrTUggTGNPdD3FDYDsexOgdqHHtAX/px8j8=;
 b=l1KwwXAywmpXsD42dtkwOF1mFVV8MFIHFUs4IGFvadAkGqpDoImT4syJAV4GnKxMW7
 8FFSFzA8f3JZRr+foK7x5BQ0g3QTe3A6iGIDcHuGub+80BdpQ8CBAwRvoEXGCL7+25Ln
 26kWLv9yAUoSQufWqdK/FfFZoKZAQDL65Rmhh7swgF9ozI1Rb6chIWbezpYZIuZ5bXNn
 Ebd4Dkj+moABhtFA3AG8009Y014oZE/HDzzBAVE6jDVvWHsi/ZzqJNPHQ7mC5rZ580VX
 oQP2XJJY5jyaBjRZIJzxlZBMyomkfZWAXZX9IDXf9JMGDTvPeId0ip8a+VFU5qpYft8h
 Jr8A==
X-Gm-Message-State: AC+VfDzDkl3ZzZ75hwbYSSgBiDKfEa+7rjKHpwnwpH6/tFBgPo8mmfUe
 X6b9xCldkKQlI068WLrdVBa2UAMHR1NOblzN
X-Google-Smtp-Source: ACHHUZ7zMN6uSLFq3r6klllUN+X/eeNylJcGx4bwt37p2RJzJYHixiEr23UQUOAG+K50DDAAty/mjw==
X-Received: by 2002:a92:d903:0:b0:333:eb18:2b75 with SMTP id
 s3-20020a92d903000000b00333eb182b75mr11849222iln.28.1684979773653; 
 Wed, 24 May 2023 18:56:13 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a92cf12000000b0032b4808029fsm29407ilo.31.2023.05.24.18.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 18:56:13 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:05 -0700
Message-Id: <20230525015607.2192395-1-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally invasive way
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

This series takes off from mlankhorst's attempt to do the same, except
instead, it tries to be as minimally invasive to the original uAPI as
possible, by only inserting padding where appropriate to ensure all
32-bit members are 32-bit aligned, and all 64-bit members are 64-bit
aligned. This should have zero effect on 64-bit hosts versus 64-bit
userspace, so existing native software will operate the same with or
without the update. The only real change is 32-bit compat support for
multilib userspace, which was previously broken.

Also introduces field validation against all of the padding and
reserved fields, which must be zero, in a separate commit.

v2:
  Removed extensions checks where there were none originally. (José)
  Moved extraneous parentheses to the correct places. (Lucas)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>

Christopher Snowhill (2):
  drm/xe: Add explicit padding to uAPI definition
  drm/xe: Validate uAPI padding and reserved fields

 drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
 drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++---
 drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
 drivers/gpu/drm/xe/xe_query.c           |  3 ++-
 drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
 drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
 include/uapi/drm/xe_drm.h               | 34 ++++++++++++++++++++++++-
 10 files changed, 85 insertions(+), 16 deletions(-)

-- 
2.40.1

