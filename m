Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E673C76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A9C10E368;
	Thu,  6 Apr 2023 20:48:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DA610E368
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680814128; x=1712350128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XoDUHKFT0Facr8XDqwCmuV6CjrLD+c/qpRtd87C0tn4=;
 b=P3qRwe6P5AJYy4BNPUrEFcj0QyBIbYigtFZV9Ojv8xDyOOc3TFmJ2sre
 fPCYwKTkcobCSqhBaLrfc1T1hhdMJVHfpNjTNYJOyQG++yTq4GJJCFCTB
 enOQQl1e/aNkA1ulICbTuGgxSSON9G9eyBk0xyh8LnOi+zMmHCxpkCpKc
 Z1F8u+Dd5yFNfJarZREVJQsfPQLQ1xCpzOgiHrCZlTV4FbxTeExh8N5Z0
 ICu9fXUv0QjmPXx/ohBqBM+hd2DP9H8b8l5mCiG8o5hQEBtqEB6wA8VY8
 tUPxflnC8/nDMG6aZxYG5PGLvtp3xVT7bxk/B+mV4DVGI8YSSt6KxYphe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="407963917"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="407963917"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811139797"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="811139797"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:48:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:48:39 -0700
Message-Id: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Revert coalescing of GGTT
 invalidations
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

Causing a bunch of hangs driver load and in user space.
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232

Benefit is rather small too, so revert it to stablize the stack.

Reverts below changes
drm/xe: Pad GGTT mapping with an extra page pointing to scratch
drm/xe: Coalesce GGTT invalidations

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  Revert "drm/xe: Pad GGTT mapping with an extra page pointing to
    scratch"
  Revert "drm/xe: Coalesce GGTT invalidations"

 drivers/gpu/drm/xe/xe_bo.c         |  1 -
 drivers/gpu/drm/xe/xe_bo.h         |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h   |  4 +---
 drivers/gpu/drm/xe/xe_ggtt.c       | 35 +++++++-----------------------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
 5 files changed, 10 insertions(+), 33 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

