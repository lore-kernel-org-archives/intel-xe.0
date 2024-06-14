Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E846C2BB85
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BC610EE72;
	Fri, 14 Jun 2024 21:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AatsAdKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F1610E2C4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401726; x=1749937726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YrZ9vnOI4rY/HoEVn/HLYI7x/AE3Y/g0xXNXlewfo2Q=;
 b=AatsAdKQMfM2wF2CbD/CiWWkaOpQs0kqb+WJ+lAfccTwpHytBu8HkZZW
 jnpr/RGsRhChMa6MGPEW4oASme8gR0pCraja+3AaPcrgiqG73+kmI62KK
 MxkA0cqZD7O+JdY6e0jm1IruDuNcxGyk+pH2zlwXJEYzQvDVN7ug85xQP
 nDx4Zor+MFy7sGViBmPMDdGwsC07XCl1KuGjQc17jetvSKs55GA77Ox9a
 uZZRAedt7rbqUz5yT54yh7E5mmk7ZhzOeGhxqoMN3guGSVkQ3c81Bg4uB
 mvM5zjNjjpQDS6TMhOk0THred9MFBdsjK0cRe/jgGvwEMwh7xVKKx02q/ Q==;
X-CSE-ConnectionGUID: X7BxoBDTRlKMa9dO8fe5YA==
X-CSE-MsgGUID: Zjss7urMSuWXMoccA+Ub7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26728561"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="26728561"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:48:43 -0700
X-CSE-ConnectionGUID: tPcd5lZzSOixS1ewQSVYHg==
X-CSE-MsgGUID: f3mDo+QwRZiPeo3Q+7k7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40579331"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:48:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Prepare RTP for VF rules
Date: Fri, 14 Jun 2024 23:48:19 +0200
Message-Id: <20240614214821.2252-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/rtp: Prepare RTP for VF rules
  drm/xe/kunit: Update RTP test to check VF rules

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 118 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.c            |  13 ++-
 drivers/gpu/drm/xe/xe_rtp.h            |  16 ++++
 drivers/gpu/drm/xe/xe_rtp_types.h      |   2 +
 4 files changed, 147 insertions(+), 2 deletions(-)

-- 
2.43.0

