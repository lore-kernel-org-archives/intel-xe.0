Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F04FC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520F210E512;
	Wed, 10 May 2023 19:54:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693BE10E512
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683748488; x=1715284488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q2CwUSGncAMyOL2pxEY3Sqx5cGzOuoYqB6i+FVcrjNc=;
 b=Myx4OV9vsnInkOwzrGShl7dPWanZwfdo/Ms/8eK1lr5NHD4UPQ6TRlsm
 zVLhXxLXwslWmgRTEKVfGWnO+Y7nlXZfd0NyVD9brIJNkrlotlKj2lM7R
 m7UrkeoUPp9HUrru7TQr5utiwzWfeYQUOjdFjLRjnXoSlRyY+Vew9MPuX
 lWWNhi89fGNuxTi4spOO5ZgFiGRjPctLK0YnQmgSZf9h3NnWFjjL+TT14
 lHvsp+n3JAw3+MRRofKHq1mfkTcu8fQ5rcHAY0ismzbrL4YF1npxz8fVo
 drPOPzpyMTVVxehdAXLmA1pmbKRlJOu8M07iyiLEKjWbSjwrRZV5CVDnF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350336271"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="350336271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730056881"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="730056881"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 12:54:20 -0700
Message-Id: <20230510195424.3045127-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Fix display integration for ATS-M
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The current way we enable/disable display works for platforms that never
have it, like PVC. However, ATS-M breaks as it's actually handled in the
driver as a "DG2 without display".  Annotate the platforms descriptions
so this can be used to know when to enable/disable support.

A few changes are also done here and there to clarify the driver/device
separation on the init phase.

Lucas De Marchi (4):
  fixup! drm/xe/display: Implement display support
  drm/xe: Annotate desc of platforms with display
  drm/xe/display: Consider has_display to enable it
  drm/xe/display: Use xe_display_driver prefix

 drivers/gpu/drm/xe/xe_device.c  |  5 +---
 drivers/gpu/drm/xe/xe_display.c | 48 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_display.h | 46 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_pci.c     | 27 ++++++++++++++++---
 4 files changed, 78 insertions(+), 48 deletions(-)

-- 
2.40.1

