Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF94C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 18:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625B810E159;
	Tue, 11 Jun 2024 18:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOjNsOju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0265B10E159
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718129268; x=1749665268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MyLVte+/EaGuOoOdHV8rJbFWRBUzMv6EoEcRKhhBbRo=;
 b=UOjNsOjuwuJ73vhL55AAtIQxt68qr4+AXJ66CeQ6AWOydBcJMtB+gAxL
 YWmhK3R4xcm/wKvEEKvfDeai4aA1W5cbBKiF9KnOMJFsyn9sVZUrlX2h6
 7yt/Q8vvSWc9pky/z/hVuAfmWBlenunfP/FbPOZtFQ3M7vvaxyzwbViat
 mwis1vnrlasEYkNq8j1uTV85Uga/B8pJaHcnoWtgZ3Cp/gvm+r4RO1/OA
 b5mL+jmEDovvbBHFlxu9mqTiptgCApXudMDsREbd4SCD73cHnNtNajjiC
 ioyayTcQsI4DTbm3iiIAz9wwDN6usuUjcsOfJoFaXwx29MquAem148bzH g==;
X-CSE-ConnectionGUID: AmQxSn8sTOKEbGPWf8RIGg==
X-CSE-MsgGUID: k9AF29aYQYS3koNlxEo9og==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32398373"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32398373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:46 -0700
X-CSE-ConnectionGUID: NrB11CJwTMaarNHW4RrbhA==
X-CSE-MsgGUID: k0HZu2zrTEWNj/RVKDnKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39620399"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] More GuC ABI fixes
Date: Tue, 11 Jun 2024 20:07:31 +0200
Message-Id: <20240611180735.1988-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (4):
  drm/xe/guc: Fixup GuC KLV ABI kernel-doc annotations
  drm/xe/guc: Update GuC CTB Descriptor ABI
  drm/xe/guc: Fixup HXG Fast Request description
  drm/xe/guc: Avoid named enum types in GuC KLV ABI

 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |  2 ++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              | 14 +++++++-------
 drivers/gpu/drm/xe/abi/guc_messages_abi.h          |  4 ++--
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  4 ++--
 4 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.43.0

