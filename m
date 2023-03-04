Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEBCC61DA3
	for <intel-xe@archiver.kernel.org>; Sat,  4 Mar 2023 00:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F61310E78B;
	Sat,  4 Mar 2023 00:14:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4D910E78B
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Mar 2023 00:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677888849; x=1709424849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8PLeWD/jgASRJ+OvUI6WH3XlzdWHLKgD1vklJvheRa8=;
 b=QZTuV7EbPWOa79NU5387dQF8lmBLI2Gw+kxkrSb8vK98oS24pnJaxPfL
 nmnaTkkXqFdGanmuG1LBRoPG6GfXCBlk2pGPhwY08mq1VCFxmQcNmY6hr
 pEJHXJXBedH5Vb3Z2FY6j8zp4dh0UbKGkyBdviNVbegR+GRdmexReCCd7
 WlvOOL0tDU4c1OinETjEDhof39Cs4PBlgqfw4VPejX9XcmP9G5y3v1eeM
 o2sDUDrENLSqmJFwvoYXjn6H8woMzln0MyxKeDLNZ0irK/lMQsCfefkbd
 R7k0GA81/ojRU/0T+KspVjJJrXq/BPC2j57he1qtNQD0XLNPbWc9epUJa A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336710231"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="336710231"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799389741"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="799389741"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 16:13:59 -0800
Message-Id: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/4] drm/xe/migrate: Some cleanups and fixes
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some minor fixes and cleanups in migration code.

- Remove unused 'struct xe_bo *bo' from emit_pte()
- Pass source bo as 'bo' in xe_migrate_copy() calls
- Kernel-doc fix for function xe_migrate_clear()
- In write_pgtable(), use correct size

v2: Rebased
v3: Address feedback and move changes to separate patches
v4: Rebased, add r-b

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Niranjana Vishwanathapura (4):
  drm/xe/migrate: Remove unused emit_pte() parameter
  drm/xe/migrate: Use proper BO in kunit test
  drm/xe/migrate: Fix xe_migrate_clear() description
  drm/xe/migrate: Fix chunk size calculation

 drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c       | 17 +++++++----------
 2 files changed, 9 insertions(+), 12 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

