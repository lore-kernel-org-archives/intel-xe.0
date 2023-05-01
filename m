Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73073C77B61
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 11:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99D10E0D1;
	Mon,  1 May 2023 11:58:41 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6A10E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682942318; x=1714478318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+x6VSNy8BH9dj+54Ic1Kgm0/18lTyc0uOJHSmscP8mU=;
 b=hNx6QJxp8E8wDmpDFZaH5UO06nFLYxeuGrl+EXzXS6JgbDUtV0gKVv+v
 21uZ19L/v09HYSxOkpUcwVFJwDu0u9aMY3NNlTdaeFe+GPNEgq+elsC3c
 Upm1rchOlWW846sMhvCgHOSv+OYePL6QAzswv4jupytdXAyEjBrz3CZBJ
 BskSugXZufBT8hlTyaQv7qqVTlD9aWstz6uEqCHU5aC6w9L4Auq1aCBk1
 8F6iXhTawSu/pPwKpqGyX7BBSIp1yLM7UZmoZIabE56Vo+UAZ8XAxzI5v
 F74610cufkphE9f1yszkIz1OZKi0Lr09votkodoQBtw+Qx+LjmkdPK3D2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="327762980"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; d="scan'208";a="327762980"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 04:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765276198"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; d="scan'208";a="765276198"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 04:58:34 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  1 May 2023 07:58:22 -0400
Message-Id: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/4] drm/xe: Rework multi tile device memory
 initialization
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
Cc: tejas.upadhyay@intel.com, michael.j.ruhl@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vram initialization path does not take into account
each tile's actual memory size.

While updating this, simplify the rebar algorithm and clarify
some helper functions.

v2: Address review comments
    - separate tile sizing to the initial patch
v3: Re-add deleted warning for small bar systems

Michael J. Ruhl (4):
  drm/xe: Rework size helper to be a little more correct
  drm/xe: Simplify rebar sizing
  drm/xe: Size GT device memory correctly
  drm/xe: Rename GPU offset helper to reflect true usage

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  18 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 278 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
 9 files changed, 205 insertions(+), 157 deletions(-)

-- 
2.39.2

