Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4329C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B360D10E915;
	Fri, 19 Jan 2024 00:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C19D10E939
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623368; x=1737159368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nOVtM4pFDZeevAosKSNQMQ3Gdr1y2cY95Vx19tPBQgg=;
 b=mi12qGutOdPGTMkcsltRREye0EFpae8DZl+g1TKBEcVz9eJO/0BnVWKJ
 n/zy9iqoQ5hQyc8STwFxSRGiq1kqiylnCwg8xVc+d7WV4m5IV9OXkYjGQ
 l9/+35QChSrWrILXjMUQVdS3SmydGVl5tejSGlUCqEhiSR7uopOecGl7X
 SQqejtJwhqG3AXqsI4L+88ZU4uCartuVbgUhii49lW2Dsq4fwc5iCN/wq
 +QqzfcFvGnZzHjz+1YMXpC/jgWKe9ZZgf9+QqZhQ67hiZQsApYZarf4Lr
 8FTF5qDsIFMvURQVSbueAYKZndJkgZqK1SH6c1HJ7lw0BNggQd6ZnQHlK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404373181"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404373181"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818923985"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818923985"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/5]  Fix 32bit build
Date: Thu, 18 Jan 2024 16:16:07 -0800
Message-Id: <20240119001612.2991381-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A few fixes when building xe with ARCH=i386.

v2: the first patch disabling 32b builds is already merged.
    These are the real fixes to get it building again.
v3: Change  "drm/xe/display: Avoid calling readq" to use memcpy

Lucas De Marchi (5):
  drm/xe: Use _ULL for u64 division
  drm/xe/mmio: Cast to u64 when printing
  drm/xe/display: Avoid calling readq()
  drm/xe: Fix cast on trace variable
  drm/xe: Enable 32bits build

 drivers/gpu/drm/xe/Kconfig                             |  2 +-
 .../drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 10 ++++------
 drivers/gpu/drm/xe/xe_device.c                         |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c                           |  4 ++--
 drivers/gpu/drm/xe/xe_trace.h                          |  2 +-
 5 files changed, 9 insertions(+), 11 deletions(-)

-- 
2.40.1

