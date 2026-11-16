Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7B606A32A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=khh1FZ5+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2ED10F04F;
	Mon, 16 Nov 2026 12:27:29 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBDB10E2FB
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794832040;
 bh=TwZR791dIennmV/cDrUSjDEyrBwhal/YbFV/pfCg1ds=;
 h=From:To:Cc:Subject:Date:From;
 b=khh1FZ5+y3UDqUKrBAd0gIKACZ5r+45fgpUhtbOoGAGuNeB55e9IpaiRVZ2876Vi+
 Xzx/6X0Xvn1gM11k4eVsca55IkYmrIjVOb1nSCk/EWfaumMBKFSQFmDql6gAf8Zx4b
 hzH9jXewcUAxGghOdf7T3bYWzuoNGpgoDMFN7FyqvqSqD8ClsieO1BlLE4/RngkkOQ
 LFC2A1M84xFaAdm15OEtjZ6+ctWHdkPkOOhhit4/S0b36ebfeN2K7Xk5jO1q8eVk0n
 Y+Roygotkg/ETw/tZ6IeKe/iedkUzAUZVPj+plknVwlsLsEZOeWtNdn7wNEvOhJRcK
 /JOYbvychniWg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 0/6] drm/xe: More BIOS FB takeover fixes
Date: Mon, 16 Nov 2026 13:28:29 +0100
Message-ID: <20261116122828.266113-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reserve the original GGTT area of the original mapping, and remove
the code that was required to deal with the fact that previously
this was not done.

This allows us to cleanly take over the original framebuffer from the
firmware, and put it in an area of the GGTT that is safe to use, without
causing any flickering.

Maarten Lankhorst (6):
  drm/xe/ggtt: Add xe_ggtt_reserve_area
  drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
  drm/xe/display: Reserve the original GGTT space before creating a bo
  drm/xe/display: Use the correct calculation for phys_base on
    integrated
  drm/xe/display: Remove duplicated code
  drm/xe/ggtt: Remove xe_ggtt_insert_bo_at

 drivers/gpu/drm/xe/display/xe_initial_plane.c |  41 +++----
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 115 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 4 files changed, 110 insertions(+), 59 deletions(-)

-- 
2.55.0

