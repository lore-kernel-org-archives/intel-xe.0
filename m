Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5ABC761A6
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 03:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1533A10E2BC;
	Sat,  1 Apr 2023 03:03:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3C910E0DF
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 03:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680318187; x=1711854187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jI6TfB4v6QdUdZjE97C5JZW0kZWbnq4VFP23k/Le+FE=;
 b=mmbt336YeaGxoSMlY7AFMThyta4qst3h6H8aA2JHOEOdhqkCJPrbmDrY
 t0UDpCrJIDDOMhGeEBt9pARg6IT1MjQtI2TElOEmVg+PGr115akcEqjoh
 ukvYYuol1eKKSrwFkOLNt76H/64lIkeiTYP+7F42uQmLtc/WfUfv+S9rZ
 g/BfqS9PD5B1XsaUSmJX/vK6xXthWcAYD/uZVPAoyvlELwl8a9mPyYkho
 iYkPQTcFhg2HEZZ6ph6devWU/+5unq7jUZNn9CSgwZVCiLmHzGS5PK9Lz
 dd8rUsu+VJ7SjZbfsVu/XNwiz+MMsMvgRcP04rk45BuSOfRL+AtAyKbr3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343284484"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="343284484"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 20:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828935674"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="828935674"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 20:03:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 20:02:57 -0700
Message-Id: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Get xe_migrate_test working
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Resolve issues in xe_migrate functionality and kunit test and
get the kunit test passing on all platforms includng the
multi-tile systems.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe/tests: Use proper batch base address
  drm/xe/tests: Set correct expectation
  drm/xe: Use proper vram offset

 drivers/gpu/drm/xe/tests/xe_migrate.c |  4 +++-
 drivers/gpu/drm/xe/xe_bo.c            | 12 ++++++------
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 drivers/gpu/drm/xe/xe_migrate.c       | 13 ++++++++-----
 4 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

