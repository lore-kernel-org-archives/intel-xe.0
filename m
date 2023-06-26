Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BDEEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0B10E1E3;
	Mon, 26 Jun 2023 10:51:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C5C10E1E3
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776664; x=1719312664;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EFjkQhagm+c6+X7QsLA7ddY1wx8f8I5mA1knKtVv1fY=;
 b=c6wfmLmCF4K7wuTXNxsT/8GT1zf5I3kX5m1Xpr1DhDmOxz2mlR7IxDOi
 H0SRMfeNbTMWQKnpa1dIb40M2scJZp/Biv5GOz70YK8yLrApwiEDs+/zz
 rhvf6jFws8uVKYxzIX9iMfKkbjWsdZxmnqyojzMW7QEEvdxRjMhuhEoHI
 PEDw+4LTip6srWLM29XIrB25taqbUJH36N37X5R0V6kta9vIvqZDAi5bR
 Ztmw3fo74wYr+ibkU5/FZ0o1Ykca6jRm2xl+EQ1xnpvDm5sq1hcIV2nFd
 gqi2x41sUFNOHXZPwC35Vd1FALbqhczD13eScs/8MLHPKG0ypL03eNMlD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279970"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279970"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182744"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182744"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:38 +0100
Message-ID: <20230626105037.43780-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 00/13] xe_device_mem_access fixes and related
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

v11 -> v12:
  - freq_rpe_show also needs the device to be awake
  - Improvements to the lockdep annotation patch

-- 
2.41.0

