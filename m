Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC64C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 16:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E3110E33A;
	Mon, 30 Oct 2023 16:11:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E23610E32E
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698682261; x=1730218261;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sma5zFNdVg6aj9qXpyChfy5HDvSMxJmz6FvfCc9zKOw=;
 b=KNT99Onb36qK6yhpzKZ21cWONytUy+gH/Jf7Qdhi+rpfXt+ims2EkgER
 4MbrLVNj+H9xz2pWCPG/qnrjD7DrzGVIEurwe74vMRLgQl15+1wtT33Nt
 VuVc2PWanbh57Pyq+4harwzu2zxKYRNox1ixj2BjtUpYLv3jEwVZqHo/V
 GSLXZNlXlSDEk2pqF3IPzEgVdcNN3taCUKmv7JdXPMCOEkVN4kKMQRqzX
 gczqIm5moaEitZ+oXG1IFEW7ARBkhl298cTuu39ahOVX6wtPy5WNdATrn
 OlIbAKtLRnioCbWyPmERzAoXPJd5w+ZAE/nWV6StacPCiYQmBMc/eDiJc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474347266"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="474347266"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1543601"
Received: from vishvend-mobl2.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.8])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:10:26 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 16:10:17 +0000
Message-ID: <20231030161016.54300-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] Some eviction fixes
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

Fixes the scary corruption issues seen around evicting VRAM, as picked up by the
IGTs written by Zbigniew [1].

v2: Some improvements suggested by Matt B.
v3: Use ctx->interruptible for the wait (Thomas).

[1] https://patchwork.freedesktop.org/series/124626/

-- 
2.41.0

