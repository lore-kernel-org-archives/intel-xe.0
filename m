Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6665BC77B6C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73210ECD2;
	Thu,  6 Apr 2023 20:18:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F6610ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680812332; x=1712348332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E1cfi7qQXCuN92IG5y1Mm+8RJZ7LFRx7d3ytALSlLfc=;
 b=Xj/GzI2yWo03XAyo05WAPv/6cNtEkBiMwcdE48lWOErJNQ6X0dXWkhnt
 Mrgb845si7dVDVGM8NsYPXLQb+0XSUmnDwKsZmzQASN84u2tYuPW5KCPx
 zb3ZYmJEt4Zzu1bVf7vmmzqRCvL/558K9J+CGmK9eJOwb661H5NUTvQAV
 oDnw758DnJeNMZXKr+mvZ1xK2sWqY4G/pCsB0XmZCoPb8AiS9B6H1Be5K
 7UOqUJaFfQmpyQPdXrMA7a3Hwi25bwVn7UaL31fe+ctQjEJQGqNrEnoqA
 I+wKKtWSs26bGec56XFVXacZ4Kn2hTsJBHuGW135zprickyySD1SgLSjj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322482247"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322482247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751775460"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="751775460"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:18:36 -0700
Message-Id: <20230406201845.1797532-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/9] Begin adding GMD_ID support for Xe
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As Intel GPUs move toward chiplet-based designs with disaggregated IP
blocks, it's no longer considered correct to determine platform IP
versions and most of the behavior/capabilities based on a simple PCI
devid/revid lookup.  From Meteor Lake onward, the driver is instead
expected to identify the specific IP blocks present on the platform by
reading GMD_ID registers that provide the version/stepping of each unit.
PCI IDs should only be used in the rare cases where the driver needs to
identify the SoC and its characteristics.  Going forward, we could
theoretically see products mixing and matching chiplets in ways that
cross the traditional platform boundaries (e.g., it would be possible
for a "MTL" to show up with a future graphics and/or media IP chiplet,
or it would be possible for some future platform to directly reuse a
graphics and/or media chiplet from MTL).  In the long term we can no
longer rely on PCI IDs to properly reflect these types of cases.

This series provides the initial framework for GMD_ID matching.  The
xe_device_desc structures used to describe platforms are broken up so
that most of the important characteristics now reside in separate
xe_graphics_desc and xe_media_desc structures for each IP rather than in
the platform-level structure.  PCI devid matching will still happen at
probe and will operate mostly unchanged on pre-MTL platforms where the
xe_device_desc will point directly at the appropriate xe_graphics_desc
and xe_media_desc descriptors.  However on MTL and beyond, the
xe_device_desc structure associated with a PCI ID will initially just
point at generic pair of descriptors with no real feature flags set,
indicating that true matching needs to happen based on GMD_ID readout.
The driver will then read the appropriate GMD_ID registers and select
the corresponding set of feature flags to use, independently of the base
platform.

MTL still isn't loading and running properly on the Xe driver, so this
is only lightly tested; with these patches the driver seems to identify
the IP versions correctly (already more correctly than the old
PCI-matching code did) and pick the correct set of feature flags before
the load fails for other pre-existing reasons.

Note that there's still more work to be done in this area after this
series:
 - Most subplatform matching (e.g., MTL-M vs MTL-P) should also be tied
   to GMD_ID rather than PCI ID.
 - Graphics/Media stepping information also comes from GMD_ID; PCI revid
   should only be used to identify the SoC stepping (which is seldom
   used by the driver).
 - Various places in the driver that match a platform directly will need
   to be updated to match on the IP version instead.  Some examples
   would be places like GuC firmware loading or workaround definition,
   where we only care about the graphics chiplet, not the base platform
   it happens to be plugged into.
 - i915 has basic GMD_ID support for version identification, but needs
   similar reworks to select feature flags based on the GMD_ID.  Since
   Xe recycles i915's display code, these i915 updates will be needed to
   fully handle display IP matching properly.

v2:
 - Drop dummy dummy structures for GMD_ID graphics/media; leaving these
   set to NULL should work both for GMD_ID platforms and for pre-GMD_ID
   platforms that lack media IP (e.g., PVC).
 - Add KUnit test to ensure the hardware engine lists are sane in the
   GMD_ID-based IP descriptors.
 - Associate a printable name with the various IPs and include it in the
   initial drm_dbg() print.
 - General cleanup/packing for the xe_device_desc structure.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Matt Roper (9):
  drm/xe: Start splitting xe_device_desc into graphics/media structures
  drm/xe: Set require_force_probe in each platform's description
  drm/xe: Move most platform traits to graphics IP
  drm/xe: Move engine masks into IP descriptor structures
  drm/xe: Clarify GT counting logic
  drm/xe: Add printable name to IP descriptors
  drm/xe: Select graphics/media descriptors from GMD_ID
  drm/xe: Add KUnit test for xe_pci.c IP engine lists
  drm/xe: Clean up xe_device_desc

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   6 +
 drivers/gpu/drm/xe/tests/Makefile      |   1 +
 drivers/gpu/drm/xe/tests/xe_pci.c      |  42 +++
 drivers/gpu/drm/xe/tests/xe_pci_test.c |  74 ++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |   6 +
 drivers/gpu/drm/xe/xe_device_types.h   |   4 +
 drivers/gpu/drm/xe/xe_pci.c            | 463 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pci.h            |   5 +
 drivers/gpu/drm/xe/xe_pci_types.h      |  39 +++
 9 files changed, 484 insertions(+), 156 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_types.h

-- 
2.39.2

