Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DAEC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 03:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D518E10E564;
	Wed, 24 May 2023 03:32:22 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5280910E564
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 03:32:21 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ae52ce3250so4630205ad.2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684899140; x=1687491140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=58sUKlC1mDnbuWPRxFhNeU1JJbqM8ZfRB4misERMGLM=;
 b=a3DUtKy9Uj9HE8qQ8up+IlkEk8k4wnNXP+0k4aD2MEQGAD5up32qR/W9222QQ1lVW2
 cELKgWkOVDmiesbSBZXWEdxRVSXwVSSOEfOdfWa9uWVB+8Bw/KgSq1PI0N5H6MiPgYkN
 Ohdz9ASggfi1eSKQnTccZZkCNqmEsTS1WjAvzMOXtjMnJpjBf7r/i6zaV2g5wtZ8zmhl
 ZUneDglmL1Ib4utSW6h6G/p3U8LfCsiM2TEovY00ErojS0zgTipKZLIRu6hd0zRxIY6/
 0p/7zOY/XUVIs+P4xMVBqbppB0viNFKD36WxyAWfaBnKGjNTiW9o8K9q6qfqR9+y3k9J
 s7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684899140; x=1687491140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58sUKlC1mDnbuWPRxFhNeU1JJbqM8ZfRB4misERMGLM=;
 b=TGonw9hxadTUbNoEw/7VINb6xtot85lF1T8F4U3Qg0FSazHA/M7dKiTKav0ROQqBK5
 dAbZO6PA4HEBcz3EthMw3GTFql4XwsNv+BrEpzoVvQvyzpSg7+fMxuqetPa1kEAGPWzV
 jPD0UDc/Hc666MUJkkjLaItdMhRSeFOtbDPqD1gdQCKEeIoNezr60UCYYjijIiimQEEK
 jEsdwbNEOFHtQ9RsUdo3NbBCB2EDNx1OpBJnvTnycSsNW8cDSQlhUXSzPex66TIsJL8u
 ji8SKv0kzNr91qjjxDFVEjc6Q/o4IkOKR3osBxIBjZRdDij6rn8m7LsSVD4lkl4oXEqz
 leoA==
X-Gm-Message-State: AC+VfDzGDkVN08nVskTrhIDBTiwWaDxgSjQJVf0YmhGNbQ7t4GZOUNHL
 lcXgPYk9Z6GkvahIuehmUK17QC9ParkLwJil
X-Google-Smtp-Source: ACHHUZ4nXqfBbSKgqbJj3jtW8ceU5fKaEZg0I5shC05+sudlFjQAslmsDvVZ5/09kFRWz6Mi669UbA==
X-Received: by 2002:a17:902:ab42:b0:1ac:b363:83b3 with SMTP id
 ij2-20020a170902ab4200b001acb36383b3mr12247729plb.41.1684899139760; 
 Tue, 23 May 2023 20:32:19 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b001a96a6877fdsm7546660plg.3.2023.05.23.20.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 20:32:19 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 20:31:29 -0700
Message-Id: <20230524033131.2000480-1-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Update Xe uAPI in a minimally invasive way
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>

Christopher Snowhill (2):
  drm/xe: Add explicit padding to uAPI definition
  drm/xe: Validate uAPI padding and reserved fields

 drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
 drivers/gpu/drm/xe/xe_engine.c          | 19 +++++++++++---
 drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
 drivers/gpu/drm/xe/xe_query.c           |  3 ++-
 drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
 drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
 include/uapi/drm/xe_drm.h               | 34 ++++++++++++++++++++++++-
 10 files changed, 86 insertions(+), 16 deletions(-)

-- 
2.40.1

