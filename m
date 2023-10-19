Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98C2CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 09:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345310E4B5;
	Thu, 19 Oct 2023 09:26:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA8810E4B9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697707607; x=1729243607;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xeIGCdrkM2tkN1tq4cbRy65Osn80HqqJq0gdSUZCDZA=;
 b=UmbdBWVFB2WCJZqgGkeMjrKlG6Z2V+zH5aRDmZHXX2bbzGRLI5cle8vE
 vbDDnuUyGL3YCH29dfU5AMXUPmLylNb4BsWtk/GLJLp1InCwKu217aWOa
 S0e+qIs3EKFcCX+r89su9wkgAbG7Eqq6Y6EqLuEIGGVxgoyjROEPGOODk
 IPSnbxNeQ6B4I4OMyQBjwRUsTrOxuBkrldonx/HaNQID1rBUqZ6I+rHUS
 kfDtTDBtn7XF/v6OK3eEbHVMQGs9GZeaDpwjnFVQvqYNWiAl4bdmyjDj6
 q43dDIT/gLLbIDyKqoYRMo7hHlC25Dw8SnoqUPG4HFZRLg08G8S8WIsE2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386037762"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="386037762"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900671199"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="900671199"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:24:40 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 15:01:38 +0530
Message-Id: <20231019093140.1901665-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Event tracing for GuC CTB
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

Add event tracing for GuC CTB.

Balasubramani Vivekanandan (2):
  drm/xe: Add event tracing for CTB
  drm/xe/trace: Optimize trace definition

 drivers/gpu/drm/xe/xe_guc_ct.c |  13 +++-
 drivers/gpu/drm/xe/xe_trace.h  | 126 ++++++++++++++++++++-------------
 2 files changed, 89 insertions(+), 50 deletions(-)

-- 
2.25.1

