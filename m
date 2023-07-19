Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BE3C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8110E42D;
	Wed, 19 Jul 2023 08:38:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AA710E42C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755934; x=1721291934;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7q2ERre/ExfDM/ir0ILL7Mp5Y8aFCFMbP3RSBoWxj7s=;
 b=Q0/3uiK4GRcM/V4ksjW/eCEw8o3B3EtXx+/t7jBHjA6ss64eeHlQgq9x
 hqB5Yn0msdZtjr03tykiabCZzlYg+GPg9Ni8BE7BFf5ht8wnRH8asFQcK
 rQNwGZ+m4BTNJDoXqWlLtwTNUJHeJLAcKrGy5fSzfhoiWTz1/UkmlaVsx
 vDVyCCgumUVWLHBANbLV7cwftECwYbK+XQPjhOjPbfjnfe20f2RgDcm5r
 98JM6egYAR2h7Dt5Ov0ccvLCZbtOLEHiYYtIlXwa96qtupmvFE3B9ttFh
 dC2Zam+zVH6vXglG6Qy5gZL7/I4yeFKViVy6z00fVsAC5TKzY7ynorA28 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345998989"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345998989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603311"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603311"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:38:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:02 +0100
Message-ID: <20230719083801.182123-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 00/10] xe_device_mem_access fixes and related
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
v14:
  - Missed also updating the fast CT path which recently changed.
v15:
  - Rebase on latest drm-xe-next.

-- 
2.41.0

