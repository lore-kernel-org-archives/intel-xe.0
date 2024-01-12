Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70917C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 09:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA4B10E080;
	Fri, 12 Jan 2024 09:28:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4335610E080
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705051719; x=1736587719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3kpP8mkkw5ORjh/xY566kdJS/wdXwXUgu/o/9/OkmlA=;
 b=dZqiRe1FOkCdPEEIwRE6jdd8qKwxxyp03O4yWkGisj4w3MkYv7QRyw5T
 4MFcbXE+ziZxOCqbdlxaUmPOJkKpD9vFV+1X9FC3oKTaChNFh6Kt6E+J1
 eplzE0x45QPrMuuxM928S7wBAJpZlrELAxvEJrx7ss41At0vt6gJk1pRP
 flLnmE+0QT+xy/7feig6QUgzmsjCcL4yTgHi+F5mlNRRfo/2dTLGxOSdI
 j89zKRvaf8FnQrq4whfrw4Znwp1CFyeeEdboxr5Hy/0wp6W5jXyAlpKOP
 yzDIqHEpot0oz5qh6eWIt1NnqTH+Y9oT5f29XV2qLXSwWG94Ou3aVtkEn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12611693"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="12611693"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="782972290"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="782972290"
Received: from unknown (HELO vgovind2-mobl3.tm.intel.com) ([10.237.50.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:28:36 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 0/1] drm/xe: ensure fbc cfb size to be page size aligned
Date: Fri, 12 Jan 2024 11:28:02 +0200
Message-Id: <20240112092803.61664-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: jouni.hogander@intel.com, ville.syrjala@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DRM gem object handling expect the object size to be page size
aligned. Neither the driver or xe stolen memory handlers do that
causing BUG_ON being triggered in some cases.

Vinod Govindapillai (1):
  drm/xe: Modify the cfb size to be page size aligned for FBC

 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.34.1

