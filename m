Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C253C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35C110E141;
	Tue, 30 May 2023 10:26:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4B10E141
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442394; x=1716978394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rwR4uaUsxKqYsEuLPX08VUdoX7bQ6a1ZqsC4jbizpwU=;
 b=WpUn7m7XC8TFjYqDn5MfOyX4j0lANpfVq5oUkbEweYnY3sMn7yI0s3s7
 zGp9fCdPZwyMk/uAQZ5wVRCn146I0mUAYuTlcfKdwihvfAid8mQJUXnl4
 NLfHF6UBZhlInjWuhmq+aPFrxef4o1z9o69gwG692pJ0dHNOPf6rOfcIH
 6OFaG+VLJ7XUGzGs9TfQRNIkiUAZa0CcB9NVqJ0VUDT9lUHqibtZgLzE0
 YED49d8nhDje4rgTkJdkICqW6CbMi5E805LxMjEXTVRvmlhD8NBcRKMv+
 t3KvoAz/CRdioIgEQe9oWL/bsKkqSS6amvUBNsPNM8tIffJ5Uzi23cB9G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="383131108"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="383131108"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880715083"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="880715083"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga005.jf.intel.com with ESMTP; 30 May 2023 03:26:30 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 16:04:20 +0530
Message-Id: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Adding throttle reasons sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Exposing various throttle reasons attributes as part of sysfs.
These attributes can point to various reasons for performance
limitations, include power limits, temperature etc.

Sujaritha Sundaresan (1):
  [RFC]drm/xe: Adding throttle reasons sysfs attributes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 67 ++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

-- 
2.25.1

