Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D1FC02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9510E369;
	Thu,  6 Feb 2025 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiwL4Ete";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E235B10E80F;
 Thu,  6 Feb 2025 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738838169; x=1770374169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Djw3Or85foo9fcv1QCAZt5FOkg7+JtChbY7uB4eG78=;
 b=MiwL4EtesSORlf9KubpR2kM7LNamksStUC2IhN5G4n2Ej1rR5Oy7n6+o
 A36hA6pfQmQIoMGVKWOabL4rox0fCIYLG+7dXIMf+SeSwThpEqMhem0Nw
 68C8eob+3xMEeUSsLDMuyRZH3kKEpL+3GWBaet3O0uWRODIAadG9CF76L
 gQwJbRwF+xiM/BG7K+3jSx94xE651dmejOx2vhhpU+1Iuh1zx4AsvzLwf
 WwHZeQrbVx6/3vEQtwbcEXdPo8UfKDtfIpiJCcLQHmFb6RpWj+555ySxm
 63roR0/GFu5hLRFWIb7jcnUGBv5R6Td2OsZUZNzspAermIkb3ULV20uVI w==;
X-CSE-ConnectionGUID: u/mpzrOJRHqOl960aPVMEQ==
X-CSE-MsgGUID: 2VHY1/B0Qk6B7CyG/TjJcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49679661"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="49679661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:36:08 -0800
X-CSE-ConnectionGUID: XHYph6fDR2yROP+UPCQVQg==
X-CSE-MsgGUID: 1naLGQiWQmug8iw68QJZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142052536"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.47])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:36:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add TTM reviewers
Date: Thu,  6 Feb 2025 11:35:44 +0100
Message-ID: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add Matthew Auld and Matthew Brost as TTM reviewers

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dbf6a03e416..7a032ea9f109 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>
+R:	Matthew Auld <matthew.auld@intel.com>
+R:	Matthew Brost <matthew.brost@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.48.1

