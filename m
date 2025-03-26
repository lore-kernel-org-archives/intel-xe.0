Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872EBC3600E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 19:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5E10E08D;
	Wed, 26 Mar 2025 19:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSt+oaGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED8E10E08D
 for <Intel-Xe@lists.freedesktop.org>; Wed, 26 Mar 2025 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743017564; x=1774553564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2S4IJ0aAd3Wapy77NiBgg9SUm8+ZSXsEqJRTBNLSoLY=;
 b=mSt+oaGATWdG8UsjK6K75p0XI+A89y2HAchqE3c2mS2CAHtJcFohIm+8
 BKNAJifLOdfxuP5QZpJdfsnbesGKVg78pVONVeolGg/4QRmnsgJSiyF4a
 +4IokYXo+yQCSYP7J5WgHJghvbyS0uZU6Lm6kNQFINVxyy8EQ287dB1SL
 mZwOj1MtUL4oER7k21z5RJKAboy2lLd9DkFoj8qiEO0O5s/8JF4VR2jfx
 bOMQK8dxvPhYmArzZs4g2sjqmsaqTcTMxyxfPI8dU4hCjAK1uBpD5UoP6
 FxX/grEWYQIAqrz/zXwa7yIyhxgDEyIj/+LFIgY+2E3qVFN1ky9IJFQTH w==;
X-CSE-ConnectionGUID: LGk6hOe1S7mvz3XQ+yI5Vg==
X-CSE-MsgGUID: SIpXgK7vRNKHfStADAFyeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44448449"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44448449"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 12:32:40 -0700
X-CSE-ConnectionGUID: lIfsh8NtThiYaZCBQ9VwpQ==
X-CSE-MsgGUID: nqP9GN3YQiK4AAznQocUVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="129939404"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 26 Mar 2025 12:32:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] Track FAST_REQ H2Gs to report where errors came from
Date: Wed, 26 Mar 2025 12:32:37 -0700
Message-ID: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Most H2G messages are FAST_REQ which means no synchronous response is
expected. However, errors can still be returned. Add support for
tracking the FAST_REQ H2Gs and matching up an error response to its
originator.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Add a missing H2G error code definition
  drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from

 drivers/gpu/drm/xe/Kconfig.debug        |  10 ++-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c          | 109 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 ++++
 drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
 5 files changed, 114 insertions(+), 23 deletions(-)

-- 
2.49.0

