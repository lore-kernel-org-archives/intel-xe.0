Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BFDC54E51
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F017310E3F5;
	Wed, 28 Feb 2024 06:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfdx0yAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EE110E109
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709100626; x=1740636626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RO+gvQsB9tbUYsxMeTPtJDYjlKIaPuITA558PRJCmIw=;
 b=cfdx0yAoz6RCfPFMLUFZOUPUkZbv0M5jFXXfWEfh5ClcL35QOxISs4PW
 isn0ZYfxXzpMMbIHmI1em2Tsnpk4bpydDB4nf5Gni4Tqdfdx5pPSvayAZ
 PE9j6ihKV5tv2nQZ6BxaeGVopQo3xDi7WkTJPUfLwdzB0anvwCBA4Tbm1
 MNpDTI2feXLh9VOQyO2fV8KH92wXKxVUzjMn/ej1PKAhq9WqDgVl2S/iO
 Zurgcg/Asvv2iLQePPC5r9xojukdnYSYCZyICWoP3YGJdlxS+DB5fdafd
 kNffNeYJyh1hKVmU0df+hvLobBRhQ+tILwYoBM/7EBnSTWPYF5junyE51 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25950313"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25950313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7290272"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] Refactor and fix mocs live kunit
Date: Tue, 27 Feb 2024 22:10:43 -0800
Message-ID: <20240228061048.3661978-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Can be considered a v2 of https://lore.kernel.org/all/20240222204203.3007498-1-lucas.demarchi@intel.com/
although it has more things.

Do some refactors to improve readability, add support in the tests for
odd number of entries and in the end switch DG2 to ignore the last entry
since the bits in that register are read-only.

Lucas De Marchi (5):
  drm/xe/mocs: Refactor mocs/l3cc loop
  drm/xe/mocs: Be explicit when logging number of entries
  drm/xe/mocs: Move warn/assertion up
  drm/xe/mocs: Allow odd number of entries on test
  drm/xe/mocs: Fix DG2 kunit

 drivers/gpu/drm/xe/tests/xe_mocs.c | 75 +++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_mocs.c       | 34 ++++++++------
 2 files changed, 62 insertions(+), 47 deletions(-)

-- 
2.43.0

