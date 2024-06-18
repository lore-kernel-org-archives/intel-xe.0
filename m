Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6D8C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 22:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5F10E7DB;
	Tue, 18 Jun 2024 22:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JI8oWHXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CC710E7DB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718748042; x=1750284042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bImSe1OPaO+cCQ5+JgVLNXg8GkyL1v0MMZQtINS5SU4=;
 b=JI8oWHXOAJNw6yDTpCFjUfMUezT50yXX5qBOwiV1dAO4UlVb/jzXW6Q4
 EMRsafIcP41WjwTpk/aU9KG5OB7VZPhtJlgVejMwT2sWwwBurrD3olEiQ
 GERF8exlkm+eBuIDB756PXhcCFe/4NP42P1/GgU8nmdr9laSl/glkzdv7
 smZL28mi20pEEe605o/rR3tBsH3tPQfZV4SQjBiXrGCqy0RCfb2vh6Wzh
 3FpefisBR9gTx0vb5RnvpkSpUd3PomIbxLt2rmEl6f74bUBlTqTSPnYeF
 JpFDEK4ZC2DtgX9JnniLWGxZ8Sbngks49D0IHvB1l4hNHKImYB18VLAea A==;
X-CSE-ConnectionGUID: jYqhTVlJRTGQOIudbPZMjQ==
X-CSE-MsgGUID: JJMp+/2TR9uBdFx4rdcIjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15801654"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15801654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:00:41 -0700
X-CSE-ConnectionGUID: EjUfz5F8SL+k93qaHibkyQ==
X-CSE-MsgGUID: WT/LKq8pTHCn3ho2Q1Ms8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41794388"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:00:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/2] Prepare RTP for VF actions
Date: Wed, 19 Jun 2024 00:00:24 +0200
Message-Id: <20240618220026.773-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/134918/#rev1
v2: use entry->flags instead of rules (Lucas)

Michal Wajdeczko (2):
  drm/xe/rtp: Prepare RTP for VF actions
  drm/xe/kunit: Update RTP test to check VF flags

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 119 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            |  18 ++++
 drivers/gpu/drm/xe/xe_rtp_types.h      |   2 +
 3 files changed, 139 insertions(+)

-- 
2.43.0

