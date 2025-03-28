Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6A8C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 12:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DF910E9F3;
	Fri, 28 Mar 2025 12:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXAojhVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA7310E9F3
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743164045; x=1774700045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pKJn8NXj7msaDBJL8XPnLKrwww1rQQ1oX1CDPntw+0g=;
 b=hXAojhVlH5AM1JVvtY/O5Gxu1NbIzpPa9q2Bu5MBwGcMMwiS5VqqG0b8
 MZ97fvjuyuzpE1sA8/QsSCNGrMDYjaHDCLOVGf27JHbQl2nSLCQbjOR5v
 0AazRdBZdI/89DTzm3ezTqko0PeHIbC6fYIl6mzxqKz/1ZQvAMQePO14m
 Zq6++UdUS0A1VeNxeHDz26utlGdXydZrSdaf78kyPZyo0jkfWbP3RkvAa
 XnvX0VsemtzrNexmh8Diwupn5bn4kMccXoqBfYRm2m5qNkfR/T8OXIgDQ
 D6e4sfp8A3LOjKdzZYnE9mKiDY+n5yOkC7RgEHD9nEmOQvCBfSTEPpB1Y Q==;
X-CSE-ConnectionGUID: lwuliptRQfm7ELTVdr7JuQ==
X-CSE-MsgGUID: XJxHlSkAQWyXV8tfGC4VDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55524106"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55524106"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:14:04 -0700
X-CSE-ConnectionGUID: PFMYTjtbQNiXOdWsWKalVA==
X-CSE-MsgGUID: tNL1EF/LRdyuSVZoqBmsXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="156367792"
Received: from dgrzegor-mobl2.igk.intel.com ([172.28.180.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:14:04 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dominikgrzegorzek@proton.me,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH] mailmap: Add entry for Dominik Grzegorzek
Date: Fri, 28 Mar 2025 13:13:34 +0100
Message-Id: <20250328121334.136578-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Because I leave Intel, add mailmap entry which maps Intel email to
private one.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 6686879ce0d5..747295e86d85 100644
--- a/.mailmap
+++ b/.mailmap
@@ -131,6 +131,7 @@ Dmitry Safonov <0x7f454c46@gmail.com> <dima@arista.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
 Domen Puncer <domen@coderock.org>
+Dominik Grzegorzek <dominikgrzegorzek@proton.me> <dominik.grzegorzek@intel.com>
 Douglas Gilbert <dougg@torque.net>
 Ed L. Cashin <ecashin@coraid.com>
 Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.com>
-- 
2.34.1

