Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE2FC44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 18:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6324510E0D7;
	Tue, 14 Jul 2026 18:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMvJq/xq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F6110E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784053754; x=1815589754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3LtAuWMIU1wO6eW7c4PkR6ZdxrghPi4LMQMPTqyC09M=;
 b=ZMvJq/xqwA5gqRhqI9EnJ8dpjCWjXXVFENJ1baHVVZdI3KlC25vAW7mj
 UiyaVQa9HYu/c891+VsOzYAkVj1vz2Qv8IzdEh3qoXCAldfnMpEGWrpax
 QSFnnlBZnmDoMD3r/RCM8OL0Z7VbhhCqiYimiqiBVUnp9C6X2tvDDSZLs
 2HlKowAlOS6+/XUJ+2ol/8ROpLYfpGbspyGxkCMYFSW0uoHKC+E6zAnp9
 J91YucDziiT3RP+DsNZPMurjmYJv/jKDACCJLonFRzSFcOV/AdcOP9pzt
 DeKVmOvCP0s8q/69ypUw3P6T6RO6UsWj0CGl0OFzc6zmoIJsHcB7Ff34t w==;
X-CSE-ConnectionGUID: L2a41ToLSUG04hpt9DjARw==
X-CSE-MsgGUID: Z4GOL7ggRLWTzxKaPQaR2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84880805"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84880805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:13 -0700
X-CSE-ConnectionGUID: MwmgvdlPTdG3uKGrzP7m3Q==
X-CSE-MsgGUID: 8jMe6gJ/TI+6QlJNUmehIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260838219"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:13 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 0/5] drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
Date: Tue, 14 Jul 2026 11:28:38 -0700
Message-ID: <20260714182904.620871-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Recommend newer GuC firmware for BMG, LNL, PTL. UAPI version: 1.34.0

Platforms PVC, CRI, NVL-P are not merged to upstream at present.
The GuC definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.

- Patches 1-2 revert patches from *-for-ci topic branches.
- Patch 3 updates recommended guc version. Intended to merge into
  drm-xe/drm-xe-next.
- Patches 4+ re-apply reverted patches.

v3: NVL-S fw_defs now upstream instead of in topic branch.


Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

John INTEL (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

Julia INTEL (3):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0

