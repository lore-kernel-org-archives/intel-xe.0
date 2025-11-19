Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F98BCF58E0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 20:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33E410E25F;
	Wed, 19 Nov 2025 20:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjLNMhY6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8928410E25F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 20:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763584303; x=1795120303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fdrlz5q1DAUYA7NIChC7KhUF5+v3c0w7jI6bks3t/a0=;
 b=JjLNMhY6ZToUx4FEZ8lSh+xBqyrXMrLoKMnHb17Nn2IRiZo5k02VGGOp
 ezLf/4e4+Q7rxUZpIFj7cSaMshNAAMswXJjdMga2R3DP0ugKTPfuIe2YJ
 mdQRI8+/a5H8heegsHrUNbTMW/YHSxL0+4Z6HTiARAGs5ZTY/hnFAY5RU
 of+evNR8xqv8EbEzrzkprJXWaaxpqdL4XSVVbx2jLmtLoMQ7hOuA/ba8V
 t7I7agS1jvKsRhEBpAdv4Hsl6wlL5cYOKyXYpD4W/ML7rjfejyARpay1I
 KFE230KqKd1zn6WJQGxjNOQerZ9GSREYuVIc3RrBfKz3RcDpptnbGT9gL A==;
X-CSE-ConnectionGUID: tEX81qRxSdemdB20YcGaMg==
X-CSE-MsgGUID: ZzsqlTDwQdCo2Tcc08laZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77107351"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="77107351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:31:42 -0800
X-CSE-ConnectionGUID: o9BcT7MQTTWrJkPx5xs/AQ==
X-CSE-MsgGUID: Tok7RAO7SuigfnBPWr9s1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="221808958"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.19])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:31:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Some bind queue fixes
Date: Wed, 19 Nov 2025 20:30:32 +0000
Message-ID: <20251119203031.267625-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Notably there is a uAPI change here, with now banning bind queue sharing, which is quite broken at
the moment, but was never actually intended as a usecase. The hope is that no userspace cares about
this.

-- 
2.51.1

