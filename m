Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17876C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 17:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6E010E295;
	Thu, 20 Mar 2025 17:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcHFrx7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C6310E295;
 Thu, 20 Mar 2025 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742491936; x=1774027936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dzHQkU9bwqPjx+ANOPLCa8k0cLKP3mVRW5n0BIUBo+0=;
 b=FcHFrx7+reg06aLjeQ1OL7VEsKdbr0M5+Hnsj5MESsghLJBHNt20L04r
 ul4Ph7xf+B8XBm3DRSMh4n+RpYevDHcQBhBzfT7lX1liynXmFDfhSiLwI
 0zNeTyOvvfvloMveKmpfbbpoccM5drCBD9wXff7jRXq1uUluOmHey7ArG
 ENQkAgzI5FeoMxQDv7mrSD3dqzHAMLC/Hdtj3BfJhYrTVbuA+04rINTw0
 n3j04s3kSp4HJ985wMKkADVVAtSujkzqDrDmw05dFXLKoB4zMZq7GqNG6
 YB2AnqYv+SrIHoaAlOXjXoqJRkmGNhKclij487cvdDBliK3ulsGyB8f4Y g==;
X-CSE-ConnectionGUID: NGRv2pFhTy+yz214szN6hw==
X-CSE-MsgGUID: cYt/WokwSd6dqMbEEm9hHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69095590"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="69095590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:32:15 -0700
X-CSE-ConnectionGUID: +QBEgak6R2igdWfCzVu+lA==
X-CSE-MsgGUID: SCUWb6yJTZeoKHomKkE4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123168390"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.226])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:32:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] Replace xe_hmm with gpusvm
Date: Thu, 20 Mar 2025 17:29:57 +0000
Message-ID: <20250320172956.168358-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
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

As a first step to moving userptr handling over to drm, replace the hmm
usage in xe over to gpusvm, which already offers similar functionality. As
some prep steps we also align on some of the missing pieces that were
already handled in xe_hmm.

-- 
2.48.1

