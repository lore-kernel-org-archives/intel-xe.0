Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E1C3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A2E10E36C;
	Fri,  2 May 2025 09:35:30 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B22510E8E7
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 09:35:24 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/4] drm/xe: Update migration tests.
Date: Fri,  2 May 2025 11:35:09 +0200
Message-ID: <20250502093514.510621-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

Now that we have a reliable migration implementation, it makes sense to update
and clean up the tests.

I'm also adding a testcase that copies 1/3rd of VRAM to sysmem or another buffer,
to measure the performance impact of our implementation of migration.

This makes it easier to see if our migration is performant, or how changes to optimize
it affect the speed, compared to a direct copy of the same buffer, using the same commands,
but without our VM mapping done in migration.

For completeness, all 4 paths are tested:
- VRAM -> VRAM
- VRAM -> sysmem
- sysmem -> VRAM
- sysmem -> sysmem (same buffer, don't care about contents)

During my first testing, copying a buffer through migration is about 7% slower than performing the
same copy directly. This is likely the result from "<flush>update PT<flush>copy 8MB<flush> next job to repeat" compared
to "copy the entire BO in 8MB chunks in a single job" repeatedly.

Maarten Lankhorst (4):
  drm/xe: Simplify migration kunit tests
  drm/xe: Silence migrate debug message.
  drm/xe: Fix small leak in migration error path.
  drm/xe: Add migrate performance kunit test

 drivers/gpu/drm/xe/tests/xe_migrate.c | 401 +++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.c       |  64 ++--
 2 files changed, 338 insertions(+), 127 deletions(-)

-- 
2.45.2

