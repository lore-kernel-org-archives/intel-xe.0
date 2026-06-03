Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55597CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100001122CB;
	Wed,  3 Jun 2026 19:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="gIK5fwtC";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529F11122CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780514561;
 bh=j1XFQOy7mcY/U02Gfvjvyhy994LgswSRobHU2Nq6qgM=;
 h=From:To:Cc:Subject:Date:From;
 b=gIK5fwtCnSw5nlNUC1jldtSIEz7I2zR9BD1IwXfAEf+FKbu05VQuer9i9vQy+n9Da
 uizuyaDJ+xf3Mqbvigmtr6W6YSDvQpJbkxtbKVnYQ7+/3TlAg8rdGBlTq2QB2S88PE
 ectspTlYH7GwIVglQ0pjeQWMiI8Og6RNNRifKkp+y7wuYwxUi5U+hEE16+ON6RtG0e
 ukaBZOfWpl068tD83QoPedvhmHMirZW45dkKTRpFspFF64tkYxfj/Dofwh248o8IE/
 HR2+QaEOAFve8Ek9GOLPZwkTnHSDw9H/DkadzNRpFy2CyQy7o6TSyHM7+9BYQNSv7o
 2BVfiYvWoT2+Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC v2 0/2] drm/xe: Allow pushing more jobs into LRC.
Date: Wed,  3 Jun 2026 21:22:37 +0200
Message-ID: <20260603192239.257733-1-dev@lankhorst.se>
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

At least passes local testing now!

Maarten Lankhorst (2):
  drm/xe: Convert job preparation in 2 stages
  drm/xe: Set job credits based on LRC size

 drivers/gpu/drm/xe/xe_execlist.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c        | 150 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_ring_ops_types.h  |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c       |   9 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
 6 files changed, 102 insertions(+), 69 deletions(-)

-- 
2.53.0

