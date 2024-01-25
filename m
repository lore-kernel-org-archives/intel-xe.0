Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76626C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 06:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2A810F803;
	Thu, 25 Jan 2024 06:50:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D0B10F803
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706165419; x=1737701419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eV7AJXsUinzqCefkET7DG2xXKWske5jd3FBZJiJ7mK8=;
 b=InuwzfjSyGvbOqWeDbfcVEqKdmnAxpcqymdlByhhYVYwpLorxGft8zxG
 K26ETYSI84j36MY002dtVLuO0L3XYdpSpZBvvrphMF+gN4crYLe4q69HK
 6UaIQ0g17mGJRuiCq1vopzUA/3Q8MAIJRIG84Ec9F80oKwsqVT+uRdNTC
 iQD3rXcLVLi1ksyMzNtNkKHqihj/Y+my2+8+AzWQuPMGbXOSJBxvj+Umw
 KTykRx63NLquNNoX3jD9ZEEPzm43dgqU+K6znD3t8nePq2aD0L1Asz2aR
 psioR9CbcE1UF+MTqvQsxtjwgjM4LebKox4xxSMSVhfKWuGYyOz4SG8t3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15428175"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15428175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28387855"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:50:19 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] drm/xe: correct the assertion for number of PTEs
Date: Wed, 24 Jan 2024 22:52:44 -0800
Message-Id: <20240125065245.1204731-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Missed one change in commit 43d48379c939. Fix it here.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: correct the assertion for number of PTEs

 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

