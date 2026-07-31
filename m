Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAA7C55171
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E4410E26D;
	Fri, 31 Jul 2026 23:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEXQMiyC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11E310E26D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 23:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785540392; x=1817076392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JcqM2W/yWEeR/ojm5fv8G4yYxnn6UvkhWbX30tyFhMg=;
 b=YEXQMiyCWTPQch8CcMXC742u4h6WC24Zxji6HATaaogrporfqBtI8bwH
 mGsH0N3pu8Z6qVAn5orGYK794ujzJzf1KOqeDnf5wbSbieWSquoClT5C1
 LFmbsD8lRDrOzOVt9LFUOLV1pJq/ezHap6BrvYoFs7/dXV3rJqB1As5Tx
 NTBqRgTX1zOnXghI1kEQW9AFTIn2yJcj8Sf33FSdZkK/tDvEzOHd1jRSN
 9b3E2CK/MgKaSdypE/R0Ee6qW1VvCleU68CvrkOmPzOswTtfdlOhUQE8H
 rSPkHm5Dvzks5Kw9jslDkEQQqvwFtaRHu7GxaZaYRpORJ55ygh//A/8T8 A==;
X-CSE-ConnectionGUID: HGtrxWFDSmaNS8OefdOMVQ==
X-CSE-MsgGUID: k6MW0KlaT8qjSuvKmzaLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86120833"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="86120833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:31 -0700
X-CSE-ConnectionGUID: eU+iEIxxRomV1JJx5kq7CQ==
X-CSE-MsgGUID: ybhKSWIXTrG/Ka+kGa0zzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="260112407"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:26:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 0/4] drm/xe/multi_queue: Handle lost message during VF
 migration
Date: Fri, 31 Jul 2026 16:26:23 -0700
Message-ID: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

During VF migration, CGP_SYNC message to GuC might get lost.
Handle it by resending the message again.
Also handle cgp_sync wait woken up by vf migration.

v2: Redesign to cover all corner cases

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe: split VF pause into prepare and revert phases
  drm/xe/multi_queue: handle CGP_SYNC wait timeout during VF recovery
  drm/xe/multi_queue: track and recover lost CGP updates across VF
    migration
  drm/xe/multi_queue: replay dynamic CGP updates lost during VF
    migration

 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   7 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  32 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 173 +++++++++++++++++--
 3 files changed, 196 insertions(+), 16 deletions(-)

-- 
2.43.0

