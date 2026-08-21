Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775D4C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C8E10E376;
	Fri, 21 Aug 2026 21:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzAof/Kh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5230E10E376
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787348229; x=1818884229;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=YyyUjdb70/bCEtd3CHmbADKpq/71G0wSEG89SpXcMwg=;
 b=UzAof/Khi3Gx+jnaJX6K3R6kNxKW8OcOzyIeD5L97VHTHAqboxC5IAFR
 H6nwcxcCy/DLdGXQtBzV2OnI5Y4V5olodw9JUTmtPLRFvRXZmA6mW6gba
 dbG0BrOZ/WvaSD1C4WAYRfqLfEFVNvN4VdUMrM18Uzr194R4ctk8fBKfp
 hQNwM1Cv+hONz9gFWM03obfAAZouPN5t41zKY9j1Y6rH2ZGsDAXvuxJQY
 ZDxrBkGaVFpTZRr0l/aeDW9Ebl+rDprEJLljH+QL4wU3xolEof0wi7zzW
 2RUa20NJ1r28BuNp90AjDJjeEbjhERrIA97QiYWGR2srZF6pcH8gMIS2D g==;
X-CSE-ConnectionGUID: Cwtsk5gHTbGlbvPoDhKuWw==
X-CSE-MsgGUID: +UcFXxWRT5yifjgKhbaXCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91776297"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="91776297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:09 -0700
X-CSE-ConnectionGUID: qXADthONSiKou3MXa9eeJg==
X-CSE-MsgGUID: qGGNaGNAT7ixRKROXgcwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266502661"
Received: from arnabgho-mobl.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.173])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:07 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Update Wa_14026539277
Date: Fri, 21 Aug 2026 18:36:46 -0300
Message-Id: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WM0QqCMBRAf0X23OJuU+d66j8i4jqvOSiNTVYh/
 ntTehB8PAfOmVgg7yiwUzYxT9EFN/QJ1CFjtsP+Ttw1iZkEWYIGwd94E3mCQhmpNTeNMkhgsNY
 FS9HLU+s+6/ByTdy5MA7+u/6jWOx/JXerKDhwMC0KkK2CKj+7fqTH0Q5Ptqyi3Ob5Lpcpx0ZXp
 bVljYK2+TzPPzKsePnrAAAA
X-Change-ID: 20260701-wa_14026539277-9d39ae09ab75
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Filip Hazubski <filip.hazubski@intel.com>
X-Mailer: b4 0.15-dev
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

The definition of Wa_14026539277 has been updated in the workaround
database and requires a different implementation.  Let's revert the
existing one and then add the up-to-date implementation.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v3:
- Changed patch "drm/xe: Add up-to-date implementation for
  Wa_14026539277" to handle 2-way-coherent PAT indexes irrespective of
  L3 cache policy.
- Link to v2: https://patch.msgid.link/20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com

Changes in v2:
- Details of the changes are in the patch's changelog.
- Link to v1: https://patch.msgid.link/20260721-wa_14026539277-v1-0-09fa102f3084@intel.com

---
Gustavo Sousa (3):
      drm/xe: Extract override_has_cached_pt()
      Revert "drm/xe/nvlp: Implement Wa_14026539277"
      drm/xe: Add up-to-date implementation for Wa_14026539277

 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 --
 drivers/gpu/drm/xe/xe_pat.h               | 10 +++++
 drivers/gpu/drm/xe/xe_device.c            | 28 ++++++++++----
 drivers/gpu/drm/xe/xe_gt.c                | 39 -------------------
 drivers/gpu/drm/xe/xe_pat.c               | 64 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c                |  5 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c        |  3 ++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 -
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 9 files changed, 97 insertions(+), 58 deletions(-)
---
base-commit: 58d59a40e2a041d3c159fab8bf5d5dc19d28da6c
change-id: 20260701-wa_14026539277-9d39ae09ab75

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

