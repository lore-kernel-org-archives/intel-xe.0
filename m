Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D036C0032E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Oct 2023 03:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F19210EAA7;
	Sat, 28 Oct 2023 03:39:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281F210EAA7
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Oct 2023 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698464356; x=1730000356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KmdtzrqCqlOyNOuVzXcBrExq+BKpzJa8j1abv2Bmmyo=;
 b=mapSaX0Bucp3afEfaL7WgHJHfzKZcu9rmxVhrNXoYKhqQLmsu5Pwz3WU
 hMgAg+rtMhHBeoqhQjtBZaOMOKYn1Q6nE7HA8jfhnNx1rbPZTZjsKpXbt
 uFtbE4LkkN9+Ub36G2sC8fVvSccW5yaN4+8g96T4nKQ5X6Aw43iwGxS46
 Q1e9N2+7952CT4IWPxNj/BjV7KqLCOb076DL5dXOr3Yjn3TejktZJNfsS
 qWZROUcg50mfkExOiy2QvwiV6v9a3lBqt2QCZIO4xttmxUUsmJOI9iwfv
 qSYKHWdx9JEjdgAK8Z7bsbk1fUPu9cNgUdnYYzNzL2dUbPv8Zo/f097y3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="6510325"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="6510325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 20:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="7825405"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 20:39:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 20:39:09 -0700
Message-ID: <20231028033910.2479157-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/1] Xe PERF layer
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, gzadicario@habana.ai,
 ogabbay@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These changes were originally submitted as part of [1] but since they are
needed by multiple teams developing different Xe PERF stream types, I am
separating these changes out as an independent patch which can be merged
first, independent of OA.

The full use of these uapi changes (for OA) can be seen in [2] and [3].

[1] https://patchwork.freedesktop.org/series/121084/
[2] https://patchwork.freedesktop.org/patch/558376/?series=121084&rev=6
[3] https://patchwork.freedesktop.org/patch/558375/?series=121084&rev=6

Ashutosh Dixit (1):
  drm/xe/uapi: "Perf" layer to support multiple perf counter stream
    types

 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_perf.c   | 21 ++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 16 +++++++++
 include/uapi/drm/xe_drm.h      | 59 ++++++++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

