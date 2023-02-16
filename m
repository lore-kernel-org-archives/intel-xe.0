Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D13C636CC
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 14:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE32710E326;
	Thu, 16 Feb 2023 14:49:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6516110E326;
 Thu, 16 Feb 2023 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676558954; x=1708094954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G5jw+2bEDfyJaywARRPKVa5eJQD8KIiWuYfIv4p0ing=;
 b=VZj1VfGm+dS7us9aDuUc3tJ4n5aPguOBv0oCKFwoSSsp0zznPOs8Dzg4
 8/rrO8niXYXeFC+Jvv2tQNt6YIfoayuh5aE9jxZQTSqZIb6Rpdubd90Pr
 q1URWEKfUmnPRLNDz7cQa+a2ODQOP924rHU7PlVajUU0AmixWcY7Mdnx6
 +86Llp0JtWCdUqqExIlPZXzK4gd5MZ26lbCw//iYo0a9VyAXMgLFZf/xk
 PQwvzmQnnRhMSy8umwzPJtGgLRLuFHt9O89GuQXzS7ZxuMFwoN0/CpcWJ
 Rm1kvzYESPGhrL8rvJw8lH5fvN8gHloxh1Q0H9/GUuwWxid1RoNXdfJ3z A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331729139"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="331729139"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:49:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672175107"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="672175107"
Received: from ksushmit-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.179])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:49:11 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:48:44 +0100
Message-Id: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm, drm/amd,
 drm/radeon: Introduce a generic suballocator
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


This series (or at least the suballocator helper) is a prerequisite
for the new Xe driver.

A variant of the series has been on review before, making the
suballocator used by the amdgpu driver the generic one. However we
ran into a number of issues on Xe when using it for context-less
allocations, hence the comlplete rewrite with simplification in
mind. More specifics in the patch commit message and in the code.

There was an unresolved issue when the series was last up for review,
and that was the per allocation aligment. Last message was from
Maarten Lankhorst arguing that the larger per-driver alignment used
would only incur a small memory cost. It would be good to have that
resolved.

The generic suballocator has been extensively tested with the Xe driver.
The amd- and radeon adaptations are only compile-tested.


Maarten Lankhorst (2):
  drm/amd: Convert amdgpu to use suballocation helper.
  drm/radeon: Use the drm suballocation manager implementation.

Thomas Hellström (1):
  drm/suballoc: Introduce a generic suballocation manager

 drivers/gpu/drm/Kconfig                    |   5 +
 drivers/gpu/drm/Makefile                   |   3 +
 drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 320 ++-------------------
 drivers/gpu/drm/drm_suballoc.c             | 301 +++++++++++++++++++
 drivers/gpu/drm/radeon/radeon.h            |  55 +---
 drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c         | 314 ++------------------
 drivers/gpu/drm/radeon/radeon_semaphore.c  |   6 +-
 include/drm/drm_suballoc.h                 | 112 ++++++++
 15 files changed, 518 insertions(+), 693 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.34.1

