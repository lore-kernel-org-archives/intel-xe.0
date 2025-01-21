Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42C4C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 18:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87010E61C;
	Tue, 21 Jan 2025 18:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpRFADf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A8910E61C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737482639; x=1769018639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xGspQFQ5HcXQn5QCisE7KAVAgH9Pedb6b7VVlfGMGRk=;
 b=DpRFADf3M7bTWxQxM0lRtQi6hJgE4JHv9S7MsEYJfN+N75HGwIWuYfLx
 NYOMGUZGt4wyUcBcs7AuV2o5TFjwMr6WKX4pu5+uhW+yimpx22rgD3A0F
 lTbCK80z77nOP4nYn/QkPDWoHiGnna1/wShCXpYjyjo/kis+nVfza+m7h
 fzKXf406beTmzxwvCQY9WcVoKHe66Vx+NpToRcWVd/qyjfWCHpsAe2E7x
 uwJPEAhrzsDofWFn1wZKtVB/pzg/VHq8dCsAmCfES1TM9KtnPtVSr6CzP
 XZ9i1xy2kFD35cx9H7vzpRfIn0Qy8r5WIo4RYwB92+uCD6KIXynzdDvXA g==;
X-CSE-ConnectionGUID: F6LHpmd7TJu+npLrHmhEaA==
X-CSE-MsgGUID: HCKaLCdHQe6Vd3EEg7JLQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37933928"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37933928"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 10:03:59 -0800
X-CSE-ConnectionGUID: Am5kNonpRbmBb0sqet39wg==
X-CSE-MsgGUID: iaqRFBbzTHit6nGWpY7zOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106663481"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 10:03:58 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/2] stream->pollin fixes
Date: Tue, 21 Jan 2025 10:03:52 -0800
Message-ID: <20250121180354.3221570-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

Ashutosh Dixit (2):
  drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
  drm/xe/oa: Fix locking for stream->pollin

 drivers/gpu/drm/xe/xe_oa.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.47.1

