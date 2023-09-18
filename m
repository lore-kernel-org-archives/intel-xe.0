Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A61BC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 12:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303210E044;
	Mon, 18 Sep 2023 12:07:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0990D10E044
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695038873; x=1726574873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RtCKORDAYqkwJPDIAd62pDfh1qPs6+UAaDA2N7rEfqo=;
 b=GCUQ1Chc0C9tFN2IDPTCtrv385SUdTi93gl0Wr31hlSnlHYqXPIEY2mT
 dn/hFvLY812CdtCVtL4CdsdEuKK0bn33uvGSn1OI3UbdP9TuG0dk9Uuyy
 XP+csdvDZdMRvOZ+TurC5cm0oWa2Q1UbnTTnXy2xcVkrN79M1LelZ/+Lc
 5AYl916HRXz3poN0n2zASmHT/ZqeAG0zBNnB1/AW8Jh3A/y88ZZGIquiT
 niuXDCEuuVJ2ni4aHG7yfMpr5mbqmgkRuC5ds4nEnYKdHl8++twKNpHcX
 23u6uEj9hPU3ALDCNA+XNJkgDAr9oUWLBDZVEAjU/Eq/f+9hSs+RS/qVB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359887424"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359887424"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 05:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="835992476"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="835992476"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2023 05:07:50 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 17:32:26 +0530
Message-Id: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/3] Use common wrapper to get step name
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

Use wrapper common for both xe and i915 to get the display step name.

This patch partially reverts the changes made in

commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")

TODO: Find cleaner solution for rest(not stepping related) of the Fixme
      patch

Chaitanya Kumar Borah (3):
  drm/i915: Add wrapper for xe compatibility
  drm/xe: Add wrapper over intel_step_name
  drm/i915/dmc: Use common wrapper to get step name

 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++-----
 drivers/gpu/drm/i915/intel_step.c        | 5 +++++
 drivers/gpu/drm/i915/intel_step.h        | 1 +
 drivers/gpu/drm/xe/xe_step.c             | 5 +++++
 drivers/gpu/drm/xe/xe_step.h             | 1 +
 5 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.25.1

