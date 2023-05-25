Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7566EC7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 06:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491D10EDAF;
	Thu, 25 May 2023 06:27:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09B10EDAF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684996054; x=1716532054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fc8sSgBmsivHwkRlgOFYch9MPf/8j1n+k3oaNcAZs/E=;
 b=ne27K2JwnDiyZ/AGY4hAr1Rssz8Pit68bcS/MdYfloSp228ZWxRLlxtV
 DtFZLRQ7qcTC040R4cfIkdtmgtGufg4mg4lD2fGYy2DGxYJKDRqSiYYsg
 VaasEVGqxj/L33Ypd7Dcl38OjtVUJK2KLzjSfu4PBXeWj5HWrb9rXXDxi
 U64kgHESUdDS/Xnweyfs8FSAy3ibu9oJflO3Y97/TBTfGzcCgFq5EA3c5
 1Nm/t9jO7opsHdm16ydGTRKQ6kD9WIzOZ93XQ2ymo0aw3MMRnageRikVa
 z4OUAHeN/Pst3vJ71YLdRaOud1KgdcDbe1mfPAoRYTvdNyKAtCl28bLXR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="351308639"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="351308639"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="774541895"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="774541895"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:27:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 08:27:22 +0200
Message-Id: <20230525062724.176084-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Migrate fix and update
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

The first patch fixes a kunit test error which is only present in the test
and causes the migrate kunit test to fail on integrated.

The second patch enables copying between system memory bos and extends
the migrate test to cover that as well. Currently this is mainly
beneficial for upcoming MOCS and PAT coherency tests.

Thomas Hellström (2):
  drm/xe: Fix the migrate selftest for integrated GPUs
  drm/xe: Support copying of data between system memory bos

 drivers/gpu/drm/xe/tests/xe_migrate.c | 23 +++++++++--------
 drivers/gpu/drm/xe/xe_bo.c            |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 37 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
 4 files changed, 38 insertions(+), 27 deletions(-)

-- 
2.39.2

