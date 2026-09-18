Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9208EC982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 08:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D8610F270;
	Fri, 18 Sep 2026 08:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="kW42ImXk";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05DA10F267
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1789719370;
 bh=gCi0hJ7UfPPbgw7DL865PYGixltSQfh2bnTG0r29ECk=;
 h=From:To:Cc:Subject:Date:From;
 b=kW42ImXkAGjTwR9PNThYyaM6UDEDWELmoT4ckunxF3AJGFP03EoWA6i/Q0P5iqKQw
 5iKCZ4639pFpia8Slfmum74ZatdmkbGHE8srLckJXpVDusPkDkYtcq+EdgDPVeirMP
 Q9/dWzyqxJFoWSWXxZkEXhrWbI4dvYL0zHXwgTkUPlgvvXfvPnDcwfp35SZ/GfMwRc
 llDqDPnSaCe9qjRSV80MSeC+6NRzi9PIPPk5gbkpiZqhfepuFUAuhewnzXRNdyFv+e
 ISrYuxlBs3k6F/xq6uXeRcCqQ7q5Vpv1fNQDhUSKzw0GYMH07i9OYh/4+B4TkVZe9V
 YtfeffVAr77Tw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/2] drm/xe: Increase job depth.
Date: Fri, 18 Sep 2026 10:16:07 +0200
Message-ID: <20260918081609.518988-1-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_sched_job.c       |  10 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
 6 files changed, 103 insertions(+), 69 deletions(-)

-- 
2.55.0

