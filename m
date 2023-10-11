Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8BACDB46F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 17:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AA810E17E;
	Wed, 11 Oct 2023 17:26:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5247B10E161
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697045210; x=1728581210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WSrOObuUVgDg0f0IQE4gHcbxrRE7Ue0amA1i6eI1ojU=;
 b=QQs7j1OG3On7/HY9UkPZ7jc0nzebmQWxFONDYa60U2kAUQ/EeUwUmtvY
 zPwCnX08SX7op8e0K25+OuPfrE3F7tUFquoQYnuHvbgsX17kvOell6b78
 2AXd/Wv3QbtCvoCppjxQC65IK8BR98ChP6KR6+uxQOiQgLeGBshxyPAg6
 XMwnHMxc288km2Nd2mi/3CH4VK6BjB1XPbquBZYTdeV8aiTqYvRyAiT2i
 OhzDDraRduS34fqS2adsx5i+UlczYafn6A1PICVSvDtqNIk5ffo/YVOO5
 agZZgh6kcG2zCWy4T3KsMgN3l1Zb5w5Uvaj8FFAbCr0L7OB2+PFQ1hK4F g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375072634"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="375072634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730572958"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="730572958"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:26:50 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 10:26:40 -0700
Message-ID: <20231011172643.826452-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Xe PERF layer
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
Cc: robert.krzemien@intel.com, ogabbay@habana.ai,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, gzadicario@habana.ai,
 Harish Chegondi <harish.chegondi@intel.com>, bdotan@habana.ai, talbo@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These changes were originally submitted as part of [1] but since they are
needed by multiple teams developing different Xe PERF stream types, I am
separating these changes out as part of an independent series which can be
merged first, independently of OA.

The full use of these uapi changes (for OA) can be seen in [2] and [3].

[1] https://patchwork.freedesktop.org/series/121084/
[2] https://patchwork.freedesktop.org/patch/558376/?series=121084&rev=6
[3] https://patchwork.freedesktop.org/patch/558375/?series=121084&rev=6

Ashutosh Dixit (2):
  drm/xe/uapi: "Perf" layer to support multiple perf counter stream
    types
  drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl

 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_perf.c   | 21 ++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 16 +++++++++
 include/uapi/drm/xe_drm.h      | 61 ++++++++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

