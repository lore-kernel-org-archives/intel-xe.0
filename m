Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2273EC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 23:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A0F10EE9F;
	Tue, 22 Sep 2026 23:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRPR4Xrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ACC10E942
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 23:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790119087; x=1821655087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=594KOWguC8aZhd36TkLTlyhPGjxBFiJB8Gpy0sMJhh0=;
 b=SRPR4XrbGT4ozh99rFDv54qulBCIzB/vdcRt4Mzi9w/kuH1/K1HUElZ2
 p48gbqDSrno5RxyRjPTsWcreu9435rmEujNTKvGqxy1jfRnmJffCiQujp
 +cPCRWtgu+2TJHULPNVRoqHJVctAl6aUhwXC9lZKkZih4VPEIzH0JnsBW
 9KcF09blUkMLnNgBvOJXKvonZq7K9hthvSGm96x6BKM1g5WBaAEq/INyf
 6z+WEKlnvj+qE0ZoJhRqDzTWptws33LIHItca4BNIktS5qNdH+fz8BeBq
 3KI1r/+X126UU9x5U8Js6bjiAOs5PLNs4rbpGxwza+H0RurqbOxYOYhea w==;
X-CSE-ConnectionGUID: bvSqM+jKTJWJ5OPTLGZqEg==
X-CSE-MsgGUID: unqnsDaETAuDU5QnQZEYwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101432612"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="101432612"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:18:07 -0700
X-CSE-ConnectionGUID: kHWxl2/1Rk6BkBZ8YlbNGA==
X-CSE-MsgGUID: CaOiLplES4OYPluGFeN24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="271922758"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:18:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v6 0/7] Use SIG_ID logs for GuC component
Date: Tue, 22 Sep 2026 16:17:59 -0700
Message-ID: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
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

 drivers/gpu/drm/xe/xe_guc.c    |  40 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c | 322 +++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 +-
 3 files changed, 257 insertions(+), 118 deletions(-)

-- 
2.55.0

