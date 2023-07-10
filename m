Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C7EEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 22:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78E610E17E;
	Mon, 10 Jul 2023 22:15:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E978A10E17E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689027330; x=1720563330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WSSkNkWkXarxXZfvlnkAz9QKAiGaoDBN6Zp/idD7p50=;
 b=inGV6R4KtGP9KRs491RhyAn7rsbJvAoZUuH9gMw0jLANOEh4glIwbIHZ
 TyB7peqFlSjkD0kFw1hR8SBbD6MMOtjNs8svaKXq0M6GX7AKeXc752pZa
 yvA+sl8OWa6tFkt0BqjVAE87+sLd2dWuP8q/kHen5k9RwD2i8pc+fck/N
 h+cWWQ10wJIbfh5AUhbK9e1nNf1eVxgwpZ45Ztc5ACdHVT5Ux5R+VoxMZ
 iLpLIGusApL//ewOnlzSLo+MeFFHpA/7PtbMZMc+kQtWKvKSZdloHZHYt
 PBkfTEspIpd1iIWzSReWJxhzPYuYdAxNGgFfZ9HvsT5VBJ/bisEgH/xdJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363338278"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="363338278"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 15:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834424233"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="834424233"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 15:15:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 10 Jul 2023 15:15:42 -0700
Message-Id: <20230710221544.1882405-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix multiple engine (un)bind races
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

Described more in detail in [1].

Have test which exposes race in tip of drm-xe-tip, fixed after this
series [2].

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/41
[2] https://patchwork.freedesktop.org/patch/546468/?series=120471&rev=1

Matthew Brost (1):
  drm/xe: Make bind engines safe

Thomas Hellström (1):
  drm/xe: Introduce a range-fence utility

 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c     |   2 +
 drivers/gpu/drm/xe/xe_migrate.h     |   8 ++
 drivers/gpu/drm/xe/xe_pt.c          | 115 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_range_fence.c | 136 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_range_fence.h |  78 ++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c          |   9 ++
 drivers/gpu/drm/xe/xe_vm_types.h    |   7 ++
 8 files changed, 356 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_range_fence.c
 create mode 100644 drivers/gpu/drm/xe/xe_range_fence.h

-- 
2.34.1

