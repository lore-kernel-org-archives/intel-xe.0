Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049A8C761AF
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79A210E14E;
	Mon,  3 Apr 2023 17:57:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AEE10E0BF
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680544669; x=1712080669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8OV13goIu60rjLYhff4ESu2zgp8+QqUJBCPI7qwIRFQ=;
 b=d/QiyQgUPE9ncg6lZJlxqY6LdhhIH3/9Tv/Z0a4FpLz5ldL+3P5N2B3D
 BK+/xfAgOWlpBkXaBu0NbsgssApMbOkK08FuiBJ/Ro/dTL3D/wn3dxgin
 bfojGov3tactT+acdr4dyOuWqEhyRl8xa2s0+ws0t1oVU4ltZcRIxfZfU
 bDLxUip4jM5OZS75pOte0exBRdcpp6Zn8G4EqimLb90BFfOz8O+7kLZ51
 ERZPY3Tw4aMjhwO+zyR9UbRwM4T2+JyyRN/JNQTKRsKifowXDm7jEKgrl
 c6x0bf3x72Da0S574mggejniZ69+inpcwUrRvJQm8op9S5BfCFIl3grlk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="341999530"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="341999530"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="686065666"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="686065666"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:57:42 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 10:57:36 -0700
Message-Id: <20230403175739.32183-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] drm/xe: Get xe_migrate_test working
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
Cc: thomas.hellstrom@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Resolve issues in xe_migrate functionality and kunit test and
get the kunit test passing on all platforms includng the
multi-tile systems.

v2: Rebase and add Fixes tag where required

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

