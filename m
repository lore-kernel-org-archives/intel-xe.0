Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47A8CD6E5D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 18:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A782D10F2B5;
	Tue,  2 Jun 2026 18:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="n47lbTDl";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB4310F2B5
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780424089;
 bh=FJKULz51hmWimbxX7f1e6Ft33WJ4y8pcvvX1TuzH+j0=;
 h=From:To:Cc:Subject:Date:From;
 b=n47lbTDlBCY0zJO0DoYWgjEyJ7R7RhWGu9ZGJe9EamgVFXfHEbHm1ajdfTz3dQAas
 drmQ3VOs4wI9DIyuOyO4WGxH1q0YC3Irc5qNiQd9ubRyV9DpizsEqUun9pk01cRUdC
 w7mTHVSUCYJGTm0DXJ5CT5ymwaAHQl+Dp4wJQUqPLIvYt+AbbHltMWrEy6vxtgqqjF
 IMdsoxrt8GhQahvTPLaoL3LQyGRbuBr5BQ9U12D6KppVI/pMhOue+1XetDqaRORy6E
 W+4Ayzi3dq/+MUI2JXLsh69WKgXsIEk0HsnXlh0zJFxkGvfqpSpxZ2Pf33CBnYmD/m
 JULESgAp7gx6A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC 0/2] drm/xe: Allow pushing more jobs into LRC.
Date: Tue,  2 Jun 2026 20:14:45 +0200
Message-ID: <20260602181447.131216-1-dev@lankhorst.se>
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

Maarten Lankhorst (2):
  drm/xe: Convert job preparation in 2 stages
  drm/xe: Set job credits based on LRC size

 drivers/gpu/drm/xe/xe_execlist.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c        | 150 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_ring_ops_types.h  |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c       |   9 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c   |   5 +-
 7 files changed, 105 insertions(+), 71 deletions(-)

-- 
2.53.0

