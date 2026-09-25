Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F2CC9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2317110E1F6;
	Fri, 25 Sep 2026 17:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="CkgX80vv";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DC210E1F6
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790357228;
 bh=D2yqMox23rHT5pw2u5nCYJL/jzMm49SfaKUSxGuro2s=;
 h=From:To:Cc:Subject:Date:From;
 b=CkgX80vv3HEbqcJFpyxEjpE0+2EYay6qGHv5tEPcGu+DvIZmvLF95q/9XOWtpP8vq
 uvM7D2djdWUvbe3UivknyF8EZEYDpcabq3P5/sUw93OJ4b4j28B9/w0zyY5P9r+niZ
 C8+BEBctXv4hFEkDYn5DJ4+qs387tfDH7TwWguRs54MC4ImOYpwaDwhRrK62INK8nK
 E30BDtN2FJ9RGdelYzA/MUuYrSvdrBoAc5a5w2E0wyiefYM+7vsJ9qQMw8P1iGVzBA
 h6vCcMEwPeA4KjYk8v28dSs17Mc7hRm5yrPo7xTMUbz66Mjqud66MFXcBhkfxAHi/H
 GZKelhIJlw2/g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/2] drm/xe: Increase job depth.
Date: Fri, 25 Sep 2026 19:26:04 +0200
Message-ID: <20260925172603.302050-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Currently we assume all jobs are of equal size, and take exactly MAX_JOB_SIZE_DW bytes.
Most jobs are much smaller, so we can fill the rings to their actual size by setting
the credit limit to the ring size, and job credits to the size of the submission,
this will allow us to fill the ring much more.

Maarten Lankhorst (2):
  drm/xe: Convert job preparation in 2 stages
  drm/xe: Set job credits based on LRC size

 drivers/gpu/drm/xe/xe_execlist.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c        | 150 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_ring_ops_types.h  |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c       |  12 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
 6 files changed, 105 insertions(+), 69 deletions(-)

-- 
2.55.0

