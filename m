Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA56E7AD57
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB1910E191;
	Tue,  3 Oct 2023 14:35:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A0F10E191
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343707; x=1727879707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CiganO5ZjXTGS+33fACPrawcdy6yDGNhw9rhJJiAjMA=;
 b=bhcJKKSzVX+gT66GO2R9tZDeI16RMpsj1zRSZNMsZ4nYB+dSvEQ5oPe5
 FUfcDoXZhuv2ahde/9F7jIliPvnv5SvxaXA2OUVT3lI4E4C4r5X4NB5oH
 MaMJ7c9muj9EQ0Upqo/NnuVKLBgQZZyuyRp0nVUKkYYI9wlUtqsmkGekG
 9qbXdtWTmy4J9nOmoLOZ8Mtpkimd0X13MWv6TR+bpwyxYDVErY+KVWHdK
 6LffQ7vdetN1x3tfXZ9HUR4IY4/+WSXMJwah93N8n7Vm50GLmOAQ9Hv2h
 Yvfx31XS9ePFjTa3JwPBj12yfDyt2dyp3qgP2UJfvCQadjCvUrjdxKAtB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413799326"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="413799326"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082041363"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="1082041363"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:47 +0300
Message-Id: <cover.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/10] xe/display: clarify display configuration
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This superseeds https://patchwork.freedesktop.org/series/124553/

Clean up and clarify display configuration.

BR,
Jani.


Jani Nikula (10):
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe: Introduce Xe assert macros
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 .../gpu/drm/xe/compat-i915-headers/i915_drv.h | 16 ++--
 drivers/gpu/drm/xe/xe_assert.h                |  3 -
 drivers/gpu/drm/xe/xe_device_types.h          |  4 -
 drivers/gpu/drm/xe/xe_display.c               | 88 ++++++++-----------
 drivers/gpu/drm/xe/xe_module.c                |  4 -
 drivers/gpu/drm/xe/xe_module.h                |  1 -
 drivers/gpu/drm/xe/xe_pci.c                   | 17 +---
 7 files changed, 48 insertions(+), 85 deletions(-)

-- 
2.39.2

