Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84361E9A02C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 00:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F275C10E0A9;
	Thu, 19 Feb 2026 00:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBq7RIu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EC410E0A9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 00:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771460800; x=1802996800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wV3Nh+itOr1HHbnO0rwGW772eXmIm3Rzad8VWTImc9Y=;
 b=lBq7RIu6Smg+3+S/0QCS7ua+7rK+VGMtgJi6wz/Cw+Zl2U2U+QpxOQrg
 lfsr+d6fAv1kUinJGUqk3mEiWB26PSHmHhdEbYRttBDLoA1WIabU00SPp
 1ghlqyF5F3Zu7p2SB8NuJ4EcBYwTtwuX15g8b7fEiT420n9+i8uTO8a0I
 QIjad8suzcRHbwdOEsBLB33fcUHhFukXM0HAhSH3qvrb0MWCc0ZNW0tZq
 8rgINPpN8azJg6RBlprbooQmfTmEglMbcr8cbZvZZN8neEUfNMQhIJ/Lv
 17GFRmJlLwEyzKUMHriEPlNtFcyIYt94a1Q5ddRO1222+v/NsU6/AYKrp A==;
X-CSE-ConnectionGUID: uRrTOMBdQhqLE1X9loZIeg==
X-CSE-MsgGUID: BagZVvWPRCiPaBC5XUsNuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72449402"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72449402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:39 -0800
X-CSE-ConnectionGUID: ZXpR1GcmREqwFCSc8I/0wQ==
X-CSE-MsgGUID: lzMu6xQhRp+Oe229YmlHow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218499613"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:40 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 0/3] drm/xe: PXP fixes
Date: Wed, 18 Feb 2026 16:26:28 -0800
Message-ID: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
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

The first 2 patches are minor fixes for issues in the PXP error
handling paths that I spotted when writing the last patch. I am
not aware of them ever actually being hit in the wild.

The last patch mitigates an issue with GSC FW that is currently being
debugged on the FW side. Given that we don't force FW updates, the
mitigation will also help on systems still running the current GSC
image after the fixed one is released.

Daniele Ceraolo Spurio (3):
  drm/xe/pxp: Clean up termination status on failure
  drm/xe/pxp: Remove incorrect handling of impossible state during
    suspend
  drm/xe/pxp: Do a PXP termination before suspend entry

 drivers/gpu/drm/xe/xe_pm.c  |  4 +-
 drivers/gpu/drm/xe/xe_pxp.c | 91 ++++++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_pxp.h |  2 +-
 3 files changed, 57 insertions(+), 40 deletions(-)

-- 
2.43.0

