Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8063ED591AC
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 18:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1C610E111;
	Mon, 18 Nov 2024 18:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXcJCFk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40B610E111
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731955524; x=1763491524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vAoHryxkpLToWbKb62TLVXb8ETuARchB+bnkfTblQQE=;
 b=JXcJCFk8DdWry/DfDeQGonBtjdnu7yEa0rCr2vG9FqkSv1Cd1cTUWU6b
 Cuo/IUtsEOZaIvBYW07tiHPMpvWLjMqltgj7hQIwFRmLQ9deCSXjkhAv7
 a1YQA8mS/BgdHW6XGWf7G+xWhtTOlZtuJVWG9K0Hzaz7iHkQZoZMgmIzC
 u352ZAQIpLi2HZ6ozEOkeb/A1S7rZH8X12WW13Swgdh7bEPRyohDYOdVg
 TnD1ByNe+bDUNWCyF507PSJRu5h6PIaXh+wUXpVb5YIMBwEr22zJqVIWs
 ITU13x3LpXDi+/Y97p2yiQ5i0yl7dj0e+GFkEetLI6lMtRxIq4tCPN4tR w==;
X-CSE-ConnectionGUID: uifpc3Q0QleMpafemEKEBQ==
X-CSE-MsgGUID: ivEQJEM5ScubGtfl/skY5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32027855"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32027855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:45:23 -0800
X-CSE-ConnectionGUID: U+0pqnzJS/GtyiowU87GFw==
X-CSE-MsgGUID: IlYME6C+R1GHjmFMHMKCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94391394"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:45:22 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 0/2] New force-wake guard class
Date: Mon, 18 Nov 2024 19:45:09 +0100
Message-Id: <20241118184511.258-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There is support for 'classes' with constructor and destructor
semantics that can be used for any scope-based resource management,
like device force-wake management.

This should allow us to use:

	CLASS(xe_fw, var)(fw, XE_FORCEWAKE_ALL);
or
	guard(xe_fw)(fw, XE_FW_GT);
or
	scoped_guard(xe_fw, fw, XE_FW_GT)
		foo();

without any concern of leaking the force-wake references.

v1: https://patchwork.freedesktop.org/series/134958/
v2: rebased

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Michal Wajdeczko (2):
  drm/xe: Introduce force-wake guard class
  drm/xe: Use new force-wake guard class in xe_mocs.c

 drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_mocs.c             | 10 +++-------
 3 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.43.0

