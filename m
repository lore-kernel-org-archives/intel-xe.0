Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B75BCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 13:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13F310E44C;
	Mon, 18 Aug 2025 13:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQadASxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018CA10E44B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755525106; x=1787061106;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=AWtIW3c4nKN0xflPG81f2l8sCOlBMDN6j8RuVrmw8pM=;
 b=bQadASxJaS2fc+kuqfQ3tVRK5duqN20yzSP7SepjTnakT5b63gC/eikk
 tQrvtr11mkseYGTEBEr+w4z9Yj1B48qJJE4n0RvuM61WamBHQblIK2n0a
 TUauEm99Wimfy/MwnbjkQNfhLR/uMhyBvUQLFe+JrtSIULChMvllmM/Kd
 THvx5SHsBpHsceBXu5ELfVesAeX8obR6PHA+ulHUvWt7KHBnATKR+yQXO
 aWEYHLX3Zohx6I2yYxEc0kP3h4KTiu9+t21Iycsx3csAOlyH4lFGu2PWm
 LeXllBO/5sevyYjiPa1MhP5t3yKE3848zex7SKsRgargXVgrOidHg/77D w==;
X-CSE-ConnectionGUID: HIKKRZymT5mkvWlNFa7bbA==
X-CSE-MsgGUID: fiqX+d27SPCaBf7G2Rv/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61373715"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61373715"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:51:45 -0700
X-CSE-ConnectionGUID: PAhc2G7tRj+TeKTBDlOvLA==
X-CSE-MsgGUID: 3b8m+JivQtWT0+WsW/eVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172785484"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.108.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:51:44 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 0/2] Tile and GT counting improvements
Date: Mon, 18 Aug 2025 10:51:01 -0300
Message-Id: <20250818-gt_count-improvements-v3-0-32f6901e42e6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMYvo2gC/4XNTQ7CIBCG4as0rMXwUwVdeQ9jTAtjO4mFBpBom
 t5d2lU3xuX7JfPMRCIEhEjO1UQCZIzoXQm5q4jpG9cBRVuaCCYOTAlJu3Q3/uUSxWEMPsMALkV
 qVQuMS8mskqTcjgEe+F7d6610jzH58FnfZL6s/8TMKaOS8SOXtW1P0FzQJXjujR/IImaxVfQvR
 RRFaV1zA7rR3GyVeZ6/dV6PBwABAAA=
X-Change-ID: 20250723-gt_count-improvements-d7be01330d73
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

This series improves the way we define values for tile_count and
gt_count. In the first patch, we move the logic that probes for
available tiles to a more appropriate location; in the second patch, we
future-proof the way gt_count is calculated.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v3:
- Rebased to get fresh CI results before applying.
- Link to v2: https://lore.kernel.org/r/20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com

Changes in v2:
- Reworded last paragraph of commit message for the first patch.
- Fixed KUnit failure.
- Link to v1: https://lore.kernel.org/r/20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com

---
Gustavo Sousa (2):
      drm/xe: Probe for tile count during device info initialization
      drm/xe: Use for_each_gt to define gt_count

 drivers/gpu/drm/xe/tests/xe_pci.c |  7 +++++++
 drivers/gpu/drm/xe/xe_mmio.c      | 33 ------------------------------
 drivers/gpu/drm/xe/xe_pci.c       | 43 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 48 insertions(+), 35 deletions(-)
---
base-commit: edead24a80ae92312f75626eb92f2771ec5a7697
change-id: 20250723-gt_count-improvements-d7be01330d73

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

