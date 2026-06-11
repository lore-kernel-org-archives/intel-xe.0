Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288FFCD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D756710EE2B;
	Thu, 11 Jun 2026 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="mNZGOq0k";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4120310EE1D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781174165;
 bh=1lf7y5upyE4/hJH+3uTRXOg41KNRQKg7c3U6KqmlPyw=;
 h=From:To:Cc:Subject:Date:From;
 b=mNZGOq0k1k3Z8I5rvIRrLd1o67oFTDWMICd0beNtQXh/kTO2aQ5IWciGPShK5cKZs
 ZPhVD79cOjKS+eYfDAw9g01v6bA7Rhdmzh70x0vUEdtMmaP9Rl0H3idOEy2qc7MF4n
 0bLs1iCdfNwOG+zeZJaB1WhaNpDN9Zq+SHMLF7OYe9hGankN0I8Zk9z3SB5IqzZXZM
 8DUyTafIY5qMRBaSZXbkEzEjc/0LIi39/kpALoblvCAv31B/Cv+S/6IwqD15a3eeHp
 6N/Qkd5/KNpJv14kgUzM4iu6p92hkJbYEuOI6npLalPOmMwEpMZaninevuqDWwzEvS
 AzZllxlnUYkDw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v3 0/2] drm/xe: Allow pushing more jobs into LRC.
Date: Thu, 11 Jun 2026 12:36:11 +0200
Message-ID: <20260611103613.191719-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

We don't know beforehand how big a job will be, so we always assume
the worst case scenario and fill the LRC based on that.

Try an alternative approach, where we determine the space required
in LRC right before submitting the job and pass that info to the
drm scheduler. This does increase the size of xe_sched_job slightly,
but does allow a bigger queue depth.

Noticed when rebasing Matt Brost's series where queue depth
dropped below 64.

Changes since v2:
- Fix job submission.

Maarten Lankhorst (2):
  drm/xe: Convert job preparation in 2 stages
  drm/xe: Set job credits based on LRC size

 drivers/gpu/drm/xe/xe_execlist.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c        | 150 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_ring_ops_types.h  |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c       |  10 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
 6 files changed, 103 insertions(+), 69 deletions(-)

-- 
2.53.0

