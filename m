Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB55EC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 22:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410B910E28C;
	Thu, 20 Jun 2024 22:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlErk2hB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0973A10E28C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718923838; x=1750459838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DLLdgdkNT1FFRvKMZpIRuVWwkReMU4uc1ZAvDZ/0scU=;
 b=JlErk2hB+ypz4H3v9Eaduzk/A5joIhDN8jqrA981lsghF8FBTiNgMxql
 dBblu83RUsYKqaU9gtaNR1FaTdCddgNp9R/oYoEvwePyAD2u+ECStBUgR
 RCa6pFBeKs1tGHfHf5RJa9xvEX0UwXIW+SKOmeEblYCVeGlXAaYmnTBYz
 xOJ51B3f38OoxO9EKJC6BV5IE2wcaC6+Hl+TpWeSW8taV6Oh6RWQDqfNm
 eiOyWYV/899uKvfj6IjHJ12P1DPmHcN0GNKpdqUZNYgfAuQhfGDEtf7/L
 D1vsWf/z27M6ANp0QqkOFRaEhE++DWk58rrALoqZpfzAtqa5aH/WgfRvy Q==;
X-CSE-ConnectionGUID: V+KZ9kgZQsCjf8xMkQV7lw==
X-CSE-MsgGUID: 4ZPL0g4GRC6ynhNYWoeQPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33480728"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="33480728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 15:50:37 -0700
X-CSE-ConnectionGUID: J6m3n7/FREqB8HqS94ChzA==
X-CSE-MsgGUID: Y4sHtn0qThiRTZdXsfFO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="43074589"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 15:50:37 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 0/2] Apply Wa_22019338487
Date: Thu, 20 Jun 2024 15:49:26 -0700
Message-Id: <20240620224928.3986377-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Apply WA for LNL and also ensure frequency request is raised in the
resume path as well. The WA applies to the resume path too.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe/lnl: Apply Wa_22019338487
  drm/xe/guc: Request max GT freq during resume

 drivers/gpu/drm/xe/Makefile            |  3 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  4 +-
 drivers/gpu/drm/xe/xe_device.c         |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c           | 42 +++++++++++--
 drivers/gpu/drm/xe/xe_ggtt.h           |  1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     | 12 ++--
 drivers/gpu/drm/xe/xe_gsc.c            |  5 ++
 drivers/gpu/drm/xe/xe_gt.c             | 24 ++++++++
 drivers/gpu/drm/xe/xe_gt.h             |  1 +
 drivers/gpu/drm/xe/xe_guc.c            |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c         | 84 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h         |  2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h   |  4 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
 14 files changed, 175 insertions(+), 15 deletions(-)

-- 
2.38.1

