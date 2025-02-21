Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCB4C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4687710EB25;
	Fri, 21 Feb 2025 18:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baMnB8SF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9153210EB25
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163956; x=1771699956;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=RzjltMmFO43lbM397OPaVU70yx0SS2oByZL/ND5TeD0=;
 b=baMnB8SFuCI5gSz+jIO/PBzjmXmaUnZFo6tzcKxKiyZn1UEfAqq2ATLK
 UGonn4lS/d/pvtbGqA1i9w2fYNF73gvFtB69rjlLw136g7lrY+Dbh/Sdp
 HEvaucScLka6v6PjTyCwy5Co3Y9NrS9KTKz1oNb9FRpFM/mJ329PvrIRo
 lh69jtKw7IY0K3oBdc3y4sZOxmq8E+9oixgB9zBb98qJWSoDbiprtr4C+
 zFKdI6ScrcoN2ZZSxPqjqwQAgxppIuYjyx36e4s7vacJCUcRNxiepq1aR
 ONGxZ5XYQHT40V0SCtcgMzQMnKoC38ck733PSqEzoI/Rss7P/9FfuPzZo Q==;
X-CSE-ConnectionGUID: dM45JRW1QOeu1VR2lu/Yyw==
X-CSE-MsgGUID: LkqoJ43xQkmM5J33BqUYxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403677"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:36 -0800
X-CSE-ConnectionGUID: r6cmoZTeS12svGGQlugdDQ==
X-CSE-MsgGUID: pI3a+R1WSxOOSaHcnvgVfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071311"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:34 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/7] drm/xe: Unify IP descriptors
Date: Fri, 21 Feb 2025 15:51:39 -0300
Message-Id: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADvLuGcC/03MQQ6DIBBA0asY1h0Do9Kkq96j6YLCoJNUMIDGx
 nj3kq66fIv/D5EpMWVxaw6RaOPMMVTgpRF2MmEkYFctUOIgERXsBGtg/wFewFG2iZcSUwbd97Z
 zzniJL1HrJZHn/Xd+PKt9ijOUKZH5/0l1xaHDVmutOlAwrrmYLbY5rtncORR6tzbO4jy/WEzyH
 aoAAAA=
X-Change-ID: 20250221-xe-unify-ip-descriptors-644c3ddaf02b
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

The Xe driver has support, official or not, for both pre-GMDID and
GMDID-based IPs. For each type, we have been using a different approach
for describing instances:

- For pre-GMDID ones, we fully describe the IP via struct
  xe_{graphics,media}_desc.

- For GMDID-based ones, we have IP info separated in different data
  structures: instances of xe_{graphics,media}_desc are used to describe
  IP names and features; while instances of gmdid_map effectively fully
  describe the IPs, by mapping IP versions to descriptors.

In this series I propose that we use a unified approach to describe IPs:

- struct xe_{graphics,media}_desc purpose becomes to only describe
  features of the IP and can be reused across releases if possible (the
  latter is already done with the current approach);

- struct gmdid_map is turned into struct xe_ip, to fully describe an IP;

- the field "name" is moved from xe_{graphics,media}_desc to xe_ip,
  making the former specifically about the features while xe_ip
  incorporates features and release info.

v2:
  - Store pointers to struct xe_ip instead xe_{graphics,media}_desc in
    struct xe_device_desc.
  - Re-use feature descriptors ("drm/xe: Re-use feature descriptors for
    pre-GMDID IPs").
  - Simplify setting name and version ("drm/xe: Simplify setting release
    info in xe->info").

---
Gustavo Sousa (7):
      drm/xe: Set IP names in functions handling IP version
      drm/xe: Disambiguate GMDID-based IP names
      drm/xe: Rename gmdid_map to xe_ip
      drm/xe: Define xe_ip instances before xe_device_desc
      drm/xe: Convert pre-GMDID IPs to struct xe_ip
      drm/xe: Re-use feature descriptors for pre-GMDID IPs
      drm/xe: Simplify setting release info in xe->info

 drivers/gpu/drm/xe/tests/xe_pci.c |  26 ++---
 drivers/gpu/drm/xe/xe_pci.c       | 217 ++++++++++++++++----------------------
 drivers/gpu/drm/xe/xe_pci_types.h |  15 +--
 3 files changed, 105 insertions(+), 153 deletions(-)
---
base-commit: 2c2b141845ce906e187d4aa4fee06bcd9d517415
change-id: 20250221-xe-unify-ip-descriptors-644c3ddaf02b

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

