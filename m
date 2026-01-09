Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A76D26D64
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B810E8E0;
	Fri,  9 Jan 2026 15:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhyL4E3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B98810E012
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767971554; x=1799507554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fBTFi+0E+wdBcon2/3a7ubZBNESXns58b05S37S0KDo=;
 b=PhyL4E3mmApSSY1KwKKKbC/bgsdp7ukJGGKb0eWC+niYHnMZfuHXHXON
 uxWd4OjqCaPjsq7hatBf1XDEfrI8lUnRm6eHhJXA8ql/dhhELTatx+Xzc
 nQNyHpM6kGnpVbw09he6ajk6Y5VvCYXB+KOza8Ry/rocwI/3gjNCDkEf8
 ztnqcEZF8fVroGmu1o4doeNkNcN9IIhpSZish01sfxybr8sNr5hMEqyUd
 zFT5jkJryadFhHIOde+S+s4U8fGFRq66yiYfwhMEXLJ4M92cGREc5dYg6
 593LlIGKNWqd7W4HTjx8KURj5jbSv9t2bgSXin/n0ESxzrjL+v+AgEpW2 Q==;
X-CSE-ConnectionGUID: /o7eyqmlRvCihCqMThCq8A==
X-CSE-MsgGUID: YGsVY3EdSHWhw87J98ap/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79990714"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="79990714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:34 -0800
X-CSE-ConnectionGUID: dYeTNh3fRwulzOb+7zHITA==
X-CSE-MsgGUID: H8b5S0tEQZOOHmPHlSJYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234687598"
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:33 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 0/5] drm/xe/mert: Minor improvements to MERT code
Date: Fri,  9 Jan 2026 16:12:14 +0100
Message-ID: <20260109151219.26206-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Michal Wajdeczko (5):
  drm/xe/mert: Normalize xe_mert.h include guards
  drm/xe/mert: Fix kernel-doc for struct xe_mert
  drm/xe/mert: Always refer to MERT using xe_device
  drm/xe/mert: Use local mert variable to simplify the code
  drm/xe/mert: Move MERT initialization to xe_mert.c

 drivers/gpu/drm/xe/xe_lmtt.c     |  2 +-
 drivers/gpu/drm/xe/xe_mert.c     | 32 +++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_mert.h     | 15 +++++++++------
 drivers/gpu/drm/xe/xe_sriov_pf.c |  4 +---
 4 files changed, 34 insertions(+), 19 deletions(-)

-- 
2.47.1

