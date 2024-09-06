Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9B5CE7B02
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 12:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF310EA2E;
	Fri,  6 Sep 2024 12:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAhY8zYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908DA10EA2E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725624407; x=1757160407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Ejo5EQDJMnC3DwpFj7wWl7u2bHGZ5JN9JAHYsB6BY4=;
 b=cAhY8zYFJfbkMkty4Ohl1Vno/yhFYHgPeI8wI8L65DUJZUupujfBg3ZG
 A4gar9Ym3hYZ4omQafpD/pTYPxMSS2f3gTx+t872qbDkx9Hwa4f4lwKP2
 T0XV1B/KHLTP9rVLppT9wOxUTkffnsjbp8wjsjcF/DR/j3TFC0GJ4hAU/
 bvebs2WAeOADbxHwoUS9cATJnV00KaaXJFLhtMS+arJcwaghxJlAPyz8W
 dupe0umRiNehJY/Vr6WpdYyvmC21ir0T3BNMkY4VYBepy4IXnxRqvyj+r
 ghruWQ3hf9zklTyL+kRhEyaPISCr52L2YXc5m86Sy2WeDlKDOvCsGMnEy g==;
X-CSE-ConnectionGUID: vMk9bT1QRcOShTGO0OV9dA==
X-CSE-MsgGUID: 2R6I5XMBTMyVlzOBL2I8GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24329517"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24329517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:15 -0700
X-CSE-ConnectionGUID: uhchSNl1TYawuI0ZtsfipA==
X-CSE-MsgGUID: BR87HDUCTJS/6onoRlcaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="96720594"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 0/3] drm/xe: split PVC PCI ID commit to two
Date: Fri,  6 Sep 2024 15:06:01 +0300
Message-Id: <cover.1725624296.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Split "drm/xe: Add PVC's PCI device IDs" in xe-for-CI into two, first
adding the PCI ID macros in drm-xe-next, and then using those macros in
xe-for-CI. It should be fine to add the PCI ID *macros* upstream, the
same as we're adding a ton of enabling for PVC. It's the identification
of the platform in xe_pci.c that couns, and that's split to xe-for-CI.

BR,
Jani.

Jani Nikula (1):
  [topic/xe-for-CI] Revert "drm/xe: Add PVC's PCI device IDs"

Rodrigo Vivi (2):
  drm/xe/pciids: Add PVC's PCI device ID macros
  drm/xe: Add PVC's PCI device IDs


-- 
2.39.2

