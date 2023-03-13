Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9875C61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4BB10E62B;
	Mon, 13 Mar 2023 20:45:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CA610E62C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740340; x=1710276340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nXPpOMjUKgXsELK+JHs2ioR0UI2w34GrbnFkT1ExRCo=;
 b=HUUelTYJUF+Iusm5Zjz1NbFmxgY4hGtWt3nkBKMNkuYNsIGHo5KTikhU
 auWHfx5FPmO6G33aTQhXlw62OTgNjAME2n4YHTYAKkEfuaizek7bC1Ym1
 RT9uFbkckXuulakG0wcCZburOZzPzrxYOPu5Qei7M7GGd1hk/N4sO4Idg
 Rh84fmMrNVN64ZROITsuw0x5LG1tsaTotSz8V7Z3MSi+hgBYglfGcNTDn
 QYFSMjctTnfXUT5ziKNxGgA/PEwtKqxbT6KTGaUt34MvRwyjKjIFT7Uda
 oZDU8XLWpMcLu8DYPe7g7aecVdKmpMRXURlSXbrxpZlzxlVf6ugYE2ctE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334733809"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="334733809"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924650097"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924650097"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:45:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 21:45:13 +0100
Message-Id: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Cpu page-table updates and fixes
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

There were flaws in the engine idle computation used to determine whether
we could use CPU page-table updates. Fix those

It also turns out fixing those triggers CPU-page-table updates in the
migrate test, which didn't really support that, so also fix the migrate test
to handle that and to run the test twice, once with CPU- and once with
GPU page-table updates, and to also provide some timings for
non-synced updates. (The timings avoid the GPU submission latency
to better reflect the case where we are able to pipeline GPU
page-table updates).

Finally provide some coverage for the fence seqno 32-bit wrapping
case by setting the initial fence seqno to a small negative number.

Thomas Hellström (6):
  drm/xe: Use a define to set initial seqno for fences
  drm/xe/migrate: Update cpu page-table updates
  drm/xe/tests: Support CPU page-table updates in the migrate test
  drm/xe: Introduce xe_engine_is_idle()
  drm/xe: Use a small negative initial seqno
  drm/xe/tests: Test both CPU- and GPU page-table updates with the
    migrate test

 drivers/gpu/drm/xe/tests/xe_migrate.c | 35 +++++++++++++++--
 drivers/gpu/drm/xe/tests/xe_test.h    |  1 +
 drivers/gpu/drm/xe/xe_engine.c        | 28 +++++++++++++-
 drivers/gpu/drm/xe/xe_engine.h        |  2 +
 drivers/gpu/drm/xe/xe_hw_fence.c      |  5 +--
 drivers/gpu/drm/xe/xe_hw_fence.h      |  3 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c       | 55 ++++++++++++++-------------
 8 files changed, 96 insertions(+), 36 deletions(-)

-- 
2.39.2

