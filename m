Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E7FC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 14:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E28A10E23F;
	Thu,  3 Apr 2025 14:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuhqN5tm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E658410EA26
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743690408; x=1775226408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EpdZZEN3/hyGZXbBaDMKsSUtipNw7k9QbYrYwO6vjCQ=;
 b=nuhqN5tmTFh/nUDvGObq+6h2fgyddJ1b8LDF+ZjFF4lCjbi6fTZlVRFe
 2lI/S65XQfv+N30JE5r7tlgyDfVASj+LNxEp5twpjN62LWLwwm5VTaX0e
 XPmEKShYhMNxxmL+fpx6+AeTwbDdsIoJA2ijueVK2n32S7+tT4c4+cY3r
 dJD3cOwTZ1Yp6BSMC5xLsPQgcubzeHZ0iGNBY9Zywlt5SNMM7IboqxbBc
 AnroWW5wg40xyZlCrj0kxwZOeZ0eQhc9hGVmvYWQSsLmSWne/0zqBGj49
 x1XHatAGnRQSURlYXXGQmns4mTTg8/Xf6a8drMo+yVjmWRpzVAMwNpOeO w==;
X-CSE-ConnectionGUID: qQqT1XvcSHWUT5J+Kk5t0g==
X-CSE-MsgGUID: vi+6zHtSSHeVmV3EGMQgSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45116891"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45116891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:46 -0700
X-CSE-ConnectionGUID: n8fe2gJLRwqwmj+PSbfjtw==
X-CSE-MsgGUID: tfg72PxDQCyMaW7zUQDFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164260903"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.114.177])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/3] VF: debugfs fixes
Date: Thu,  3 Apr 2025 16:26:32 +0200
Message-Id: <20250403142635.1821-1-michal.wajdeczko@intel.com>
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

Some debugfs files exposed under gt0/ or uc/ are not working properly
on VF drivers, so stop showing them if not applicable.

There will be still some bad register accesses done by guc_info, but
this will be fixed by other pending patch [1]

[1] https://patchwork.freedesktop.org/patch/640267/?series=145667&rev=1

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

v1: https://patchwork.freedesktop.org/series/146561/#rev1
v2: document guc_debugfs_show helper (Lucas)
    clarify no changes in file structure (Lucas)
    avoid "privileged" word, make it clear it's about VF/PF (Lucas)
    add hint for developers where to add new files (Lucas)

Michal Wajdeczko (3):
  drm/xe/guc: Refactor GuC debugfs initialization
  drm/xe/guc: Don't expose GuC privileged debugfs files if VF
  drm/xe/vf: Don't expose privileged GT debugfs files if VF

 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  30 ++++--
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 148 ++++++++++++++++------------
 2 files changed, 105 insertions(+), 73 deletions(-)

-- 
2.47.1

