Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B295AEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6315B10E1E8;
	Mon, 19 Jun 2023 11:00:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE23010E1E8
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687172440; x=1718708440;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aQPaG/FfZ1gddYDxO1nBKFGEQDSTFalT6z8hb6OfB84=;
 b=C6QBLA+QjBwFNceRipzMHbXH9ZwAv0847xoIQElta1IpXt1A8okJP0TF
 FSBYbraFSgE6QsL/feQernD1C2w2TrPHLQ8p9SgJyA7/SpzPjXnLzO6i6
 uqb2CKwHb7rB/tDz/TLj6JuMqTbyYP4u2vL9m/o0UmIFpTYOcgBr9Hfqh
 w5fNZ1v4Cvp+sviHV9kzVuimH3+Hfcv8vdyAnmWvEdOVHBRXDg51Ul9nQ
 HSPttJg+2C4XkF/cFZFjEz8oI/Qtf85DhU4GiO+O7L/gG/uTrDaXeTf0K
 kEbywgLIEdKBf4p4Cvc1DT63d6K0qF64+hrzOT+p+yTYu19IuzNfTwijj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941709"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="339941709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803579263"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803579263"
Received: from lsuareza-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 12:00:19 +0100
Message-ID: <20230619110018.53538-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
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

The remaining small-bar bits. Add support for requesting CPU access for VRAM
buffers. Also expose this to userspace, along with various bits of related
accounting. Finally turn on small-bar support.

v2: Various improvements suggested by José
v3: Add some kernel-doc (Gwan-gyeong)
v4: Small kernel-doc fix, also use the correct version of the struct
v5: Rebase on latest xe-next changes
v6: Rebase on the needed PL_TT -> PL_TT move fix, plus fix some other issues
    reported by José when running actual workloads

-- 
2.41.0

