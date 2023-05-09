Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88CEC7EE2A
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997C110E332;
	Tue,  9 May 2023 06:57:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3928F10E32E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683615445; x=1715151445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MRZhohJZaJnyBj48Zr5AHE3bJGFZuyiBn/oB874rTsI=;
 b=aJ8tzmb+iDFHMsOxpnIxWdFfuM2IRPf09CS5lJ+8Zsk+1okas0WttRH9
 v+Vpkyia8thwPuO4CCd+w3SLo/EQ0r1Wq6jFbovwRG+VOEyX+9WKBRXyP
 ZXjDa1VnqItPhDLcI7cA8BCVbkQ3/YXT6MWSYN4A/B4J3LLNMuF+Kn0Q6
 PXex5kIPUthH0pOnX/kDhpdNtj+kwtVNouI7chPXCcHiWG7OPzVyRQPww
 YizQQaQ9U5uAEQrSYFSGRxngqv/IOdBv7W01rF6roMcpmalxTY+fhlS0L
 xVZkqUvx7HPURyr3vA2Fq68gJslW9cSWtFi9K7eRBnQzgdMF9LZWsBo76 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334271741"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="334271741"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="873054075"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="873054075"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:57:22 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 23:57:07 -0700
Message-Id: <20230509065709.30393-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe: Handle -EDEADLK case during BO
 validation
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
Cc: thomas.hellstrom@intel.com, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With multiple active VMs, under memory pressure, it is possible that
ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
return -ENOMEM.

Until ttm properly handles locking in such scenarios, best thing the
driver can do is unwind the lock and retry.

v2: revert retry timeout upon -EAGAIN in preempt worker (Thomas)
z
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe: Handle -EDEADLK case in preempt worker
  drm/xe: Handle -EDEADLK case in exec ioctl

 drivers/gpu/drm/xe/xe_exec.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c   | 22 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

