Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F949C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 17:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4393410E945;
	Wed, 12 Feb 2025 17:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIavPfzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E405E10E93E;
 Wed, 12 Feb 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739382226; x=1770918226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4lvCK3oVuO6UA5LnxKkNpiR4PHC4if9ntjBQdJ+0bBg=;
 b=GIavPfzDWikFzrjiXbcr7u65F7mApDRGpOef7kgidbeK2PJjUtumzZYo
 bwUnPwlIteJZ/f58im2XUag7v2bT6R4L0zaipeJaVMBkd3WweScutWve7
 i49tTcme9wKuqTJhdk1Jj+mA1rGtMSg1cPRLZMl3/8mtKVhPXaA0Crl3Z
 5AQqvoE02moRkLgSE4Ar+joWi/cwYf9gs1oqONDa76g9WruotZvjdrysC
 Uyi1e8UoIdHsOkkDnliGV3tcfwIsfyHJ96b036A7Vmjee+Cz4Py8USmoa
 jjNWTh8ZFvoRki2u9KbeDa1mn+8i7jG4WyFCZHKFWRWWRGC8pPAOwkwwF A==;
X-CSE-ConnectionGUID: UxtlApknT3+h+cTxO9qQ9g==
X-CSE-MsgGUID: +ymeiprkT2WVqjgmQ+h7Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40180084"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40180084"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:43:45 -0800
X-CSE-ConnectionGUID: UNKhA5VATdqNMfnezyKS0Q==
X-CSE-MsgGUID: AdTsOKfSTnqQ7qwqFUChnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150069135"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.108.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:43:45 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 0/2] Improve type-safety on POWER_DOMAIN_*() macros
Date: Wed, 12 Feb 2025 14:43:15 -0300
Message-ID: <20250212174333.371681-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
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

Fix one issue[1] reported by the kernel test robot and also take this
opportunity to improve POWER_DOMAIN_*() macros by making them explicitly
return the expected enum type.

[1] https://lore.kernel.org/oe-kbuild-all/202502120809.XfmcqkBD-lkp@intel.com/

Gustavo Sousa (2):
  drm/i915/display: Use explicit cast in POWER_DOMAIN_*() macros
  drm/i915/display: Make POWER_DOMAIN_*() always result in enum
    intel_display_power_domain

 drivers/gpu/drm/i915/display/intel_display_power.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.48.1

