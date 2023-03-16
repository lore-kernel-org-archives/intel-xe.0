Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55FEC76195
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 21:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD7D10E388;
	Thu, 16 Mar 2023 21:03:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F14910E31F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679000633; x=1710536633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zXXoQ1mlyEOIaykh3hDmsa3YIYMsDCEUotSf8mfnYU=;
 b=maE7zfUf+jKgU0rQoeOmta/7R3j0jKeGpAqXRDXbz+jGHbJj6zxOBv7F
 OFatXi5TeRV2sJ6yO8P50IZ+HNzAfweM1hc7+qNcA+KdO73z7198ffd4z
 57OfhYvGRLBc3ZSi6FsSI92aazxD2dv8raAI+di3JjToY1aYrCPMX22qO
 xDuqiwml+HubB08BQfNSELUfC0tZwOJfYXyrZ7uZbXuDJtM8KVepYt8Zu
 Zn3p+i1H/jhlRs6N4198Y9GJA6akEH9JrKaeXn8xSHugE4c7wKPtcNRYe
 Ds0Ren78NWpLTIFlFSbTdjVQM2KZWpQnEc14excHNTz3b+Q/2wVYJWiqS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338127576"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="338127576"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657320509"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="657320509"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 14:03:38 -0700
Message-Id: <20230316210341.3547058-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Add rtp unit tests + arch=UM build fix
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
Cc: mauro.chehab@intel.com, thomas.hellstrom@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

First two commits are fixups needed after the rebase on 6.2.
I didn't need the one for UML, but I'm guessing this is why CI is
failing since it depends on the linker version.

Third patch is the important one, adding unit tests for the rtp
infrastructure.  Previous tentative version had a hack that is not
needed anymore: the issue was passing the sr from the stack of the test
cases and then trying to make them drm-managed.  In this versions the
tests also cover more ground, checking for incompatible register type
entries: this was the reason that led to the wrong fix in
commit 3b9b18b4aee5 ("drm/xe: Fix duplicated setting for register 0x6604")

Lucas De Marchi (2):
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  drm/xe: Add basic unit tests for rtp

Masahiro Yamada (1):
  UML: define RUNTIME_DISCARD_EXIT

 arch/um/kernel/vmlinux.lds.S           |   2 +-
 drivers/gpu/drm/xe/Kconfig             |   2 +
 drivers/gpu/drm/xe/Kconfig.debug       |   1 +
 drivers/gpu/drm/xe/tests/Makefile      |   7 +-
 drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  71 +++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
 drivers/gpu/drm/xe/xe_rtp.c            |   4 +
 8 files changed, 300 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h

-- 
2.39.0

