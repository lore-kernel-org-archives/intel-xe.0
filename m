Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45234C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 09:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1610E526;
	Tue, 23 Jul 2024 09:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7HnqrcC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B34610E526
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721727591; x=1753263591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v4Ta2OJkjBAgzeb//oQDBFILvUazlW9Y/fxr2ZolrpU=;
 b=M7HnqrcCXz4ETGsqsoIx+1YHM18yYQ8D25WK/NOxWAZGdp9X/8SlaaO7
 ni9HXofzwcsBdc7Y0r4LiMcJ0GrAShr60nTTCIlWiNInHp3t0R9Xw5FT6
 nVpkvr7YpOOB3R0c73/evXuAQ9SwpglN0F8siyThBfaNoufNQNUhc2Bu6
 /kL5YGY0aSx6c1Ip4suIZbZ2wOKOTdr/zCbK0JWF5yulJYHJVYHr/15rv
 AWmsvj0/Nqx/W9pMPkhxSG2fRlRlrtYoN6rYFaxB7jnUd9jmMjPSnBmNL
 ksGK5c0d1tROe/tuTHhOgMRZGTpgG0nkUR3wt2r2DawOirXrkwGLFeys9 A==;
X-CSE-ConnectionGUID: Gh8vHFrVTX+5hPwV/M9tDA==
X-CSE-MsgGUID: vQHk5cfERxCsHiJdVjtIXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30003244"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="30003244"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:39:50 -0700
X-CSE-ConnectionGUID: GHAXZ9IuRlKfE+v3O6ubvg==
X-CSE-MsgGUID: 2aKtcNObQLG9RF8FAd+dcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57027948"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:39:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Subject: [PATCH v5 0/2] Restrict BMG to use 64K pages for scanout buffers
Date: Tue, 23 Jul 2024 11:39:35 +0200
Message-Id: <20240723093937.144596-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

According to talk to UMD teams they've asked to adjust allocation
for scanout buffer transparently to required by display alignment.
Previously we agreed we require explicitly aligned size, what was
relaxed in creating dumb bo. I decided to relax this requirement
for scanout as well to avoid changes from UMD side.

+Thomas, +Maarten for their statement about change
For reference about explicit uAPI change please take a look
to v3.

v2: Limit restriction to BMG
v3: Expose display alignment config to userspace
v4: Drop display alignment config
    Handle buffer size adjustment transparently in the kernel
v5: Rebase to current drm-tip

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>

Zbigniew Kempczyński (2):
  drm/xe: Separate 64K physical allocation for display
  drm/xe: Use 64K pages for scanout buffers for Battlemage

 drivers/gpu/drm/xe/xe_bo.c           | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++-
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.34.1

