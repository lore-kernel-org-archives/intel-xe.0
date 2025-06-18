Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686CAC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 18:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2888710E29D;
	Wed, 18 Jun 2025 18:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJ4QqojP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E141310E29D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750272612; x=1781808612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bPgiaBLVewWCcyoNxbPC4V+0WhwboGfOBl6Lvn+tiTE=;
 b=iJ4QqojPR12Oj2yivFZjRmYlr93xWRjRsFg4blSzksqvE40e8ATanwW8
 1zgTWv2S6puRK89togcDIKjN1JehbVoARzttLXS70y14BDHX+E3hmOB2t
 Yk2pZk0o6WlvIl+MADrhPx9DnPTVNaIcmV2S00shkf7a9kqX3ljwMGgA5
 17KNlGsXSIH/SiXG5DifhTb/QK+7abvE6hw5mulZTURzrJ+dQWRo+9kG0
 kesh7wY0IzpesfoAs3krq0EKyafusk07ieCmCRi0FUb9hiGOhPjfQYaZ/
 0ncPQF5Ad+inWGfVpd5cw4N6DhtJIlbIB6nLcJouCvU36XNC/pKvnT5g0 g==;
X-CSE-ConnectionGUID: rfiPg42MTBmtsGBJfhvDuQ==
X-CSE-MsgGUID: gmz+Ws5ZQGm5XKzPaYgy3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75036856"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="75036856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:11 -0700
X-CSE-ConnectionGUID: ULodSPM0SD+F7eh3ps0N2A==
X-CSE-MsgGUID: EePi5UoIRCa0gPjRxTwnmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150730685"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 0/4] drm/xe: Update Wa_22019338487
Date: Wed, 18 Jun 2025 11:49:57 -0700
Message-ID: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250613-wa-22019338487-d18a019d79a8
X-Mailer: b4 0.15-dev-a7f9c
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

Extracted from https://lore.kernel.org/r/20250602234415.2015921-4-vinay.belgaumkar@intel.com.
Now that the other workarounds were already update, also update this
one that had more changes.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v5:
- Drop additional steps in case we are doing L2 flush
- Link to v4: https://lore.kernel.org/r/20250615-wa-22019338487-v4-0-704830697cbc@intel.com
---
Lucas De Marchi (3):
      drm/xe/guc_pc: Add _locked variant for min/max freq
      drm/xe/xe_guc_pc: Lock once to update stashed frequencies
      drm/xe: Split xe_device_td_flush()

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_22019338487

 drivers/gpu/drm/xe/xe_device.c       |  72 +++++----
 drivers/gpu/drm/xe/xe_guc_pc.c       | 280 ++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
 4 files changed, 259 insertions(+), 97 deletions(-)

base-commit: 55cbd02fa784e94b4f658c1e547371ac804c62a9
change-id: 20250613-wa-22019338487-d18a019d79a8

Lucas De Marchi

