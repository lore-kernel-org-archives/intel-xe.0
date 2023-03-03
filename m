Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C02C7EE2F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB79B10E5CA;
	Fri,  3 Mar 2023 10:16:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9BD10E5C8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677838576; x=1709374576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F5FUxMINwmCv38u41DNQvYcCiWzLdYMwB297pcL3xH8=;
 b=CMEzTw4SxV3RL/FicsyvRfjcJeCF3d7CSnAmc0GGnXIrZw/NXDmQhN9H
 jTL1qAJWoYoSOY39vVAil4W1kD2xuNV34apffHbcqHfsqgsihF+kBlaR7
 ODIR3TJIJv5cohl25zdk+wqoAaNnBjTmWFR7V9gXZtt1ASCq5fzfPgzmH
 nune8PcUOxt7xE6LDrreIKMtxl4pLOBnwEamo85jTiE0lSVlyI9MRjnlN
 wE9XNwWa8aTu+W3cbt43myDt+c24B4K81sNHqhXTD4oUWVw8he8BRsHGm
 5qtqdb+j3GiRP4onfAeYGg5TPQkGHQGA0xowdaSsRJdbkTiKGyO84gO8d g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="335034903"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="335034903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004537309"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004537309"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 02:16:06 -0800
Message-Id: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/4] drm/xe/migrate: Some cleanups and fixes
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

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

