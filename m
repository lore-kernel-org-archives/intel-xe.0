Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6443CC54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 23:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3173E10E77A;
	Fri, 17 Nov 2023 23:14:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C27B10E781
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700262866; x=1731798866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eQilMXnp7DgOQUfq71etv+C5AqN1Wy64HdbbpIvtlWs=;
 b=GvXQjYieY43cXdZ7G4ZscoY6XrKE+2BVFHcSvBntS/B2qXR6KYxr6Iwt
 aLqVoSRvTpGB8ElDYaYbG3any0bDV7jeOe3Pn+e/s7szNNG6wTJlRG6YG
 pKh/D4VDBhrBlFnOl09sWDjapvBK75dqCIOARl69kx9d+Rg7DQ9j+Ko+H
 YQNKJQ0Vo/QYKjh3x/naXREvkOJZsAutFA9+lU9z1KDA7Gb/ng6GiMQgZ
 SS7UPwoZxiOMZhH7YcCJACz+JoJ9OgqV0ziUDX4g4Gj06N0D6QKPAkrvs
 qTKS7dCfJWo+jmoa/TmLo17xnATYpHsj1hDFw3E1EVQjxzwJGEHWN6sIP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371561519"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371561519"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097236227"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097236227"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 15:14:08 -0800
Message-Id: <20231117231411.631895-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Add WA kunit support to MTL/LNL
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Previously we didn't have support to test the WA tables for MTL and LNL
since they use GMD_ID to connect the graphics and media descriptions.
Add some infrastructure to add that support by stubbing peek_gmdid().
Now the test provides its own version of that function, which allows the
versions and steppings to come from the test table.

Lucas De Marchi (3):
  drm/xe/kunit: Move fake pci data to test-priv
  drm/xe/kunit: Add stub to peek_gmdid
  drm/xe/kunit: Test WAs for MTL and LNL

 drivers/gpu/drm/xe/tests/xe_pci.c      | 35 +++++++++++++++++-----
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 23 +++++++--------
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  4 ++-
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 41 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c            |  2 ++
 drivers/gpu/drm/xe/xe_step.h           |  2 ++
 6 files changed, 85 insertions(+), 22 deletions(-)

-- 
2.40.1

