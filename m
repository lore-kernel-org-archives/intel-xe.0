Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D118CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4610E81D;
	Wed, 15 Oct 2025 14:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRBHG4s7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE01810E81C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538022; x=1792074022;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OGbF6qc+u38Y1/CIGPRHW+eOf6U7qGRr29Zbm2TmJSw=;
 b=FRBHG4s7rmHPKU1uKtGSAkNOyLPVGguUef7fJt/XjJ+LhRksPXezcELv
 zWr7+oWldE+etH/+tG5kDQu1g7sGLazYoEMeXBfC6YCIjCDeCn9mrnIzn
 rE0FSRWoNQrqF8VIIer52RPPdwbsFB0vTwcKmu+6lNdAEEyow7mX5g9Xb
 xVrzvcW9l7U7kxaDVIDO1SEuf5L7t8QMcqzc7yskTsWReYADNXQTLXWBx
 lpvg5U8x0pGsc0s97HlLebb7vVpBDJ/xrI6LWSyi+8RitMfrsTehK+ddL
 AXy6VEAchbdn8nBBLRxwINRMXr0RjIBVOhJ5EtVBtiV+sYPlb2Z3v8h62 w==;
X-CSE-ConnectionGUID: K6likx+vQUy2py7yU4AJ2w==
X-CSE-MsgGUID: SPGfomevRTG6aHTxE45xMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="72990274"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="72990274"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:22 -0700
X-CSE-ConnectionGUID: fZiu32ftSCCmzxKAKgU7aQ==
X-CSE-MsgGUID: MSZsFbbFQg+kRvR08k63Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181740949"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] Some migration fixes/improvements
Date: Wed, 15 Oct 2025 15:19:30 +0100
Message-ID: <20251015141929.123637-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

Notably also cutting over to MEM_COPY instruction.

-- 
2.51.0

