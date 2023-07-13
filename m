Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10370C001DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA76010E6DA;
	Thu, 13 Jul 2023 13:23:16 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1D210E6D9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254595; x=1720790595;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RcsRvb3XZdSiwM59tjrd5RjtV1xUY9/t5VuCDL46xzA=;
 b=iJ4ljdwNYnFH5VQBR0iShO/4uCBeuvO8/VByfNnNKC8hiJBjC1rPRPqr
 k0YTyUkQCtyyUC73pUSIQTJeOa3Nw4TN7YslVoPxQ4+stHD9oiknrlWeA
 h7+xpPUG8tlLyLeDfoRaVVdFP6QykK9yUD38rlLVR6aq9pE+uJSZxBwbs
 DyhzgBSis7CZiEPTFJDLqJgOgtM1+xBF0J8waEWtz0GyK3V8tSt5scLqx
 EXR5YfCpxQsssb7NNJSUkbk6/s0oIDNZTp46o2MICNfcY6ZkYI4ffFghH
 cmFRIzuXK1hbh8dgv/L4bhu1BujzJqlOCgbCI3oEKnAxkyNysY743BxwV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345497884"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="345497884"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787455276"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="787455276"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:22:45 +0100
Message-ID: <20230713132244.459605-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v13 00/10] xe_device_mem_access fixes and related
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
v13:
  - Simply the first patch (Anshuman), also drop three patches which can be
    dealt with later.

-- 
2.41.0

