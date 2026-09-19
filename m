Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CD0C982E1
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 05:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A9510E70C;
	Sat, 19 Sep 2026 05:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjT+i0/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9302F10E536
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 05:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789794063; x=1821330063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NaLiog5BYYlNbkyHFayyjbLmRLtO85NCGLdYDbuQyGc=;
 b=TjT+i0/+p1uEoCEyY29CCMWlud25mu46RcJeFrpm9UnF6NvIMkhaivty
 h8ZlbD1RzumSSmZLD/CvNSJwzlzdXUsZSnphhS/0TVYY5djMvoVj/YCyz
 om2qZdqnE2/VClms5R1b6cYNegYCnBJHHoVoFmJISh0UuMX5/Z3KbeJ9o
 1Mbkrt5uFjh6DyiMCO/Lz8wqNYVLQ/cXjVTy8uLouWYxvQeMRRGwzNgE7
 lrjWE42dK6pa0oUISPtxBRrS0BEAgpFxjlqNbKKR9naop1esQKENb0QpW
 OkbhTxirnE2ox4KrHOQ6rRVmCyb5pg1NIPZBxMQDGDP5JhP3JlBH+rlXx A==;
X-CSE-ConnectionGUID: 4IRuZImfQ9uStv9E3+67nA==
X-CSE-MsgGUID: LFGxNnYKTk+D6lAChv7tJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89463547"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89463547"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 22:01:03 -0700
X-CSE-ConnectionGUID: PvaleoDST/eQPn8khc1uIA==
X-CSE-MsgGUID: 6tET+lt6ScGP6c8/0skSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2926695"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 22:01:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v5 0/7] Use SIG_ID logs for GuC component
Date: Fri, 18 Sep 2026 22:00:56 -0700
Message-ID: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
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

 drivers/gpu/drm/xe/xe_guc.c    |  40 ++---
 drivers/gpu/drm/xe/xe_guc_ct.c | 296 ++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 +-
 3 files changed, 230 insertions(+), 119 deletions(-)

-- 
2.55.0

