Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07593C76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 17:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8D110E1B1;
	Fri, 31 Mar 2023 17:10:08 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998D410E15D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680282606; x=1711818606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O7vtsjb+BjYd6KAQpS0rQD+WM9fbSK9yGQPPQV2j+VQ=;
 b=WZIA68zFK5C59ag4zrWKf7LWuxACbEUnGwQfs62KsUM5ktpQTmGkLDB6
 DlXm72oWbsnWk8n0DFe+3YO/UB1hx/2jBITa65UBQk5jTxTnOtfbgtS8r
 XX0aeD6Q1PHsoJHE4RCVcaMWCbhn4EoPpzGjYGaDKfgQr3ROZ8t76la+g
 ++kjcAjQ5Yc527m2UOtqsFHQCXgAtzhbIyRB4d20yjNxiy4piMDf+ujBt
 LaLUZrTbZXRoYukTYby1MaaV0onNHnCLjYRa0mnisZZHZnkJMTa4fmvdX
 PKiyhK7bCy+b1Or7A2c4aaFiex+PCWYURYhmToh8tp75UjnT0GJWH1LQ7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325490227"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325490227"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809106387"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809106387"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:33 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 10:09:22 -0700
Message-Id: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe/tests: Use proper batch base address
  drm/xe/tests: Set correct expectation
  drm/xe: Use proper vram offset

 drivers/gpu/drm/xe/tests/xe_migrate.c |  5 ++++-
 drivers/gpu/drm/xe/xe_bo.c            | 12 ++++++------
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 drivers/gpu/drm/xe/xe_migrate.c       | 13 ++++++++-----
 4 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

