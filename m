Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA7CF6ABD
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 10:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02A210E6E9;
	Thu,  8 Jan 2026 10:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="LuEXGMZa";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F1810E6EE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767867018;
 bh=X1QjsGp7yWO5gYfrWY/vIOAM3botGuTdC6BnV68VWQ8=;
 h=From:To:Cc:Subject:Date:From;
 b=LuEXGMZaMfxUWwwi5Ia0e24t9Ly4vGEGXOQYsqpRmwcWG3dawr8eoxfEeKDFc/4oE
 BVCSz03PKgo3LzMGgjZm63pRAWvMrcfigNlq+3ZuIZb+HrNPmij9uCA7Rjzi85lC8y
 QB6K2jPj7RilvN+5WUTg451wGbO07F8PtsNO6lseVkYl4nYiz7awwytUslZ90Rle5t
 rp2Zx1WEtyahVxURVt9I72PZHeWavdAjwxK8mOaOGzwseTsvdy8GFC62DA49fyLbNO
 mhTe/QIp8nK8U5gcFCZCW9OmspooZI362y0sFEvbu3MX92gxSirw1ouFHYqJzQ70OC
 9AU2A77tiBLnA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/7] drm/xe: Privatize struct xe_ggtt_node.
Date: Thu,  8 Jan 2026 11:10:15 +0100
Message-ID: <20260108101014.579906-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

I'm trying to fix the problem that GGTT can be moved on VF's. The easiest
solution is resizing the GGTT to be as big as can be allowed, and provide
a variable ggtt->start. To facilitate this, the first step is avoid
the rest of the code from looking at drm_mm_node directly,
this will make it possible to change its start offset in the next series.

Maarten Lankhorst (7):
  drm/xe: Start using ggtt->start in preparation of balloon removal
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
  drm/xe/display: Avoid dereferencing xe_ggtt_node
  drm/xe: Do not dereference ggtt_node in xe_bo.c
  drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
  drm/xe: Privatize xe_ggtt_node

 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 104 ++++-----
 drivers/gpu/drm/xe/display/xe_stolen.c        |   2 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 212 +++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h                  |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  32 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  19 +-
 10 files changed, 254 insertions(+), 149 deletions(-)

-- 
2.51.0

