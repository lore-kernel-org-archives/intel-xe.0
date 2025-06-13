Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E6EC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7B10E9A6;
	Fri, 13 Jun 2025 19:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEPcVBp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C48110E9A6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749842390; x=1781378390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G7ZBkrqCK0oK5m2GxXFJwXKHhcygyZy4VhVZP2T4mXI=;
 b=JEPcVBp6/R/tEVkxHzdWryvm9csXrYqWeOLrWscQvq9jP7CH9HtHOaQO
 ZJmJ6PsaTl+5XLxkMSle1FXrnOF8jSDS3nvGClwTxbN3UuUGD3L4HCjR8
 0LxdSY+PNqEnKuB5Rlo+qtUuQ0MUJtFmrOHrAb5EiCAfbv16NnEuvquCQ
 EMwC21IndHIVuH9VxJFNlOFSG6Oz13mCGkY0sXoGFwC5YExjTxzIRUhel
 olwS4eSK++bxblI8xo6VdXNvar311YA37csLGmun43ad6S4b11pbI4+yk
 5woT8yCtMnjJ5FWi13720hW5LCsy2emZ1WPCn9utolWGIxxB+6xNcxlXY g==;
X-CSE-ConnectionGUID: FLiiD+jERiuJ10NvZ2tlug==
X-CSE-MsgGUID: fh4QcB31R9KKXurpfn2pQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69509503"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69509503"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:19:50 -0700
X-CSE-ConnectionGUID: KFkc4cgrR9OZQAXnUE2rzw==
X-CSE-MsgGUID: ofLhMrZ9RN6XxyHQ9XU6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151721329"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:19:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Convert xe_pci tests to parametrized tests
Date: Fri, 13 Jun 2025 21:19:36 +0200
Message-Id: <20250613191938.1980-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/tests: Drop unused xe_device_fn typedef
  drm/xe/tests: Convert xe_pci tests to parametrized tests

 drivers/gpu/drm/xe/tests/xe_pci.c      | 63 +++++++++++++-------------
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 24 ++++------
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 13 +-----
 3 files changed, 41 insertions(+), 59 deletions(-)

-- 
2.47.1

