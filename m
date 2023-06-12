Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC80C7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3506D10E18F;
	Mon, 12 Jun 2023 17:14:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03F10E0C7
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590077; x=1718126077;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Xb3v8lXjY6+j/sn+uyEHMY/wbo5YR6lFTpl9K9KENg=;
 b=WPmiysyK6q0m3QlG/QWvL8clifm1qRWAuY2aCITJuK+Ffl73gTZd7tx1
 RD2UTmUXByx+5ALx80O1dieN4F4UgtR2baHN9S8PZb7jwTCMhNLU9ZJUv
 dIi+DH4931+HwiTNyXpXrAxyOUSIXuDnMzgw78vLgAfgyrFpk6Mpm4ZRq
 gIRituRC+Lpy/17z2EYfkDERKuvVF7jEMmGp7BVqphLMR+V8k3vmtNaAy
 rQI6KChGgUT7iii8KzjstSzOGb5Q2HSnxzrylrZJKV6yjEWEKmsebOjAF
 y7yfy6Zr5wWTNENu6uBi0f8954FQMD/bV6ga961XVCe9mvAJkt6hjZHpN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792710"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792710"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715098"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715098"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:13 +0100
Message-Id: <20230612171225.88689-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 00/12] xe_device_mem_access fixes and related
 bits
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

Main goal is to fix the races in xe_device_mem_access_get(). With that fixed we
can clean up some hacks and also start rolling it out to more places that need
it, including now asserting it around every mmio access. We also add lockdep
annotations for xe_device_mem_access_get() and fix the remaining lockdep
fallout.

-- 
2.40.1

