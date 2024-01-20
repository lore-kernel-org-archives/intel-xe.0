Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E75C4725D
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 01:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56CA10E1E6;
	Sat, 20 Jan 2024 01:50:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEF710E1E6
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 01:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705715400; x=1737251400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mUhpnhA5Q2vlI634KjPg5uuU9CA+nisO4o7kMH91VHI=;
 b=UwcKJOgsXDNQXi8TmTH4wHzLCr65B96tbnmt8SKCIDIjU/Q0F98U6uBm
 nakdiF2XK/XagY2ryazvdN4QBZYl2+n9SQqldCBlxCrYyYndT8XmLoNoG
 DuiZzs2WJPjxs8cdBi6TeXd+3AlWviBXkm6lIuNu42qlPWrjG82m0SLIe
 D2Ib3DJGwmVGlqEAe67w9Ia4b3AtWQ1+7acXiiqrzVNnl40wkCjNUo0y7
 uOE51rz9eooUfX3XSk9rEE+VSKRIxUUGF58NQ5bXPEG6uZJdX0e2Igh8f
 BOzqFc4xYc+QVmDXxQ64vvUcOIOu43tiEEFq0T7OaRJ4NqPrUdkfu7/pT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404665930"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="404665930"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 17:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="785200611"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="785200611"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 17:50:00 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Fri, 19 Jan 2024 17:49:52 -0800
Message-ID: <20240120014953.1241724-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v7 and v8

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |   9 +-
 drivers/gpu/drm/xe/xe_device.c       |   7 +-
 drivers/gpu/drm/xe/xe_module.c       |   4 -
 drivers/gpu/drm/xe/xe_oa.c           | 420 +++++++--------------------
 drivers/gpu/drm/xe/xe_oa.h           |   3 -
 drivers/gpu/drm/xe/xe_oa_types.h     |   5 +-
 include/uapi/drm/xe_drm.h            | 162 ++++-------
 7 files changed, 174 insertions(+), 436 deletions(-)

-- 
2.41.0

