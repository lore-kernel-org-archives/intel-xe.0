Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E5C47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9744C10E1B6;
	Thu, 18 Jan 2024 22:18:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1210E1B6
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705616311; x=1737152311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9LpIehz15e12QWZg+lwZoBLcA76LLVIfv4ES/pUl7ZY=;
 b=gA0js6tbxYxn8gYgCh6XD4JFE1rO8ff5B/IRdVHF/j8v7MRPhMfXxD1e
 xDNwScYWY+TP8rZ6qMQwgY9Jbz5kzNWZZzk48/qWO8vxISfZ2zPMAKahd
 QVpHwA7QBa+zpT1/kEfIScRTIGeGvuyTS8fi3jJsXIBGVfTGjyq3UL9U5
 0eNbmovRlQKGNaC8nH2nGI37MGp+8NgEQD+soDTZAS6zXiZs20j+kWFB5
 0XgWTLK/DYt+sYGlSIMU1cSk0BQfY81MoyfABD3SITmLHX7dRKs+UxS4l
 RLxlkbxbaT+GbQpD92VGqH9LaWQh8Sp0kU/IthNZu+tTecMe44PZoi1yW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7685320"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7685320"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928244350"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="928244350"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:18:20 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/1] drm/xe: correct the calculation of remaining size
Date: Thu, 18 Jan 2024 14:20:50 -0800
Message-Id: <20240118222051.790432-1-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Fix a bug in function write_pgtable where, in case the number of
PTEs is more than the maximum of one MI_STORE_DATA_IMM can take,
the caclulation of remaining size is wrong.
Also revert a change made earlier, because the pgtable can have
512 entries.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: correct the calculation of remaining size

 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

