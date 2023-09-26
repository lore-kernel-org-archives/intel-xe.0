Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0A6CE7A8E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 04:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDFE10E34D;
	Tue, 26 Sep 2023 04:10:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E6210E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 04:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695701448; x=1727237448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=siZgZ4Gyep3CRMfpxCghlPXUrix4DdrNmPpPSHrAYkw=;
 b=N/eRBRxk1Xq+rqqXjpl4Nr0U1CC4Y7oWcfJ020mqRl8sFBZugnYAeLfO
 jyc68OaOmDKwsJb+Mw4qgDePG4CdCPVMQXu7cobvHwKLEuvVtwMplo0uS
 gCWRPrE5Q1smcdNne+s3wGPn9AElLP0BNpHh3JUwXMUu1QacgDGyiIbYa
 uD8O0EGKn/lH4WFN0rrTpyIBqu/0s00xBOL8LFyNnKcFMsFJx5lxBHFRE
 1vzQYgp5aXFbDheHnc4DFRA2UN8f8FeyHbRIDpq6Bimv7J0kcfi3dAnyi
 feFq62unpXc4q2bTP+A8De2GSEoGaNiKe/1gZ6/c5JhKOHQraKHBaVUFY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371811039"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="371811039"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752002744"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="752002744"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:10:47 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 21:12:58 -0700
Message-Id: <20230926041259.1102823-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] drm/xe: timeout needs to be a signed value
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

In xe_wait_user_fence_ioctl, the timeout is currently defined as
unsigned long. That could potentially pass a negative value to
the schedule_timeout() call because nsecs_to_jiffies() returns an
unsigned long which gets used as signed long.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Fei Yang (1):
  drm/xe: timeout needs to be a signed value

 drivers/gpu/drm/xe/xe_wait_user_fence.c | 55 +++++++++++++++++--------
 1 file changed, 37 insertions(+), 18 deletions(-)

-- 
2.25.1

