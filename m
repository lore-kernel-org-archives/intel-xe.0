Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF4BCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987CD10E69C;
	Mon, 12 Oct 2026 23:29:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0129210E60E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791847756; x=1823383756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qIuTwXebIjQjOX8Bpjy7xG4tC6aMCNHKpLptpKCQ17k=;
 b=eEhZnho67iY4Ak8834LoFHpBqXHk6T4L8haujlwp4vZmTjBqRXRmcaeF
 VMeJrZ/9VJAL/HmhAfskFMCpRNP2hljy8ZjX9osoZXeFqNcJ8r7ntMIVI
 o1Ij6ca3OK0V6O1eBYIYWjIxm7eZfsF49dqb0lCa4Noz4K0avoe3rgExu
 tjFrw0vRgwOfbQqPIVqii+dXLF+H2pN7WCTEDM10v9XCIokVctcb2r1qY
 ztoMch7UKIkQBBjvfVyyoMEfFnqsV/uQiu4IpR04tiina3eGnQRvD38N4
 56gspgmql8m0n0yWlho+I5Ip1IVqePNdwP0hgxOV8rq95wc0RSO6FlzFE A==;
X-CSE-ConnectionGUID: fcjytav3SuyRdwX12bUgOg==
X-CSE-MsgGUID: KzMS27ZvQNW9steABe1DIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="450709"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="450709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:16 -0700
X-CSE-ConnectionGUID: kqboq75YSEC0WBR3tVN2HA==
X-CSE-MsgGUID: XZHNyXRyTEaLNqgD0UaSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1337833"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, aravind.iddamsetty@intel.com,
 mallesh.koujalagi@intel.com, alan.previn.teres.alexis@intel.com,
 julia.filipchuk@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v7 0/7] Use SIG_ID logs for GuC component
Date: Mon, 12 Oct 2026 16:29:08 -0700
Message-ID: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add SIG ID logging support for some parts of the GuC interface code.

v3: Add some review comments from v2. Some opens remain. will address in next
revision as discussion evolves.
v4: Review comments from v3
v5: Review comments from v4
v6: Include Sashiko's comments and some fixes
v7: Comments from Daniele

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/guc: Use different error codes for GuC load errors
  drm/xe/uc: Report DMA failure using SIGID
  drm/xe/guc: Report major GuC failures using SIGID
  drm/xe/guc: Report errors that cause a CT shutdown using SIGID

Umesh Nerlige Ramappa (3):
  drm/xe/guc: Handle CRASH and EXCEPTION G2H with separate helpers
  drm/xe/guc: Make ct_dead_capture available on non-debug config
  drm/xe/guc: Cleanup error codes and handling for CT errors

 drivers/gpu/drm/xe/xe_guc.c    |  40 +++--
 drivers/gpu/drm/xe/xe_guc_ct.c | 317 +++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 +-
 3 files changed, 253 insertions(+), 117 deletions(-)

-- 
2.55.0

