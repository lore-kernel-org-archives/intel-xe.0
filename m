Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C225BCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838AC10E3A1;
	Mon, 20 Oct 2025 12:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTn1OFJJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC95110E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964881; x=1792500881;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x8q8UuIf8odxrUgsW0BYlH8GgbxDzFd1jJK3B6KKlz0=;
 b=WTn1OFJJ6uQ7TN8wJqF3iTDQPqFY/huTPrG0e3DI7Mx3BtEX637x/k/B
 CSqcGJER/rQJpnic+gcsDJeQxwMKaWlv5befsMWYz3aDZ4bzWC8cismXs
 0oGXVEEZSz1KFuA3LQ6hSt8Fa00wcj4Ec4VozZjAPlEoIMH5Tva0lncLj
 JUYxLQSqTOO3Sp54iP/5v/YXXjl+AZ9JaAxMwBBFDb+MOJUAH18ysKHwV
 uCqKYeRbUOTHXqGb95feAXy3QLk74edMPgHwEXhdksExAFA9I/MYSktE5
 7DL2U0l8noke3dU0yWyjEOL1d8p9GioJW2oTvFbIZRPkzUl20uLxNJavl w==;
X-CSE-ConnectionGUID: mxAeWamyRCSVWeg2j5X8oQ==
X-CSE-MsgGUID: ogoxk7S8QHu0poXbnSx1VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422388"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:40 -0700
X-CSE-ConnectionGUID: wsTxvTv2ROWGgafITRxDCg==
X-CSE-MsgGUID: Zs0/tpc4Sy+r4qUBS+1xhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512873"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/7] Some migration fixes/improvements
Date: Mon, 20 Oct 2025 13:54:32 +0100
Message-ID: <20251020125431.41153-9-matthew.auld@intel.com>
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

v2:
  - Various improvements from Matt Brost.
  - Allow easily switching between MEM_COPY and old path with configfs.
-- 
2.51.0

