Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B4AC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 14:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4710E7FC;
	Fri, 26 May 2023 14:37:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9325610E7FC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685111831; x=1716647831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MLDhM34o0hsDKtCMhunIunwPV0j7LIiKahCmHEz7Uiw=;
 b=RQGzA/7B+JqQiqJwMnfCW8mvgNcGFbzTcioFHzLF89Rb+pY2HiYElVi8
 Mrmo18DEnkP2xFTel0W9UbbMrVkCSTbalTGrQBSpYbv4/m4J4SLQag2pE
 qJRD0rOFD3fqB+StA1omXzbvIGjLTvW6SY5JO0ZO85OjNZO/FYQijpj8W
 JP6Sh+nwMO4ZtHE1pqLCeTLOtUv+POPYNr4JOrU4vtiSmRb3A8xiscBET
 15ErhRbTm3Ndo4WjuvLd+n6n6WplWbv/YAwA5srlmq9eZLkYRMwZOFBim
 9sPfXCdRKQXeRbz+w8CLJFbR3Ra6HFqXwsfTb0xmSEtW7BurV4K83Wr/o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333839102"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="333839102"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 07:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770362679"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="770362679"
Received: from djustese-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 07:37:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 16:36:55 +0200
Message-Id: <20230526143657.226637-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Migrate fix and update
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

 drivers/gpu/drm/xe/tests/xe_migrate.c | 23 +++++++--------
 drivers/gpu/drm/xe/xe_bo.c            |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 40 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h       |  3 +-
 4 files changed, 41 insertions(+), 27 deletions(-)

-- 
2.39.2

