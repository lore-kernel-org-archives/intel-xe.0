Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D3EC7EE39
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 18:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691010E7BA;
	Wed, 25 Jun 2025 18:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPLgCxez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5710E236
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750874898; x=1782410898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bEfFrK6Dc5QFNNeFbUhl/Y81879OXdd+wHDx2/cj2M=;
 b=DPLgCxezOJBRQlqDpcosWsdQNbUhcdD0y5bt/UEiGcMaIYhsOizk3Ge/
 y2C7clWdku6RKk90a79ax3UFI1/VoFDiAZmjmpwNT6M3bY1CsUDiKsYW0
 I3l5nhsApD4pT2ja/Cu63SBNoAS+m56BJK6CqyIo6BOShElmFou+/Qd/f
 /Wq7p/t5AuctjW2T5swPX2qCKthY8dOJ6ewvYR4cm3sOC8DykQ2We9MzH
 tQVPmw/TD21dduDKXYhyxKFJGs4iCgLhYpEmWpv0UdC/Q5aD2n/8ibgQ+
 nYONnP0j39IbfW7Oc/rBG+ewd9zAF0oyi4D4tqr8MwVR222oDMKiP3l13 Q==;
X-CSE-ConnectionGUID: tMCxEPTjQ9GaF1Rzi7i1Dw==
X-CSE-MsgGUID: s4u8gR0CRBaIUOEn4CNTvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53293588"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53293588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:17 -0700
X-CSE-ConnectionGUID: 6hjy3pKlRWWsV2ZdeuoPrA==
X-CSE-MsgGUID: 5hWVoWDmTBGq7OLJfFxf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="175941845"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:17 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 4/5] drm/xe: extend Wa_15015404425 to apply to PTL
Date: Wed, 25 Jun 2025 11:08:10 -0700
Message-ID: <20250625180811.17112-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625180811.17112-1-matthew.s.atwood@intel.com>
References: <20250625180811.17112-1-matthew.s.atwood@intel.com>
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

Wa_15015404425 needs to be applied to PTL A0 to B0, a subsequent patch
will address the complexity required to do this. For now apply to PTL as
a whole.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index b7d12ea4d65c..3a0c4ccc4224 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1 +1,2 @@
 15015404425     PLATFORM(LUNARLAKE)
+		PLATFORM(PANTHERLAKE)
-- 
2.49.0

