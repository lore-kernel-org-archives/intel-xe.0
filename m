Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B3C25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D95F10F18A;
	Thu, 23 May 2024 17:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UICzv00q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92B410F18A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 17:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485760; x=1748021760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZEkYU7Ja3eNJgba64/yAat2iBwc0UbEPhCGcHgDN5Zw=;
 b=UICzv00qwta9qzosbibwjdnAHidlH9fWDc+3tkQd28JzZNs9ZVg+5CZi
 16PnsRYkq8OUOorviih4roCkP9jsNmEEidCUimZROj4CxJT3BUUu4yN8/
 l2/ptkumvzb7ALlZByxqKGOz7uDSSN95lvxK//I1W20epy8qgceB07zNQ
 ZHZWY1leMJkFUlSRM0sfCAKmhS/8i8aQ0XDx46uQZbOint4YUPBDi7M2W
 w0fymUWOTyTffbA5T+Qswbt+e+9eMsoAucgz/wg/p9tsPr28fioYmIctW
 bkHoBHkMsSWR+aC4PY+Q+uQTFOXpiOLOAqnbwO7sQ6SD1IuZj/U9DL3uE Q==;
X-CSE-ConnectionGUID: wqJHL6jVTkCX8aP9HE12Ow==
X-CSE-MsgGUID: dD8aZWu4SzKPRfkprmo4Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12602690"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12602690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:35:59 -0700
X-CSE-ConnectionGUID: nSs476+cSPyzigmZ2/Ho9w==
X-CSE-MsgGUID: 9ZgN/iQFQ4iwbQt/6DDCLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34301100"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:35:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 lucas.demarchi@intel.com, ashutosh.dixit@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 0/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Date: Thu, 23 May 2024 23:17:19 +0530
Message-Id: <20240523174720.2759358-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Removing xe_hwmon_process_reg as per review comments from Lucas in
https://patchwork.freedesktop.org/patch/587830/?series=131765&rev=7.

It was reviewed an unnecessary umbrella function which can be removed.

Karthik Poosa (1):
  drm/xe/hwmon: Remove xe_hwmon_process_reg

 drivers/gpu/drm/xe/xe_hwmon.c | 80 ++++++++++++++---------------------
 1 file changed, 31 insertions(+), 49 deletions(-)

-- 
2.25.1

