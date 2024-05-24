Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA51C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 23:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1E510E064;
	Fri, 24 May 2024 23:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfI9WFAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B00A10E064
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 23:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716594165; x=1748130165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jz65n9wLZ1YvlUomBFI/NEPMJ+nBzvl/MoyhRUq/Zyo=;
 b=NfI9WFAGCyNXr2eCc8Eaz2/nv6B5JMK/IgCBA5UNqB7IaPmRbxLMAcmA
 0t5kFAw6zrchgsoU9Hb/UzbKPc51ofFR6GoM+QCavvYqklXqU8k3Fr8Tq
 QtuEx88V3raK0mOXiKfOsbVm7fvz/YIM7YWLYmLaoSkb5g0dUL1u7Ld/h
 rKx87HH8v8gRJzAtE6gh8LIbPqTNn9ZEy4Ov0GkQM7R7ghfBASpuznRBy
 j9gHQ0S7YsUQ4tz1DTDRC3OzUAG/FeL7qULDksujsdZuH+2ZGdM0XQgQs
 rrBO8KzB2gO/FE8KBK5EqDSqvHFt8UG0hNc6OJzH0R8VW1lt5WixSUcQU w==;
X-CSE-ConnectionGUID: t+IkJJexQ/uwlzXbyGOzEg==
X-CSE-MsgGUID: jvo+xzj/SdCm42+AwQQIqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12860210"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12860210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:42:45 -0700
X-CSE-ConnectionGUID: QmGUwEtnRBmdGsm3/1TJxQ==
X-CSE-MsgGUID: lJOoZqSfT5uMasPitBIe0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34267759"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa009.fm.intel.com with ESMTP; 24 May 2024 16:42:45 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 0/2] drm/xe: Apply Wa_22019338487
Date: Fri, 24 May 2024 16:41:07 -0700
Message-Id: <20240524234109.1731675-1-vinay.belgaumkar@intel.com>
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


Add a workaround for LNL. Extend it to BMG as well.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

  drm/xe/lnl: Apply Wa_22019338487
  drm/xe/bmg: Apply Wa_22019338487

 drivers/gpu/drm/xe/Makefile        |  2 ++
 drivers/gpu/drm/xe/xe_device.c     |  8 +++++++
 drivers/gpu/drm/xe/xe_gsc.c        |  8 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c     | 34 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 6 files changed, 54 insertions(+), 2 deletions(-)

-- 
2.38.1

